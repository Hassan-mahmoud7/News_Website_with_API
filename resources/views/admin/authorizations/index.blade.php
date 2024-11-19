@extends('layouts.dashboard.app')
@section('title','Roles')
@section('body')
  <!-- Begin Page Content -->
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables:</h1>
    <p class="mb-4">Roles Managment</p>
    <button type="button" class="btn btn-primary ml-0 mb-3" data-toggle="modal" data-target="#add_authorization"
    data-whatever="@getbootstrap"><i class="fa-solid fa-flag"></i> Add New Role</button>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Roles Managment</h6>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Role</th>
                            <th>Permission</th>
                            <th>Related Admins</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Role</th>
                            <th>Permission</th>
                            <th>Related Admins</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        @forelse ($authorizations as $authorization)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $authorization->role }}</td>
                            <td>
                                @foreach ($authorization->permissions as $permission)
                                {{ $permission }} ,
                                @endforeach
                            </td>
                            <td>{{ $authorization->admins->count() }}</td>
                            <td>{{ $authorization->created_at->format('Y-m-d h:m a') }}</td>
                            <td>
                                <button type="button" class="btn btn-primary m-auto" data-toggle="modal" data-target="#edit_authorization_{{ $authorization->id }}"
                                    data-whatever="@getbootstrap" title="Edit Authorization"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                                <form action="{{ route('admin.authorizations.destroy', $authorization->id) }}" id="delete_authorization_{{ $authorization->id }}" method="POST" class="d-inline">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-danger m-1" onclick="if(confirm('Do You Want To Delete The Role')){document.getElementById('delete_authorization_{{ $authorization->id }}').submit()} return false ;" title="Delete"><i class="fa-solid fa-trash-can"></i> Delete</button>
                                </form>
                            </td>
                              {{-- Edit Authorization Model --}}
                              @include('admin.authorizations.edit')
                        </tr>
                        @empty
                        <tr><td colspan="8" class="alert alert-info text-center">No Authorizations Yet Now !</td></tr>
                        @endforelse

                    </tbody>
                </table>
                {{-- {{ $authorization->appends(request()->input())->links() }} --}}
            </div>
        </div>
          {{-- model add new category --}}
       @include('admin.authorizations.create')
    </div>

</div>
<!-- /.container-fluid -->
@endsection
