@extends('layouts.frontend.app')
@section('title', 'Profile')
@section('breadcrumb')
@section('body')
@php
    // نستخدم preg_replace لفلترة أي شيء بعد أول رقم
    $username = preg_replace('/\d.*/', '', Auth::guard('web')->user()->username);
@endphp


    <div class="dashboard container">
        <!-- Sidebar -->
        <aside class="profile-sidebar m-auto mt-sm-0">
            <div class="user-info text-center p-3 m-auto">
                <img src="{{ asset(Auth::guard('web')->user()->image) }}" alt="{{ Auth::guard('web')->user()->name }}"
                    class="rounded-circle mb-2 " style="width: 80px; height: 80px; object-fit: cover" />
                <h5 class="mb-0" style="color: #ff6f61">{{ $username }}</h5>
            </div>
            <ul class="profile-sidebar-menu">
                <li class="menu-item active" data-section="profile"><i class="fa-solid fa-user"></i> Profile</li>
                <li class="menu-item" data-section="notifications"><i class="fa-solid fa-bell"></i> Notifications</li>
                <li class="menu-item" data-section="settings"><i class="fa-solid fa-gear"></i> Settings</li>
                <li class="menu-item" data-section="support"><i class="fa-solid fa-headset"></i> Support</li>
                <li class="menu-item" data-section="logout"><i class="fa-solid fa-right-from-bracket"></i> Logout</li>
            </ul>
        </aside>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Profile Section -->
            <section id="profile" class="content-section active">
                <h2>User Profile</h2>
                <div class="user-profile h-25">
                    <img src="{{ asset(Auth::guard('web')->user()->image) }}" alt="{{ Auth::guard('web')->user()->name }}"
                        class="profile-img" />
                    <span class="username">{{ Auth::guard('web')->user()->name }}</span>
                </div>

                <!-- Add Post Section -->
                <form action="{{ route('frontend.dashboard.post.store') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    <section id="add-post" class="add-post-section">
                        <h2>Add Post</h2>
                        <div class="post-form">
                            <!-- Post Title -->
                            <input type="text" name="title" id="postTitle" placeholder="Post Title"
                                value="{{ old('title') }}" />
                            @error('title')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                            <input type="text" name="key_words" id="keywords" placeholder="Enter keywords"
                                value="{{ old('key_words') }}" />
                            @error('key_words')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                            <textarea type="text" name="small_desc" placeholder="Enter Small description">{{ old('small_desc') }}</textarea>
                            @error('small_desc')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror

                            <!-- Post Content -->
                            <textarea name="desc" id="postContent" placeholder="What's on your mind?">{{ old('desc') }}</textarea>
                            @error('desc')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror

                            <!-- Image Upload -->
                            <input type="file" name="images[]" id="postImage" accept="image/*" multiple />
                            @error('images[]')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror
                            <div class="tn-slider">
                                <div id="imagePreview" class="slick-slider"></div>
                            </div>

                            <!-- Category Dropdown -->
                            <select name="category_id" id="postCategory">
                                <option disabled selected>Select Category</option>
                                @foreach ($categories as $category)
                                    <option {{ old('category_id') == $category->id ? 'selected' : '' }}
                                        value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach

                            </select>
                            @error('category_id')
                                <div class="alert alert-danger">{{ $message }}</div>
                            @enderror

                            <!-- Enable Comments Checkbox -->
                            <label class="d-block">
                                <input type="checkbox" name="comment_able" id="enableComments"
                                    @checked(true) /> Enable Comments
                            </label>

                            <!-- Post Button -->
                            <button id="postBtn" class="post-btn"><i class="fa-regular fa-newspaper"></i> Post</button>
                        </div>
                    </section>
                </form>

                <!--  Show/Edit Post Section -->
                <section id="posts-section" class="posts-section">
                    <h2>Your Posts</h2>

                    <ul class="user-posts">

                        <div class="user-profile h-25">
                            <img src="{{ asset(Auth::guard('web')->user()->image) }}"
                                alt="{{ Auth::guard('web')->user()->username }}" class="profile-img" />
                            <span class="username">{{ $username }}</span>
                        </div>
                        <!-- Example of a Post Item -->
                        @forelse ($posts as $post )
                            <li class="post-item">
                                <div class="col-md-12 tn-left">
                                    <div class="row tn-slider">

                                        @foreach ($post->images as $image)
                                            <div class="col-md-6 @if ($loop->index == 0) 'active ' @endif">
                                                <div class="tn-img ">
                                                    <img class="img-fluid w-100" src="{{ asset($image->path) }}" />
                                                    <div class="tn-title">
                                                        <a href=""></a>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach


                                    </div>
                                </div>
                                <!-- Post Images Slider -->
                                <div class="tn-slider">
                                    <div class="slick-slider edit-sider" id="postImages">
                                        <!-- Existing Images -->
                                    </div>
                                </div>
                                <!-- Editable Title -->
                                <h5>{{ $post->title }}</h5>

                                <!-- Editable Content -->
                                <p>
                                    {!! chunk_split($post->desc, 60) !!}
                                </p>


                                <!-- Image Upload Input for Editing -->
                                <input type="file" class="edit-post-image" accept="image/*" multiple disabled />
                                <!-- Editable Category Dropdown -->
                                <select class="post-category" disabled>
                                    <option value="general" selected>General</option>
                                    <option value="tech">Tech</option>
                                    <option value="life">Life</option>
                                </select>

                                <!-- Editable Enable Comments Checkbox -->
                                <label>
                                    <input type="checkbox" class="enable-comments" disabled
                                        @checked($post->comment_able == 1) />
                                    Enable Comments
                                </label>

                                <!-- Post Meta: Views and Comments -->
                                <div class="post-meta">
                                    <span class="views">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-eye-fill" viewBox="0 0 16 16">
                                            <path d="M10.5 8a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0" />
                                            <path
                                                d="M0 8s3-5.5 8-5.5S16 8 16 8s-3 5.5-8 5.5S0 8 0 8m8 3.5a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7" />
                                        </svg>
                                        {{ $post->num_of_views }}
                                    </span>

                                    {{-- <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                            fill="currentColor" class="bi bi-chat" viewBox="0 0 16 16">
                                            <path
                                                d="M2.678 11.894a1 1 0 0 1 .287.801 11 11 0 0 1-.398 2c1.395-.323 2.247-.697 2.634-.893a1 1 0 0 1 .71-.074A8 8 0 0 0 8 14c3.996 0 7-2.807 7-6s-3.004-6-7-6-7 2.808-7 6c0 1.468.617 2.83 1.678 3.894m-.493 3.905a22 22 0 0 1-.713.129c-.2.032-.352-.176-.273-.362a10 10 0 0 0 .244-.637l.003-.01c.248-.72.45-1.548.524-2.319C.743 11.37 0 9.76 0 8c0-3.866 3.582-7 8-7s8 3.134 8 7-3.582 7-8 7a9 9 0 0 1-2.347-.306c-.52.263-1.639.742-3.468 1.105" />
                                        </svg> --}}
                                    {{-- <a href="javascript:void(0)"></a> --}}
                                    <button class="postComments btn" id="commentBtn_{{ $post->id }}"
                                        post-id="{{ $post->id }}"> <i class="fa-regular fa-comment"></i></button>
                                    <button class="hideComments btn" id="hideCommentId_{{ $post->id }}"
                                        post-id="{{ $post->id }}" style="display: none"> hide Comments <i
                                            class="fa-solid fa-comment-slash"></i></button>
                                </div>

                                <!-- Post Actions -->
                                <div class="post-actions">
                                    <a href="{{ route('frontend.dashboard.post.edit', $post->slug) }}"
                                        class="btn btn-info"> <i class="fa-regular fa-pen-to-square"></i> Edit </a>
                                    <a href="javascript:void(0)"
                                        onclick="if(confirm('Are You sure To Delete This Post?')){getElementById('deleteForm_{{ $post->id }}').submit()} return false"
                                        class="btn btn-danger"> <i class="fa-regular fa-trash-can"></i> Delete</a>
                                    <form id="deleteForm_{{ $post->id }}"
                                        action="{{ route('frontend.dashboard.post.delete') }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <input type="hidden" name="slug" value="{{ $post->slug }}">
                                    </form>
                                </div>

                                <!-- Comments Section (Initially Hidden) -->
                                <ul id="displayComment_{{ $post->id }}" class="comments-section"
                                    style="display: none">

                                    <!-- Additional comments will be added dynamically -->
                                </ul>
                            </li>
                        @empty
                            <div class="alert alert-info">
                                No Posts !
                            </div>
                        @endforelse
                        <!-- Additional posts will be added dynamically -->
                    </ul>
                </section>
            </section>

            <!-- Notifications Section -->
            <section id="notifications" class="content-section">
                <div class="row">
                    <div class="col-6">
                        <h2>Notifications</h2>
                    </div>
                    <div class="col-6">
                        @if (auth()->user()->notifications->count() > 0)
                            <a href="{{ route('frontend.dashboard.notification.delete.all') }}"
                                class="btn btn-sm btn-warning float-right"><i class="fa-solid fa-trash"></i> Delete
                                All</a>
                        @endif

                    </div>
                </div>
                <ul class="notification-list ">
                    @forelse (auth()->user()->notifications  as $notify)
                    <a href="{{ route('frontend.post.show', $notify->data['post_slug']) }}?notify={{ $notify->id }}">
                        <div class="notification alert alert-info d-flex justify-content-between align-items-center">
                            <div>
                                <strong>You have Notification from : {{ $notify->data['user_name'] }}</strong>
                                <br>
                                Post title : {{ $notify->data['post_title'] }}
                                <div>
                                    {{ $notify->created_at->diffForHumans() }}
                                </div>
                            </div>

                            <button
                                onclick="if(confirm('Are You Sure To Delete Notify?')){document.getElementById('deleteNotify').submit()} return false;"
                                class="btn btn-danger btn-sm">
                                <i class="fa-regular fa-trash-can"></i>
                            </button>
                        </div>
                    </a>

                        <form action="{{ route('frontend.dashboard.notification.delete') }}" method="POST"
                            id="deleteNotify">
                            @csrf
                            <input type="hidden" name="notify_id" value="{{ $notify->id }}">
                        </form>
                    @empty
                        <div class="alert alert-info">
                            No Notification Yet !
                        </div>
                    @endforelse
                </ul>
            </section>

            <!-- Settings Section -->
            <section id="settings" class="content-section">
                <h2>Settings</h2>
                <form action="{{ route('frontend.dashboard.setting.update') }}" class="settings-form" method="POST"
                    enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                        <label for="username">Name:</label>
                        <input type="text" name="name" id="username" value="{{ auth()->user()->name }}" />
                        @error('name')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" name="username" id="username" value="{{ auth()->user()->username }}" />
                        @error('username')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" name="email" id="email" value="{{ auth()->user()->email }}" />
                        @error('email')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="email">Phone:</label>
                        <input type="text" name="phone" id="phone" placeholder="Enter Your Phone" value="{{ auth()->user()->phone }}" />
                        @error('phone')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="profile-image">Profile Image:</label>
                        <input type="file" name="image" id="profile-image" accept="image/*" />
                        @error('image')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                       <img src="{{ asset(auth()->user()->image) }}" class="img-thumbnail w-25 m-auto"
                       id="profile_img" alt="{{ auth()->user()->name }}">
                    </div>
                    <div class="form-group">
                        <label for="country">Country:</label>
                        <input type="text" name="country" id="country" value="{{ auth()->user()->country }}" />
                        @error('country')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="city">City:</label>
                        <input type="text" name="city" id="city" value="{{ auth()->user()->city }}" />
                        @error('city')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="street">Street:</label>
                        <input type="text" name="street" id="street" placeholder="Enter your street"
                            value="{{ auth()->user()->street }}" />
                        @error('street')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="floor">Floor:</label>
                        <input type="text" name="floor" id="floor" placeholder="Enter your street"
                            value="{{ auth()->user()->floor }}" />
                        @error('floor')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <button type="submit" class="save-settings-btn"> Save Changes</button>
                </form>

                <!-- Form to change the password -->
                <form action="{{ route('frontend.dashboard.setting.change.password') }}" method="POST"
                    class="change-password-form">
                    @csrf
                    <h2>Change Password</h2>
                    <div class="form-group">
                        <label for="current-password">Current Password:</label>
                        <input type="password" name="current_password" id="current-password"
                            placeholder="Enter Current Password" />
                        @error('current_password')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="new-password">New Password:</label>
                        <input type="password" name="password" id="new-password" placeholder="Enter New Password" />
                        @error('password')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="confirm-password">Confirm New Password:</label>
                        <input type="password" name="password_confirmation" id="confirm-password"
                            placeholder="Enter Confirm New " />
                    </div>
                    <button type="submit" class="change-password-btn">
                        Change Password
                    </button>
                </form>
            </section>
            <!-- Support Section -->
            <section id="support" class="content-section">
                <h2 class="test-canter"><a href="{{ $getSetting->whatsapp }}" title="whats app" target="_blank">
                        Support <i class="fa-brands fa-whatsapp "></i></a></h2>

            </section>
            <!-- Logout Section -->
            <section id="logout" class="content-section">
                <h2>Are You Sure Logout</h2>
                <div class="row m-auto">
                    <form action="{{ route('logout') }}" method="POST" class=" col-ms-6 offset-1">
                        @csrf
                        <button type="submit" class="btn btn-info">Yes</button>
                    </form>
                    <div class="col-6">
                        <a href="{{ route('frontend.dashboard.profile') }}" class="btn btn-info">cansel</a>
                    </div>

                </div>

            </section>
        </div>
    </div>
