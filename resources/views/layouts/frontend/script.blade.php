@auth
    <script>
        role = "user";
        userId = {{ auth()->user()->id }};
        showPostRoute = "{{ route('frontend.post.show',':slug') }}"
    </script>
@endauth
<script src="{{ asset('build/assets/app-962e0b91.js') }}"></script>
<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="{{ asset('assets/frontend/lib/easing/easing.min.js') }}"></script>
<script src="{{ asset('assets/frontend/lib/slick/slick.min.js') }}"></script>
{{-- js file input --}}
<script src="{{ asset('assets/vendor/file-input/js/fileinput.min.js') }}"></script>
<script src="{{ asset('assets/vendor/file-input/themes/fa5/theme.min.js') }}"></script>
{{-- summernote --}}
<script src="{{ asset('assets/vendor/summernote/summernote-bs4.min.js') }}"></script>

<!-- Template Javascript -->
<script src="{{ asset('assets/frontend/js/main.js') }}"></script>

@stack('js')
</body>

</html>
