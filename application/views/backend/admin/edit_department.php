<?php
$single_department_info = $this->db->get_where('department', array('department_id' => $param2))->result_array();
foreach ($single_department_info as $row) {
?>

    <div class="row">
        <div class="col-md-12">

            <div class="panel panel-primary" data-collapsed="0">

                <div class="panel-heading">
                    <div class="panel-title">
                        <h3><?php echo get_phrase('edit_notice'); ?></h3>
                    </div>
                </div>

                <div class="panel-body">

                    <form role="form" class="form-horizontal form-groups-bordered"  method="post"
                        action="<?php echo base_url(); ?>index.php?admin/department/update/<?php echo $row['department_id']; ?>" 
                        enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('name'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" required name="name" class="form-control" id="field-1" value="<?php echo $row['name']; ?>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('description'); ?></label>
                            <div class="col-sm-9">
                                <textarea name="description" class="form-control wysihtml5" id="field-ta" data-stylesheet-url="<?php echo base_url(); ?>assets/css/wysihtml5-color.css"><?php echo $row['description']; ?></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('value'); ?> R$ </label>
                        <div class="col-sm-5">
                            <input type="text" required name="cost" class="form-control" id="cost" value="<?php echo $row['cost']; ?>">
                        </div>
                    </div>

                        <div class="col-sm-3 control-label col-sm-offset-2">
                            <input type="submit" class="btn btn-success" value="<?php echo get_phrase('update'); ?>">
                        </div>
                    </form>

                </div>

            </div>

        </div>
    </div>
<?php } ?>
