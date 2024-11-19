@extends('layouts.dashboard.app')
@section('title', 'Update Post')
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
                                    <h1 class="h4 text-gray-900 mb-4"><i class="fa-regular fa-edit text-primary"></i>
                                        Update Post</h1>
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
                                <form action="{{ route('admin.posts.update',$post->id) }}" method="POST" class="user"
                                    enctype="multipart/form-data">
                                    @csrf
                                    @method('PUT')


                                    <div class="form-group col-sm-12 mb-12 mb-sm-6">
                                        <input type="text" name="title"
                                            class="form-control form-control-user @error('title') is-invalid @enderror"
                                            id="exampleInputtitle" aria-describedby="titleHelp"
                                            placeholder="Enter Post title ..." required value="{{ old('title',$post->title) }}" title="title">
                                        @error('title')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>

                                    <div class="form-group col-sm-12 mb-12 mb-sm-6">
                                        <textarea type="text" name="small_desc" title="small Description"
                                            class="form-control form-control-user @error('small_desc') is-invalid @enderror" id="exampleInputname"
                                            aria-describedby="nameHelp" placeholder="Enter Post Smail Description ..." required>{{ old('small_desc' , $post->small_desc) }}</textarea>
                                        @error('small_desc')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group col-sm-12 mb-12 mb-sm-6">
                                        <textarea type="text" name="desc" title="Description" class="form-control form-control-user @error('desc') is-invalid @enderror"
                                            id="postContent" aria-describedby="nameHelp" placeholder="Enter Post Description ..." required>{!! old('desc' , $post->desc) !!}</textarea>
                                        @error('desc')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-12 mb-3 mb-sm-0">
                                            <select name="category_id" title="Select Category"
                                                class="form-control rounded-pill @error('category_id') is-invalid @enderror">
                                                <option selected disabled value="">Select Category</option>
                                                @foreach ($categories as $category)
                                                    <option @selected($category->id == $post->category_id)
                                                        value="{{ $category->id }}">{{ $category->name }}</option>
                                                @endforeach
                                            </select>
                                            @error('category_id')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <select name="status" title="Select Status"
                                                class="form-control rounded-pill @error('status') is-invalid @enderror">
                                                <option value="1" @selected($post->status == 1)>Active</option>
                                                <option value="0" @selected($post->status == 0)>Not Active</option>
                                            </select>
                                            @error('status')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <label class="form-control rounded-pill" title="Check  Comments Enable">
                                                <input type="checkbox" name="comment_able" id="enableComments"
                                                @checked($post->comment_able == 1)  /> Enable Comments
                                            </label>
                                            @error('comment_able')
                                                <span class="invalid-feedback" role="alert">
                                                    <strong>{{ $message }}</strong>
                                                </span>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="file" name="images[]" id="postImage" multiple
                                            class="form-control rounded-pill @error('images') is-invalid @enderror" value="{{ old('images') }}">
                                        @error('images')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                     <div class="row">

                                         <button class="btn btn-primary rounded-pill m-auto btn-block col-5 "><i class="fa-solid fa-arrow-up"></i> Update Post </button>
                                         <a  href="{{ route('admin.posts.index') }}" class="btn btn-info rounded-pill btn-block col-5 m-auto"><i class="fa-solid fa-arrow-right"></i> Cancel </a>
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
    <script>
        $('#postImage').fileinput({
            theme: 'fa5',
            allowedFileTypes: ['image'],
            maxFileCount: 5,
            showUpload: false,
            initialPreviewAsData: true,
            initialPreview: [
                @if ($post->images->count() > 0)
                    @foreach ($post->images as $image)
                        "{{ asset($image->path) }}",
                    @endforeach
                @endif
            ],
            initialPreviewConfig: [
                @if ($post->images->count() > 0)
                    @foreach ($post->images as $image)
                        {
                            caption: "{{ $image->path }}",
                            width: '120px',
                            url: "{{ route('admin.posts.image.delete', [$image->id, '_token' => csrf_token()]) }}", // server delete action
                            key: "{{ $image->id }}",

                        },
                    @endforeach
                @endif
            ]
        });
        // summernote Desc
        $('#postContent').summernote({
            height: 300,
        });
    </script>
@endpush
