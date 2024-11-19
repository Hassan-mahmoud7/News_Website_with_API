<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => ['required', 'string', 'min:2', 'max:50'],
            'username' => ['required', 'string', 'min:2', 'max:50', 'unique:users'],
            'email' => 'required|email|max:90|unique:users',
            'phone' => 'required|string|min:6|max:16|unique:users',
            'status' => ['in:0,1'],
            'email_verified_at' => ['in:0,1'],
            'country' => ['required', 'string', 'max:50'],
            'city' => ['required', 'string', 'max:50'],
            'street' => ['required', 'string', 'max:50'],
            'floor' => ['required', 'string', 'max:50'],
            'password' => ['required','string','min:8','max:25','confirmed'],
            'password_confirmation' => ['required'],
            'image' => ['nullable', 'image', 'mimes:jpeg,png,jpg,gif|max:2048'],
        ];
    }
}
