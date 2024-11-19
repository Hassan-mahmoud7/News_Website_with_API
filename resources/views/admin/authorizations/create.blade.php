<div class="modal fade" id="add_authorization" tabindex="-1"
    aria-labelledby="add_Authorization" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="add_Authorization">Add New Role</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <form action="{{ route('admin.authorizations.store') }}" method="POST">
                    @csrf
                    <div class="form-group row">
                        <div class="col-sm-12 mb-3 mb-sm-0">
                            <input type="text" name="role"
                                class="form-control rounded-pill @error('role') is-invalid @enderror"
                                id="exampleInputrole" placeholder="Enter Admin Role ..." required
                                >
                            @error('role')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                    </div>
                    <div class="form-group row">
                        {{-- @php
                            $userPermissions = is_array($authorization->permissions)
                                ? $authorization->permissions : collect($authorization->permissions)->pluck('permission_key')->toArray();
                        @endphp --}}

                        @foreach (config('authorization.permissions') as $key => $permission)
                            <div class="col-sm-12 mb-3 mb-sm-0 ">
                                <label class="form-control rounded-pill">
                                    {{ $permission }} :
                                    <input type="checkbox" name="permissions[]" value="{{ $key }}"
                                        >
                                </label>
                            </div>
                        @endforeach
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Add New Role</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
