@extends('layouts.dashboard.app')
@section('title', 'Create User')
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
                                    <h1 class="h4 text-gray-900 mb-4"><i class="fa-solid fa-user text-primary"></i> Create New
                                        User</h1>
                                </div>
                                <form action="{{ route('admin.users.store') }}" method="POST" class="user"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" name="name"
                                                class="form-control form-control-user @error('name') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter User Name ..." required value="{{ old('name') }}">
                                            @error('name')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" name="username"
                                                class="form-control form-control-user @error('username') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter User Username ..." required
                                                value="{{ old('username') }}">
                                            @error('username')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="email" name="email"
                                                class="form-control form-control-user @error('email') is-invalid @enderror"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Enter User Email Address..." required
                                                value="{{ old('email') }}">
                                            @error('email')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" name="phone"
                                                class="form-control form-control-user @error('phone') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter User Phone ..." required value="{{ old('phone') }}">
                                            @error('phone')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" name="country"
                                                class="form-control form-control-user @error('country') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter User Country ..." required value="{{ old('country') }}">
                                            @error('country')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" name="city"
                                                class="form-control form-control-user @error('city') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter User City ..." required value="{{ old('city') }}">
                                            @error('city')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" name="street"
                                                class="form-control form-control-user @error('street') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter User Street ..." required value="{{ old('street') }}">
                                            @error('street')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" name="floor"
                                                class="form-control form-control-user @error('floor') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter User Floor ..." required value="{{ old('floor') }}">
                                            @error('floor')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="password" name="password"
                                                class="form-control form-control-user @error('password') is-invalid @enderror"
                                                id="exampleInputPassword" required placeholder="Password">
                                            @error('password')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="password" name="password_confirmation"
                                                class="form-control form-control-user @error('password_confirmation') is-invalid @enderror"
                                                id="exampleInputPassword_confirmation" required
                                                placeholder="Password_confirmation">
                                            @error('password_confirmation')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <select name="status"
                                                class="form-control rounded-pill @error('status') is-invalid @enderror">
                                                <option selected disabled value="">Select Status</option>
                                                <option value="1">Active</option>
                                                <option value="0">Not Active</option>
                                            </select>
                                            @error('status')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <select name="email_verified_at"
                                                class="form-control rounded-pill @error('email_verified_at') is-invalid @enderror">
                                                <option selected disabled value="">Select Email Status</option>
                                                <option value="1">Active</option>
                                                <option value="0">Not Active</option>
                                            </select>
                                            @error('email_verified_at')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="file" name="image"
                                            class="form-control rounded-pill @error('image') is-invalid @enderror"
                                            placeholder="Enter User Image ..." value="{{ old('image') }}">
                                        @error('image')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="row">

                                        <button class="btn btn-primary rounded-pill m-auto btn-block col-5 "><i
                                                class="fa-solid fa-arrow-up"></i> Update User </button>
                                        <a href="{{ route('admin.users.index') }}"
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
