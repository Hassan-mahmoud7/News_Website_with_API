@extends('layouts.frontend.app')
@section('title' , 'Category' . ' '.$category->name)
@section('meta_desc')
{{ $category->small_desc }}
@endsection
@push('header')
<meta rel="canonical" href="{{ url()->full() }}" />
@endpush
@section('breadcrumb')
<li class="breadcrumb-item"><a href="{{ route('frontend') }}">Home</a></li>
<li class="breadcrumb-item active">{{ $category->name }}</li>
@endsection
@section('body')
<div class="main-news mt-5">
    <div class="container">
        <div class="row">
            <div class="col-lg-9">
                <div class="row">
                    @forelse ($posts as $post)
                        <div class="col-md-4">
                            <div class="mn-img">
                                <img src="{{ asset($post->images->first()->path) }}" loading="lazy"/>
                                <div class="mn-title">
                                    <a  href="{{ route('frontend.post.show',$post->slug) }}" title="{{ $post->title }}">{{ $post->title }}</a>
                                </div>
                            </div>
                        </div>
                        @empty
                        <div class="alert alert-info">
                            Category Is Empty
                        </div>
                    @endforelse
                </div>
                {{ $posts->links() }}
            </div>

            <div class="col-lg-3">
                <div class="mn-list">
                    <h2>Other Categories</h2>
                    <ul>
                        @foreach ($categories as $category)

                        <li><a href="{{ route('frontend.category.posts', $category->slug) }}" title="{{ $category->name }}">{{ $category->name }}</a></li>
                        @endforeach
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
