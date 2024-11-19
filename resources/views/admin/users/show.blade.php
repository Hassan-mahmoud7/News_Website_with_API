@extends('layouts.dashboard.app')
@section('title', 'User Show')
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
                                    <h1 class="h4 text-gray-900 mb-4"><i class="fa-solid fa-user text-primary"></i> Show User:
                                        {{ $user->name }}</h1>
                                </div>
                                <div class="users">
                                    <div class="row">
                                        <div class="col-6 m-auto">
                                            <img class="w-100 h-100 mb-5 mt-4 rounded img-thumbnail"
                                                src="{{ url($user->image) }}" alt="">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input disabled class="form-control form-control-user " id="exampleInputname"
                                                aria-describedby="nameHelp" value="Name: {{ $user->name }}">
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input disabled class="form-control form-control-user" id="exampleInputname"
                                                value="Username: {{ $user->username }}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input disabled class="form-control form-control-user " id="exampleInputEmail"
                                                aria-describedby="emailHelp" required value="Email: {{ $user->email }}">
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input disabled class="form-control form-control-user " id="exampleInputname"
                                                aria-describedby="nameHelp" required value="Phone: {{ $user->phone }}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input disabled class="form-control form-control-user " id="exampleInputname"
                                                aria-describedby="nameHelp" required value="Country: {{ $user->country }}">
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input disabled class="form-control form-control-user" id="exampleInputname"
                                                aria-describedby="nameHelp" required value="City: {{ $user->city }}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input disabled class="form-control form-control-user " id="exampleInputname"
                                                aria-describedby="nameHelp" required value="Street: {{ $user->street }}">
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input disabled class="form-control form-control-user" id="exampleInputname"
                                                aria-describedby="nameHelp" placeholder="Enter User Floor ..." required
                                                value="Floor: {{ $user->floor }}">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input disabled
                                                class="form-control form-control-user {{ $user->status == 1 ? 'text-success' : 'text-danger' }}"
                                                value="{{ $user->status == true ? 'Status Active' : 'Status Block' }}">
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input disabled class="form-control form-control-user "
                                                value="{{ $user->email_verified_at == null ? 'Email Verified Is:Not Active' : 'Email Verified Is: Active' }}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <a href="{{ route('admin.users.status', $user->id) }}"
                                            class="btn btn-{{ $user->status == 1 ? 'dark' : 'success' }} m-auto col-4"
                                            title="Block"><i
                                                class="{{ $user->status == 1 ? 'fa-solid fa-lock' : 'fa-solid fa-lock-open' }}"></i>
                                            {{ $user->status == 1 ? 'Block' : 'Active' }}</a>
                                        <form action="{{ route('admin.users.destroy', $user->id) }}"
                                            id="delete_user_{{ $user->id }}" method="POST"
                                            class="d-inline m-auto col-4">
                                            @csrf
                                            @method('DELETE')
                                            <button class="btn btn-danger m-auto col"
                                                onclick="if(confirm('Do You Want To Delete The User')){document.getElementById('delete_user_{{ $user->id }}').submit()} return false ;"
                                                title="Delete"><i class="fa-solid fa-trash-can"></i>Delete </button>
                                        </form>
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
