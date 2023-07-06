@section('content')
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.0/css/dataTables.bootstrap4.min.css">
<script src="https://cdn.datatables.net/1.11.0/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.0/js/dataTables.bootstrap4.min.js"></script>
<div class="row">
    <div class="col-lg-6 margin-tb">
        <div class="pull-left">
            <h2>Appointments</h2>
        </div>
        <div class="pull-right">
            <a class="btn btn-success" href="{{ route('counselor.appointments.create') }}">Create Appointment</a>
        </div>
    </div>
</div>
<br>
@if (Session::get('success'))
<div class="alert alert-success">
    <p>{{ Session::get('success') }}</p>
</div>
@endif
<!-- Check for success message and appointment data -->
@if (Session::get('appointment') && Session::get('success'))
<div class="modal fade" id="appointment-modal" tabindex="-1" role="dialog" aria-labelledby="appointment-modal-label"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="appointment-modal-label">Appointment Booked Successfully!</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <td width="100px">Client</td>
                        <td>{{ Session::get('appointment')->client->fullName }}</td>
                    </tr>
                    <tr>
                        <td>Date</td>
                        <td>{{ \Carbon\Carbon::parse(Session::get('appointment')->appointmentDate)->format('j F Y
                            (l)')}}
                        </td>
                    </tr>
                    <tr>
                        <td>Time</td>
                        <td>{{ \Carbon\Carbon::parse(Session::get('appointment')->timeslot->startTime)->format('g:i A')
                            }}</td>
                    </tr>
                    <tr>
                        <td>Method</td>
                        <td>{{ Session::get('appointment')->method }}</td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a type="button" class="btn btn-primary"
                    href="{{route('chats.show', ['receiver' => Session::get('appointment')->client->id ])}}">Chat</a>
            </div>
        </div>
    </div>
</div>

@endif




<table id="counselor-appointments-table" class="table table-bordered">
    <thead>
        <tr>
            <th>#</th>
            <th>Date/Time</th>
            <th width="280px">Patient</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($appointments as $t)
        <tr>
            <td>{{ $loop->index + 1 }}</td>
            <td>
                {{ \Carbon\Carbon::parse($t->appointmentDate)->format('d/m/Y') . " " . ($t->timeslot != null ?
                \Carbon\Carbon::parse($t->timeslot->startTime)->format('(h:iA)') : '') }}
            </td>
            <td>{{ $t->client->fullName }}</td>
            <td>{{$statusLabels[$t->status]}}</td>
            <td>
                <form action="{{ route('counselor.appointments.destroy',$t->id) }}" method="POST">

                    <a class="btn btn-info" href="{{ route('counselor.appointments.show',$t->id) }}">Show</a>

                    <a class="btn btn-primary" href="{{ route('counselor.appointments.edit',$t->id) }}">Edit</a>

                    @csrf
                    @method('DELETE')

                    <button type="button" class="btn btn-danger" id="deleteButton-{{ $t->id }}">Delete</button>
                </form>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
<!-- Load jQuery and Bootstrap JS libraries -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>

<!-- Show the modal if the condition is true -->
@if (Session::get('appointment') && Session::get('success'))
<script>
    $(document).ready(function() {
            $('#appointment-modal').modal('show');
        });
</script>
@endif
<script>
    $(document).ready(function() {
        $('#counselor-appointments-table').DataTable();
    });
</script>
<script>
    $(document).ready(function() {
        $('#counselor-appointments-table').on('click', '.btn-danger', function() {
            var button = $(this);
            var deleteButtonId = button.attr('id');
            var counselorId = deleteButtonId.replace('deleteButton-', '');
            var deleteButtonText = button.html();
            var newButton = $('<button></button>').attr({
                'type': 'submit',
                'class': 'btn btn-warning',
                'id': deleteButtonId,
                // Add other attributes as needed
            }).text('Are you sure?');
            if (deleteButtonText === 'Delete') {
                $(this).replaceWith(newButton);
            } 
        });
    });
</script>