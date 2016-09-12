<?php
    $system_currency_id = $this->db->get_where('settings', array('type' => 'system_currency_id'))->row()->description;
    $currency_symbol    = $this->db->get_where('currency', array('currency_id' => $system_currency_id))->row()->currency_symbol;
    //$edit_data = $this->db->get_where('receipt_doctor', array('receipt_doctor_id' => $param2))->result_array();

    #calcula quanto a clinica vai receber e quanto é o honorário do médico das consultas
    $sql_query =    "SELECT
                    rd.receipt_doctor_id, rd.timestamp, ROUND((rd.amount - rd.amount_honorary),2) as amount_clinic,
                    dc.name as doctor_name, dc.honorary, dc.council,
                    rd.amount, rd.amount_honorary
                    FROM receipt_doctor rd
                    JOIN appointment app
                    ON rd.receipt_doctor_id=app.receipt_doctor_id
                    JOIN doctor dc
                    ON app.doctor_id=dc.doctor_id
                    WHERE rd.receipt_doctor_id=".$param2."
                    GROUP BY rd.receipt_doctor_id
                    ORDER BY rd.timestamp";
    $edit_data = $this->db->query($sql_query)->result_array();

    foreach ($edit_data as $row) { ?>
        <div id="receipt_doctor_print">
            <div>
                <table width="100%" border="0">
                    <tr>
                        <td width="60%"><img src="assets/images/logo.png" style="max-height:120px;"></td>
                        <td align="right">
                            <h5><?php echo get_phrase('receipt_number');?>: <?php echo $row['receipt_doctor_id']; ?></h5>
                            <h5><?php echo get_phrase('date_time');?>: <?php echo str_replace("-","/",date("d-m-Y",$row['timestamp']))." - ".date("H:i",$row['timestamp']);?></h5>
                            <h5><?php echo get_phrase('doctor');?>: <?php echo $row['doctor_name'];?></h5>
                            <h5><?php echo $row['council'];?></h5>
                        </td>
                    </tr>
                </table>
                <hr>
                <h4><?php echo get_phrase('appointments');?></h4>
                <table class="table table-bordered" width="100%" border="1" style="border-collapse:collapse;">
                    <thead>
                        <tr>
                            <th class="text-center">#</th>
                            <th class="text-center"><?php echo get_phrase('date_time');?></th>
                            <th class="text-center" width="40%"><?php echo get_phrase('patient');?></th>
                            <th class="text-center"><?php echo get_phrase('return');?></th>
                            <th class="text-center"><?php echo get_phrase('amount');?></th>
                        </tr>
                    </thead>
                    <tbody>
                    <!--APPOINTMENTS STARTS HERE-->
                        <div>
                            <?php
                            $sql_query2 =   "SELECT
                                            rd.receipt_doctor_id, rd.timestamp as receipt_doctor_timestamp,
                                            rd.amount as receipt_doctor_amount, rd.amount_honorary as receipt_doctor_honorary,
                                            app.appointment_id, app.timestamp as appointment_timestamp, app.appointment_return,
                                            pt.name as patient_name,
                                            dc.name as doctor_name, dc.honorary as honorary_percent,
                                            dp.name as department_name, dp.cost as cost, round((dp.cost * dc.honorary / 100),2) as total_honorary
                                            FROM appointment app
                                            JOIN patient pt
                                            ON app.patient_id=pt.patient_id
                                            JOIN doctor dc
                                            ON app.doctor_id=dc.doctor_id
                                            JOIN department dp
                                            ON dc.department_id=dp.department_id
                                            JOIN receipt_doctor rd
                                            ON app.receipt_doctor_id=rd.receipt_doctor_id
                                            WHERE app.receipt_doctor_id=".$param2." ORDER BY appointment_timestamp";
                            $edit_data2 = $this->db->query($sql_query2)->result_array();

                            $i = 1;
                            foreach ($edit_data2 as $row2) { ?>
                                <tr>
                                    <td class="text-center"><?php echo $i++; ?></td>
                                    <td class="text-center"><?php echo str_replace("-","/",date("d-m-Y",$row2['appointment_timestamp']))." - ".date("H:i",$row2['appointment_timestamp']);?></td>
                                    <td class="text-left"><?php echo $row2['patient_name']; ?></td>
                                    <td class="text-center">
                                        <?php if ($row2['appointment_return'] == 'true') { ?>
                                            <input type="checkbox" id="appointment_return" name="appointment_return" disabled checked>
                                        <?php } else { ?>
                                            <input type="checkbox" id="appointment_return" name="appointment_return" disabled>
                                        <?php } ?>
                                    </td>
                                    <td class="text-center">
                                        <?php if ($row2['appointment_return'] == 'true') {
                                            echo $currency_symbol."00,00";
                                        } else {
                                            echo $currency_symbol.number_format($row2['cost'],2,',','.');
                                        } ?>
                                    </td>
                                </tr>
                            <?php } ?>
                        </div>
                    </tbody>
                    </table>
                    <!--APPOINTMENTS ENDS HERE-->
                <table width="100%" border="0">
                    <tr>
                        <td align="right" width="80%"><?php echo get_phrase('total_clinic');?> :</td>
                        <td align="right"><?php echo $currency_symbol.number_format($row['amount_clinic'],2,',','.');?></td>
                    </tr>
                    <tr>
                        <td align="right" width="80%"><?php echo get_phrase('honorary_percentage');?> :</td>
                        <td align="right"><?php echo $row['honorary']; ?>%</td>
                    </tr>
                    <tr>
                        <td align="right" width="80%"><?php echo get_phrase('total_honorary');?> :</td>
                        <td align="right"><?php echo $currency_symbol.number_format($row['amount_honorary'],2,',','.');?></td>
                    </tr>
                    <tr>
                        <td align="right" width="80%"><h4><?php echo get_phrase('total');?> :</h4></td>
                        <td align="right"><h4><?php echo $currency_symbol.number_format($row['amount'],2,',','.');?></h4></td>
                    </tr>
                </table>

                <?php
                $sql_query_red =    "SELECT
                                    dc.name as doctor_name,
                                    rd.receipt_doctor_id, rd.timestamp as receipt_doctor_timestamp, rd.amount as receipt_amount,
                                    red.receipt_exam_doctor_id, red.timestamp as receipt_exam_doctor_timestamp, red.amount as receipt_exam_amount
                                    FROM receipt_doctor rd
                                    LEFT JOIN receipt_exam_doctor red
                                    ON rd.timestamp=red.timestamp
                                    JOIN appointment app
                                    ON rd.receipt_doctor_id=app.receipt_doctor_id
                                    JOIN doctor dc
                                    ON app.doctor_id=dc.doctor_id
                                    WHERE rd.receipt_doctor_id=".$param2."
                                    GROUP BY red.receipt_exam_doctor_id";
                $data_red = $this->db->query($sql_query_red);
                $data2_red = $data_red->row('receipt_exam_doctor_id');

                if (!is_null($data2_red) || !empty($data2_red)) { ?>
                    <br>
                    <hr>
                    <h4><?php echo get_phrase('exams');?></h4>
                    <table class="table table-bordered" width="100%" border="1" style="border-collapse:collapse;">
                        <thead>
                            <tr>
                                <th class="text-center">#</th>
                                <th class="text-center" width="28%"><?php echo get_phrase('date_time');?></th>
                                <th class="text-center" width="40%"><?php echo get_phrase('patient');?></th>
                                <th class="text-center" width="40%"><?php echo get_phrase('exam');?></th>
                                <th class="text-center"><?php echo get_phrase('amount');?></th>
                            </tr>
                        </thead>
                        <!-- EXAMS START HERE-->
                            <tbody>
                                <div>
                                    <?php
                                    $sql_query4 =   "SELECT
                                                    app.timestamp as appointment_timestamp, ex.exam_id,
                                                    pt.name as patient_name,
                                                    ext.name as exam_type_name,
                                                    ext.value as exam_value,
                                                    ex.total_third
                                                    FROM exam ex
                                                    JOIN appointment app
                                                    ON ex.appointment_id=app.appointment_id
                                                    JOIN patient pt
                                                    ON app.patient_id=pt.patient_id
                                                    JOIN exam_type ext
                                                    ON ex.exam_type_id=ext.exam_type_id
                                                    WHERE ex.receipt_exam_doctor_id=".$data2_red."
                                                    ORDER BY appointment_timestamp";
                                    $edit_data4 = $this->db->query($sql_query4)->result_array();

                                    $i = 1;
                                    foreach ($edit_data4 as $row4) { ?>
                                        <tr>
                                            <td class="text-center"><?php echo $i++;?></td>
                                            <td class="text-center"><?php echo str_replace("-","/",date("d-m-Y",$row4['appointment_timestamp']))." - ".date("H:i",$row4['appointment_timestamp']);?></td>
                                            <td class="text-left"><?php echo $row4['patient_name'];?></td>
                                            <td class="text-left"><?php echo $row4['exam_type_name'];?></td>
                                            <td class="text-center"><?php echo $currency_symbol.number_format($row4['exam_value'],2,',','.');?></td>
                                        </tr>
                                    <?php } ?>
                                </div>
                                <!--EXAMS ENDS HERE-->
                            </tbody>
                    </table>
                        <?php
                        $sql_query5 =   "SELECT ex.receipt_exam_doctor_id,
                                        ROUND(SUM(ext.value),2) as total_receipt,
                                        ROUND(SUM(ex.total_third),2) as total_third_receipt
                                        FROM exam ex
                                        LEFT JOIN exam_type ext ON ex.exam_type_id=ext.exam_type_id
                                        WHERE receipt_exam_doctor_id=".$data2_red;
                        $edit_data5 = $this->db->query($sql_query5)->result_array();

                        foreach ($edit_data5 as $row5) {
                            $amount = $row5['total_receipt'];
                            $amount_third = $row5['total_third_receipt'];
                            $amount_clinic_s = $amount - $amount_third;
                            $data_exams_receipt['amount_clinic'] = $amount_clinic_s; ?>
                            <table width="100%" border="0">
                                <tr>
                                    <td align="right" width="80%"><?php echo get_phrase('total_clinic'); ?> :</td>
                                    <td align="right"><?php echo $currency_symbol.number_format($amount_clinic_s,2,',','.');?></td>
                                </tr>
                                <tr>
                                    <td align="right" width="80%"><?php echo get_phrase('total_third'); ?> :</td>
                                    <td align="right"><?php echo $currency_symbol.number_format($amount_third,2,',','.');?> </td>
                                </tr>
                                <tr>
                                    <td align="right" width="80%"><h4><?php echo get_phrase('total'); ?> :</h4></td>
                                    <td align="right"><h4><?php echo $currency_symbol.number_format($amount,2,',','.');?></h4></td>
                                </tr>
                            </table>
                        <?php }
                    }
                    else {
                        $amount_clinic_s = 0;
                        $row5['total_third_receipt'] = 0;
                        $row5['total_receipt'] = 0;
                    } ?>
                    <br>
                    <hr>
                    <table width="100%" border="0">
                        <tr>
                            <td align="right" width="80%"><h4>Total Clinica :</h4></td>
                            <?php $amount_clinic = $row['amount_clinic']+$amount_clinic_s;?>
                            <td align="right"><h4><?php echo $currency_symbol.number_format($amount_clinic,2,',','.');?></h4></td>
                        </tr>
                        <tr>
                            <td align="right" width="80%"><h4><?php echo get_phrase('total_receipt_third');?> :</h4></td>
                            <?php $amount_third_receipt = $row['amount_honorary']+$row5['total_third_receipt'];?>
                            <td align="right"><h4><?php echo $currency_symbol.number_format($amount_third_receipt,2,',','.');?></h4></td>
                        </tr>
                        <tr>
                            <td align="right" width="80%"><h4>Total Recibo :</h4></td>
                            <?php $total_receipt = $row['amount']+$row5['total_receipt'];?>
                            <td align="right"><h4><?php echo $currency_symbol.number_format($total_receipt,2,',','.');?></h4></td>
                        </tr>
                    </table>
                </div>
            </div>
            <?php } ?>

        <div id="printdiv">
            <a onClick="PrintElem('#receipt_doctor_print')" class="btn btn-primary btn-icon icon-left hidden-print">
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
        var filename = "<?php echo get_phrase('receipt_doctor')." ".$param2;?>";
        var titlewindow = "<?php echo get_phrase('receipt_doctor');?>";
        var mywindow = window.open('',titlewindow,'height=842 width=595 menubar=0 status=0 scrollbars=1 resizable=0 toolbar=0');
        mywindow.document.write('<html><head><title>'+filename+'</title>');
        mywindow.document.write('<link rel="stylesheet" href="assets/css/neon-theme.css" type="text/css"/>');
        mywindow.document.write('<link rel="stylesheet" href="assets/js/datatables/responsive/css/datatables.responsive.css" type="text/css"/>');
        mywindow.document.write('</head><body>');
        mywindow.document.write(data);
        mywindow.document.write('</body></html>');

        //mywindow.print();
        //mywindow.close();

        return true;
    }
</script>