@extends('layouts.frontend.app')
@section('title' , 'Contact-us')
@section('body')

@section('breadcrumb')
<li class="breadcrumb-item"><a href="{{ route('frontend') }}">Home</a></li>
<li class="breadcrumb-item active">Contact us</li>
@endsection
    <!-- Contact Start -->
    <div class="contact">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <div class="contact-form">
                        <form action="{{ route('frontend.contact.store') }}" method="POST">
                            @csrf
                            <div class="form-row">
                                <div class="form-group col-md-6">
                                    <input type="text" name="name" class="form-control" placeholder="Your Name" />
                                    @error('name')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="text" name="phone" class="form-control" placeholder="Your Phone" />
                                    @error('phone')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="form-group col-md-12">
                                    <input type="email" name="email" class="form-control" placeholder="Your Email" />
                                    @error('email')
                                        <div class="alert alert-danger">{{ $message }}</div>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group">
                                <input type="text" name="title" class="form-control" placeholder="Subject" />
                                @error('title')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror

                            </div>
                            <div class="form-group">
                                <textarea class="form-control" name="body" rows="5" placeholder="Message"></textarea>
                                @error('body')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                            <div class="row mb-3 mt-3">
                                <label for="" class="col-md-4 col-form-label text-md-end ">Prove you are not a robot</label>
                                <div class="col-md-6 ">
                                    {!! NoCaptcha::display() !!}
                                    @if ($errors->has('g-recaptcha-response'))
                                        <span class="help-block text-danger m-auto">
                                            <strong>{{ $errors->first('g-recaptcha-response') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>
                            <div>
                                <button class="btn" type="submit">Send Message</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="contact-info">
                        <h3>Get in Touch</h3>
                        <p class="mb-4">
                            The contact form is currently inactive. Get a functional and
                            working contact form with Ajax & PHP in a few minutes. Just copy
                            and paste the files, add a little code and you're done.

                        </p>
                        <h4><i
                                class="fa fa-map-marker"></i>{{ $getSetting->street . ' , ' . $getSetting->city . ' , ' . $getSetting->country }}
                        </h4>
                        <h4><i class="fa fa-envelope"></i>{{ $getSetting->email }}</h4>
                        <h4><i class="fa fa-phone"></i>{{ $getSetting->phone }}</h4>
                        <div class="social">
                            <a href="{{ $getSetting->twitter }}" target="_blank" title="twitter" rel="nofollow"><i
                                    class="fab fa-twitter"></i></a>
                            <a href="{{ $getSetting->facebook }}" target="_blank" title="facebook" rel="nofollow"><i
                                    class="fab fa-facebook-f"></i></a>
                            <a href="{{ $getSetting->linkedin }}" target="_blank" title="linkedin" rel="nofollow"><i
                                    class="fab fa-linkedin-in"></i></a>
                            <a href="{{ $getSetting->instagram }}" target="_blank" title="instagram" rel="nofollow"><i
                                    class="fab fa-instagram"></i></a>
                            <a href="{{ $getSetting->youtube }}" target="_blank" title="youtube" rel="nofollow"><i
                                    class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->
@endsection
@push('js')
    {!! NoCaptcha::renderJs() !!}
@endpush
