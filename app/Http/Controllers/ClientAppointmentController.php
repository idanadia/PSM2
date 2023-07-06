<?php

namespace App\Http\Controllers;

use App\Mail\AppointmentBookedForClient;
use App\Mail\AppointmentBookedForCounselor;

// use App\Models\Timetable;
use App\Models\Appointment;
use App\Models\Client;
use App\Models\Report;
use App\Models\Symptom;
use App\Models\Timeslot;
use App\Models\User;
use Auth;
use Illuminate\Http\Request;
use Mail;

class ClientAppointmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = auth()->user();
        $appointments = Appointment::with('counselor')
            ->where('clientId', $user->id)
            ->get();

        return view('appointment.index', compact('appointments'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function create()
    {
        $counselors = User::where('role', '1')->get();
        $timeslots = [];

        foreach ($counselors as $counselor) {
            $timeslots[$counselor->id] = Timeslot::where('counselorId', $counselor->id)
                ->where('isActive', true)
                ->select('startTime', 'endTime', 'id')->get()
                ->toArray();
        }
        return view('appointment.create', compact('counselors', 'timeslots'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

    public function store(Request $request)
    {

        $validatedData = $request->validate([
            'date' => 'required|date',
            'time' => 'required',
            'counselorId' => 'required|exists:users,id',
            'method' => 'required',
        ]);

        // $datetime = Carbon::createFromFormat('Y-m-d H:i:s', $validatedData['date'] . ' ' . $validatedData['time'] . ":00");

        $appointment = new Appointment();
        $appointment->counselorId = $validatedData['counselorId'];
        $appointment->timeslotId = $validatedData['time'];
        $appointment->clientId = Auth::user()->id;
        $appointment->method = $validatedData['method'];
        // $appointment->appointmentDate = $datetime;$validatedData['counselorId']
        $appointment->appointmentDate = $validatedData['date'];

        $dayOfWeek = date('N', strtotime($validatedData['date']));

        if ($dayOfWeek == 5 || $dayOfWeek == 6) {
            return redirect()->back()->withErrors(['error' => 'Appointments are not available on weekends.']);
        }

        $client = Client::where('counselorId', $appointment->counselorId)
            ->where('clientId', $appointment->clientId)
            ->first();

        $existAppointment = Appointment::where('counselorId', $appointment->counselorId)
            ->where('timeslotId', $appointment->timeslotId)
            ->where('appointmentDate', $appointment->appointmentDate)
            ->first();
        if (!$client) {
            $newClient = new Client();
            $newClient->clientId = $appointment->clientId;
            $newClient->counselorId = $validatedData['counselorId'];
            $newClient->save();
        }
        if ($existAppointment) {
            return redirect()->back()->withErrors(['error' => 'Appointment already exists']);
        } else {
            $appointment->save();

            Mail::to($appointment->counselor->email)->send(new AppointmentBookedForCounselor($appointment));
            Mail::to($appointment->client->email)->send(new AppointmentBookedForClient($appointment));
        }

        return redirect()->route('client.appointments.index')
            ->with('success', 'Appointment created successfully.')
            ->with('appointment', $appointment);
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Timetable  $Timetable
     * @return \Illuminate\Http\Response
     */
    public function show(Appointment $appointment)
    {

        $statusLabels = [
            0 => 'Scheduled',
            1 => 'Confirmed',
            2 => 'In Progress',
            3 => 'Completed',
            4 => 'Cancelled',
        ];

        $reports = Report::with('appointment')
            ->where('appointmentId', $appointment->id)
            ->get();

        return view('appointment.show', compact('appointment', 'reports', 'statusLabels'));
    }

    public function sendEmailReminderToClient(Appointment $appointment)
    {
        try {
            // Send email to counselor
            Mail::to($appointment->client->email)->send(new AppointmentBookedForClient($appointment));

            // Email sent successfully
            return redirect()->back()->with('success', 'Email sent successfully');
        } catch (Swift_TransportException $e) {
            // Handle failed email sending
            return redirect()->back()->with('error', 'Failed to send email: ' . $e->getMessage());
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Timetable  $Timetable
     * @return \Illuminate\Http\Response
     */
    public function edit(Appointment $appointment)
    {
        $users = User::get();
        $symptoms = Symptom::all();

        return view('appointment.edit', compact('users', 'appointment', 'symptoms'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Timetable  $Timetable
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Appointment $appointment)
    {
        $validatedData = $request->validate([
            'user_id' => 'required',

        ]);

        return redirect()->route('appointments.index')
            ->with('success', 'Appointment updated successfully');
    }
    public function changeStatus($appointmentId, $status)
    {
        $client = Auth::user();
        $appointment = Appointment::where('id', $appointmentId)
            ->where('clientId', $client->id)
            ->first();

        if (!$appointment) {
            return response()->json(['error' => 'Appointment not found'], 404);
        }

        $appointment->status = $status;
        $appointment->save();

        return redirect()->back()
            ->with('success', 'Appointment status confirmed.');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Timetable  $Timetable
     * @return \Illuminate\Http\Response
     */
    public function destroy(Appointment $appointment)
    {
        $appointment->delete();

        return redirect()->route('appointments.index')
            ->with('success', 'Inspection deleted successfully');
    }

}
