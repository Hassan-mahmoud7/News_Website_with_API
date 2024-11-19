<div class="card-body">
    <form action="{{ route('admin.users.index') }}" method="GET">
        @csrf
        <div class="row">
            <div class="col-2">
                <div class="from-group">
                    <label for="sort_by">Based on:</label>
                    <select name="sort_by" class="form-control" id="sort_by">
                        <option selected disabled value="">Sort By</option>
                        <option value="id">id</option>
                        <option value="name">name</option>
                        <option value="created_at">created_at</option>
                    </select>
                </div>
            </div>
            <div class="col-2">
                <div class="from-group">
                    <label for="order_by_direction">Ranking:</label>
                    <select name="order_by_direction" class="form-control" id="order_by_direction">
                        <option selected disabled value="">Order By</option>
                        <option value="asc">Acsending</option>
                        <option value="desc">Descending</option>
                    </select>
                </div>
            </div>
            <div class="col-2">
                <div class="from-group">
                    <label for="limit_by">show:</label>
                    <select name="limit_by" class="form-control" id="limit_by">
                        <option selected disabled value="">Limit</option>
                        <option value="10">10</option>
                        <option value="20">20</option>
                        <option value="40">40</option>
                    </select>
                </div>
            </div>
            <div class="col-2">
                <div class="from-group">
                    <label for="status">Status:</label>
                    <select name="status" class="form-control" id="status">
                        <option selected disabled value="">Status</option>
                        <option value="1">Active</option>
                        <option value="0">Not Active</option>
                    </select>
                </div>
            </div>
            <div class="col-4">
                <div class="form-group">
                    <label for="search">Search:</label>
                    <div class="input-group">
                        <input type="search" name="search" class="form-control" id="search"
                            placeholder="Search...">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">
                                <i class="fa-solid fa-magnifying-glass"></i> Submit
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
</div>
