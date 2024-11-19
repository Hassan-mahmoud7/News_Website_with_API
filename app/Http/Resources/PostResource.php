<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class PostResource extends JsonResource
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
            'title' => $this->title,
            'slug' => $this->slug,
            'num_of_views' => $this->num_of_views,
            'status' => $this->status(),
            'post_url' => route('frontend.post.show', $this->slug),
            'post_endpoint' => url('api/posts/show/' . $this->slug),
            'date' => $this->created_at->format('Y-m-d h:i A'),
            'publisher' => $this->user_id == null ? new AdminResource($this->admin) : new UserResource($this->user),
            'media' => ImageResource::collection($this->images),
            'category_name' => $this->category->name,

        ];
        if ($request->is('api/post/show/*')) {

                $data['small_desc'] = $this->small_desc;
                $data['desc'] = $this->desc;
                $data['category'] = new CategoryResource($this->category);
                $data['comment_able'] = $this->comment_able == 1 ? 'active' : 'inactive';

        }

        return $data;
    }
}
