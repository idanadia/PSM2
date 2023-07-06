<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    {{-- <title>Appointment Reminder</title> --}}
    <style>
        /* Define your custom CSS styles here */
        /* You can style the email layout, typography, colors, etc. */
    </style>
</head>

<body>
    <h1>Your Appointment has been booked!</h1>

    <p>Dear {{ $appointment->counselor->fullName}},</p>

    <p>These are the details for your upcoming appointment:</p>

    <p>
    <h3>Your Client</h3>
    <strong>Full Name:</strong> {{ $appointment->client->fullName }}<br>
    <strong>Email:</strong> {{ $appointment->client->email }}<br>
    <strong>Course:</strong> {{ $appointment->client->course }}<br>
    <strong>Faculty:</strong> {{ $appointment->client->faculty }}<br>
    <strong>Phone Number:</strong> {{ $appointment->client->phoneNo }}<br>
    </p>

    <p>
        <strong>Date:</strong> {{ Carbon\Carbon::parse($appointment->appointmentDate)->format('D d F Y') }}<br>
        <strong>Time:</strong> {{ Carbon\Carbon::parse($appointment->timeslot->startTime)->format('g:i A') }}<br>
        @if ( $appointment->method == "Face to Face" )
        <strong>Location:</strong> {{ $appointment->counselor->roomLocation }}
        @else
        <strong>Platform:</strong> {{ $appointment->method }}
        @endif
    </p>



    <p>Please make sure to arrive on time and bring any necessary documents or materials.</p>

    <p>If you have any questions or need to reschedule, please contact us.</p>

    <p>Thank you and we look forward to seeing you soon!</p>

    <p>Sincerely,<br>
        Your UTMPK Team
    </p>
</body>

</html>