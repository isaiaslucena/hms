<?php
$patient_info     = $this->db->get('patient')->result_array();
$doctor_info      = $this->db->get('doctor')->result_array();
$single_appointment_info = $this->db->get_where('appointment', array('appointment_id' => $param2))->result_array();
foreach ($single_appointment_info as $row) { ?>
    <div class="row">
        <div class="col-md-12">

            <div class="panel panel-primary" data-collapsed="0">

                <div class="panel-heading">
                    <div class="panel-title">
                        <h3><?php echo get_phrase('add_receipt'); ?></h3>
                    </div>
                </div>

                <div class="panel-body">

                    <form role="form" class="form-horizontal form-groups-bordered" enctype="multipart/form-data"
                        action="<?php echo base_url(); ?>index.php?receptionist/receipt_patient_add/create"
                        method="post" enctype="multipart/form-data">

                        <input type="hidden" readonly name="appointment_id" id="appointment_id" value="<?php echo $row['appointment_id']; ?>">
                        <input type="hidden" readonly name="doctor_id" id="doctor_id" value="<?php echo $row['doctor_id']; ?>">
                        <input type="hidden" readonly name="patient_id" id="patient_id" value="<?php echo $row['patient_id']; ?>">

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('receipt_date'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" readonly name="receipt_timestamp" class="form-control" id="receipt_timestamp" value="<?php echo date("d-m-Y H:i:s"); ?>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('patient'); ?></label>
                            <div class="col-sm-7">
                                <?php foreach ($patient_info as $row2) { ?>
                                    <?php if ($row['patient_id'] == $row2['patient_id'])
                                    { ?>
                                        <input type="text" readonly name="patient_id" class="form-control" id="patient_id" value="<?php echo $row2['name']; ?>">
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('doctor'); ?></label>
                            <div class="col-sm-7">
                                <?php foreach ($doctor_info as $row2) { ?>
                                    <?php if ($row['doctor_id'] == $row2['doctor_id'])
                                    { ?>
                                        <input type="text" readonly name="doctor_id" class="form-control" id="doctor_id" value="<?php echo $row2['name']; ?>">
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('appointment_date'); ?></label>
                            <div class="col-sm-7">
                                <div class="date-and-time">
                                    <input type="text" readonly name="appointment_timestamp" class="form-control" id="appointmnet_timestamp" value="<?php echo date("d/m/Y H:i:s", $row['timestamp']); ?>">
                                </div>
                            </div>
                        </div>

                        <?php if($row['appointment_return'] == 'true') { ?>
                        <div class="form-group">
                            <div class="col-sm-7 col-sm-offset-3">
                                <input type="checkbox" id="appointment_return" name="appointment_return" disabled checked>
                                <label class="control-label" for="appointment_return"><?php echo get_phrase('return'); ?></label>
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

                        <?php } else { ?>
                        <div class="form-group">
                            <div class="col-sm-3 control-label col-sm-offset-2">
                                <input type="checkbox" id="appointment_return" name="appointment_return" disabled>
                                <label class="control-label" for="appointment_return"><?php echo get_phrase('return'); ?></label>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('payment_type'); ?></label>
                            <div class="col-sm-5">
                                <select name="payment_type" required class="form-control" required>
                                    <option value=""><?php echo get_phrase('select_payment_type'); ?></option>
                                    <option value="cash"><?php echo get_phrase('cash'); ?></option>
                                    <option value="debit"><?php echo get_phrase('debit'); ?></option>
                                    <option value="credit"><?php echo get_phrase('credit'); ?></option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group installmentv" style="display:none;">
                            <label for="field-1" class="col-sm-3 control-label installmentv" style="display:none;"><?php echo get_phrase('installment'); ?></label>
                            <div class="col-sm-5 installmentv" style="display:none;">
                                <select name="payment_installment" class="form-control installmentv" style="display:none;">
                                    <option value=""><?php echo get_phrase('select_installment'); ?></option>
                                    <option value="0">À vista</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select>
                            </div>
                        </div>

                        <script type="text/javascript">
                            $("select").change(function () {
                                // hide all optional elements
                                $('.optional').css('display','none');

                                $("select option:selected").each(function () {
                                    if($(this).val() == "credit") {
                                        $('.installmentv').css('display','block');
                                    }
                                });
                            });
                        </script>

                        <div class="col-sm-3 control-label col-sm-offset-2">
                            <input type="submit" class="btn btn-success" value="<?php echo get_phrase('submit'); ?>">
                        </div>
                    </form>

                </div>

            </div>

        </div>
    </div>
    <?php } ?>
<?php }?>