<button onclick="return addreceipt_onclick()" class="btn btn-primary pull-right">
    <?php echo get_phrase('add_receipt'); ?>
    <script language="javascript" type="text/javascript">
        function addreceipt_onclick()
        {
            window.location.href = "<?php echo base_url(); ?>index.php?receptionist/add_receipt_doctor";
        }
    </script>
</button>


<div style="clear:both;"></div>
<br>
<center>
    <form role="form" enctype="multipart/form-data" class="form-horizontal form-groups-bordered"
        action="<?php echo base_url(); ?>index.php?receptionist/save_receipt_doctor_info/filter" method="post">
    <table border="0" cellspacing="0" cellpadding="0" class="table">
        <tr>
            <td><?php echo get_phrase('select_doctor'); ?></td>
            <td><?php echo get_phrase('start_date'); ?></td>
            <td><?php echo get_phrase('end_date'); ?></td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <select name="doctor_id" class="selectboxit">
                    <option value="" <?php if($doctor_id == 'all') echo 'selected'; ?>>
                        <?php echo get_phrase('all_doctors'); ?>
                    </option>
                    <?php
                    $this->db->order_by('name', 'asc');
                    $doctors = $this->db->get('doctor')->result_array();
                    foreach ($doctors as $row) { ?>
                        <option value="<?php echo $row['doctor_id']; ?>"
                            <?php if ($doctor_id == $row['doctor_id']) echo 'selected'; ?>>
                                <?php echo $row['name']; ?>
                        </option>
                    <?php } ?>
                </select>
            </td>
            <td>
                <input type="text" name="start_timestamp" class="form-control datepicker"
                    data-format="dd/mm/yyyy" placeholder="<?php echo get_phrase('date'); ?>"
                    value="<?php echo date("d-m-Y", $start_timestamp); ?>">
            </td>
            <td>
                <input type="text" name="end_timestamp" class="form-control datepicker"
                    data-format="dd/mm/yyyy" placeholder="<?php echo get_phrase('date'); ?>"
                    value="<?php echo date("d-m-Y", $end_timestamp); ?>">
            </td>
            <td>
                <input type="submit" value="<?php echo get_phrase('filter_appointments'); ?>" class="btn btn-info" />
            </td>
        </tr>
    </table>
    </form>
</center>

<table class="table table-bordered table-striped datatable" id="table-2">
    <thead>
        <tr>
            <th>#</th>
            <th><?php echo get_phrase('date');?></th>
            <th><?php echo get_phrase('doctor');?></th>
            <th><?php echo get_phrase('patient');?></th>
        </tr>
    </thead>

    <tbody>
        <?php
        $count = 1;
        foreach ($receipt_doctor_info as $row) { ?>
            <tr>
                <td><?php echo $count++; ?></td>
                <td><?php echo str_replace("-","/",date("d-m-Y",$row['timestamp']))." - ".date("H:i",$row['timestamp']); ?></td>
                <td>
                    <?php $name = $this->db->get_where('doctor' , array('doctor_id' => $row['doctor_id'] ))->row()->name;
                        echo $name;?>
                </td>
                <td>
                    <?php $name = $this->db->get_where('patient' , array('patient_id' => $row['patient_id'] ))->row()->name;
                        echo $name;?>
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