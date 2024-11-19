<?php

namespace App\Models;

use App\Models\Post;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Category extends Model
{
    use HasFactory, Sluggable;
    protected $fillable = ['id','name','small_desc','slug','status'];

    public function posts(){
        return $this->hasMany(Post::class, 'category_id');
    }
    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'name'
            ]
        ];
    }
    public function scopeActive($query)
    {
        $query->where('status', 1);

    }
    public function status()
    {
       return  $this->status == 1 ? 'Active' : 'Not Active';
    }
}
