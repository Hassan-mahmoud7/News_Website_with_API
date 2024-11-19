@extends('layouts.dashboard.app')
@section('title','Related Site')
@section('body')
    <!-- Begin Page Content -->
    <div class="container-fluid">

        <!-- Page Heading -->
        <h1 class="h3 mb-2 text-gray-800">Tables:</h1>
        <button type="button" class="btn btn-primary ml-0 mb-3" data-toggle="modal" data-target="#add_Related_site"
                data-whatever="@getbootstrap"><i class="fa-solid fa-globe"></i> Create Related Site</button>

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary d-inline mr-3">Related Sites controller</h6>


            </div>
            {{-- table data --}}
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Url</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Name</th>
                                <th>Url</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            @forelse ($relatedSites as $relatedSite)
                                <tr>
                                    <td>{{ $loop->iteration }}</td>
                                    <td>{{ $relatedSite->name }}</td>
                                    <td>{{ $relatedSite->url }}</td>
                                    <td>{{ $relatedSite->created_at->diffForHumans() }}</td>
                                    <td>
                                        <button type="button" class="btn btn-primary m-auto" data-toggle="modal" data-target="#edit_relatedSite_{{ $relatedSite->id }}"
                data-whatever="@getbootstrap" title="Edit Related Site"><i class="fa-solid fa-pen-to-square"></i></button>
                                        <form action="{{ route('admin.related-site.destroy', $relatedSite->id) }}"
                                            id="delete_relatedSite_{{ $relatedSite->id }}" method="POST" class="d-inline m-auto">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-danger m-auto"
                                                onclick="if(confirm('Do You Want To Delete The relatedSite')){document.getElementById('delete_relatedSite_{{ $relatedSite->id }}').submit()} return false ;"
                                                title="Delete"><i class="fa-solid fa-trash-can"></i></button>
                                        </form>
                                    </td>
                                    {{-- Edit relatedSite Model --}}
                                  @include('admin.related-site.edit')
                                </tr>
                            @empty
                                <tr>
                                    <td colspan="8" class="alert alert-info text-center">No Related Site Yet Now !</td>
                                </tr>
                            @endforelse

                        </tbody>
                    </table>
                    {{-- {{ $relatedSites->appends(request()->input())->links() }} --}}
                </div>
            </div>
        </div>
        {{-- model add new Related Site --}}
       @include('admin.related-site.create')
    </div>

    <!-- /.container-fluid -->
@endsection
