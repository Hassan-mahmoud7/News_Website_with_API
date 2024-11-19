<?php

use Illuminate\Support\Facades\Broadcast;
use Illuminate\Support\Facades\Auth;

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

Broadcast::channel('users.{id}', function ($user, $id) {// this $admin get in the auth guard("web") / this $id get in the webskop=>inpusher
    return (int) $user->id === (int) $id;
});

Broadcast::channel('admins.{id}', function ($admin, $id) { // this $admin get in the auth guard("admins") / this $id get in the webskop=>inpusher
    return (int) $admin->id === (int) $id;
}, ['guards' => ['admin']]);

/* steps channel || broadcast
* 1 create notify.
* 2 create New...Notify.php in Terminal php artisan make:notification New....Notify.
* 3 call class notify in controller to method.
* 4 change method in the class New...Notify.
* 5 goto the blade.php and add notification.
* 6 goto meddleware CheckNotificationReadAt.php make Condition on markAsRead.
* 7 goto providers in file BroadcastServiceProviders +We remove comments in method boot.
* 8 goto add Echo in file bootstrap.js.
* 9 goto insert ${jqeury(add html notify)} in file app.js.
* 10 goto add Route Channels.php insert /|\ if you want add multi gurads insert in options[] /|\.
* 11 in Terminal wright ""npm run build"".
* 12 add new link script file.
* 13 Don't forget that every time I edit a file app.js you do this number * 10 .
* 14 call this method in pusher.
*/
