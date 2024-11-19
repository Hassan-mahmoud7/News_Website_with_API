<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

    <!-- Sidebar Toggle (Topbar) -->
    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
        <i class="fa fa-bars"></i>
    </button>

    <!-- Topbar Search -->
    <form method="GET" action="{{ route('admin.search') }}"
        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
        @csrf
        <div class="input-group">
            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                aria-label="Search" name="keyword" aria-describedby="basic-addon2">
            <select class="form-control bg-light border-0 " name="option" id="">
                <option selected disabled value="">Select Option</option>
                @can('posts')
                    <option value="post">posts</option>
                @endcan

                @can('users')
                    <option value="user">users</option>
                @endcan
                @can('categories')
                    <option value="category">categories</option>
                @endcan
                @can('contacts')
                    <option value="contact">contacts</option>
                @endcan
            </select>
            <div class="input-group-append">
                <button class="btn btn-primary" type="submit">
                    <i class="fas fa-search fa-sm"></i>
                </button>
            </div>
        </div>
    </form>

    <!-- Topbar Navbar -->
    <ul class="navbar-nav ml-auto">

        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
        <li class="nav-item dropdown no-arrow d-sm-none">
            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown"
                aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
            </a>
            <!-- Dropdown - Messages -->
            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                aria-labelledby="searchDropdown">
                <form method="GET" action="{{ route('admin.search') }}"
                    class="form-inline mr-auto w-100 navbar-search">
                    @csrf
                    <div class="input-group">
                        <input type="text" name="keyword" class="form-control bg-light border-0 small"
                            placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                        <select name="option" class="form-control bg-light border-0 small" id="">
                            <option selected disabled value="">Select Option</option>
                            @can('posts')
                                <option value="post">posts</option>
                            @endcan
                            @can('users')
                                <option value="user">users</option>
                            @endcan
                            @can('categories')
                                <option value="category">categories</option>
                            @endcan
                            @can('contacts')
                                <option value="contact">contacts</option>
                            @endcan
                        </select>
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </li>

        <!-- Nav Item - Alerts -->
        @can('notifications')

            <li class="nav-item dropdown no-arrow mx-1">
                <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    <i class="fas fa-bell fa-fw"></i>
                    <!-- Counter - Alerts -->
                    @auth

                        <span id="countNotify"
                            class="badge badge-danger badge-counter">{{ Auth::guard('admin')->user()->unreadNotifications->count() }}</span>
                    @endauth
                </a>
                <!-- Dropdown - Alerts -->
                <div id="notify_push" class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                    aria-labelledby="alertsDropdown">
                    {{-- <h6 class="dropdown-header">
                    Notifications
                </h6> --}}
                    @auth
                        @forelse (Auth::guard('admin')->user()->unreadNotifications as $notify)
                            <a class="dropdown-item d-flex align-items-center"
                                href="{{ $notify->data['link'] }}?notify_admin={{ $notify->id }}">
                                <div class="mr-3">
                                    <div class="icon-circle bg-primary">
                                        <i class="fas fa-file-alt text-white"></i>
                                    </div>
                                </div>
                                <div>
                                    <div class="small text-gray-500">{{ $notify->data['date'] }}</div>
                                    <span class="font-weight-bold">{{ $notify->data['contact_title'] }}!</span>
                                </div>
                            </a>

                        @empty
                            
                        @endforelse
                    @endauth
                    @if (!is_null(Auth::guard('admin')->user()->unreadNotifications))
                        <a class="dropdown-item text-center small text-gray-500"
                            href="{{ route('admin.notification.index') }}">Show All Alerts</a>
                    @endif
                </div>
            </li>
        @endcan



        <div class="topbar-divider d-none d-sm-block"></div>

        <!-- Nav Item - User Information -->
        <li class="nav-item dropdown no-arrow">
            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                    @if(Auth::guard('admin')->check())
                        {{ auth('admin')->user()->username }}
                    @endif
                </span>
                <img class="img-profile rounded-circle" src="{{ asset('assets/dashboard/img/undraw_profile.svg') }}">
            </a>
            <!-- Dropdown - User Information -->
            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                @can('profile')
                    <a class="dropdown-item" href="{{ route('admin.profile.index') }}">
                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                        Profile
                    </a>
                @endcan
                <a class="dropdown-item" href="{{ route('admin.setting.index') }}">
                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                    Settings
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                    Logout
                </a>
            </div>
        </li>

    </ul>

</nav>
<!-- End of Topbar -->
