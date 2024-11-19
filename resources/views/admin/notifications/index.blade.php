@extends('layouts.dashboard.app')
@section('title', 'show Notifications')
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
                                    <h1 class="h4 text-gray-900 mb-4"><i class="fa-solid fa-bell"></i>
                                        Show Notifications</h1>
                                    </div>
                                    <div class="ml-auto">
                                        <a href="{{ route('admin.notification.delete.all') }}" class="btn btn-danger mb-4 ml-auto"><i class="fa-regular fa-trash-can"></i>
                                            delete All</a>
                                    </div>
                                <div class="users">

                                    <!-- Comment Section -->
                                    {{-- <h5 class="text-primary m-4"> Notifications : </h5> --}}
                                    @forelse ($notifications as $notification)
                                        <div class="col-12 mt-3 w-100">
                                            <div class="d-flex justify-content-center row">
                                                <div class="col-md-12 w-100">
                                                    <div class="d-flex flex-column comment-section ">
                                                        <div class="p-3 mb-2 bg-light shadow-sm rounded">
                                                            <div class="d-flex flex-row user-info ">

                                                                    <div class="d-flex flex-column justify-content-start ml-2 ">
                                                                        <span
                                                                        class="d-block font-weight-bold name"><a href="{{ $notification->data['link'] }}" class="text-decoration-none">{{ $notification->data['user_name'] }}</a> :-</span><span
                                                                        class="date text-black-50">Sent since - {{ $notification->created_at->diffForHumans() }}</span>
                                                                    </div>
                                                                    <div class="btn btn-danger ml-auto" title="Delete This comment">
                                                                        <form action="{{ route('admin.notification.destroy', $notification->id) }}"
                                                                            id="delete_comment_{{ $notification->id }}" method="POST"
                                                                            >
                                                                            @csrf
                                                                            @method('DELETE')
                                                                            <button class="btn btn-danger"
                                                                                onclick="if(confirm('Do You Want To Delete The Notification')){document.getElementById('delete_comment_{{ $notification->id }}').submit()} return false ;"
                                                                                title="Delete"><i class="fa-solid fa-trash-can" title="delete"></i> Delete
                                                                            </button>
                                                                        </form>
                                                                    </div>
                                                            </div>
                                                            <div class="mt-2">
                                                                <p class="comment-text">{{ $notification->data['contact_title'] }}</p>
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
                                                                No Notifications Yet !
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
