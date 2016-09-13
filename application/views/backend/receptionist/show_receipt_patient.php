<button onclick="showAjaxModal('<?php echo base_url();?>index.php?modal/popup/add_receipt_patient');" class="btn btn-primary pull-right">
    <?php echo get_phrase('add_receipt'); ?>
</button>

<div style="clear:both;"></div>
<br>
<!--<center>
    <form role="form" enctype="multipart/form-data" class="form-horizontal form-groups-bordered" action="<?php echo base_url();?>index.php?receptionist/receipt_patient_manage/filter" method="post">
    <table border="0" cellspacing="0" cellpadding="0" class="table">
        <tr>
            <td><?php echo get_phrase('select_patient'); ?></td>
            <td><?php echo get_phrase('start_date'); ?></td>
            <td><?php echo get_phrase('end_date'); ?></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <select name="patient_id" class="selectboxit">
                    <option value="all" <?php if($patient_id == 'all') echo 'selected'; ?>>
                        <?php echo get_phrase('all_patients'); ?></option>
                    <?php
                    $this->db->order_by('name', 'asc');
                    $patients = $this->db->get('patient')->result_array();
                    foreach ($patients as $row) { ?>
                        <option value="<?php echo $row['patient_id']; ?>"
                            <?php if ($patient_id == $row['patient_id']) echo 'selected'; ?>>
                                <?php echo $row['name']; ?></option>
                    <?php } ?>
                </select>
            </td>
            <td>
                <input type="text" name="start_timestamp" class="form-control datepicker" data-format="dd/mm/yyyy" placeholder="<?php echo get_phrase('date'); ?>" value="<?php echo date("d-m-Y", $start_timestamp); ?>">
            </td>
            <td>
                <input type="text" name="end_timestamp" class="form-control datepicker" data-format="dd/mm/yyyy" placeholder="<?php echo get_phrase('date'); ?>" value="<?php echo date("d-m-Y", $end_timestamp); ?>">
            </td>
            <td>
                <input type="submit" value="<?php echo get_phrase('filter_receipts'); ?>" class="btn btn-info" />
            </td>
        </tr>
    </table>
    </form>
</center>-->

<table class="table table-bordered table-striped datatable" id="table-2">
    <thead>
        <tr>
            <th class="text-center">#</th>
            <th class="text-center"><?php echo get_phrase('date');?></th>
            <th class="text-center"><?php echo get_phrase('patient');?></th>
            <th class="text-center"><?php echo get_phrase('amount');?></th>
            <th class="text-center"><?php echo get_phrase('options');?></th>
        </tr>
    </thead>

    <tbody>
        <?php
        $system_currency_id = $this->db->get_where('settings', array('type' => 'system_currency_id'))->row()->description;
        $currency_symbol    = $this->db->get_where('currency', array('currency_id' => $system_currency_id))->row()->currency_symbol;
        $count = 1;
        foreach ($receipt_patient_info as $row) { ?>
            <tr>
                <td align="center"><?php echo $count++; ?></td>
                <td align="center"><?php echo date("d/m/Y - H:i", $row['timestamp']);?></td>
                <td><?php echo $row['patient_name'];?></td>
                <td align="center"><?php echo $currency_symbol.number_format($row['receipt_patient_amount'],2,',','.');?></td>
                <td align="center">
                    <a onclick="showAjaxModal('<?php echo base_url();?>index.php?modal/popup/edit_appointment/<?php echo $row['appointment_id']?>');" class="btn btn-default btn-sm btn-icon icon-left">
                        <i class="entypo-pencil"></i>
                        <?php echo get_phrase('edit');?>
                    </a>
                    <a onclick="return checkDelete();" href="<?php echo base_url();?>index.php?receptionist/appointment_management/delete/<?php echo $row['appointment_id']?>" class="btn btn-danger btn-sm btn-icon icon-left">
                        <i class="entypo-cancel"></i>
                        <?php echo get_phrase('delete');?>
                    </a>
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
        $("#table-2 tbody input[type=checkbox]").each(function (i, el)
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