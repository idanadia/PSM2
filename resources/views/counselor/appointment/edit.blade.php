@extends('layouts.template')

@section('content')
<div class="row">
    <div class="col-lg-12 margin-tb">
        <div class="pull-left">
            <h2>Edit Appointment</h2>
        </div>
    </div>
</div>

@if ($errors->any())
<div class="alert alert-danger">
    <strong>Whoops!</strong> There were some problems with your input.<br><br>
    <ul>
        @foreach ($errors->all() as $error)
        <li>{{ $error }}</li>
        @endforeach
    </ul>
</div>
@endif

<form action="{{ route('counselor.appointments.update',$appointment->id) }}" method="POST">
    @csrf
    @method('PUT')

    <div class="form-group">
        <label for="date">Client</label>
        <div class="row">
            @foreach ($clients as $client)
            <div class="col-sm-4">
                <div class="card mb-3">
                    <div class="card-body">
                        <h5 class="card-title ">{{ $client->fullName }}</h5>
                        <p class="card-text">{{ $client->matricId }}<br>{{ $client->course }}<br>{{ $client->faculty }}
                        </p>


                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>



    <div class="form-group">
        <label for="date">Date</label>
        <input type="date" name="date" id="date" class="form-control"
            value="{{ Carbon\Carbon::parse($appointment->appointmentDateTime)->format('Y-m-d') }}" required>
    </div>
    <div class="form-group">
        <label for="time">Time</label>
        <select name="time" id="time" class="form-control" required>
            <option value="{{ $appointment->timeslot != null ? $appointment->timeslot->id : ""}}">
                {{$appointment->timeslot != null ? Carbon\Carbon::parse($appointment->timeslot->startTime)->format('g:i
                A')
                ." - ".Carbon\Carbon::parse($appointment->timeslot->endTime)->format('g:i A') : "Select your timeslot"}}
            </option>
            @foreach($timeslots as $timeslot)
            <option value="{{$timeslot->id}}">{{Carbon\Carbon::parse($timeslot->startTime)->format('g:i A')
                ." - ".Carbon\Carbon::parse($timeslot->endTime)->format('g:i A')}}
            </option>
            @endforeach
        </select>
    </div>

    <div class="form-group">
        <label for="method">Method</label>
        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="method" id="video-call"
                                    value="Video Call" {{ (isset($appointment['method']) &&
                                    $appointment['method']=='Video Call' ) ? ' checked' : '' }}>
                                <label class="form-check-label" for="video-call">
                                    Video Call
                                </label>
                            </div>
                            <p class="card-text">Have your appointment via video call.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="method" id="phone-call"
                                    value="Phone Call" {{ (isset($appointment['method']) &&
                                    $appointment['method']=='Phone Call' ) ? ' checked' : '' }}>
                                <label class="form-check-label" for="phone-call">
                                    Phone Call
                                </label>
                            </div>
                            <p class="card-text">Have your appointment via phone call.</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="method" id="face-to-face"
                                    value="Face to Face" {{ (isset($appointment['method']) &&
                                    $appointment['method']=='Face to Face' ) ? ' checked' : '' }}>
                                <label class="form-check-label" for="face-to-face">
                                    Face to Face
                                </label>
                            </div>
                            <p class="card-text">Have your appointment face to face.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <br>
    <br>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 text-center">
            <button type="submit" class="btn btn-primary">Submit</button>
            <a class="btn btn-primary" href="{{ route('counselor.appointments.index') }}"> Back</a>
        </div>
    </div>

</form>
@endsection