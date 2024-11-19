<?php

namespace App\Models;

use App\Models\Post;
use App\Models\Authorization;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Admin extends Authenticatable
{
    use HasFactory, Notifiable;

    // protected  $guarded= [];
    protected $fillable = ['id','name','username','email','phone','status','password','role_id']; // this method more security fillable from guarded

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];
    public function posts() {
        return $this->hasMany(Post::class,'admin_id');

    }
    public function authrization(){
        return $this->belongsTo(Authorization::class, 'role_id');
    }
    public function hasAccess($Config_permission)
    {
        $authrizations = $this->authrization;
        if (!$authrizations) {
            return false;
        }
        foreach ($authrizations->permissions as $permission) {
            if ($Config_permission == $permission ?? false) {
                return true;
            }
        }
    }
    public function receivesBroadcastNotificationsOn(): string
    {
        return 'admins.'.$this->id;
    }
    public function status()
    {
       return  $this->status == 1 ? 'Active' : 'Not Active';
    }
}
