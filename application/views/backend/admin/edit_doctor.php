<?php
$this->db->order_by('name','asc');
$department_info = $this->db->get('department')->result_array();
$single_doctor_info = $this->db->get_where('doctor', array('doctor_id' => $param2))->result_array();
foreach ($single_doctor_info as $row) {
?>
    <div class="row">
        <div class="col-md-12">

            <div class="panel panel-primary" data-collapsed="0">

                <div class="panel-heading">
                    <div class="panel-title">
                        <h3><?php echo get_phrase('edit_doctor'); ?></h3>
                    </div>
                </div>

                <div class="panel-body">

                    <form role="form" class="form-horizontal form-groups-bordered" action="<?php echo base_url(); ?>index.php?admin/doctor/update/<?php echo $row['doctor_id']; ?>" method="post" enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('name'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" name="name" class="form-control" id="name" value="<?php echo $row['name']; ?>">
                                <script type="text/javascript"> document.getElementById("name").focus(); </script>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('email'); ?></label>
                            <div class="col-sm-5">
                                <input type="email" name="email" class="form-control" id="field-1" value="<?php echo $row['email']; ?>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('street'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" name="street" class="form-control" id="field-1" value="<?php echo $row['street']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('street_number'); ?></label>
                            <div class="col-sm-5">
                                <input type="number" name="street_number" class="form-control" id="field-1" value="<?php echo $row['street_number']; ?>">
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
                                <input type="text" name="neighborhood" class="form-control" id="field-1" value="<?php echo $row['neighborhood']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('city'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" name="city" class="form-control" id="field-1" value="<?php echo $row['city']; ?>">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('state'); ?></label>
                            <div class="col-sm-5">
                                <select name="state" class="form-control">
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
                                <input type="text" required name="phone" class="form-control" id="field-1" value="<?php echo $row['phone']; ?>">
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
                            <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('department'); ?></label>
                            <div class="col-sm-5">
                                <select name="department_id" class="form-control">
                                    <option required value=""><?php echo get_phrase('select_department'); ?></option>
                                    <?php foreach ($department_info as $row2) { ?>
                                        <option value="<?php echo $row2['department_id']; ?>" <?php if ($row['department_id'] == $row2['department_id']) echo 'selected'; ?>>
                                            <?php echo $row2['name']; ?>
                                        </option>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('honorary'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" required name="honorary" class="form-control" id="field-1" value="<?php echo $row['honorary'],"%"; ?>">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('council'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" required name="council" class="form-control" id="field-1" value="<?php echo $row['council']; ?>">
                            </div>
                        </div>

                        <!--<div class="form-group">
                            <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('profile'); ?></label>
                            <div class="col-sm-9">
                                <textarea name="profile" class="form-control html5editor" id="field-ta" data-stylesheet-url="assets/css/wysihtml5-color.css">
                                    <?php //echo $row['profile']; ?>
                                </textarea>
                            </div>
                        </div>-->

                        <div class="form-group">
                            <label class="col-sm-3 control-label"><?php echo get_phrase('image'); ?></label>

                            <div class="col-sm-5">

                                <div class="fileinput fileinput-new" data-provides="fileinput">
                                    <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;" data-trigger="fileinput">
                                        <img src="<?php echo $this->crud_model->get_image_url('doctor' , $row['doctor_id']);?>" alt="...">
                                    </div>
                                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px"></div>
                                    <div>
                                        <span class="btn btn-white btn-file">
                                            <span class="fileinput-new"><?php echo get_phrase('select_image'); ?></span>
                                            <span class="fileinput-exists"><?php echo get_phrase('change'); ?></span>
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