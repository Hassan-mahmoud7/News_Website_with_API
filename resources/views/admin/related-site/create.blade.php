 {{-- model add new Related Site --}}

 <div class="modal fade" id="add_Related_site" tabindex="-1" aria-labelledby="add_Related_siteLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="add_Related_siteLabel">Create New Related Site</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('admin.related-site.store') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Name:</label>
                        <input type="text" name="name" placeholder="Enter New Related Site Name" class="form-control" id="recipient-name">
                    </div>

                    <div class="form-group">
                        <label for="recipient-url" class="col-form-label">Url:</label>
                        <input type="text" name="url" placeholder="Enter New Related Site url" class="form-control" id="recipient-url">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" >Create Related Site</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
{{-- model add Edit --}}
