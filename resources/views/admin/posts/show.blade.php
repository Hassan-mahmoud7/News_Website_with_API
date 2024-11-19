@extends('layouts.dashboard.app')
@section('title', 'Post Show')
@section('body')
    <!-- Nested Row within Card Body -->
    <div class="row justify-content-center">
        <div class="col-xl-10 col-lg-12 col-md-9">
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <div class="row ">
                        <div class="col-lg-8 m-auto">
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4"><i class="fa-regular fa-newspaper text-primary"></i>
                                        Show Post:
                                        {{ $post->name }}</h1>
                                </div>
                                <div class="users">
                                    <div class="row m-auto">
                                        <h5 class="alert alert-light shadow-sm mt-3 fs-6"><i class="fa-solid fa-user"></i>
                                            Publisher :
                                            {{ $post->user->name ?? $post->admin->name }}</h5>

                                    </div>

                                    <!-- Carousel -->
                                    <div id="newsCarousel" class="carousel slide shadow p-3 mb-2 bg-white rounded"
                                        data-ride="carousel">
                                        <ol class="carousel-indicators">
                                            <li data-target="#newsCarousel" data-slide-to="0" class="active"></li>
                                            <li data-target="#newsCarousel" data-slide-to="1"></li>
                                            <li data-target="#newsCarousel" data-slide-to="2"></li>
                                        </ol>
                                        <div class="carousel-inner">
                                            @foreach ($post->images as $image)
                                                <div class="carousel-item @if ($loop->index == 0) active @endif">
                                                    <img src="{{ asset($image->path) }}"
                                                        class="d-block w-100 h-100 img-fluid" alt="First Slide">
                                                    <div class="carousel-caption d-none d-md-block">
                                                        <h5>{{ $post->title }}</h5>

                                                    </div>
                                                </div>
                                            @endforeach

                                            <!-- Add more carousel-item blocks for additional slides -->
                                        </div>
                                        <a class="carousel-control-prev" href="#newsCarousel" role="button"
                                            data-slide="prev">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Previous</span>
                                        </a>
                                        <a class="carousel-control-next" href="#newsCarousel" role="button"
                                            data-slide="next">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </div>
                                    <div class="row mb-2">
                                        <p class="ml-4"><i class="fa-solid fa-eye"></i> Views :{{ $post->num_of_views }}
                                        </p>
                                        <p class="ml-4 mr-4  ml-auto"><i class="fa-regular fa-calendar-plus"></i> Created
                                            :{{ $post->created_at->diffForHumans() }}</p>
                                    </div>
                                    <div class="row mb-4">
                                        <p class="ml-4 {{ $post->comment_able == 0 ? 'text-success' : 'text-warning' }}"><i
                                                class="fa-solid fa-comment"></i> Comments
                                            :{{ $post->comment_able == 0 ? 'Active' : 'Not Active' }}</p>
                                        <p
                                            class="ml-4 mr-4 ml-auto {{ $post->comment_able == 1 ? 'text-success' : 'text-dark' }}">
                                            <i
                                                class="{{ $post->status == 1 ? 'fa-solid fa-lock-open' : 'fa-solid fa-lock' }}"></i>
                                            Status :{{ $post->status == 1 ? 'Active' : 'Not Active' }}
                                        </p>
                                    </div>
                                    <div class="row mb-4">
                                        <b class="ml-4"><i class="fa-solid fa-layer-group"></i> Category
                                            :{{ $post->category->name }}</b>
                                    </div>
                                    <div class="sn-content ml-2">
                                        Small Description : {{ $post->small_desc }}.
                                    </div>
                                    <div class="sn-content ml-2">
                                        {!! $post->desc !!}
                                    </div>
                                    <div class="row mt-5">
                                        <a href="{{ route('admin.posts.index') }}"
                                            class="btn btn-info mt-1 m-auto col-sm-3" title="cancel"><i
                                                class="fa-solid fa-arrow-right"></i> Back To Posts </a>

                                        <a href="{{ route('admin.posts.status', $post->id) }}"
                                            class="btn btn-{{ $post->status == 1 ? 'dark' : 'success' }} mt-1 m-auto col-sm-2"
                                            title="Change Status"><i
                                                class="{{ $post->status == 1 ? 'fa-solid fa-lock' : 'fa-solid fa-lock-open' }}"></i>
                                            {{ $post->status == 1 ? 'Block' : 'Active' }}</a>
                                        @if ($post->user_id == null)
                                            <a href="{{ route('admin.posts.edit', $post->id) }}"
                                                class="btn btn-warning mt-1 m-auto col-sm-2" title="edit"><i
                                                    class="fa-regular fa-edit"></i> Edit</a>
                                        @endif
                                        <form action="{{ route('admin.posts.destroy', $post->id) }}"
                                            id="delete_post_{{ $post->id }}" method="POST"
                                            class="d-inline m-auto col-sm-2 mt-1">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-danger mt-1 m-auto col-12"
                                                onclick="if(confirm('Do You Want To Delete The User')){document.getElementById('delete_post_{{ $post->id }}').submit()} return false ;"
                                                title="Delete"><i class="fa-solid fa-trash-can" title="delete"></i> Delete
                                            </button>
                                        </form>
                                    </div>
                                    <!-- Comment Section -->
                                    <h5 class="text-primary m-4"><i class="fa-solid fa-comments"></i> Comments : </h5>
                                    @forelse ($post->comments as $comment)
                                        <div class="col-12 mt-3 w-100">
                                            <div class="d-flex justify-content-center row">
                                                <div class="col-md-12 w-100">
                                                    <div class="d-flex flex-column comment-section ">
                                                        <div class="p-3 mb-2 bg-light shadow-sm rounded">
                                                            <div class="d-flex flex-row user-info "><img
                                                                    class="rounded-circle"
                                                                    src="{{ asset($comment->user->image) }}"
                                                                    width="40">
                                                                    <div class="d-flex flex-column justify-content-start ml-2 ">
                                                                        <span
                                                                        class="d-block font-weight-bold name"><a href="{{ route('admin.users.show', $comment->user_id) }}" class="text-decoration-none">{{ $comment->user->name }}</a> :</span><span
                                                                        class="date text-black-50">Shared publicly - {{ $comment->created_at->diffForHumans() }}</span>
                                                                    </div>
                                                                    <div class="btn btn-danger ml-auto" title="Delete This comment">
                                                                        <form action="{{ route('admin.posts.delete.comment', $comment->id) }}"
                                                                            id="delete_comment_{{ $comment->id }}" method="POST"
                                                                            >
                                                                            @csrf
                                                                            @method('DELETE')
                                                                            <button class="btn btn-danger"
                                                                                onclick="if(confirm('Do You Want To Delete The Comment')){document.getElementById('delete_comment_{{ $comment->id }}').submit()} return false ;"
                                                                                title="Delete"><i class="fa-solid fa-trash-can" title="delete"></i> Delete
                                                                            </button>
                                                                        </form>
                                                                    </div>
                                                            </div>
                                                            <div class="mt-2">
                                                                <p class="comment-text">{{ $comment->comment }}</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @empty
                                        <div class="col-12 mt-5">
                                            <div class="d-flex justify-content-center row">
                                                <div class="col-md-8">
                                                    <div class="d-flex flex-column comment-section">
                                                        <div class="bg-white p-2">
                                                            <div class="alert alert-warning">
                                                                No Comments Yet !
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforelse
                                </div>
                                {{-- <button class="btn btn-primary btn-user btn-block"> Create User </button> --}}
                            </div>

                            <hr>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
