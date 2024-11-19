<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;
    protected $fillable = ['site_name','email','phone','favicon','logo','facebook','instagram','linkedin','twitter','youtube','street','city','country','small_desc'];
}
