@extends('layouts.dashboard.app')
@section('title','Admins')
@section('body')
  <!-- Begin Page Content -->
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables:</h1>
    <p class="mb-4">Admins controller</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Admins controller</h6>
        </div>
       @include('admin.admins.filler.filter')
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>Role</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>Role</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        @forelse ($admins as $admin)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $admin->name }}</td>
                            <td>{{ $admin->username }}</td>
                            <td>{{ $admin->email }}</td>
                            <td>{{ $admin->phone }}</td>
                            <td class="{{ $admin->status == 1?'text-success':'text-danger' }}">{{ $admin->status == 1?'Active':'Not Active' }}</td>
                            <td>{{ $admin->authrization->role }}</td>
                            <td>{{ $admin->created_at->format('Y-m-d h:m a') }}</td>
                            <td>
                                <a href="{{ route('admin.admins.edit', $admin->id) }}" class="btn btn-primary m-1" title="Show"><i class="fa-regular fa-edit"></i></a>
                                <a href="{{ route('admin.admins.status', $admin->id) }}" class="btn btn-dark m-1" title="Block"><i class="{{ $admin->status == 1?'fa-solid fa-lock-open':'fa-solid fa-lock' }}"></i></a>
                                <form action="{{ route('admin.admins.destroy', $admin->id) }}" id="delete_admin_{{ $admin->id }}" method="POST" class="d-inline">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-danger m-1" onclick="if(confirm('Do You Want To Delete The Admin')){document.getElementById('delete_admin_{{ $admin->id }}').submit()} return false ;" title="Delete"><i class="fa-solid fa-trash-can"></i></button>
                                </form>
                            </td>

                        </tr>
                        @empty
                        <tr><td colspan="8" class="alert alert-info text-center">No Admins Yet Now !</td></tr>
                        @endforelse

                    </tbody>
                </table>
                {{-- {{ $admins->appends(request()->input())->links() }} --}}
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
@endsection
