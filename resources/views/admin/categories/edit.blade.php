<div class="modal fade" id="edit_category_{{ $category->id }}" tabindex="-1" aria-labelledby="edit_categoryLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="edit_categoryLabel">Edit Category</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('admin.categories.update', $category->id) }}" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label for="recipient-name" class="col-form-label">Name:</label>
                        <input type="text" name="name" placeholder="Enter New Category Name" class="form-control" id="recipient-name" value="{{ $category->name }}">
                    </div>
                    <div class="form-group ">
                        <select name="status" class="form-control" id="">
                            <option selected disabled >Select Status</option>
                            <option value="1" @selected($category->status == 1)>Active</option>
                            <option value="0" @selected($category->status == 0)>Not Active</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="message-text" class="col-form-label">Small Description:</label>
                        <textarea class="form-control" name="small_desc" placeholder="Enter New Category Small Description" id="message-text">{{ $category->small_desc }}</textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" >Edit Category</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
