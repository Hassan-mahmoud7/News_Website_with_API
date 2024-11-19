<?php

namespace App\Models;

use App\Models\Admin;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Authorization extends Model
{
    use HasFactory;
    protected $fillable = ['id','role','permissions'];

    public function admins(){
        return $this->hasMany(Admin::class , 'role_id');
    }
    public function getPermissionsAttribute($permissions)
    {
        return  json_decode($permissions);
    }


}
