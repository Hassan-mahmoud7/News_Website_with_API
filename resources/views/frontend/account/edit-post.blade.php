@extends('layouts.frontend.app')
@section('title', 'Edit' . ' : ' . $post->title)
@section('breadcrumb')
@section('body')

    <div class="dashboard container">
        <!-- Sidebar -->


        <!-- Main Content -->
        <div class="main-content col-md-12">
            <!-- Show/Edit Post Section -->
            <form action="{{ route('frontend.dashboard.post.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <section id="posts-section" class="posts-section">
                    <h2>Your Posts</h2>
                    <ul class="list-unstyled user-posts">
                        <!-- Example of a Post Item -->
                        @if (session()->has('errors'))
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach (session('errors')->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                        <input type="hidden" name="post_id" value="{{ $post->id }}">
                        <li class="post-item">
                            <!-- Editable Title -->
                            <input type="text" name="title" class="form-control mb-2 post-title"
                                value="{{ $post->title }}" />
                            <!-- Editable Keywords -->
                            {{-- <input type="text" name="key_words" class="form-control mb-2 post-title"
                                value="{{ $post->key_words }}" /> --}}
                            <!-- Editable Small Description -->
                            <textarea type="text" name="small_desc" id="small description" class="form-control mb-2 post-title"
                                placeholder="Enter Small description">{{ $post->small_desc }} </textarea>
                            <!-- Editable Content -->
                            <textarea name="desc" id="postDesc" class="form-control mb-2 post-content">{!! $post->desc !!} </textarea>
                            <!-- Image Upload Input for Editing -->
                            <input type="file" name="images[]" id="post_images" class="form-control mt-2 edit-post-image"
                                accept="image/*" multiple />

                            <!-- Editable Category Dropdown -->

                            <select name="category_id" id="postCategory" class="col-12 mt-3 mb-3 p-2">
                                <option disabled selected>Select Category</option>
                                @foreach ($categories as $category)
                                <option value="{{ $category->id }}" @selected($category->id)>
                                    {{ $category->name }}
                                </option>
                                @endforeach

                            </select>

                            <!-- Editable Enable Comments Checkbox -->
                            <div class="form-check mb-2">
                                <input name="comment_able" @checked($post->comment_able == 1) id="enableComments"
                                    class="form-check-input enable-comments" type="checkbox" />
                                <label class="form-check-label">
                                    Enable Comments
                                </label>
                            </div>

                            <!-- Post Meta: Views and Comments -->
                            <div class="post-meta d-flex justify-content-between">
                                <span class="views">
                                    <i class="fa-solid fa-eye"></i> {{ $post->num_of_views }}
                                    <i class="fa-solid fa-comments"></i> {{ $post->comments->count() }}
                                </span>
                            </div>

                            <!-- Post Actions -->
                            <div class="post-actions mt-2">
                                <button class="btn btn-primary edit-post-btn">save</button>
                                <a href="{{ route('frontend.dashboard.profile') }}"
                                    class="btn btn-info delete-post-btn">Cancel</a>
                            </div>

                        </li>
                        <!-- Additional posts will be added dynamically -->
                    </ul>
                </section>
            </form>
        </div>
    </div>

@endsection
@push('js')
    <script>
        $('#post_images').fileinput({
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
                            url: "{{ route('frontend.dashboard.post.image.delete', [$image->id, '_token' => csrf_token()]) }}", // server delete action
                            key: "{{ $image->id }}",

                        },
                    @endforeach
                @endif
            ]
        });
        // summernote Desc
        $('#postDesc').summernote({
            height: 300,
        });
    </script>
@endpush
