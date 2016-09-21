<?php
    $system_currency_id = $this->db->get_where('settings', array('type' => 'system_currency_id'))->row()->description;
    $currency_symbol    = $this->db->get_where('currency', array('currency_id' => $system_currency_id))->row()->currency_symbol;

    $query_appid    =   "SELECT
                        rp.receipt_patient_id, rp.timestamp, rp.appointment_id,
                        pt.name as patient_name, dc.name as doctor_name, dp.name as department_name,
                        rp.payment_type, rp.payment_installment,
                        dp.cost as receipt_patient_amount
                        FROM receipt_patient rp
                        JOIN appointment app
                        ON rp.appointment_id=app.appointment_id
                        JOIN patient pt
                        ON app.patient_id=pt.patient_id
                        JOIN doctor dc
                        ON app.doctor_id=dc.doctor_id
                        JOIN department dp
                        ON dc.department_id=dp.department_id
                        WHERE rp.receipt_patient_id=".$param2;
    $query_appid_data = $this->db->query($query_appid);
    $appointment_id = $query_appid_data->row('appointment_id');
    $edit_data = $query_appid_data->result_array();

    foreach ($edit_data as $row) { ?>
        <div id="receipt_patient_print">
            <div>
                <table width="100%" border="0">
                    <tr>
                        <td width="60%"><img src="assets/images/logo.png" style="max-height:120px;"></td>
                        <td align="right">
                            <h5><?php echo get_phrase('receipt_number');?>: <?php echo $row['receipt_patient_id']; ?></h5>
                            <h5><?php echo get_phrase('date_time');?>: <?php echo str_replace("-","/",date("d-m-Y",$row['timestamp']))." - ".date("H:i",$row['timestamp']);?></h5>
                            <h5><?php echo get_phrase('patient');?>: <?php echo $row['patient_name'];?></h5>
                        </td>
                    </tr>
                </table>

                <hr>

                <h4><?php echo get_phrase('appointment');?></h4>
                <table class="table table-bordered" width="100%" border="1" style="border-collapse:collapse;">
                    <thead>
                        <tr>
                            <th class="text-center" width="28%"><?php echo get_phrase('date_time');?></th>
                            <th class="text-center" width="40%"><?php echo get_phrase('doctor');?></th>
                            <th class="text-center" width="40%"><?php echo get_phrase('department');?></th>
                            <th class="text-center"><?php echo get_phrase('value');?></th>
                        </tr>
                    </thead>

                    <tr>
                        <td align="center"><?php echo str_replace("-","/",date("d-m-Y",$row['timestamp']))." - ".date("H:i",$row['timestamp']);?></td>
                        <td align="center"><?php echo $row['doctor_name'];?></td>
                        <td align="center"><?php echo $row['department_name'];?></td>
                        <td align="center"><?php echo $currency_symbol.number_format($row['receipt_patient_amount'],2,',','.');?></td>
                    </tr>
                </table>

                <?php
                $sql_query_red =    "SELECT
                                    rep.receipt_exam_patient_id, rep.timestamp, ex.appointment_id
                                    FROM receipt_exam_patient rep
                                    JOIN exam ex
                                    ON rep.receipt_exam_patient_id=ex.receipt_exam_patient_id
                                    WHERE ex.appointment_id=".$row['appointment_id']."
                                    GROUP BY rep.receipt_exam_patient_id";
                $data_red = $this->db->query($sql_query_red);
                $data2_red = $data_red->row('receipt_exam_patient_id'); ?>

                <?php if (!empty($data2_red)) { ?>
                    <br>
                    <hr>
                    <h4><?php echo get_phrase('exams');?></h4>
                    <table class="table table-bordered" width="100%" border="1" style="border-collapse:collapse;">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center" width="28%"><?php echo get_phrase('date_time');?></th>
                                <th class="text-center" width="40%"><?php echo get_phrase('exam');?></th>
                                <th class="text-center"><?php echo get_phrase('value');?></th>
                            </tr>
                        </thead>
                        <!-- EXAMS START HERE-->
                            <tbody>
                                <div>
                                    <?php
                                    $sql_query4 =   "SELECT
                                                    ex.appointment_id, app.timestamp, ex.exam_id,
                                                    ex.exam_type_id, ext.name as exam_type, ext.value
                                                    FROM exam ex
                                                    JOIN exam_type ext
                                                    ON ex.exam_type_id=ext.exam_type_id
                                                    JOIN appointment app
                                                    ON ex.appointment_id=app.appointment_id
                                                    WHERE ex.appointment_id=".$row['appointment_id'];
                                    $edit_data4 = $this->db->query($sql_query4)->result_array();

                                    $i = 1;
                                    foreach ($edit_data4 as $row4) { ?>
                                        <tr>
                                            <td align="center"><?php echo $i++;?></td>
                                            <td align="center"><?php echo str_replace("-","/",date("d-m-Y",$row4['timestamp']))." - ".date("H:i",$row4['timestamp']);?></td>
                                            <td align="center"><?php echo $row4['exam_type'];?></td>
                                            <td align="center"><?php echo $currency_symbol.number_format($row4['value'],2,',','.');?></td>
                                        </tr>
                                    <?php } ?>
                                </div>
                                <!--EXAMS ENDS HERE-->
                            </tbody>
                    </table>
                        <?php
                        $sql_query5 =   "SELECT
                                        rp.receipt_patient_id, rp.timestamp, rp.amount as receipt_amount,
                                        rep.receipt_exam_patient_id, rep.amount as receipt_exam_amount,
                                        (rp.amount+rep.amount) as total_receipt_amount
                                        FROM receipt_patient rp
                                        LEFT JOIN receipt_exam_patient rep
                                        ON rp.timestamp=rep.timestamp
                                        WHERE rp.appointment_id=".$row['appointment_id'];
                        $edit_data5 = $this->db->query($sql_query5);
                        $total_exam_amount = $edit_data5->row('receipt_exam_amount');?>
                    <br>
                    <hr>

                    <table width="100%" border="0">
                        <tr>
                            <td align="right" width="80%"><h4><?php echo get_phrase('total_exams');?> :</h4></td>
                            <td align="right"><h4><?php echo $currency_symbol.number_format($total_exam_amount,2,',','.');?></h4></td>
                        </tr>
                    </table>
                <?php }
                else {
                    $total_exam_amount = 0; ?>
                    <br>
                    <hr>
                <?php } ?>

                    <table width="100%" border="0">
                        <tr>
                            <td align="right" width="80%"><h4><?php echo get_phrase('appointment_value');?> :</h4></td>
                            <td align="right"><h4><?php echo $currency_symbol.number_format($row['receipt_patient_amount'],2,',','.');?></h4></td>
                        </tr>
                    </table>

                    <table width="100%" border="0">
                        <tr>
                            <?php $total_receipt_amount_data = $row['receipt_patient_amount'] + $total_exam_amount;?>
                            <td align="right" width="80%"><h4><?php echo get_phrase('total_receipt');?> :</h4></td>
                            <td align="right"><h4><?php echo $currency_symbol.number_format($total_receipt_amount_data,2,',','.');?></h4></td>
                        </tr>
                    </table>

                    <?php
                        if ($row['payment_type'] == "credit") { ?>
                            <?php $payment_installment_value =  $total_receipt_amount_data / $row['payment_installment'];?>
                            <table width="100%" border="0">
                                <tr>
                                    <td align="right" width="80%"><h4><?php echo get_phrase('payment_type');?> :</h4></td>
                                    <td align="right"><h4><?php echo get_phrase($row['payment_type']);?></h4></td>
                                </tr>
                            </table>
                            <table width="100%" border="0">
                                <tr>
                                    <td align="right" width="80%"><h4><?php echo get_phrase('installment');?> :</h4></td>
                                    <td align="right"><h4><?php echo $row['payment_installment'];?>x de <?php echo $currency_symbol.number_format($payment_installment_value,2,',','.');?></h4></td>
                                </tr>
                            </table>
                        <?php }
                        else { ?>
                            <table width="100%" border="0">
                                <tr>
                                    <td align="right" width="80%"><h4><?php echo get_phrase('payment_type');?> :</h4></td>
                                    <td align="right"><h4><?php echo get_phrase($row['payment_type']);?></h4></td>
                                </tr>
                            </table>
                        <?php } ?>
                </div>
            </div>
            <?php } ?>

        <div id="printdiv">
            <a onClick="PrintElem('#receipt_patient_print')" class="btn btn-primary btn-icon icon-left hidden-print">
                <?php echo get_phrase('print_receipt');?>
                <i class="entypo-doc-text"></i>
            </a>
        </div>

<script type="text/javascript">
    function PrintElem(elem)
    {
        Popup($(elem).html());
    }

    function Popup(data)
    {
        var filename = "<?php echo get_phrase('receipt_patient')." ".$param2;?>";
        var titlewindow = "<?php echo get_phrase('receipt_patient');?>";
        var mywindow = window.open('',titlewindow,'height=842 width=595 menubar=0 status=0 scrollbars=1 resizable=0 toolbar=0');
        mywindow.document.write('<html><head><title>'+filename+'</title>');
        mywindow.document.write('<link rel="stylesheet" href="assets/css/neon-theme.css" type="text/css"/>');
        mywindow.document.write('<link rel="stylesheet" href="assets/js/datatables/responsive/css/datatables.responsive.css" type="text/css"/>');
        mywindow.document.write('</head><body>');
        mywindow.document.write(data);
        mywindow.document.write('</body></html>');

        mywindow.print();
        //mywindow.close();

        return true;
    }
</script>