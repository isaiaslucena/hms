<?php
    $this->db->order_by('name','asc');
    $department_info = $this->db->get('department')->result_array(); ?>
<div class="row">
    <div class="col-md-12">

        <div class="panel panel-primary" data-collapsed="0">

            <div class="panel-heading">
                <div class="panel-title">
                    <h3><?php echo get_phrase('add_doctor'); ?></h3>
                </div>
            </div>

            <div class="panel-body">

                <form role="form" class="form-horizontal form-groups-bordered" action="<?php echo base_url(); ?>index.php?admin/doctor/create" method="post" enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('name'); ?></label>
                        <div class="col-sm-5">
                            <input type="text" required name="name" class="form-control" id="name">
                            <script type="text/javascript"> document.getElementById("name").focus(); </script>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('email'); ?></label>
                        <div class="col-sm-5">
                            <input type="email" name="email" class="form-control" id="field-1" >
                        </div>
                    </div>

                    <!--<div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('password'); ?></label>
                        <div class="col-sm-5">
                            <input type="password" name="password" class="form-control" id="field-1" >
                        </div>
                    </div>-->

                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('street'); ?></label>
                        <div class="col-sm-5">
                            <input type="text" name="street" class="form-control" id="street">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('street_number'); ?></label>
                        <div class="col-sm-5">
                            <input type="number" name="street_number" class="form-control" id="street_number">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('complement'); ?></label>
                        <div class="col-sm-5">
                            <input type="text" name="complement" class="form-control" id="street_comp">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('neighborhood'); ?></label>
                        <div class="col-sm-5">
                            <input type="text" name="neighborhood" class="form-control" id="neighborhood">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('city'); ?></label>
                        <div class="col-sm-5">
                            <input type="text" name="city" class="col-sm-1 form-control" id="city">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('state'); ?></label>
                        <div class="col-sm-5">
                            <select name="state" class="form-control">
                                <option value=""><?php echo get_phrase('select_state'); ?></option>
                                <option value="AC">Acre</option>
                                <option value="AL">Alagoas</option>
                                <option value="AM">Amazonas</option>
                                <option value="AP">Amapá</option>
                                <option value="BA">Bahia</option>
                                <option value="CE">Ceará</option>
                                <option value="DF">Distrito Federal</option>
                                <option value="ES">Espírito Santo</option>
                                <option value="GO">Goiás</option>
                                <option value="MA">Maranhão</option>
                                <option value="MT">Mato Grosso</option>
                                <option value="MS">Mato Grosso do Sul</option>
                                <option value="MG">Minas Gerais</option>
                                <option value="PA">Pará</option>
                                <option value="PB">Paraíba</option>
                                <option value="PR">Paraná</option>
                                <option value="PE">Pernambuco</option>
                                <option value="PI">Piauí</option>
                                <option value="RJ">Rio de Janeiro</option>
                                <option value="RN">Rio Grande do Norte</option>
                                <option value="RO">Rondônia</option>
                                <option value="RS">Rio Grande do Sul</option>
                                <option value="RR">Roraima</option>
                                <option value="SC">Santa Catarina</option>
                                <option value="SE">Sergipe</option>
                                <option value="SP">São Paulo</option>
                                <option value="TO">Tocantins</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="field-1" required class="col-sm-3 control-label"><?php echo get_phrase('phone'); ?></label>
                        <div class="col-sm-5">
                            <input type="tel" required name="phone" class="form-control" id="phone">
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
                        <label for="field-ta" required class="col-sm-3 control-label"><?php echo get_phrase('department'); ?></label>
                        <div class="col-sm-5">
                            <select name="department_id" class="form-control">
                                <option value=""><?php echo get_phrase('select_department'); ?></option>
                                <?php foreach ($department_info as $row) { ?>
                                    <option value="<?php echo $row['department_id']; ?>"><?php echo $row['name']; ?></option>
                                <?php } ?>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="field-1" required class="col-sm-3 control-label"><?php echo get_phrase('council'); ?></label>
                        <div class="col-sm-5">
                            <input type="text" required name="council" class="col-sm-1 form-control" id="council">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="field-1" required class="col-sm-3 control-label"><?php echo get_phrase('honorary'); ?></label>
                        <div class="col-sm-5">
                            <input type="text" required name="honorary" class="col-sm-1 form-control honorary" id="honorary">
                            <script type="text/javascript">
                                $(".honorary").mask("9?9%");
                                $(".honorary").on("blur", function() {
                                    var value = $(this).val().length == 1 ? $(this).val() + '%' : $(this).val();
                                    $(this).val(value);
                                })
                            </script>
                        </div>
                    </div>

                    <!--<div class="form-group">
                        <label for="field-ta" class="col-sm-3 control-label"><?php echo get_phrase('profile'); ?></label>
                        <div class="col-sm-9">
                            <textarea name="profile" class="form-control html5editor" id="field-ta" data-stylesheet-url="assets/css/wysihtml5-color.css"></textarea>
                        </div>
                    </div>-->

                    <div class="form-group">
                        <label class="col-sm-3 control-label"><?php echo get_phrase('image'); ?></label>
                        <div class="col-sm-5">
                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;" data-trigger="fileinput">
                                    <img src="http://placehold.it/200x150" alt="...">
                                </div>
                                <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px"></div>
                                <div>
                                    <span class="btn btn-white btn-file">
                                        <span class="fileinput-new">Select image</span>
                                        <span class="fileinput-exists">Change</span>
                                        <input type="file" name="image" accept="image/*">
                                    </span>
                                    <a href="#" class="btn btn-orange fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-3 control-label col-sm-offset-2">
                        <input type="submit" class="btn btn-success" value="<?php echo get_phrase('save'); ?>">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>