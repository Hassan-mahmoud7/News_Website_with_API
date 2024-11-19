@auth
    <script>
        role = "admin";
        adminId = {{ auth('admin')->user()->id }};
    </script>
@endauth
<script src="{{ asset('build/assets/app-962e0b91.js') }}"></script>
<!-- Bootstrap core JavaScript-->
<script src="{{ asset('assets/dashboard/vendor/jquery/jquery.min.js') }}"></script>
<script src="{{ asset('assets/dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js') }}"></script>

<!-- Core plugin JavaScript-->
<script src="{{ asset('assets/dashboard/vendor/jquery-easing/jquery.easing.min.js') }}"></script>

<!-- Custom scripts for all pages-->
<script src="{{ asset('assets/dashboard/js/sb-admin-2.min.js') }}"></script>

<!-- Page level plugins -->
<script src="{{ asset('assets/dashboard/vendor/chart.js/Chart.min.js') }}"></script>

<!-- Page level custom scripts -->
<script src="{{ asset('assets/dashboard/js/demo/chart-area-demo.js') }}"></script>
<script src="{{ asset('assets/dashboard/js/demo/chart-pie-demo.js') }}"></script>
<!-- Page level custom scripts -->
<script src="{{ asset('assets/dashboard/js/demo/datatables-demo.js') }}"></script>
<!-- Page level plugins -->
<script src="{{ asset('assets/dashboard/vendor/datatables/jquery.dataTables.min.js') }}"></script>
<script src="{{ asset('assets/dashboard/vendor/datatables/dataTables.bootstrap4.min.js') }}"></script>
{{-- js file input --}}
<script src="{{ asset('assets/vendor/file-input/js/fileinput.min.js') }}"></script>
<script src="{{ asset('assets/vendor/file-input/themes/fa5/theme.min.js') }}"></script>
{{-- summernote --}}
<script src="{{ asset('assets/vendor/summernote/summernote-bs4.min.js') }}"></script>

@stack('js')
@livewireScripts

</body>

</html>
