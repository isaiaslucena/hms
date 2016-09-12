<?php
$system_currency_id = $this->db->get_where('settings', array('type' => 'system_currency_id'))->row()->description;
$currency_symbol    = $this->db->get_where('currency', array('currency_id' => $system_currency_id))->row()->currency_symbol;
$single_exam_type_info = $this->db->get_where('exam_type', array('exam_type_id' => $param2))->result_array();
foreach ($single_exam_type_info as $row) { ?>

    <div class="row">
        <div class="col-md-12">

            <div class="panel panel-primary" data-collapsed="0">

                <div class="panel-heading">
                    <div class="panel-title">
                        <h3><?php echo get_phrase('edit_exam_type'); ?></h3>
                    </div>
                </div>

                <div class="panel-body">

                    <form role="form" class="form-horizontal form-groups-bordered"  method="post" action="<?php echo base_url(); ?>index.php?admin/exam_type/update/<?php echo $row['exam_type_id']; ?>" enctype="multipart/form-data">

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('name'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" required name="name" class="form-control" id="field-1" value="<?php echo $row['name']; ?>">
                                <script type="text/javascript">document.getElementById("name").focus();</script>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('value'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" required name="value_examtype" class="form-control" id="value_examtype" value="<?php echo $row['value']; ?>">
                                <script type="text/javascript">
                                    $('#value_examtype').change(function(){
                                      $("select option:selected").each(function (){
                                        var className = $(this).val();
                                        $('#phoneNumber').removeClass();
                                        $('#phoneNumber').addClass(className);
                                        initMasks();
                                      });
                                    });

                                    function initMasks(){
                                      //$('.unitedStates').mask("(999) 999-9999");
                                      //$('.sweden').mask("99 99 99 99? 99");

                                      $("#value_examtype").maskMoney({symbol:'R$ ',
                                      showSymbol: true, thousands:'.', decimal:',', symbolStay: true});
                                    }



                                    /*$(document).load(function(){
                                        $("#value_examtype").maskMoney({symbol:'R$ ',
                                        showSymbol: true, thousands:'.', decimal:',', symbolStay: true});
                                    })*/
                                </script>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('third_percent'); ?></label>
                            <div class="col-sm-5">
                                <input type="text" required name="third_percent" class="form-control" id="third_percent" value="<?php echo $row['third_percent']; ?>">
                                <script type="text/javascript">
                                    $(".third_percent").mask("9?9%");
                                    $(".third_percent").on("blur", function() {
                                        var value = $(this).val().length == 1 ? $(this).val() + '%' : $(this).val();
                                        $(this).val(value);
                                    })
                                </script>
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
