  <!-- Top Bar Start -->
  <div class="top-bar">
      <div class="container">
          <div class="row">
              <div class="col-md-6">
                  <div class="tb-contact">
                      <p><i class="fas fa-envelope"></i>{{ $getSetting->email }}</p>
                      <p><i class="fas fa-phone-alt"></i>{{ $getSetting->phone }}</p>
                  </div>
              </div>
              <div class="col-md-6">
                  <div class="tb-menu">
                      @guest
                          <a href="{{ route('login') }}"> <i class="fa-solid fa-arrow-right-to-bracket"></i> Login</a>
                          <a href="{{ route('register') }}"> <i class="fa-solid fa-registered"></i> Register</a>
                      @endguest
                      @auth
                          <a href="javascript:void(0)"
                              onclick="if (confirm('Do You Want to Logout')){ document.getElementById('formLogout').submit()} return false"> <i
                                 class="fa-solid fa-right-from-bracket"></i> Logout</a>
                      @endauth
                      <form action="{{ route('logout') }}" method="post" id="formLogout">
                          @csrf
                      </form>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Top Bar Start -->

  <!-- Brand Start -->
  <div class="brand">
      <div class="container">
          <div class="row align-items-center">
              <div class="col-lg-3 col-md-4">
                  <div class="b-logo">
                      <a href="{{ route('frontend') }}" title="{{ $getSetting->site_name }}">
                          <img src="{{ asset($getSetting->logo) }}" alt="Logo" />
                      </a>
                  </div>
              </div>
              <div class="col-lg-6 col-md-4">
                  <div class="b-ads">

                  </div>
              </div>
              <div class="col-lg-3 col-md-4">
                  <form action="{{ route('frontend.search') }}" method="get">
                      @csrf
                      <div class="b-search">
                          <input type="text" name="search" placeholder="Search" />
                          <button type="submit"><i class="fa fa-search"></i></button>
                      </div>
                  </form>
                  @error('search')
                      <div class="alert alert-danger"> {{ $message }} </div>
                  @enderror
              </div>
          </div>
      </div>
  </div>
  <!-- Brand End -->

  <!-- Nav Bar Start -->
  <div class="nav-bar">
      <div class="container">
          <nav class="navbar navbar-expand-md bg-dark navbar-dark">
              <a href="#" class="navbar-brand">MENU</a>
              <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                  <span class="navbar-toggler-icon"></span>
              </button>

              <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                  <div class="navbar-nav mr-auto">
                      <a href="{{ route('frontend') }}" class="nav-item nav-link active">Home</a>
                      <div class="nav-item dropdown">
                          <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Categories</a>
                          <div class="dropdown-menu">
                              @foreach ($categories as $category)
                                  <a href="{{ route('frontend.category.posts', $category->slug) }}"
                                      class="dropdown-item" title="{{ $category->name }}">{{ $category->name }}</a>
                              @endforeach
                          </div>
                      </div>

                      <a href="{{ route('frontend.contact.index') }}" class="nav-item nav-link">Contact Us</a>
                      <a href="{{ route('frontend.dashboard.profile') }}" class="nav-item nav-link">Account</a>
                  </div>
                  <div class="social ml-auto">
                      <!-- Notification Dropdown -->
                      @auth('web')
                          <a href="#" class="nav-link dropdown-toggle" id="notificationDropdown" role="button"
                              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              <i class="fas fa-bell"></i>
                              <span id="count-notification" class="badge badge-danger">{{ auth()->user()->unreadNotifications()->count() }}</span>
                          </a>
                          <div class="dropdown-menu dropdown-menu-right" aria-labelledby="notificationDropdown"
                              style="width: 300px;">
                              <div class="row ">
                                  <h6 class="dropdown-header col-6 fs-1"><a href="{{ route('frontend.dashboard.profile') }}#notifications" style="background: rgb(0 0 0 / 0%); border-radius: 0px; font-size: 1.3rem;" >Notifications</a></h6>
                                  @if (auth()->user()->notifications->count() > 0)
                                      <span class="col-6 m-auto"><a
                                              href="{{ route('frontend.dashboard.notification.read.all') }}"
                                              class=" p-1 m-1 m-auto"> <i class="fa-solid fa-eye"></i></a>read all</span>
                                  @endif
                              </div>
                              @forelse (auth()->user()->unreadNotifications()->limit(10)->get() as $notify)
                              <div id="push-notification">

                                  <div class="dropdown-item d-flex justify-content-between align-items-center">
                                      <span><a href="{{ route('frontend.post.show', $notify->data['post_slug']) }}?notify={{ $notify->id }}"
                                              style="background: rgb(0 0 0 / 0%); border-radius: 0px;">new comment
                                              :{{ substr($notify->data['post_title'], 0, 7) }}...</a></span>
                                      <form action="{{ route('frontend.dashboard.notification.delete') }}" method="POST">
                                          @csrf
                                          <input type="hidden" name="notify_id" value="{{ $notify->id }}">
                                          <button type="submit" class="btn btn-sm btn-danger" title="Delete"><i
                                                  class="fa-regular fa-trash-can"></i></button>
                                      </form>
                                  </div>
                              </div>
                              @empty
                                  <div class="alert alert-info">
                                      No Notification Yet !
                                  </div>
                              @endforelse

                              <!-- <div class="dropdown-item text-center">No notifications</div>  -->

                          </div>
                      @endauth
                      <a href="{{ $getSetting->twitter }}" target="_blank" title="twitter" rel="nofollow"><i
                              class="fab fa-twitter"></i></a>
                      <a href="{{ $getSetting->facebook }}" target="_blank" title="facebook" rel="nofollow"><i
                              class="fab fa-facebook-f"></i></a>
                      <a href="{{ $getSetting->linkedin }}" target="_blank" title="linkedin" rel="nofollow"><i
                              class="fab fa-linkedin-in"></i></a>
                      <a href="{{ $getSetting->instagram }}" target="_blank" title="instagram" rel="nofollow"><i
                              class="fab fa-instagram"></i></a>
                      <a href="{{ $getSetting->youtube }}" target="_blank" title="youtube" rel="nofollow"><i
                              class="fab fa-youtube"></i></a>
                  </div>
              </div>
          </nav>
      </div>
  </div>
  <!-- Nav Bar End -->
