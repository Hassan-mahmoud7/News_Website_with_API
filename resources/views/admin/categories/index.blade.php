@extends('layouts.dashboard.app')
@section('title',
    'Categorise
    ')
@section('body')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Tables:</h1>
        <button type="button" class="btn btn-primary ml-0 mb-3" data-toggle="modal" data-target="#add_category"
                data-whatever="@getbootstrap"><i class="fa-solid fa-layer-group"></i> Create Category</button>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary d-inline mr-3">Categorise controller</h6>


            </div>
            @include('admin.categories.filler.filter')
            {{-- table data --}}
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Status</th>
                                <th>Posts Count</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Status</th>
                                <th>Posts Count</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            @forelse ($categories as $category)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $category->name }}</td>
                                    <td class="{{ $category->status == 1 ? 'text-success' : 'text-danger' }}">
                                        {{ $category->status == 1 ? 'Active' : 'Not Active' }}</td>
                                    <td>{{ $category->posts_count }}</td>
                                    <td>{{ $category->created_at }}</td>
                                    <td>
                                        <button type="button" class="btn btn-primary m-auto" data-toggle="modal" data-target="#edit_category_{{ $category->id }}"
                data-whatever="@getbootstrap" title="Edit Category"><i class="fa-solid fa-pen-to-square"></i></button>
                                        <a href="{{ route('admin.categories.status', $category->id) }}"
                                            class="btn btn-dark m-auto" title="Block"><i
                                                class="{{ $category->status == 1 ? 'fa-solid fa-lock-open' : 'fa-solid fa-lock' }}"></i></a>
                                        <form action="{{ route('admin.categories.destroy', $category->id) }}"
                                            id="delete_category_{{ $category->id }}" method="POST" class="d-inline m-auto">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-danger m-auto"
                                                onclick="if(confirm('Do You Want To Delete The category')){document.getElementById('delete_category_{{ $category->id }}').submit()} return false ;"
                                                title="Delete"><i class="fa-solid fa-trash-can"></i></button>
                                        </form>
                                    </td>
                                    {{-- Edit Category Model --}}
                                  @include('admin.categories.edit')
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="8" class="alert alert-info text-center">No categories Yet Now !</td>
                                </tr>
                            @endforelse

                        </tbody>
                    </table>
                    {{-- {{ $categories->appends(request()->input())->links() }} --}}
                </div>
            </div>
        </div>
        {{-- model add new category --}}
       @include('admin.categories.create')
    </div>

    <!-- /.container-fluid -->
@endsection
