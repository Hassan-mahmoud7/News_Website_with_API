@extends('layouts.dashboard.app')
@section('title','Contacts
')
@section('body')
  <!-- Begin Page Content -->
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables:</h1>
    <p class="mb-4">Contacts controller</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Contacts controller</h6>
        </div>
       @include('admin.contacts.filler.filter')
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Title</th>
                            <th>Status</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        @forelse ($contacts as $contact)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $contact->name }}</td>
                            <td>{{ $contact->title }}</td>
                            <td class="{{ $contact->status == 1?'text-success':'text-primary' }}">{{ $contact->status == 1?'Reed':'Unread' }}</td>
                            <td>{{ $contact->email }}</td>
                            <td>{{ $contact->phone }}</td>
                            <td>{{ $contact->created_at->diffForHumans() }}</td>
                            <td>
                                <a href="{{ route('admin.contacts.show', $contact->id) }}" class="btn btn-primary m-1" title="Show"><i class="fa-regular fa-eye"></i></a>
                                {{-- <a href="{{ route('admin.contacts.status', $contact->id) }}" class="btn btn-dark m-1" title="Block"><i class="{{ $contact->status == 1?'fa-solid fa-lock-open':'fa-solid fa-lock' }}"></i></a> --}}
                                <form action="{{ route('admin.contacts.destroy', $contact->id) }}" id="delete_contact_{{ $contact->id }}" method="POST" class="d-inline">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-danger m-1" onclick="if(confirm('Do You Want To Delete The contact')){document.getElementById('delete_contact_{{ $contact->id }}').submit()} return false ;" title="Delete"><i class="fa-solid fa-trash-can"></i></button>
                                </form>
                            </td>

                        </tr>
                        @empty
                        <tr><td colspan="8" class="alert alert-info text-center">No Contacts Yet Now !</td></tr>
                        @endforelse

                    </tbody>
                </table>
                {{-- {{ $Contacts->appends(request()->input())->links() }} --}}
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
@endsection