@endsection
@push('js')
    <script>
        $(document).on('change', '#profile-image', function (e) {
            e.preventDefault();
            var file = this.files[0];
            if (file) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#profile_img').attr('src', e.target.result);
                }
                reader.readAsDataURL(file);
            }
        });
        document.addEventListener("DOMContentLoaded", function() {
            const menuItems = document.querySelectorAll(".menu-item");
            const contentSections = document.querySelectorAll(".content-section");

            // Sidebar toggle functionality
            menuItems.forEach((item) => {
                item.addEventListener("click", function() {
                    menuItems.forEach((i) => i.classList.remove("active"));
                    this.classList.add("active");

                    const sectionToShow = this.getAttribute("data-section");
                    contentSections.forEach((section) =>
                        section.classList.remove("active")
                    );
                    document.getElementById(sectionToShow).classList.add("active");
                });
            });

            // Check if there's a hash in the URL and display the corresponding section
            const hash = window.location.hash.substring(1); // Remove the "#" character
            if (hash) {
                const targetSection = document.getElementById(hash);
                if (targetSection) {
                    contentSections.forEach((section) => section.classList.remove("active"));
                    targetSection.classList.add("active");

                    // Optionally, add active class to the corresponding menu item
                    menuItems.forEach((item) => item.classList.remove("active"));
                    const targetMenuItem = document.querySelector(`.menu-item[data-section="${hash}"]`);
                    if (targetMenuItem) {
                        targetMenuItem.classList.add("active");
                    }
                }
            }
        });
    </script>

    <script>
        $(function() {
            $('#postImage').fileinput({
                theme: 'fa5',
                allowedFileTypes: ['image'],
                maxFileCount: 5,
                showUpload: false,
            });
            $('#postContent').summernote({
                height: 300,
            });
        });
        //get post comments
        $(document).on('click', '.postComments', function(e) {
            e.preventDefault();
            var post_id = $(this).attr('post-id');


            $.ajax({
                type: "GET",
                url: '{{ route('frontend.dashboard.post.getComment', ':post_id') }}'.replace(':post_id',
                    post_id),
                success: function(response) {
                    $('#displayComment_' + post_id).empty();
                    $.each(response.data, function(indexInArray, comment) {
                        $('#displayComment_' + post_id).append(`<li class="comment-item">
                                        <img src="${comment.user.image}" alt="User Image" class="comment-img" />
                                        <div class="comment-content">
                                            <span class="comment-username">${comment.user.name}</span>
                                            <p class="comment-text">${comment.comment}</p>
                                        </div>
                                    </li>`).show();
                    });
                    $('#commentBtn_' + post_id).hide();
                    $('#hideCommentId_' + post_id).show();


                }
            });
        });
        // hide post comments
        $(document).on('click', '.hideComments', function(e) {
            e.preventDefault();
            var post_id = $(this).attr('post-id');
            // 1- hide comments
            $('#displayComment_' + post_id).hide();
            // 2- hide (hide comment button)
            $('#hideCommentId_' + post_id).hide();
            // 3- show comment button
            $('#commentBtn_' + post_id).show();
        });
    </script>
@endpush
