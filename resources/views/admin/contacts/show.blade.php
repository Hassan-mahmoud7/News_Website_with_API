@extends('layouts.dashboard.app')
@section('title', 'Contact Show')
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
                                    <h1 class="h4 text-gray-900 mb-4"><i class="fa-solid fa-address-book text-primary"></i> Show
                                        Contact:
                                        {{ $contact->name }}</h1>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div disabled class="alert alert-secondary"><span class="text-primary">Name:</span> {{ $contact->name }}
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div disabled class="alert alert-secondary"><span class="text-primary">Title:</span> {{ $contact->title }}
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div disabled class="alert alert-secondary "><span class="text-primary">Email:</span> {{ $contact->email }}
                                        </div>
                                    </div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <div disabled class="alert alert-secondary "><span class="text-primary">Phone:</span> {{ $contact->phone }}
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12 mb-3 mb-sm-0">
                                        <div disabled class="alert alert-secondary "><span class="text-primary">Message:</span> {{ $contact->body }}
                                        </div>
                                    </div>

                                </div>
                                {{-- <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input disabled
                                                class="alert alert-secondary {{ $contact->status == 1 ? 'text-success' : 'text-danger' }}"
                                                value="{{ $contact->status == true ? 'Status Active' : 'Status Block' }}">
                                        </div>

                                    </div> --}}
                                <div class="row">
                                    <a href=" mailto:{{ $contact->email }}?subject=Re:{{ urlencode($contact->title) }}"class="btn btn-success m-auto col-4"
                                        title="contact"><i class="fa-solid fa-reply"></i> Reply</a>
                                    <form action="{{ route('admin.users.destroy', $contact->id) }}"
                                        id="delete_user_{{ $contact->id }}" method="POST" class="d-inline m-auto col-4">
                                        @csrf
                                        @method('DELETE')
                                        <button class="btn btn-danger m-auto col"
                                            onclick="if(confirm('Do You Want To Delete The User')){document.getElementById('delete_user_{{ $contact->id }}').submit()} return false ;"
                                            title="Delete"><i class="fa-solid fa-trash-can"></i> Delete </button>
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
