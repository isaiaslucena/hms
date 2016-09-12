<?php
$single_patient_info = $this->db->get_where('patient', array('patient_id' => $param2))->result_array();
foreach ($single_patient_info as $row) {
?>
    <div class="row">
        <div class="col-md-12">

            <div class="panel panel-primary" data-collapsed="0">

                <div class="panel-heading">
                    <div class="panel-title">
                        <h3><?php echo get_phrase('edit_patient'); ?></h3>
                    </div>
                </div>

                <div class="panel-body">

                    <form role="form" class="form-horizontal form-groups-bordered" action="<?php echo base_url(); ?>index.php?receptionist/patient/update/<?php echo $row['patient_id']; ?>" method="post" enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('name'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" required name="name" id="name" class="form-control" value="<?php echo $row['name']; ?>">
                                <script type="text/javascript"> document.getElementById("name").focus(); </script>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('email'); ?></label>
                            <div class="col-sm-5">
                                <input type="email" required name="email" class="form-control" id="field-1" value="<?php echo $row['email']; ?>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('street'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" required name="street" class="form-control" id="field-1" value="<?php echo $row['street']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('street_number'); ?></label>
                            <div class="col-sm-5">
                                <input type="number" required name="street_number" class="form-control" id="field-1" value="<?php echo $row['street_number']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('complement'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" name="street_comp" class="form-control" id="field-1" value="<?php echo $row['street_comp']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('neighborhood'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" required name="neighborhood" class="form-control" id="field-1" value="<?php echo $row['neighborhood']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('city'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" required name="city" class="form-control" id="field-1" value="<?php echo $row['city']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('state'); ?></label>
                            <div class="col-sm-5">
                                <select required name="state" class="form-control">
                                    <option value=""><?php echo get_phrase('select_state'); ?></option>
                                    <option value="AC" <?php if ($row['state'] == 'state')echo 'selected';?>>Acre</option>
                                    <option value="AL" <?php if ($row['state'] == 'state')echo 'selected';?>>Alagoas</option>
                                    <option value="AM" <?php if ($row['state'] == 'state')echo 'selected';?>>Amazonas</option>
                                    <option value="AP" <?php if ($row['state'] == 'state')echo 'selected';?>>Amapá</option>
                                    <option value="BA" <?php if ($row['state'] == 'state')echo 'selected';?>>Bahia</option>
                                    <option value="CE" <?php if ($row['state'] == 'state')echo 'selected';?>>Ceará</option>
                                    <option value="DF" <?php if ($row['state'] == 'state')echo 'selected';?>>Distrito Federal</option>
                                    <option value="ES" <?php if ($row['state'] == 'state')echo 'selected';?>>Espírito Santo</option>
                                    <option value="GO" <?php if ($row['state'] == 'state')echo 'selected';?>>Goiás</option>
                                    <option value="MA" <?php if ($row['state'] == 'state')echo 'selected';?>>Maranhão</option>
                                    <option value="MT" <?php if ($row['state'] == 'state')echo 'selected';?>>Mato Grosso</option>
                                    <option value="MS" <?php if ($row['state'] == 'state')echo 'selected';?>>Mato Grosso do Sul</option>
                                    <option value="MG" <?php if ($row['state'] == 'state')echo 'selected';?>>Minas Gerais</option>
                                    <option value="PA" <?php if ($row['state'] == 'state')echo 'selected';?>>Pará</option>
                                    <option value="PB" <?php if ($row['state'] == 'state')echo 'selected';?>>Paraíba</option>
                                    <option value="PR" <?php if ($row['state'] == 'state')echo 'selected';?>>Paraná</option>
                                    <option value="PE" <?php if ($row['state'] == 'state')echo 'selected';?>>Pernambuco</option>
                                    <option value="PI" <?php if ($row['state'] == 'state')echo 'selected';?>>Piauí</option>
                                    <option value="RJ" <?php if ($row['state'] == 'state')echo 'selected';?>>Rio de Janeiro</option>
                                    <option value="RN" <?php if ($row['state'] == 'state')echo 'selected';?>>Rio Grande do Norte</option>
                                    <option value="RO" <?php if ($row['state'] == 'state')echo 'selected';?>>Rondônia</option>
                                    <option value="RS" <?php if ($row['state'] == 'state')echo 'selected';?>>Rio Grande do Sul</option>
                                    <option value="RR" <?php if ($row['state'] == 'state')echo 'selected';?>>Roraima</option>
                                    <option value="SC" <?php if ($row['state'] == 'state')echo 'selected';?>>Santa Catarina</option>
                                    <option value="SE" <?php if ($row['state'] == 'state')echo 'selected';?>>Sergipe</option>
                                    <option value="SP" <?php if ($row['state'] == 'state')echo 'selected';?>>São Paulo</option>
                                    <option value="TO" <?php if ($row['state'] == 'state')echo 'selected';?>>Tocantins</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('phone'); ?></label>
                            <div class="col-sm-5">
                                <input type="tel" required name="phone" id="phone" class="form-control" id="field-1" value="<?php echo $row['phone']; ?>">
                                <script type="text/javascript">
                                    $("#phone").mask("(99) 9999?9-9999");

                                    $("#phone").on("blur", function() {
                                        var last = $(this).val().substr( $(this).val().indexOf("-") + 1 );

                                        if( last.length == 3 ) {
                                            var move = $(this).val().substr( $(this).val().indexOf("-") - 1, 1 );
                                            var lastfour = move + last;
                                            var first = $(this).val().substr( 0, 9 );
                                            $(this).val( first + '-' + lastfour );
                                        }
                                    });
                                </script>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('sex'); ?></label>
                            <div class="col-sm-5">
                                <select required name="sex" class="form-control">
                                    <option value=""><?php echo get_phrase('select_sex'); ?></option>
                                    <option value="male" <?php if ($row['sex'] == 'male')echo 'selected';?>>
                                        <?php echo get_phrase('male'); ?>
                                    </option>
                                    <option value="female" <?php if ($row['sex'] == 'female')echo 'selected';?>>
                                        <?php echo get_phrase('female'); ?>
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('birth_date'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" required name="birth_date" class="form-control datepicker" data-format="dd/mm/yyyy" id="field-1" value="<?php echo date("d/m/Y", $row['birth_date']); ?>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('age'); ?></label>
                            <div class="col-sm-5">
                                <input type="number" name="age" class="form-control" id="field-1" value="<?php echo $row['age']; ?>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('blood_group'); ?></label>
                            <div class="col-sm-5">
                                <select name="blood_group" class="form-control">
                                    <option value=""><?php echo get_phrase('select_blood_group'); ?></option>
                                    <option value="A+" <?php if ($row['blood_group'] == 'A+')echo 'selected';?>>A+</option>
                                    <option value="A-" <?php if ($row['blood_group'] == 'A-')echo 'selected';?>>A-</option>
                                    <option value="B+" <?php if ($row['blood_group'] == 'B+')echo 'selected';?>>B+</option>
                                    <option value="B-" <?php if ($row['blood_group'] == 'B-')echo 'selected';?>>B-</option>
                                    <option value="AB+" <?php if ($row['blood_group'] == 'AB+')echo 'selected';?>>AB+</option>
                                    <option value="AB-" <?php if ($row['blood_group'] == 'AB-')echo 'selected';?>>AB-</option>
                                    <option value="O+" <?php if ($row['blood_group'] == 'O+')echo 'selected';?>>O+</option>
                                    <option value="O-" <?php if ($row['blood_group'] == 'O-')echo 'selected';?>>O-</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label"><?php echo get_phrase('image'); ?></label>
                            <div class="col-sm-5">
                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;" data-trigger="fileinput">
                                        <img src="<?php echo $this->crud_model->get_image_url('patient' , $row['patient_id']);?>" alt="...">
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px"></div>
                                    <div>
                                        <span class="btn btn-white btn-file">
                                            <span class="fileinput-new"><?php echo get_phrase('select_image');?></span>
                                            <span class="fileinput-exists"><?php echo get_phrase('change');?></span>
                                            <input type="file" name="image" accept="image/*">
                                        </span>
                                        <a href="#" class="btn btn-orange fileinput-exists" data-dismiss="fileinput">Remove</a>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-sm-3 control-label col-sm-offset-2">
                            <input type="submit" class="btn btn-success" value="<?php echo get_phrase('update');?>">
                        </div>
                    </form>

                </div>

            </div>

        </div>
    </div>
<?php } ?>