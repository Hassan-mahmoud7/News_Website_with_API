@extends('layouts.frontend.app')
@section('title', 'Show' . ' ' . $mainPost->title)
@section('meta_desc')
    {{ $mainPost->small_desc }}
@endsection
{{-- @section('key_words')
    @foreach ($mainPost->key_words as $key_word)
        {{ $key_word }}
    @endforeach
@endsection --}}
@push('header')
<meta rel="canonical" href="{{ url()->full() }}" />
@endpush
@section('breadcrumb')
    <li class="breadcrumb-item"><a href="{{ route('frontend') }}">Home</a></li>
    <li class="breadcrumb-item active">{{ $mainPost->title }}</li>
@endsection

@section('body')
    <!-- Single News Start-->
    <div class="single-news">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Carousel -->
                    <div class="row m-auto">
                        <h5 class="alert alert-light shadow-sm mt-3 fs-6"><i class="fa-solid fa-user"></i> Publisher :
                            {{ $mainPost->user->name ?? $mainPost->admin->name }}</h5>

                    </div>

                    <!-- Carousel -->
                    <div id="newsCarousel" class="carousel slide shadow p-3 mb-2 bg-white rounded" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#newsCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#newsCarousel" data-slide-to="1"></li>
                            <li data-target="#newsCarousel" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            @foreach ($mainPost->images as $image)
                                <div class="carousel-item @if ($loop->index == 0) active @endif">
                                    <img src="{{ asset($image->path) }}"
                                        class="d-block w-100 img_bg img-fluid" alt="First Slide">
                                    <div class="carousel-caption d-none d-md-block">
                                        <h5>{{ $mainPost->title }}</h5>

                                    </div>
                                </div>
                            @endforeach

                            <!-- Add more carousel-item blocks for additional slides -->
                        </div>
                        <a class="carousel-control-prev" href="#newsCarousel" role="button"
                            data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#newsCarousel" role="button"
                            data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                    <div class="row mb-4">
                        <small class="ml-4 fs-6"><i class="fa-regular fa-calendar-plus"></i> Created :{{ $mainPost->created_at->diffForHumans()}}</small>
                        <small class="ml-4 fs-6 ml-auto text-end"><i class="fa-solid fa-eye"></i> Views :{{ $mainPost->num_of_views}}</small>
                    </div>
                    <div class="sn-content ml-2">
                        {!! $mainPost->desc !!}
                    </div>

                    <!-- Comment Section -->


                    <div class="comment-section">
                        <!-- Comment Input -->
                        @if ($mainPost->comment_able == true )
                        @if (auth('web')->check() && auth('web')->user()->status != 0)

                        <form id="CommentForm">
                            <div class="comment-input">
                                @csrf
                                <input type="text" name="comment" title="comment" placeholder="Add a comment..."
                                    id="commentBox" />

                                {{-- <input type="hidden" name="user_id" value="{{ auth()->user()->id }}"> --}}
                                <input type="hidden" name="post_id" value="{{ $mainPost->id }}">
                                <button type="submit">Comment</button>
                            </div>
                        </form>

                        @endif
                        @else
                            <div class="alert alert-info ">
                                Unable To Comment
                            </div>
                        @endif

                        <!-- Display Comments -->
                        <div style="display:none" id="errorMsg" class="alert alert-danger">
                            {{-- display error --}}

                        </div>
                        <div class="comments">
                            @foreach ($mainPost->comments as $comment)
                                <div class="comment">
                                    <img src="{{ asset($comment->user->image) }}" alt="{{ $comment->user->name }}"
                                        class="comment-img" />
                                    <div class="comment-content">
                                        <span class="username">{{ $comment->user->name }}</span>
                                        <p class="comment-text">{{ $comment->comment }}</p>
                                    </div>
                                </div>
                            @endforeach

                            <!-- Add more comments here for demonstration -->
                        </div>

                        <!-- Show More Button -->
                        @if ($mainPost->comments->count() > 2)
                            <button id="showMoreBtn" class="show-more-btn">Show more</button>
                        @endif
                    </div>




                    <!-- Related News -->
                    <div class="sn-related">
                        <h2>Related News</h2>
                        <div class="row sn-slider">
                            @foreach ($posts_belongs_to_category as $post)
                                <div class="col-md-4">
                                    <div class="sn-img">
                                        <img src="{{ asset($post->images->first()->path) }}" alt="{{ $post->title }}"
                                            class="img-fluid" />
                                        <div class="sn-title">
                                            <a href="{{ route('frontend.post.show', $post->slug) }}"
                                                title="{{ $post->title }}">{{ $post->title }}</a>
                                        </div>
                                    </div>
                                </div>
                            @endforeach

                        </div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div class="sidebar">
                        <div class="sidebar-widget">
                            <h2 class="sw-title">In This Category</h2>
                            <div class="news-list">
                                @foreach ($posts_belongs_to_category as $post)
                                    <div class="nl-item">
                                        <div class="nl-img">
                                            <img src="{{ asset($post->images->first()->path) }}"
                                                alt="{{ $post->title }}" />
                                        </div>
                                        <div class="nl-title">
                                            <a href="{{ route('frontend.post.show', $post->slug) }}"
                                                title="{{ $post->title }}">{{ $post->title }}</a>
                                        </div>
                                    </div>
                                @endforeach

                            </div>
                        </div>



                        <div class="sidebar-widget">
                            <div class="tab-news">
                                <ul class="nav nav-pills nav-justified">

                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="pill" href="#popular">Popular</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="pill" href="#latest">Latest</a>
                                    </li>
                                </ul>

                                <div class="tab-content">

                                    <div id="popular" class="container tab-pane active">
                                        @foreach ($greatest_posts_comments as $post)
                                            <div class="tn-news">
                                                <div class="tn-img">
                                                    <img src="{{ asset($post->images->first()->path) ?? asset($post->images->first()) }}"
                                                        alt="{{ $post->title }}" />
                                                </div>
                                                <div class="tn-title">
                                                    <a href="{{ route('frontend.post.show', $post->slug) }}"
                                                        title="{{ $post->title }}">{{ $post->title }}</a>
                                                </div>
                                            </div>
                                        @endforeach

                                    </div>
                                    {{-- Latest --}}
                                    <div id="latest" class="container tab-pane fade">
                                        @foreach ($latest_posts as $post)
                                            <div class="tn-news">
                                                <div class="tn-img">
                                                    <img src="{{ asset($post->images->first()->path ?? $post->images->first()) }}"
                                                        alt="{{ $post->title }}" />
                                                </div>
                                                <div class="tn-title">
                                                    <a href="{{ route('frontend.post.show', $post->slug) }}"
                                                        title="{{ $post->title }}">{{ $post->title }}</a>
                                                </div>
                                            </div>
                                        @endforeach

                                    </div>
                                </div>
                            </div>
                        </div>

                        {{-- image Desin --}}
                        {{-- <div class="sidebar-widget">
                            <div class="image">
                                <a href="https://htmlcodex.com"><img src="img/ads-2.jpg" alt="Image" /></a>
                            </div>
                        </div> --}}
                        <div class="sidebar-widget">
                            <h2 class="sw-title">News Category</h2>
                            <div class="category">
                                <ul>
                                    @foreach ($categories as $category)
                                        <li><a href="{{ route('frontend.category.posts', $category->slug) }}"
                                                title="{{ $category->name }}">{{ $category->name }}</a><span>({{ $category->posts->count() }})</span>
                                        </li>
                                    @endforeach

                                </ul>
                            </div>
                        </div>

                        {{--
                        <div class="sidebar-widget">
                            <h2 class="sw-title">Tags Cloud</h2>
                            <div class="tags">
                                <a href="">National</a>
                                <a href="">International</a>
                                <a href="">Economics</a>
                                <a href="">Politics</a>
                                <a href="">Lifestyle</a>
                                <a href="">Technology</a>
                                <a href="">Trades</a>
                            </div>
                        </div> --}}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Single News End-->
