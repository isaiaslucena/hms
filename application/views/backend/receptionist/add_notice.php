<div class="row">
    <div class="col-md-12">

        <div class="panel panel-primary" data-collapsed="0">

            <div class="panel-heading">
                <div class="panel-title">
                    <h3><?php echo get_phrase('add_notice'); ?></h3>
                </div>
            </div>

            <div class="panel-body">

                <form role="form" class="form-horizontal form-groups-bordered"  method="post"
                    action="<?php echo base_url(); ?>index.php?receptionist/notice/create" enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('title'); ?></label>
                        <div class="col-sm-5">
                            <input type="text" name="title" class="form-control" id="titleinput" required>
                            <script type="text/javascript"> document.getElementById("titleinput").focus(); </script>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('description'); ?></label>
                        <div class="col-sm-7">
                            <textarea name="description" class="form-control" id="field-ta"></textarea>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('start_date'); ?></label>
                        <div class="col-sm-7">
                            <div class="date-and-time">
                                <input type="text" name="start_timestamp" class="form-control datepicker" data-format="dd/mm/yyyy" placeholder="<?php echo get_phrase('select_date'); ?>" required>
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('end_date'); ?></label>
                        <div class="col-sm-7">
                            <div class="date-and-time">
                                <input type="text" name="end_timestamp" class="form-control datepicker" data-format="dd/mm/yyyy" placeholder="<?php echo get_phrase('select_date'); ?>" required>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3 control-label col-sm-offset-2">
                        <input type="submit" class="btn btn-success" value="<?php echo get_phrase('submit'); ?>">
                    </div>
                </form>

            </div>

        </div>

    </div>
</div>