import './bootstrap';
//users
if (role == "user") {
    window.Echo.private('users.'+userId)
    .notification((event)=>{
        let link = showPostRoute.replace(':slug' , event.post_slug)
       $('#push-notification').prepend(`<div class="dropdown-item d-flex justify-content-between align-items-center">
                                          <span><a href="${link}?notify=${event.id}"
                                                  style="background: rgb(0 0 0 / 0%); border-radius: 0px;">new comment
                                                  :${event.post_title.substring(0,10)}...</a></span>
                                      </div>`);
                                      count = Number($('#count-notification').text());
                                      count++;
                                      $('#count-notification').text(count);
    });
}

// Admins
if (role == "admin") {
    window.Echo.private('admins.'+adminId)
    .notification((event)=>{
        $('#notify_push').prepend(`<a class="dropdown-item d-flex align-items-center" href="${event.link}?notify_admin=${event.id}">
                                        <div class="mr-3">
                                            <div class="icon-circle bg-primary">
                                                <i class="fas fa-file-alt text-white"></i>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="small text-gray-500">${event.date}</div>
                                            <span class="font-weight-bold">${event.contact_title}!</span>
                                        </div>
                                    </a>`);
                                    count = Number($('#countNotify').text());
                                    count++;
                                    $('#countNotify').text(count);
    });
}
