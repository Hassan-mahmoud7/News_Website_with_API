<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AdminRequest extends FormRequest
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
        $admin_id = $this->route('admin');
        $rules = [
            'name' => ['required','string','min:2','max:60'],
            'username' => ['required','string','min:5','max:100','unique:admins,username,'.$admin_id],
            'email' => ['required','string','email','unique:admins,email,'.$admin_id],
            'phone' => ['required','string','min:6','max:16','unique:admins,phone,'.$admin_id],
            'status' => ['required','in:1,0'],
            'role_id' => ['required','exists:authorizations,id'],
        ];
        if (in_array($this->method(),['PUT' , 'PATCH'])) {
            $rules['password'] = ['nullable','string','min:8','max:25','confirmed'];
            $rules['password_confirmation'] = ['nullable'];
        }else {
            $rules['password'] = ['required','string','min:8','max:25','confirmed'];
            $rules['password_confirmation'] = ['required_with:password'];
        }
        return $rules;
    }
}
