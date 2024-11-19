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
            <a class="nav-link" href="index.html">
                <i class="fas fa-fw fa-tachometer-alt"></i>
                <span>Dashboard</span></a>
        </li>
    @endcan

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Interface
    </div>

    <!-- Nav Item - Pages Collapse Menu -->
    {{-- <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
            aria-expanded="true" aria-controls="collapseTwo">
            <i class="fas fa-fw fa-cog"></i>
            <span>Components</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Custom Components:</h6>
                <a class="collapse-item" href="buttons.html">Buttons</a>
                <a class="collapse-item" href="cards.html">Cards</a>
            </div>
        </div>
    </li> --}}

    <!-- Nav Item - Utilities Collapse Menu -->
    @can('settings')
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                aria-expanded="true" aria-controls="collapseUtilities">
                <i class="fa-solid fa-gears"></i>
                <span> Setting</span>
            </a>
            <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Setting Managment:</h6>
                    <a class="collapse-item" href="{{ route('admin.setting.index') }}">Setting</a>
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

    <!-- Divider -->
    <hr class="sidebar-divider">

    <!-- Heading -->
    <div class="sidebar-heading">
        Addons
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
    @can('contacts')
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePagesContact"
                aria-expanded="true" aria-controls="collapsePagesContact">
                <i class="fa-regular fa-address-book"></i>
                <span>Contact Management</span>
            </a>
            <div id="collapsePagesContact" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <a class="collapse-item" href="{{ route('admin.contacts.index') }}">Contacts</a>
                    {{-- <a class="collapse-item" href="{{ route('admin.contacts.create') }}">Add contacts</a> --}}
                </div>
            </div>
        </li>
    @endcan
    <!-- Nav Item - Pages Collapse Menu Posts -->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePagesPosts"
        aria-expanded="true" aria-controls="collapsePagesPosts">
        <i class="fa-solid fa-newspaper"></i>
        <span>Posts Management</span>
    </a>
    <div id="collapsePagesPosts" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
        <div class="bg-white py-2 collapse-inner rounded">
                    @can('index_posts')
                    <a class="collapse-item" href="{{ route('admin.posts.index') }}">Posts</a>
                    @endcan
                    @can('create_posts')
                    <a class="collapse-item" href="{{ route('admin.posts.create') }}">Add Post</a>
                    @endcan
                </div>
            </div>
        </li>

    <!-- Nav Item - Tables Categories -->
    @can('categories')
        <li class="nav-item">
            <a class="nav-link" href="{{ route('admin.categories.index') }}">
                <i class="fa-solid fa-layer-group"></i>
                <span>Categories</span></a>
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
