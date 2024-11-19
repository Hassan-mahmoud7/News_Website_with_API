<?php

namespace App\Http\Requests;

use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Http\FormRequest;

class ProfileAdminRequest extends FormRequest
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
        $admin_id = Auth::guard('admin')->user()->id;
        return [
            'name' => ['required','string','min:2','max:60'],
            'username' => ['required','string','min:5','max:100','unique:admins,username,'.$admin_id],
            'email' => ['required','string','email','unique:admins,email,'.$admin_id],
            'phone' => ['required','string','min:6','max:16','unique:admins,phone,'.$admin_id],
            'password' => ['required','string','min:8'],
        ];
    }
}
