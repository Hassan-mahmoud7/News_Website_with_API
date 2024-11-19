@extends('layouts.dashboard.app')
@section('title','Posts
')
@section('body')
  <!-- Begin Page Content -->
  <div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Tables:</h1>
    <p class="mb-4">Posts controller</p>

    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">Posts controller</h6>
        </div>
       @include('admin.posts.filler.filter')
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>comments count</th>
                            <th>Catrgory</th>
                            <th>User</th>
                            <th>Status</th>
                            <th>Views</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>#</th>
                            <th>Title</th>
                            <th>comments count</th>
                            <th>Catrgory</th>
                            <th>User</th>
                            <th>Status</th>
                            <th>Views</th>
                            <th>Created At</th>
                            <th>Actions</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        @forelse ($posts as $post)
                        <tr>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $post->title }}</td>
                            <td>{{ $post->comments_count }}</td>
                            <td>{{ $post->category->name }}</td>
                            <td>{{ $post->user->name ?? $post->admin->name}}</td>
                            <td class="{{ $post->status == 1?'text-success':'text-danger' }}">{{ $post->status == 1?'Active':'Not Active' }}</td>
                            <td>{{ $post->num_of_views }}</td>
                            <td>{{ $post->created_at }}</td>
                            <td>
                                <a href="{{ route('admin.posts.show', ['post'=>$post->id , 'page'=> request()->page]) }}" class="btn btn-primary m-1" title="Show"><i class="fa-regular fa-eye"></i></a>
                                <a href="{{ route('admin.posts.status', $post->id) }}" class="btn btn-dark m-1" title="Block"><i class="{{ $post->status == 1?'fa-solid fa-lock-open':'fa-solid fa-lock' }}"></i></a>
                                <form action="{{ route('admin.posts.destroy', $post->id) }}" id="delete_post_{{ $post->id }}" method="POST" class="d-inline">
                                    @csrf
                                    @method('DELETE')
                                    <button class="btn btn-danger m-1" onclick="if(confirm('Do You Want To Delete The Post')){document.getElementById('delete_post_{{ $post->id }}').submit()} return false ;" title="Delete"><i class="fa-solid fa-trash-can"></i></button>
                                </form>
                                @if ($post->user_id == null)
                                 <a href="{{ route('admin.posts.edit', $post->id) }}" class="btn btn-warning m-1" title="edit"><i class="fa-regular fa-edit"></i></a>

                                @endif
                            </td>

                        </tr>
                        @empty
                        <tr><td colspan="8" class="alert alert-info text-center">No Posts Yet Now !</td></tr>
                        @endforelse

                    </tbody>
                </table>
                {{-- {{ $posts->appends(request()->input())->links() }} --}}
            </div>
        </div>
    </div>

</div>
<!-- /.container-fluid -->
@endsection
