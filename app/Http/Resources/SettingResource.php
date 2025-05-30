<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class SettingResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'site_name' => $this->site_name,
            'email' => $this->email,
            'phone' => $this->phone,
            'logo' => asset($this->logo),
            'favicon' => asset($this->favicon),
            'facebook' => $this->facebook,
            'twitter' => $this->twitter,
            'instagram' => $this->instagram,
            'youtube' => $this->youtube,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
            'address' => $this->street . ', ' . $this->city . ', ' . $this->country,
            'small_desc' => $this->small_desc

        ];
    }
}
