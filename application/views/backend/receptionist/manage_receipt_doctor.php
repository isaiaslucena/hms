<table class="table table-bordered table-striped datatable" id="table-2">
    <thead>
        <tr>
            <th class="text-center">#</th>
            <th class="text-center"><?php echo get_phrase('date'); ?></th>
            <th class="text-center"><?php echo get_phrase('doctor'); ?></th>
            <th class="text-center"><?php echo get_phrase('amount_receipt'); ?></th>
            <th class="text-center"><?php echo get_phrase('amount_exam_receipt'); ?></th>
            <th class="text-center"><?php echo get_phrase('options'); ?></th>
        </tr>
    </thead>

    <tbody>
        <?php
        $system_currency_id = $this->db->get_where('settings', array('type' => 'system_currency_id'))->row()->description;
        $currency_symbol    = $this->db->get_where('currency', array('currency_id' => $system_currency_id))->row()->currency_symbol;
        foreach ($receipt_doctor_info as $row) { ?>
            <tr>
                <td align="center"><?php echo $row['receipt_doctor_id']; ?></td>
                <td align="center"><?php echo str_replace("-","/",date("d-m-Y",$row['receipt_doctor_timestamp']))." - ".date("H:i",$row['receipt_doctor_timestamp']); ?></td>
                <td><?php echo $row['doctor_name']; ?></td>
                <td align="center"><?php echo $currency_symbol.number_format($row['receipt_amount'],2,',','.'); ?></td>
                <td align="center"><?php echo $currency_symbol.number_format($row['receipt_exam_amount'],2,',','.'); ?></td>
                <td align="center">
                    <!--<a onclick="showAjaxModal('<?php echo base_url();?>index.php?modal/popup/edit_receipt_doctor/<?php echo $row['receipt_doctor_id'];?>');" class="btn btn-default btn-sm btn-icon icon-left">
                        <i class="entypo-pencil"></i>
                        <?php echo get_phrase('edit');?>
                    </a>-->
                    <a onclick="showAjaxModal('<?php echo base_url();?>index.php?modal/popup/view_receipt_doctor/<?php echo $row['receipt_doctor_id'];?>');" class="btn btn-default btn-sm btn-icon icon-left">
                        <i class="entypo-eye"></i>
                        <?php echo get_phrase('view_receipt');?>
                    </a>
                    <!--<a href="<?php echo base_url(); ?>index.php?receptionist/receipt_doctor_manage/delete/<?php echo $row['receipt_doctor_id'];?>" class="btn btn-danger btn-sm btn-icon icon-left" onclick="return checkDelete();">
                        <i class="entypo-cancel"></i>
                        <?php echo get_phrase('delete');?>
                    </a>-->
                </td>
            </tr>
        <?php } ?>
    </tbody>
</table>

<script type="text/javascript">
    jQuery(window).load(function ()
    {
        var $ = jQuery;

        $("#table-2").dataTable({
            "sPaginationType": "bootstrap",
            "sDom": "<'row'<'col-xs-3 col-left'l><'col-xs-9 col-right'<'export-data'T>f>r>t<'row'<'col-xs-3 col-left'i><'col-xs-9 col-right'p>>",
            "oLanguage": {
            "sEmptyTable": "Nenhum registro encontrado",
                "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
                "sInfoFiltered": "(Filtrados de _MAX_ registros)",
                "sInfoPostFix": "",
                "sInfoThousands": ".",
                "sLengthMenu": "_MENU_ resultados por página",
                "sLoadingRecords": "Carregando...",
                "sProcessing": "Processando...",
                "sZeroRecords": "Nenhum registro encontrado",
                "sSearch": "Pesquisar",
                "oPaginate": {
                    "sNext": "Próximo",
                    "sPrevious": "Anterior",
                    "sFirst": "Primeiro",
                    "sLast": "Último"
                },
                "oAria": {
                    "sSortAscending": ": Ordenar colunas de forma ascendente",
                    "sSortDescending": ": Ordenar colunas de forma descendente"
                }
            }
        });

        $(".dataTables_wrapper select").select2({
            minimumResultsForSearch: -1
        });

        // Highlighted rows
        $("#table_filter tbody input[type=checkbox]").each(function (i, el)
        {
            var $this = $(el),
                    $p = $this.closest('tr');

            $(el).on('change', function ()
            {
                var is_checked = $this.is(':checked');

                $p[is_checked ? 'addClass' : 'removeClass']('highlight');
            });
        });

        // Replace Checkboxes
        $(".pagination a").click(function (ev)
        {
            replaceCheckboxes();
        });
    });
</script>