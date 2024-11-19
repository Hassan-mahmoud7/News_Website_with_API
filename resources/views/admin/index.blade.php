@extends('layouts.dashboard.app')
@section('title' , 'Home')
@section('body')
  <!-- Begin Page Content -->
  <div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>

    </div>

    <!-- Content Row -->
   @livewire('admin.statistics')
    <!-- Content Row -->
    {{-- chart row --}}
    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-6 col-lg-6">
            <div class="card-body shadow  mb-3">

                <h4 class="text-primary">{{ $post_chart->options['chart_title'] }}</h4>
                {!! $post_chart->renderHtml() !!}

            </div>
        </div>

        <!-- Pie Chart -->
        <div class="col-xl-6 col-lg-6">
            <div class="card-body shadow  mb-3">

                <h4 class="text-primary">{{ $user_chart->options['chart_title'] }}</h4>
                {!! $user_chart->renderHtml() !!}

            </div>
        </div>
    </div>
    <div class="row">

        <!-- Area Chart -->
        <div class="col-xl-6 col-lg-6">
            <div class="card-body shadow  mb-3">

                <h4 class="text-primary">{{ $contact_chart->options['chart_title'] }}</h4>
                {!! $contact_chart->renderHtml() !!}

            </div>
        </div>

        <!-- Pie Chart -->
        <div class="col-xl-6 col-lg-6">
            <div class="card-body shadow  mb-3">

                <h4 class="text-primary">{{ $comment_chart->options['chart_title'] }}</h4>
                {!! $comment_chart->renderHtml() !!}

            </div>
        </div>
    </div>
    <!-- Posts Comments Row -->
        @livewire('admin.latest-posts-comments')
</div>
<!-- /.container-fluid -->
@endsection
@push('js')
{!! $post_chart->renderChartJsLibrary() !!}
{!! $post_chart->renderJs() !!}
{!! $user_chart->renderChartJsLibrary() !!}
{!! $user_chart->renderJs() !!}
{!! $contact_chart->renderChartJsLibrary() !!}
{!! $contact_chart->renderJs() !!}
{!! $comment_chart->renderChartJsLibrary() !!}
{!! $comment_chart->renderJs() !!}
@endpush
