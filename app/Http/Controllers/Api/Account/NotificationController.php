<?php

namespace App\Http\Controllers\Api\Account;

use App\Http\Controllers\Controller;
use App\Http\Resources\NotificationResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    public function getUserNotification()
    {
        $user = Auth::guard('sanctum')->user();
        $notifications = $user->notifications;
        $unreadNotifications = $user->unreadNotifications;
        return apiResponse(200,'This All Notifications Related User',[
            'all_notifications' => NotificationResource::collection($notifications),
            'unread_notifications' => NotificationResource::collection($unreadNotifications),
        ]);

    }
    public function readUserNotification($id)
    {
        $user = Auth::guard('sanctum')->user();
        $unreadNotification = $user->unreadNotifications()->whereId($id)->first();
        $notifications = $user->notifications()->whereId($id)->first();
        if (!$notifications) {
            return apiResponse(404,'the Notification Not Found');
        }
        if (!$unreadNotification) {
            return apiResponse(200,'The notification already read');
        }
        $unreadNotification->markAsRead();
        return apiResponse(200,'Notification Read Successfully');


    }
}
