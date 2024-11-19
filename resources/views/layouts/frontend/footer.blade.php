  <!-- Footer Start -->
  <div class="footer mb-0">
      <div class="container">
          <div class="row">
              <div class="col-lg-3 col-md-6">
                  <div class="footer-widget">
                      <h3 class="title">Get in Touch</h3>
                      <div class="contact-info">
                          <p><i
                                  class="fa fa-map-marker"></i>{{ $getSetting->street . ' , ' . $getSetting->city . ' , ' . $getSetting->country }}
                          </p>
                          <p><i class="fa fa-envelope"></i>{{ $getSetting->email }}</p>
                          <p><i class="fa fa-phone"></i>{{ $getSetting->phone }}</p>
                          <div class="social">
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
                  </div>
              </div>

              <div class="col-lg-3 col-md-6">
                  <div class="footer-widget">
                      <h3 class="title">Useful Links</h3>
                      <ul>
                          @foreach ($relatedsites as $site)
                              <li><a href="{{ $site->url }}" target="_blank"
                                      title="{{ $site->name }}" rel="nofollow">{{ $site->name }}</a></li>
                          @endforeach

                      </ul>
                  </div>
              </div>

              <div class="col-lg-3 col-md-6">
                  <div class="footer-widget">
                      <h3 class="title">Quick Links</h3>
                      <ul>
                          <li><a href="{{ route('frontend') }}">Home</a></li>
                          <li><a href="{{ route('frontend.contact.index') }}">Contact-us</a></li>
                      </ul>
                  </div>
              </div>

              <div class="col-lg-3 col-md-6">
                  <div class="footer-widget">
                      <h3 class="title">Newsletter</h3>
                      <div class="newsletter">
                          <p>
                              Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                              Vivamus sed porta dui. Class aptent taciti sociosqu
                          </p>
                          <form method="POST" action="{{ route('frontend.new.subscrice') }}">
                            @csrf
                              <input class="form-control" name="email" type="email" placeholder="Your email here" />
                              @error('email')
                              <div class="alert alert-warning text-danger">{{ $message }}</div>

                              @enderror
                              <button class="btn">Submit</button>
                          </form>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- Footer End -->

  <!-- Footer Bottom Start -->
  <div class="footer-bottom">
      <div class="container">
          <div class="row">
              <div class="col-md-6 copyright">
                  <p>
                      Copyright &copy; <a href="">{{ config('app.name') }}</a>. All Rights
                      Reserved
                  </p>
              </div>

              <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
              <div class="col-md-6 template-by">
                  <p>Designed By <a href="https://htmlcodex.com">Hassan Mahmoud</a></p>
              </div>
          </div>
      </div>
  </div>
  <!-- Footer Bottom End -->

  <!-- Back to Top -->
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
