@extends('layouts.dashboard.app')
@section('title','Users
')
@section('body')
  <!-- Begin Page Content -->
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables:</h1>
    <p class="mb-4">Users controller</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Users controller</h6>
        </div>
       @include('admin.users.filler.filter')
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>Country</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Status</th>
                            <th>Country</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        @forelse ($users as $user)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $user->name }}</td>
                            <td>{{ $user->email }}</td>
                            <td>{{ $user->phone }}</td>
                            <td class="{{ $user->status == 1?'text-success':'text-danger' }}">{{ $user->status == 1?'Active':'Not Active' }}</td>
                            <td>{{ $user->country }}</td>
                            <td>{{ $user->created_at }}</td>
                            <td>
                                <a href="{{ route('admin.users.show', $user->id) }}" class="btn btn-primary m-1" title="Show"><i class="fa-regular fa-eye"></i></a>
                                <a href="{{ route('admin.users.status', $user->id) }}" class="btn btn-dark m-1" title="Block"><i class="{{ $user->status == 1?'fa-solid fa-lock-open':'fa-solid fa-lock' }}"></i></a>
                                <form action="{{ route('admin.users.destroy', $user->id) }}" id="delete_user_{{ $user->id }}" method="POST" class="d-inline">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-danger m-1" onclick="if(confirm('Do You Want To Delete The User')){document.getElementById('delete_user_{{ $user->id }}').submit()} return false ;" title="Delete"><i class="fa-solid fa-trash-can"></i></button>
                                </form>
                            </td>

                        </tr>
                        @empty
                        <tr><td colspan="8" class="alert alert-info text-center">No Users Yet Now !</td></tr>
                        @endforelse

                    </tbody>
                </table>
                {{-- {{ $users->appends(request()->input())->links() }} --}}
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
@endsection
