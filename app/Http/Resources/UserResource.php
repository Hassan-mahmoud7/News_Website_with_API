<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class UserResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        $data = [
            'user_name' => $this->name,
            'user_status' => $this->status(),
            'created_date' => $this->created_at->diffForHumans(),
        ];
        if ($request->is('api/account/user')) {
            $data['id'] = $this->id;
            $data['user_username'] = $this->username;
            $data['user_email'] = $this->email;
            $data['user_phone'] = $this->phone;
            $data['user_country'] = $this->country;
            $data['user_city'] = $this->city;
            $data['user_street'] = $this->street;
            $data['user_floor'] = $this->floor;
            $data['user_image'] = url($this->image);

        }
        return $data;
    }
}
