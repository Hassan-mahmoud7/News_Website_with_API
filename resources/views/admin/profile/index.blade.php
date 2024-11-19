@extends('layouts.dashboard.app')
@section('title', 'profile')
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
                                    <h1 class="h4 text-gray-900 mb-4"><i class="fa-solid fa-user-tie text-primary"></i>
                                        Update Profile</h1>
                                </div>
                                @if ($errors->any())
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endif
                                <form action="{{ route('admin.profile.update') }}" method="POST" class="user">
                                    @csrf

                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-6 mb-sm-0">
                                            <input type="text" name="name" title="Name"
                                                class="form-control form-control-user @error('name') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter Site Name ..." required value="{{ old('name',auth('admin')->user()->name) }}">
                                            @error('name')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-6 mb-sm-0">
                                            <input type="text" name="username" title="User Name"
                                                class="form-control form-control-user @error('username') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter Site Name ..." required value="{{ old('username',auth('admin')->user()->username) }}">
                                            @error('username')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="email" name="email" title="Email"
                                                class="form-control form-control-user @error('email') is-invalid @enderror"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Enter User Email Address..." required
                                                value="{{ old('email',auth('admin')->user()->email) }}">
                                            @error('email')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" name="phone" title="Phone"
                                                class="form-control form-control-user @error('phone') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter User Phone ..." required value="{{ old('phone',auth('admin')->user()->phone) }}">
                                            @error('phone')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="password" name="password" title="Password"
                                                class="form-control form-control-user @error('password') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter Your password ..." required >
                                            @error('password')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="row">

                                        <button class="btn btn-primary rounded-pill m-auto btn-block col-5 "><i
                                                class="fa-solid fa-arrow-up"></i> Update Profile </button>
                                        <a href="{{ route('admin.home') }}"
                                            class="btn btn-info rounded-pill btn-block col-5 m-auto"><i
                                                class="fa-solid fa-arrow-right"></i> Cancel </a>
                                    </div>
                                </form>
                                <hr>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endsection
