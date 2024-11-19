@extends('layouts.frontend.app')
@section('title' , 'Search News')
@section('breadcrumb')
<li class="breadcrumb-item"><a href="{{ route('frontend') }}">Home</a></li>
<li class="breadcrumb-item active">Search</li>
@endsection
@section('body')

    <!-- Main News Start-->
    <div class="main-news">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        @forelse ($posts as $post)
                            <div class="col-md-4">
                                <div class="mn-img">
                                    <img src="{{ $post->images->first()->path }}" loading="lazy"/>
                                    <div class="mn-title">
                                        <a  href="{{ route('frontend.post.show',$post->slug) }}" title="{{ $post->title }}">{{ $post->title }}</a>
                                    </div>
                                </div>
                            </div>
                            @empty
                            <div class="alert alert-info col-12 m-5">
                                Sory Undfind Search: <span class="text-danger"> {{ $_GET['search'] }} </span>
                            </div>
                        @endforelse
                    </div>
                </div>
                {{ $posts->links() }}


            </div>
        </div>
    </div>
    <!-- Main News End-->
@endsection

