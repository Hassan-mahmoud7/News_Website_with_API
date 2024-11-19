@extends('layouts.dashboard.app')
@section('title', 'Edit Admin')

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
                                    <h1 class="h4 text-gray-900 mb-4">
                                        <i class="fa-solid fa-user-tie text-primary"></i> Edit Admin</h1>
                                </div>
                                <form action="{{ route('admin.admins.update', $admin->id) }}" method="POST" class="user">
                                    @csrf
                                    @method('PUT')
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" name="name" title="Name"
                                                class="form-control form-control-user @error('name') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter Admin Name ..." required value="{{ old('name', $admin->name) }}">
                                            @error('name')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" name="username" title="User Name"
                                                class="form-control form-control-user @error('username') is-invalid @enderror"
                                                id="exampleInputusername" aria-describedby="usernameHelp"
                                                placeholder="Enter Admin username ..." required
                                                value="{{ old('username' ,$admin->username) }}">
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
                                                placeholder="Enter Admin Email Address..." required
                                                value="{{ old('email' , $admin->email) }}">
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
                                                placeholder="Enter Admin Phone ..." required value="{{ old('phone' ,$admin->phone) }}">
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
                                                id="exampleInputPassword" placeholder="Password">
                                            @error('password')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="password" name="password_confirmation" title="Password Confirmation"
                                                class="form-control form-control-user @error('password_confirmation') is-invalid @enderror"
                                                id="exampleInputPassword_confirmation"
                                                placeholder="Password Confirmation">
                                            @error('password_confirmation')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <select name="status" title="Status"
                                                class="form-control rounded-pill @error('status') is-invalid @enderror">
                                                <option selected disabled value="">Select Status</option>
                                                <option value="1" @selected($admin->status == 1)>Active</option>
                                                <option value="0" @selected($admin->status == 0)>Not Active</option>
                                            </select>
                                            @error('status')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <select name="role_id" title="Roles"
                                                class="form-control rounded-pill @error('role_id') is-invalid @enderror">
                                                <option selected disabled value="">Select Role</option>
                                                @forelse ($authorizations as $authorization)
                                                <option value="{{ $authorization->id }}" @selected($admin->role_id == $authorization->id)>{{ $authorization->role }}</option>
                                                @empty
                                                <option disabled selected> No Roles</option>
                                                @endforelse
                                            </select>
                                            @error('role_id')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="row">
                                        <button class="btn btn-primary rounded-pill m-auto btn-block col-5 "><i class="fa-solid fa-arrow-up"></i> Update Admin </button>
                                        <a href="{{ route('admin.admins.index') }}"  class="btn btn-info rounded-pill btn-block col-5 m-auto"><i
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

