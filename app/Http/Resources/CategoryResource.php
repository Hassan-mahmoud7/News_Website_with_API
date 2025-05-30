<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class CategoryResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $data = [
            'id' => $this->id,
            'category_name' =>$this->name,
            'category_slug' => $this->slug,
            'status' => $this->status(),
            'created_data' => $this->created_at->format('y-m-d h:i A'),

        ];
        if (!$request->is('api/post/show/*') && !$request->is('api/categories')) {
            $data['posts'] = PostResource::collection($this->posts);
        };
        return $data;
    }
}
