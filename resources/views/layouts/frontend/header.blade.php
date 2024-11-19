<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>{{ config('app.name') }} | @yield('title')</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta
      content="@yield('key_words')"
      name="keywords"
    />
    <meta content="@yield('meta_desc')" name="description" />
    @stack('header')
    <meta name="robots" content="index, follow">
    <!-- Favicon -->
    <link href="{{ asset($getSetting->favicon) }}" type="image/png" rel="icon" />


    <!-- Google Fonts -->
    <link
      href="https://fonts.googleapis.com/css?family=Montserrat:400,600&display=swap"
      rel="stylesheet"
    />
    {{-- font awesome --}}
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
    <!-- CSS Libraries -->
    <link
      href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
      rel="stylesheet"
    />
    <link href="{{asset('assets/frontend/lib/slick/slick.css')}}" rel="stylesheet" />
    <link href="{{asset('assets/frontend/lib/slick/slick-theme.css')}}" rel="stylesheet" />
     {{-- file input --}}
     <link rel="stylesheet" href="{{ asset('assets/vendor/file-input/css/fileinput.min.css') }}">
     {{-- summernote --}}
     <link rel="stylesheet" href="{{ asset('assets/vendor/summernote/summernote-bs4.min.css') }}">

    <!-- Template Stylesheet -->
    <link href="{{asset('assets/frontend/css/style.css')}}" rel="stylesheet" />

  </head>

  <body>
