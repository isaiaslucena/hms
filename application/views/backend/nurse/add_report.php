<?php 
$patient_info = $this->db->get('patient')->result_array(); 
$doctor_info = $this->db->get('doctor')->result_array();
?>
<div class="row">
    <div class="col-md-12">

        <div class="panel panel-primary" data-collapsed="0">

            <div class="panel-heading">
                <div class="panel-title">
                    <h3><?php echo get_phrase('add_report'); ?></h3>
                </div>
            </div>

            <div class="panel-body">

                <form role="form" class="form-horizontal form-groups-bordered" action="<?php echo base_url(); ?>index.php?nurse/report/create" method="post" enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('type'); ?></label>

                        <div class="col-sm-5">
                            <select name="type" class="form-control">
                                <option value=""><?php echo get_phrase('select_type'); ?></option>
                                <option value="operation"><?php echo get_phrase('operation'); ?></option>
                                <option value="birth"><?php echo get_phrase('birth'); ?></option>
                                <option value="death"><?php echo get_phrase('death'); ?></option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('description'); ?></label>

                        <div class="col-sm-9">
                            <textarea name="description" class="form-control wysihtml5" id="field-ta" data-stylesheet-url="assets/css/wysihtml5-color.css"></textarea>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('date'); ?></label>

                        <div class="col-sm-5">
                            <input type="text" name="timestamp" class="form-control datepicker" id="field-1" >
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('patient'); ?></label>

                        <div class="col-sm-5">
                            <select name="patient_id" class="form-control">
                                <option value=""><?php echo get_phrase('select_patient'); ?></option>
                                <?php foreach ($patient_info as $row) { ?>
                                    <option value="<?php echo $row['patient_id']; ?>"><?php echo $row['name']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('doctor'); ?></label>

                        <div class="col-sm-5">
                            <select name="doctor_id" class="form-control">
                                <option value=""><?php echo get_phrase('select_doctor'); ?></option>
                                <?php foreach ($doctor_info as $row) { ?>
                                    <option value="<?php echo $row['doctor_id']; ?>"><?php echo $row['name']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="col-sm-3 control-label col-sm-offset-2">
                        <input type="submit" class="btn btn-success" value="Submit">
                    </div>
                </form>

            </div>

        </div>

    </div>
</div>