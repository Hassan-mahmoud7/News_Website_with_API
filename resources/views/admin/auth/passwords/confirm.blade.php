@extends('layouts.dashboard.auth.app')
@section('title','Confirm')
@section('body')
<!-- Nested Row within Card Body -->
<div class="row justify-content-center">
    <div class="col-xl-10 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <div class="row ">
                <div class="col-lg-6 m-auto">
                    <div class="p-5">
                        <div class="text-center">
                            <h1 class="h4 text-gray-900 mb-4"><i
                                    class="fa-solid fa-face-smile text-primary"></i> Enter Your Verfication Code!</h1>
                        </div>
                        <form action="{{ route('admin.password.verify.otp') }}" method="POST" class="user">
                            @csrf
                            <div class="form-group">
                                <input type="email" hidden name="email"
                                    class="form-control form-control-user @error('email') is-invalid @enderror"
                                    id="exampleInputEmail" aria-describedby="emailHelp"
                                    value="{{ $email }}">
                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-group">
                                <input type="text" name="token"
                                    class="form-control form-control-user @error('token') is-invalid @enderror"
                                    id="exampleInputPassword" placeholder="Token">
                                @error('token')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <button class="btn btn-primary btn-user btn-block">
                                Check Token
                            </button>
                        </form>
                        <hr>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
