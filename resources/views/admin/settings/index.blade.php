@extends('layouts.dashboard.app')
@section('title', 'Setting')
@push('css')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/css/dropify.min.css">
@endpush
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
                                    <h1 class="h4 text-gray-900 mb-4"><i class="fa-solid fa-gears"></i>
                                        Update Setting</h1>
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
                                <form action="{{ route('admin.setting.update') }}" method="POST" class="user"
                                    enctype="multipart/form-data">
                                    @csrf

                                    <div class="form-group row">
                                        <div class="col-sm-12 mb-6 mb-sm-0">
                                            <label for="exampleInputsite_name" class="label text-primary">Name:</label>
                                            <input type="text" name="site_name" title="Site Name"
                                                class="form-control form-control-user @error('site_name') is-invalid @enderror"
                                                id="exampleInputsite_name" aria-describedby="site_nameHelp"
                                                placeholder="Enter Site Name ..." required value="{{ old('site_name',$getSetting->site_name) }}">
                                            @error('site_name')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-12 mb-6 mb-sm-0">
                                            <input type="hidden" name="setting_id"
                                                class="form-control form-control-user @error('setting_id') is-invalid @enderror"
                                                id="exampleInputsetting_id" aria-describedby="setting_idHelp"
                                                 required value="{{ $getSetting->id }}">
                                            @error('setting_id')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label for="exampleInputEmail" class="label text-primary">Email:</label>
                                            <input type="email" name="email" title="Email"
                                                class="form-control form-control-user @error('email') is-invalid @enderror"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Enter User Email Address..." required
                                                value="{{ old('email',$getSetting->email) }}">
                                            @error('email')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label for="exampleInputPhone" class="label text-primary">Phone:</label>
                                            <input type="text" name="phone" title="Phone"
                                                class="form-control form-control-user @error('phone') is-invalid @enderror"
                                                id="exampleInputPhone" aria-describedby="nameHelp"
                                                placeholder="Enter User Phone ..." required value="{{ old('phone',$getSetting->phone) }}">
                                            @error('phone')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label for="exampleInputCountry" class="label text-primary">Country:</label>
                                            <input type="text" name="country" title="Country"
                                                class="form-control form-control-user @error('country') is-invalid @enderror"
                                                id="exampleInputCountry" aria-describedby="nameHelp"
                                                placeholder="Enter Country ..." required value="{{ old('country',$getSetting->country) }}">
                                            @error('country')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label for="exampleInputCity" class="label text-primary">City:</label>
                                            <input type="text" name="city" title="City"
                                                class="form-control form-control-user @error('city') is-invalid @enderror"
                                                id="exampleInputCity" aria-describedby="nameHelp"
                                                placeholder="Enter City ..." required value="{{ old('city',$getSetting->city) }}">
                                            @error('city')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label for="exampleInputStreet" class="label text-primary">Street:</label>
                                            <input type="text" name="street" title="Street"
                                                class="form-control form-control-user @error('street') is-invalid @enderror"
                                                id="exampleInputStreet" aria-describedby="nameHelp"
                                                placeholder="Enter Street ..." required value="{{ old('street',$getSetting->street) }}">
                                            @error('street')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label for="exampleInputYoutube" class="label text-primary">link Youtube:</label>
                                            <input type="text" name="youtube" title="Youtube"
                                                class="form-control form-control-user @error('youtube') is-invalid @enderror"
                                                id="exampleInputname" aria-describedby="nameHelp"
                                                placeholder="Enter Youtube Link ..." required value="{{ old('youtube',$getSetting->youtube) }}">
                                            @error('youtube')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label for="exampleInputfacebook" class="label text-primary">link Facebook:</label>
                                            <input type="text" name="facebook" title="Facebook"
                                                class="form-control form-control-user @error('facebook') is-invalid @enderror"
                                                id="exampleInputfacebook" required placeholder="Enter Facebook Link" value="{{ old('facebook',$getSetting->facebook) }}">
                                            @error('facebook')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label for="exampleInputinstagram" class="label text-primary">link Instagram:</label>
                                            <input type="text" name="instagram" title="Instagram"
                                                class="form-control form-control-user @error('instagram') is-invalid @enderror"
                                                id="exampleInputinstagram" required placeholder="Enter Instagram Link" value="{{ old('instagram',$getSetting->instagram) }}">
                                            @error('instagram')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label for="exampleInputlinkedin" class="label text-primary">link Linkedin:</label>
                                            <input type="text" name="linkedin" title="Linkedin"
                                                class="form-control form-control-user @error('linkedin') is-invalid @enderror"
                                                id="exampleInputlinkedin" required placeholder="Enter Linkedin Link" value="{{ old('linkedin',$getSetting->linkedin) }}">
                                            @error('linkedin')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label for="exampleInputtwitter" class="label text-primary">link Twitter(X):</label>
                                            <input type="text" name="twitter" title="Twitter(X)"
                                                class="form-control form-control-user @error('twitter') is-invalid @enderror"
                                                id="exampleInputtwitter" required placeholder="Enter Twitter Link" value="{{ old('twitter',$getSetting->twitter) }}">
                                            @error('twitter')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class=" col-sm-12 mb-6 mb-sm-0">
                                            <label for="exampleInputsmall_desc" class="label text-primary">Small Description:</label>
                                            <input type="text" name="small_desc" title="Small Description"
                                                class="form-control form-control-user @error('small_desc') is-invalid @enderror"
                                                id="exampleInputsmall_desc" required
                                                placeholder="Enter Small Description Link" value="{{ old('small_desc',$getSetting->small_desc) }}">
                                            @error('small_desc')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class=" col-sm-6 mb-3 mb-sm-0">
                                            <label class="label text-primary" for="Favicon">Favicon</label>
                                            <input type="file" name="favicon" title="Favicon" id="Favicon"
                                                class="form-control rounded-pill dropify @error('favicon') is-invalid @enderror"
                                                value="{{ old('favicon') }}">
                                                @error('favicon')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                                <br>
                                                <img src="{{asset($getSetting->favicon) }}" class="thumbanil w-100" alt="">

                                        </div>
                                        <div class=" col-sm-6 mb-3 mb-sm-0">
                                            <label class="label text-primary" for="Logo">Logo</label>
                                            <input type="file" name="logo" title="Logo" id="Logo"
                                                class="form-control rounded-pill dropify @error('logo') is-invalid @enderror"
                                                value="{{ $getSetting->logo }}">
                                                @error('logo')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                                @enderror
                                                <br>
                                                <img src="{{asset($getSetting->logo) }}" class="thumbanil w-100" alt="">

                                        </div>
                                    </div>
                                    <div class="row">

                                        <button class="btn btn-primary rounded-pill m-auto btn-block col-5 "><i
                                                class="fa-solid fa-arrow-up"></i> Update Setting </button>
                                        <a href="{{ route('admin.posts.index') }}"
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
    @push('js')
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Dropify/0.2.2/js/dropify.min.js"></script>
        <script>
            $('.dropify').dropify({
                messages: {
                    'default': 'Uplode Image',
                    'replace': 'Drag and drop or click to replace',
                    'remove': 'Remove',
                    'error': 'Ooops, something wrong happended.'
                }
            });
        </script>
    @endpush