@endsection
@push('js')
    <script>
        //show more comments
        $(document).on('click', '#showMoreBtn', function(e) {
            e.preventDefault();
            $.ajax({
                url: "{{ route('frontend.post.getAllComments', $mainPost->slug) }}",
                type: 'GET',
                success: function(data) {
                    $('.comments').empty();
                    $.each(data, function(key, comment) {
                        $('.comments').append(`
                          <div class="comment">
                                    <img src="${comment.user.image}" alt="${ comment.user.name }"
                                        class="comment-img" />
                                    <div class="comment-content">
                                        <span class="username">${comment.user.name}</span>
                                        <p class="comment-text">${comment.comment}</p>
                                    </div>
                                </div>
                        `);
                        $('#showMoreBtn').hide();
                    });
                },
                error: function(data) {

                },
            })
            //save comment

        });
        $(document).on('submit', '#CommentForm', function(e) {
            e.preventDefault();
            var formData = new FormData($(this)[0]);
            $('#commentBox').val('');
            $.ajax({
                url: "{{ route('frontend.post.add.comment') }}",
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,

                success: function(data) {
                    $('#errorMsg').hide();
                    $('.comments').prepend(`
                          <div class="comment">
                                    <img src="${data.comment.user.image}" alt="${data.comment.user.name}"
                                        class="comment-img"/>
                                    <div class="comment-content">
                                        <span class="username">${data.comment.user.name}</span>
                                        <p class="comment-text">${data.comment.comment}</p>
                                    </div>
                                </div>
                        `);
                },
                error: function(data) {
                    if (data.status === 401) {
                        // if user not login , show message login
                        $('#errorMsg').html(`
                    <div class="alert alert-info">
                        You need to <a href="{{ route('login') }}">log in</a> to comment.
                    </div>
                `).show();
                    } else {
                        var response = $.parseJSON(data.responseText);
                        $('#errorMsg').text(response.errors.comment).show();
                    }
                },
            });
        });
    </script>
@endpush
