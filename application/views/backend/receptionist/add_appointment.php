<?php
$this->db->order_by('name', 'asc');
$patient_info   = $this->db->get('patient')->result_array();
$this->db->order_by('name', 'asc');
$doctor_info    = $this->db->get('doctor')->result_array();
$this->db->order_by('name', 'asc');
$exam_type_info    = $this->db->get('exam_type')->result_array();
?>
<div class="row">
    <div class="col-md-12">

        <div class="panel panel-primary" data-collapsed="0">

            <div class="panel-heading">
                <div class="panel-title">
                    <h3><?php echo get_phrase('add_appointment'); ?></h3>
                </div>
            </div>

            <div class="panel-body">

                <form role="form" class="form-horizontal form-groups-bordered" enctype="multipart/form-data"
                    action="<?php echo base_url(); ?>index.php?receptionist/appointment/create" method="post">

                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('date'); ?></label>
                        <div class="col-sm-7">
                            <div class="date-and-time">
                                <input type="text" name="date_timestamp" class="form-control datepicker" data-format="dd-mm-yyyy" placeholder="<?php echo get_phrase('select_date'); ?>" required>
                                <input type="text" name="time_timestamp" class="form-control timepicker" data-template="dropdown" data-show-seconds="false" data-default-time="08:00 AM" data-show-meridian="false" data-minute-step="5"  placeholder="<?php echo get_phrase('select_time'); ?>" required>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('doctor'); ?></label>
                        <div class="col-sm-7">
                            <select required name="doctor_id" class="select2">
                                <option value=""><?php echo get_phrase('select_doctor'); ?></option>
                                <?php foreach ($doctor_info as $row) { ?>
                                        <option value="<?php echo $row['doctor_id']; ?>"><?php echo $row['name']; ?>
                                        </option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('patient'); ?></label>
                        <div class="col-sm-7">
                            <select required name="patient_id" class="select2">
                                <option value=""><?php echo get_phrase('select_patient'); ?></option>
                                <?php foreach ($patient_info as $row) { ?>
                                        <option value="<?php echo $row['patient_id']; ?>"><?php echo $row['name']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-7 col-sm-offset-3">
                            <input type="checkbox" id="appointment_return" name="appointment_return">
                            <label class="control-label" for="appointment_return"><?php echo get_phrase('return'); ?></label>
                        </div>
                    </div>

                    <!--<div class="form-group">
                        <div class="form-group">
                            <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('exam_type'); ?></label>
                            <div class="col-sm-7">
                                <select name="exam_type_id" class="select2">
                                    <option value=""><?php echo get_phrase('select_exam_type'); ?></option>
                                    <?php foreach ($exam_type_info as $row) { ?>
                                        <option value="<?php echo $row['exam_type_id']; ?>"><?php echo $row['name']; ?></option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                    </div>-->

                    <div class="form-group">
                        <dl class="dropdown">
                            <div class="form-group">
                                <dt>
                                    <a href="#">
                                        <!--<span class="col-sm-3 control-label hida multiSel"><?php echo get_phrase('exam_type');?></span>-->
                                        <label for="field-ta" class="col-sm-3 control-label hida multiSel"><?php echo get_phrase('exam_type'); ?></label>
                                    </a>
                                </dt>
                                <div class="col-sm-7">
                                <dd>
                                    <ul>
                                    <?php foreach ($exam_type_info as $row) { ?>
                                        <li>
                                            <input type="checkbox" name="exam_type_id[]" value="<?php echo $row['exam_type_id'];?>"/> <?php echo $row['name'];?>
                                        </li>
                                    <?php } ?>
                                    </ul>
                                </dd>
                                </div>
                            </div>
                        </dl>
                    </div>

                    <!--<div class="form-group">
                        <div class="col-sm-offset-3 col-sm-8">
                            <input type="button" class="btn btn-default btn-sm btn-icon icon-left"
                                    onClick="add_exam_type_entry()" value="<?php echo get_phrase('add_exam_type');?>">
                                <i class="entypo-plus"></i>
                            </button>
                        </div>
                    </div>-->

                    <div class="form-group">
                        <div class="col-sm-7 col-sm-offset-3">
                            <input type="checkbox" id="notify" name="notify">
                            <label class="control-label" for="notify"><?php echo get_phrase('notify_patient_with_') . ' SMS'; ?></label>
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

<script>
        $(".dropdown dt a").on('click', function () {
            $(".dropdown dd ul").slideToggle('fast');
        });

        $(".dropdown dd ul li a").on('click', function () {
            $(".dropdown dd ul").hide();
        });

        function getSelectedValue(id) {
            return $("#" + id).find("dt a span.value").html();
        }

        $(document).bind('click', function (e) {
            var $clicked = $(e.target);
            if (!$clicked.parents().hasClass("dropdown")) $(".dropdown dd ul").hide();
        });


        $('.mutliSelect input[type="checkbox"]').on('click', function () {

            var title = $(this).closest('.mutliSelect').find('input[type="checkbox"]').val(),
                title = $(this).val() + ",";

            if ($(this).is(':checked')) {
                var html = '<span title="' + title + '">' + title + '</span>';
                $('.multiSel').append(html);
                $(".hida").hide();
            } else {
                $('span[title="' + title + '"]').remove();
                var ret = $(".hida");
                $('.dropdown dt a').append(ret);

            }
        });
</script>