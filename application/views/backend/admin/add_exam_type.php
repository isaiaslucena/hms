<div class="row">
    <div class="col-md-12">

        <div class="panel panel-primary" data-collapsed="0">

            <div class="panel-heading">
                <div class="panel-title">
                    <h3><?php echo get_phrase('add_exam_type'); ?></h3>
                </div>
            </div>

            <div class="panel-body">

                <form role="form" class="form-horizontal form-groups-bordered" action="<?php echo base_url(); ?>index.php?admin/exam_type/create" method="post" enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="field-1"  class="col-sm-3 control-label"><?php echo get_phrase('name'); ?></label>
                        <div class="col-sm-5">
                            <input type="text" required name="name" class="form-control" id="name">
                            <script type="text/javascript"> document.getElementById("name").focus(); </script>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('value');?></label>
                        <div class="col-sm-5">
                            <input type="text" required class="form-control" name="value_examtype" id="value_examtype">
                            <script type="text/javascript">
                                $(function(){
                                    $("#value_examtype").maskMoney({symbol:'R$ ',
                                    showSymbol: true, thousands:'.', decimal:',', symbolStay: true});
                                })
                            </script>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="field-1" class="col-sm-3 control-label"><?php echo get_phrase('third_percent'); ?></label>
                        <div class="col-sm-5">
                            <input type="text" required name="third_percent" class="form-control col-sm-1 third_percent" id="third_percent">
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
                        <input type="submit" class="btn btn-success" value="<?php echo get_phrase('submit'); ?>">
                    </div>
                </form>

            </div>

        </div>

    </div>
</div>