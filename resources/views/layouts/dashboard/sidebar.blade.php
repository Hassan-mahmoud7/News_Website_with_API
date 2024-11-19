<!-- Sidebar -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center" href="{{ route('admin.home') }}">
        <div class="sidebar-brand-icon ">
            <img src="{{ asset($getSetting->logo) /* asset('assets/frontend/img/' . $getSetting->logo)*/ }}"
                alt="Logo" class="w-100" />
        </div>
        <div class="sidebar-brand-text mx-3"><sup></sup></div>
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <!-- Nav Item - Dashboard -->
    @can('home')
        <li class="nav-item active">
            <a class="nav-link" href="{{ route('admin.home') }}">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>
    @endcan
    <div class="sidebar-heading">
        Interface
    </div>
    <!-- Nav Item - Pages Collapse Menu User -->
    @can('users')
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePagesUesr"
                aria-expanded="true" aria-controls="collapsePagesUesr">
                <i class="fas fa-fw fa-users"></i>
                <span>UesrManagement</span>
            </a>
            <div id="collapsePagesUesr" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="{{ route('admin.users.index') }}">Users</a>
                    <a class="collapse-item" href="{{ route('admin.users.create') }}">Add User</a>
                </div>
            </div>
        </li>
    @endcan
    <!-- Nav Item - Pages Collapse Menu Posts -->
    @can('posts')
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePagesPosts"
                aria-expanded="true" aria-controls="collapsePagesPosts">
                <i class="fa-solid fa-newspaper"></i>
                <span>Posts Management</span>
            </a>
            <div id="collapsePagesPosts" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="{{ route('admin.posts.index') }}">Posts</a>
                    <a class="collapse-item" href="{{ route('admin.posts.create') }}">Add Post</a>
                </div>
            </div>
        </li>
    @endcan
    <!-- Nav Item - Admins Collapse Menu -->
    @can('admins')
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAdmins"
                aria-expanded="true" aria-controls="collapseAdmins">
                <i class="fa-solid fa-user-tie"></i>
                <span> Admins</span>
            </a>
            <div id="collapseAdmins" class="collapse" aria-labelledby="headingAdmins" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Admins Managment:</h6>
                    <a class="collapse-item" href="{{ route('admin.admins.index') }}">Admin</a>
                    <a class="collapse-item" href="{{ route('admin.admins.create') }}">Add New Admin</a>
                </div>
            </div>
        </li>
    @endcan
    <!-- Nav Item - Authorizations Collapse Menu -->
    @can('authorizations')
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAuthorizations"
                aria-expanded="true" aria-controls="collapseAuthorizations">
                <i class="fa-solid fa-flag"></i>
                <span> Authorizations</span>
            </a>
            <div id="collapseAuthorizations" class="collapse" aria-labelledby="headingAuthorizations"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Authorizations Managment:</h6>
                    <a class="collapse-item" href="{{ route('admin.authorizations.index') }}">Roles</a>
                </div>
            </div>
        </li>
    @endcan
    <!-- Nav Item - Tables Categories -->
    @can('categories')
        <li class="nav-item">
            <a class="nav-link" href="{{ route('admin.categories.index') }}">
                <i class="fa-solid fa-layer-group"></i>
                <span>Categories</span></a>
        </li>
    @endcan
    <!-- Divider -->


    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Addons
    </div>
    <!-- Nav Item - Utilities Collapse Menu -->
    @can('settings')
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSetting"
                aria-expanded="true" aria-controls="collapseSetting">
                <i class="fa-solid fa-gear"></i>
                <span> Settings</span>
            </a>
            <div id="collapseSetting" class="collapse" aria-labelledby="headingSetting" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Settings Managment:</h6>
                    <a class="collapse-item" href="{{ route('admin.setting.index') }}">Settings</a>
                    <a class="collapse-item" href="{{ route('admin.related-site.index') }}">Related Site</a>
                </div>
            </div>
        </li>
    @endcan
    <!-- Nav Item - Tables Notifications -->
    @can('notifications')
        <li class="nav-item">
            <a class="nav-link" href="{{ route('admin.notification.index') }}">
                <i class="fa-solid fa-bell"></i>
                <span>Notifications</span></a>
        </li>
    @endcan

    <!-- Nav Item - Contacts Collapse Menu -->
    @can('contacts')
        <li class="nav-item">
            <a class="nav-link" href="{{ route('admin.contacts.index') }}">
                <i class="fa-solid fa-phone-flip"></i>
                <span> Contacts</span></a>
        </li>
    @endcan

    <!-- Nav Item - Charts -->
    {{-- <li class="nav-item">
        <a class="nav-link" href="charts.html">
            <i class="fas fa-fw fa-chart-area"></i>
            <span>Charts</span></a>
    </li> --}}

    <!-- Divider -->
    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>


</ul>
<!-- End of Sidebar -->
