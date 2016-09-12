<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Crud_model extends CI_Model {

    function __construct(){
        //function
        parent::__construct();
    }

    function clear_cache(){
        $this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
        $this->output->set_header('Pragma: no-cache');
    }

    function get_type_name_by_id($type, $type_id = '', $field = 'name'){
        $this->db->where($type . '_id', $type_id);
        $query = $this->db->get($type);
        $result = $query->result_array();
        foreach ($result as $row){
            return $row[$field];
            //return    $this->db->get_where($type,array($type.'_id'=>$type_id))->row()->$field;
        }
    }

    // Create a new invoice.
    function create_invoice(){
        $data['title']              = $this->input->post('title');
        $data['invoice_number']     = $this->input->post('invoice_number');
        $data['patient_id']         = $this->input->post('patient_id');
        $data['creation_timestamp'] = $this->input->post('creation_timestamp');
        $data['due_timestamp']      = $this->input->post('due_timestamp');
        $data['vat_percentage']     = $this->input->post('vat_percentage');
        $data['discount_amount']    = $this->input->post('discount_amount');
        $data['status']             = $this->input->post('status');

        $invoice_entries            = array();
        $descriptions               = $this->input->post('entry_description');
        $amounts                    = $this->input->post('entry_amount');
        $number_of_entries          = sizeof($descriptions);

        for ($i = 0; $i < $number_of_entries; $i++) {
            if ($descriptions[$i] != "" && $amounts[$i] != "") {
                $new_entry          = array('description' => $descriptions[$i], 'amount' => $amounts[$i]);
                array_push($invoice_entries, $new_entry);
            }
        }
        $data['invoice_entries']    = json_encode($invoice_entries);

        $this->db->insert('invoice', $data);
    }

    function select_invoice_info(){
        //$this->db->order_by('name','asc');
        return $this->db->get('invoice')->result_array();
    }

    function select_invoice_info_by_patient_id(){
        $patient_id = $this->session->userdata('login_user_id');
        return $this->db->get_where('invoice', array('patient_id' => $patient_id))->result_array();
    }

    function update_invoice($invoice_id){
        $data['title']              = $this->input->post('title');
        $data['invoice_number']     = $this->input->post('invoice_number');
        $data['patient_id']         = $this->input->post('patient_id');
        $data['creation_timestamp'] = $this->input->post('creation_timestamp');
        $data['due_timestamp']      = $this->input->post('due_timestamp');
        $data['vat_percentage']     = $this->input->post('vat_percentage');
        $data['discount_amount']    = $this->input->post('discount_amount');
        $data['status']             = $this->input->post('status');

        $invoice_entries            = array();
        $descriptions               = $this->input->post('entry_description');
        $amounts                    = $this->input->post('entry_amount');
        $number_of_entries          = sizeof($descriptions);

        for ($i = 0; $i < $number_of_entries; $i++){
            if ($descriptions[$i] != "" && $amounts[$i] != "") {
                $new_entry          = array('description' => $descriptions[$i], 'amount' => $amounts[$i]);
                array_push($invoice_entries, $new_entry);
            }
        }
        $data['invoice_entries']    = json_encode($invoice_entries);

        $this->db->where('invoice_id', $invoice_id);
        $this->db->update('invoice', $data);
    }

    function delete_invoice($invoice_id){
        $this->db->where('invoice_id', $invoice_id);
        $this->db->delete('invoice');
    }

    function calculate_invoice_total_amount($invoice_number){
        $total_amount           = 0;
        $invoice                = $this->db->get_where('invoice', array('invoice_number' => $invoice_number))->result_array();
        foreach ($invoice as $row) {
            $invoice_entries    = json_decode($row['invoice_entries']);
            foreach ($invoice_entries as $invoice_entry)
                $total_amount  += $invoice_entry->amount;

            $vat_amount         = $total_amount * $row['vat_percentage'] / 100;
            $grand_total        = $total_amount + $vat_amount - $row['discount_amount'];
        }

        return $grand_total;
    }

    //////system settings//////
    function update_system_settings(){
        $data['description'] = $this->input->post('system_name');
        $this->db->where('type', 'system_name');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('system_title');
        $this->db->where('type', 'system_title');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('address');
        $this->db->where('type', 'address');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('phone');
        $this->db->where('type', 'phone');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('paypal_email');
        $this->db->where('type', 'paypal_email');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('currency');
        $this->db->where('type', 'currency');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('system_email');
        $this->db->where('type', 'system_email');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('buyer');
        $this->db->where('type', 'buyer');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('system_name');
        $this->db->where('type', 'system_name');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('purchase_code');
        $this->db->where('type', 'purchase_code');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('language');
        $this->db->where('type', 'language');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('text_align');
        $this->db->where('type', 'text_align');
        $this->db->update('settings', $data);
    }

    // SMS settings.
    function update_sms_settings(){
        $data['description'] = $this->input->post('clickatell_user');
        $this->db->where('type', 'clickatell_user');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('clickatell_password');
        $this->db->where('type', 'clickatell_password');
        $this->db->update('settings', $data);

        $data['description'] = $this->input->post('clickatell_api_id');
        $this->db->where('type', 'clickatell_api_id');
        $this->db->update('settings', $data);
    }

    /////creates log/////
    function create_log($data){
        $data['timestamp'] = strtotime(date('Y-m-d') . ' ' . date('H:i:s'));
        $data['ip'] = $_SERVER["REMOTE_ADDR"];
        $location = new SimpleXMLElement(file_get_contents('http://freegeoip.net/xml/' . $_SERVER["REMOTE_ADDR"]));
        $data['location'] = $location->City . ' , ' . $location->CountryName;
        $this->db->insert('log', $data);
    }

    ////////BACKUP RESTORE/////////
    function create_backup($type){
        $this->load->dbutil();

        $options = array(
            'format' => 'txt', // gzip, zip, txt
            'add_drop' => TRUE, // Whether to add DROP TABLE statements to backup file
            'add_insert' => TRUE, // Whether to add INSERT data to backup file
            'newline' => "\n"               // Newline character used in backup file
        );

        if ($type == 'all') {
            $tables = array('');
            $file_name = 'system_backup';
        } else {
            $tables = array('tables' => array($type));
            $file_name = 'backup_' . $type;
        }

        $backup = & $this->dbutil->backup(array_merge($options, $tables));

        $this->load->helper('download');
        force_download($file_name . '.sql', $backup);
    }

    /////////RESTORE TOTAL DB/ DB TABLE FROM UPLOADED BACKUP SQL FILE//////////
    function restore_backup(){
        move_uploaded_file($_FILES['userfile']['tmp_name'], 'uploads/backup.sql');
        $this->load->dbutil();


        $prefs = array(
            'filepath' => 'uploads/backup.sql',
            'delete_after_upload' => TRUE,
            'delimiter' => ';'
        );
        $restore = & $this->dbutil->restore($prefs);
        unlink($prefs['filepath']);
    }

    /////////DELETE DATA FROM TABLES///////////////
    function truncate($type){
        if ($type == 'all') {
            $this->db->truncate('student');
            $this->db->truncate('mark');
            $this->db->truncate('teacher');
            $this->db->truncate('subject');
            $this->db->truncate('class');
            $this->db->truncate('exam');
            $this->db->truncate('grade');
        } else {
            $this->db->truncate($type);
        }
    }

    ////////IMAGE URL//////////
    function get_image_url($type = '', $id = ''){
        if (file_exists('uploads/' . $type . '_image/' . $id . '.jpg'))
            $image_url = base_url() . 'uploads/' . $type . '_image/' . $id . '.jpg';
        else
            $image_url = base_url() . 'uploads/user.jpg';

        return $image_url;
    }

    function save_department_info(){
        $data['name'] 		    = $this->input->post('name');
        $data['description']    = $this->input->post('description');
        $data['cost']           = $this->input->post('cost');

        $this->db->insert('department',$data);
    }

    function select_department_info(){
        $this->db->order_by('name', 'asc');
        return $this->db->get('department')->result_array();
    }

    function update_department_info($department_id){
        $data['name'] 		    = $this->input->post('name');
        $data['description'] 	= $this->input->post('description');
        $data['cost']           = $this->input->post('cost');

        $this->db->where('department_id',$department_id);
        $this->db->update('department',$data);
    }

    function delete_department_info($department_id){
        $this->db->where('department_id',$department_id);
        $this->db->delete('department');
    }

    function select_exam_type_info(){
        $this->db->order_by('name', 'asc');
        return $this->db->get('exam_type')->result_array();
    }

    function save_exam_type_info(){
        $data['name']           = $this->input->post('name');
        $data['value']          = str_replace(",",".",str_replace("R$ ","",$this->input->post('value_examtype')));
        $data['third_percent']  = str_replace("%","",$this->input->post('third_percent'));

        $this->db->insert('exam_type',$data);
    }

    function update_exam_type_info($exam_type_id){
        $data['name']           = $this->input->post('name');
        $data['value']          = str_replace(",",".",str_replace("R$ ","",$this->input->post('value_examtype')));
        $data['third_percent']  = str_replace("%","",$this->input->post('third_percent'));

        $this->db->where('exam_type_id',$exam_type_id);
        $this->db->update('exam_type',$data);
    }

    function delete_exam_type_info($exam_type_id){
        $this->db->where('exam_type_id',$exam_type_id);
        $this->db->delete('exam_type');
    }

    function save_doctor_info(){
        $data['name']           = $this->input->post('name');
        $data['email']          = $this->input->post('email');
        $data['street']         = $this->input->post('street');
        $data['street_number']  = $this->input->post('street_number');
        $data['street_comp']    = $this->input->post('street_comp');
        $data['neighborhood']   = $this->input->post('neighborhood');
        $data['city']           = $this->input->post('city');
        $data['state']          = $this->input->post('state');
        $data['phone']          = $this->input->post('phone');
        $data['department_id']  = $this->input->post('department_id');
        $data['council']        = $this->input->post('council');
        $data['honorary']       = str_replace("%","",$this->input->post('honorary'));
        $data['profile']        = $this->input->post('profile');

        $this->db->insert('doctor',$data);

        $doctor_id  =   $this->db->insert_id();
        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/doctor_image/" . $doctor_id . '.jpg');
    }

    function select_doctor_info(){
        $this->db->order_by('name','asc');
        return $this->db->get('doctor')->result_array();
    }

    function update_doctor_info($doctor_id){
        $data['name'] 		    = $this->input->post('name');
        $data['email']          = $this->input->post('email');
        $data['street']         = $this->input->post('street');
        $data['street_number']  = $this->input->post('street_number');
        $data['street_comp']    = $this->input->post('street_comp');
        $data['neighborhood']   = $this->input->post('neighborhood');
        $data['city']           = $this->input->post('city');
        $data['state']          = $this->input->post('state');
        $data['phone']          = $this->input->post('phone');
        $data['department_id'] 	= $this->input->post('department_id');
        $data['council']        = $this->input->post('council');
        $data['honorary']       = str_replace("%","",$this->input->post('honorary'));
        $data['profile'] 	    = $this->input->post('profile');

        $this->db->where('doctor_id',$doctor_id);
        $this->db->update('doctor',$data);

        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/doctor_image/" . $doctor_id . '.jpg');
    }

    function delete_doctor_info($doctor_id){
        $this->db->where('doctor_id',$doctor_id);
        $this->db->delete('doctor');
    }

    function save_patient_info(){
        $data['name']           = $this->input->post('name');
        $data['email']          = $this->input->post('email');
        $data['street']         = $this->input->post('street');
        $data['street_number']  = $this->input->post('street_number');
        $data['street_comp']    = $this->input->post('street_comp');
        $data['neighborhood']   = $this->input->post('neighborhood');
        $data['city']           = $this->input->post('city');
        $data['state']          = $this->input->post('state');
        $data['phone']          = $this->input->post('phone');
        $data['sex']            = $this->input->post('sex');
        $data['birth_date']     = strtotime($this->input->post('birth_date'));
        $data['age']            = $this->input->post('age');
        $data['blood_group']    = $this->input->post('blood_group');

        $this->db->insert('patient',$data);

        $patient_id  =   $this->db->insert_id();
        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/patient_image/" . $patient_id . '.jpg');
    }

    function select_patient_info(){
        $this->db->order_by('name', 'asc');
        return $this->db->get('patient')->result_array();
    }

    function select_patient_info_by_patient_id( $patient_id = '' ){
        //$this->db->order_by('name', 'asc');
        return $this->db->get_where('patient', array('patient_id' => $patient_id))->result_array();
    }

    function update_patient_info($patient_id){
        $data['name']           = $this->input->post('name');
        $data['email']          = $this->input->post('email');
        $data['street']         = $this->input->post('street');
        $data['street_number']  = $this->input->post('street_number');
        $data['street_comp']    = $this->input->post('street_comp');
        $data['neighborhood']   = $this->input->post('neighborhood');
        $data['city']           = $this->input->post('city');
        $data['state']          = $this->input->post('state');
        $data['phone']          = $this->input->post('phone');
        $data['sex']            = $this->input->post('sex');
        $data['birth_date']     = strtotime(str_replace('/','.',$this->input->post('birth_date')));
        $data['age']            = $this->input->post('age');
        $data['blood_group']    = $this->input->post('blood_group');

        $this->db->where('patient_id',$patient_id);
        $this->db->update('patient',$data);

        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/patient_image/" . $patient_id . '.jpg');
    }

    function delete_patient_info($patient_id){
        $this->db->where('patient_id',$patient_id);
        $this->db->delete('patient');
    }

    function save_nurse_info(){
        $data['name'] 		= $this->input->post('name');
        $data['email'] 		= $this->input->post('email');
        $data['password']   = sha1($this->input->post('password'));
        $data['address'] 	= $this->input->post('address');
        $data['phone']      = $this->input->post('phone');

        $this->db->insert('nurse',$data);

        $nurse_id  =   $this->db->insert_id();
        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/nurse_image/" . $nurse_id . '.jpg');
    }

    function select_nurse_info(){
        $this->db->order_by('name','asc');
        return $this->db->get('nurse')->result_array();
    }

    function update_nurse_info($nurse_id){
        $data['name'] 		= $this->input->post('name');
        $data['email'] 		= $this->input->post('email');
        $data['address'] 	= $this->input->post('address');
        $data['phone']          = $this->input->post('phone');

        $this->db->where('nurse_id',$nurse_id);
        $this->db->update('nurse',$data);

        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/nurse_image/" . $nurse_id . '.jpg');
    }

    function delete_nurse_info($nurse_id){
        $this->db->where('nurse_id',$nurse_id);
        $this->db->delete('nurse');
    }

    function save_pharmacist_info(){
        $data['name'] 		= $this->input->post('name');
        $data['email'] 		= $this->input->post('email');
        $data['password']   = sha1($this->input->post('password'));
        $data['address'] 	= $this->input->post('address');
        $data['phone']      = $this->input->post('phone');

        $this->db->insert('pharmacist',$data);

        $pharmacist_id  =   $this->db->insert_id();
        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/pharmacist_image/" . $pharmacist_id . '.jpg');
    }

    function select_pharmacist_info(){
        $this->db->order_by('name','asc');
        return $this->db->get('pharmacist')->result_array();
    }

    function update_pharmacist_info($pharmacist_id){
        $data['name'] 		= $this->input->post('name');
        $data['email'] 		= $this->input->post('email');
        $data['address'] 	= $this->input->post('address');
        $data['phone']      = $this->input->post('phone');

        $this->db->where('pharmacist_id',$pharmacist_id);
        $this->db->update('pharmacist',$data);

        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/pharmacist_image/" . $pharmacist_id . '.jpg');
    }

    function delete_pharmacist_info($pharmacist_id){
        $this->db->where('pharmacist_id',$pharmacist_id);
        $this->db->delete('pharmacist');
    }

    function save_laboratorist_info(){
        $data['name'] 		= $this->input->post('name');
        $data['email'] 		= $this->input->post('email');
        $data['password']       = sha1($this->input->post('password'));
        $data['address'] 	= $this->input->post('address');
        $data['phone']          = $this->input->post('phone');

        $this->db->insert('laboratorist',$data);

        $laboratorist_id  =   $this->db->insert_id();
        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/laboratorist_image/" . $laboratorist_id . '.jpg');
    }

    function select_laboratorist_info(){
        $this->db->order_by('name','asc');
        return $this->db->get('laboratorist')->result_array();
    }

    function update_laboratorist_info($laboratorist_id){
        $data['name'] 		= $this->input->post('name');
        $data['email'] 		= $this->input->post('email');
        $data['address'] 	= $this->input->post('address');
        $data['phone']          = $this->input->post('phone');

        $this->db->where('laboratorist_id',$laboratorist_id);
        $this->db->update('laboratorist',$data);

        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/laboratorist_image/" . $laboratorist_id . '.jpg');
    }

    function delete_laboratorist_info($laboratorist_id){
        $this->db->where('laboratorist_id',$laboratorist_id);
        $this->db->delete('laboratorist');
    }

    function save_accountant_info(){
        $data['name'] 		= $this->input->post('name');
        $data['email'] 		= $this->input->post('email');
        $data['password']       = sha1($this->input->post('password'));
        $data['address'] 	= $this->input->post('address');
        $data['phone']          = $this->input->post('phone');

        $this->db->insert('accountant',$data);

        $accountant_id  =   $this->db->insert_id();
        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/accountant_image/" . $accountant_id . '.jpg');
    }

    function select_accountant_info(){
        $this->db->order_by('name','asc');
        return $this->db->get('accountant')->result_array();
    }

    function update_accountant_info($accountant_id){
        $data['name'] 		= $this->input->post('name');
        $data['email'] 		= $this->input->post('email');
        $data['address'] 	= $this->input->post('address');
        $data['phone']          = $this->input->post('phone');

        $this->db->where('accountant_id',$accountant_id);
        $this->db->update('accountant',$data);

        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/accountant_image/" . $accountant_id . '.jpg');
    }

    function delete_accountant_info($accountant_id){
        $this->db->where('accountant_id',$accountant_id);
        $this->db->delete('accountant');
    }

    function save_receptionist_info(){
        $data['name'] 		= $this->input->post('name');
        $data['email'] 		= $this->input->post('email');
        $data['password']       = sha1($this->input->post('password'));
        $data['address'] 	= $this->input->post('address');
        $data['phone']          = $this->input->post('phone');

        $this->db->insert('receptionist',$data);

        $receptionist_id  =   $this->db->insert_id();
        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/receptionist_image/" . $receptionist_id . '.jpg');
    }

    function select_receptionist_info(){
        $this->db->order_by('name','asc');
        return $this->db->get('receptionist')->result_array();
    }

    function update_receptionist_info($receptionist_id){
        $data['name'] 		= $this->input->post('name');
        $data['email'] 		= $this->input->post('email');
        $data['address'] 	= $this->input->post('address');
        $data['phone']          = $this->input->post('phone');

        $this->db->where('receptionist_id',$receptionist_id);
        $this->db->update('receptionist',$data);

        move_uploaded_file($_FILES["image"]["tmp_name"], "uploads/receptionist_image/" . $receptionist_id . '.jpg');
    }

    function delete_receptionist_info($receptionist_id){
        $this->db->where('receptionist_id',$receptionist_id);
        $this->db->delete('receptionist');
    }

    function save_bed_allotment_info(){
        $data['bed_id']             = $this->input->post('bed_id');
        $data['patient_id'] 		= $this->input->post('patient_id');
        $data['allotment_timestamp'] 	= strtotime($this->input->post('allotment_timestamp'));
        $data['discharge_timestamp']    = strtotime($this->input->post('discharge_timestamp'));

        $this->db->insert('bed_allotment',$data);
    }

    function select_bed_allotment_info(){
        //$this->db->order_by('name','asc');
        return $this->db->get('bed_allotment')->result_array();
    }

    function update_bed_allotment_info($bed_allotment_id){
        $data['bed_id']                 = $this->input->post('bed_id');
        $data['patient_id'] 		= $this->input->post('patient_id');
        $data['allotment_timestamp'] 	= strtotime($this->input->post('allotment_timestamp'));
        $data['discharge_timestamp']    = strtotime($this->input->post('discharge_timestamp'));

        $this->db->where('bed_allotment_id',$bed_allotment_id);
        $this->db->update('bed_allotment',$data);
    }

    function delete_bed_allotment_info($bed_allotment_id){
        $this->db->where('bed_allotment_id',$bed_allotment_id);
        $this->db->delete('bed_allotment');
    }

    function select_blood_bank_info(){
        //$this->db->order_by('name','asc');
        return $this->db->get('blood_bank')->result_array();
    }

    function update_blood_bank_info($blood_group_id){
        $data['status']    = $this->input->post('status');

        $this->db->where('blood_group_id',$blood_group_id);
        $this->db->update('blood_bank',$data);
    }

    function save_report_info(){
        $data['type'] 		    = $this->input->post('type');
        $data['description']    = $this->input->post('description');
        $data['timestamp']      = strtotime($this->input->post('timestamp'));
        $data['patient_id']     = $this->input->post('patient_id');

        $login_type             = $this->session->userdata('login_type');
        if($login_type=='nurse')
            $data['doctor_id']  = $this->input->post('doctor_id');
        else $data['doctor_id'] = $this->session->userdata('login_user_id');

        $this->db->insert('report',$data);
    }

    function select_report_info(){
        //$this->db->order_by('name','asc');
        return $this->db->get('report')->result_array();
    }

    function update_report_info($report_id){
        $data['type'] 		    = $this->input->post('type');
        $data['description']    = $this->input->post('description');
        $data['timestamp']      = strtotime($this->input->post('timestamp'));
        $data['patient_id']     = $this->input->post('patient_id');

        $login_type             = $this->session->userdata('login_type');
        if($login_type=='nurse')
            $data['doctor_id']  = $this->input->post('doctor_id');
        else $data['doctor_id'] = $this->session->userdata('login_user_id');

        $this->db->where('report_id',$report_id);
        $this->db->update('report',$data);
    }

    function delete_report_info($report_id){
        $this->db->where('report_id',$report_id);
        $this->db->delete('report');
    }

    function save_bed_info(){
        $data['bed_number']     = $this->input->post('bed_number');
        $data['type'] 		= $this->input->post('type');
        $data['description']    = $this->input->post('description');

        $this->db->insert('bed',$data);
    }

    function select_bed_info(){
        //$this->db->order_by('name','asc');
        return $this->db->get('bed')->result_array();
    }

    function update_bed_info($bed_id){
        $data['bed_number']     = $this->input->post('bed_number');
        $data['type'] 		= $this->input->post('type');
        $data['description']    = $this->input->post('description');

        $this->db->where('bed_id',$bed_id);
        $this->db->update('bed',$data);
    }

    function delete_bed_info($bed_id){
        $this->db->where('bed_id',$bed_id);
        $this->db->delete('bed');
    }

    function save_blood_donor_info(){
        $data['name']                       = $this->input->post('name');
        $data['email']                      = $this->input->post('email');
        $data['address']                    = $this->input->post('address');
        $data['phone']                      = $this->input->post('phone');
        $data['sex']                        = $this->input->post('sex');
        $data['age']                        = $this->input->post('age');
        $data['blood_group']                = $this->input->post('blood_group');
        $data['last_donation_timestamp']    = strtotime($this->input->post('last_donation_timestamp'));

        $this->db->insert('blood_donor',$data);
    }

    function select_blood_donor_info(){
        //$this->db->order_by('name','asc');
        return $this->db->get('blood_donor')->result_array();
    }

    function update_blood_donor_info($blood_donor_id){
        $data['name']                       = $this->input->post('name');
        $data['email']                      = $this->input->post('email');
        $data['address']                    = $this->input->post('address');
        $data['phone']                      = $this->input->post('phone');
        $data['sex']                        = $this->input->post('sex');
        $data['age']                        = $this->input->post('age');
        $data['blood_group']                = $this->input->post('blood_group');
        $data['last_donation_timestamp']    = strtotime($this->input->post('last_donation_timestamp'));

        $this->db->where('blood_donor_id',$blood_donor_id);
        $this->db->update('blood_donor',$data);
    }

    function delete_blood_donor_info($blood_donor_id){
        $this->db->where('blood_donor_id',$blood_donor_id);
        $this->db->delete('blood_donor');
    }

    function save_medicine_category_info(){
        $data['name'] 		= $this->input->post('name');
        $data['description']    = $this->input->post('description');
        $this->db->insert('medicine_category',$data);
    }

    function select_medicine_category_info(){
        //$this->db->order_by('name','asc');
        return $this->db->get('medicine_category')->result_array();
    }

    function update_medicine_category_info($medicine_category_id){
        $data['name'] 		= $this->input->post('name');
        $data['description'] 	= $this->input->post('description');

        $this->db->where('medicine_category_id',$medicine_category_id);
        $this->db->update('medicine_category',$data);
    }

    function delete_medicine_category_info($medicine_category_id){
        $this->db->where('medicine_category_id',$medicine_category_id);
        $this->db->delete('medicine_category');
    }

    function save_medicine_info(){
        $data['name']                   = $this->input->post('name');
        $data['medicine_category_id']   = $this->input->post('medicine_category_id');
        $data['description']            = $this->input->post('description');
        $data['price']                  = $this->input->post('price');
        $data['manufacturing_company']  = $this->input->post('manufacturing_company');
        $data['status']                 = $this->input->post('status');

        $this->db->insert('medicine',$data);
    }

    function select_medicine_info(){
        //$this->db->order_by('name','asc');
        return $this->db->get('medicine')->result_array();
    }

    function update_medicine_info($medicine_id){
        $data['name']                   = $this->input->post('name');
        $data['medicine_category_id']   = $this->input->post('medicine_category_id');
        $data['description']            = $this->input->post('description');
        $data['price']                  = $this->input->post('price');
        $data['manufacturing_company']  = $this->input->post('manufacturing_company');
        $data['status'] 		        = $this->input->post('status');

        $this->db->where('medicine_id',$medicine_id);
        $this->db->update('medicine',$data);
    }

    function delete_medicine_info($medicine_id){
        $this->db->where('medicine_id',$medicine_id);
        $this->db->delete('medicine');
    }

    function save_appointment_info(){
        $data['timestamp']  = strtotime(str_replace('-','.',$this->input->post('date_timestamp').' '.$this->input->post('time_timestamp')));
        $data['status']     = 'approved';
        $data['patient_id'] = $this->input->post('patient_id');

        if($this->session->userdata('login_type') == 'doctor')
            $data['doctor_id']  = $this->session->userdata('login_user_id');
        else
            $data['doctor_id']  = $this->input->post('doctor_id');

        if($this->input->post('appointment_return') == 'on')
            $data['appointment_return'] = 'true';
        else
            $data['appointment_return'] = 'false';

        $this->db->insert('appointment',$data);

        #id do ultimo appointment
        $lastid_appointment = $this->db->query('SELECT appointment_id FROM appointment ORDER BY appointment_id DESC LIMIT 1');
        $rowid_appointment = $lastid_appointment->row('appointment_id');
        $data_exam['appointment_id'] = $lastid_appointment->row('appointment_id');

        $data_exam['exam_type_id'] = $this->input->post('exam_type_id');
        $exams_apps = $this->input->post('exam_type_id');
        if ($data_exam['exam_type_id'] != "" || $data_exam['exam_type_id'] != null) {
            #Adiciona o id a tabela de exames
            //$data_exam['appointment_id'] = $this->input->post('appointment_id');
            foreach ($exams_apps as $exams){
                $lastid_exam = $this->db->query('SELECT exam_id FROM exam ORDER BY exam_id DESC LIMIT 1');
                $rowid_exam = $lastid_exam->row('exam_id');

                if ($rowid_exam == null) {
                    $newid_exam=0;
                    $newid_exam++;
                    $data_exam['exam_id'] = $newid_exam;
                }
                elseif ($rowid_exam == "") {
                    $newid_exam=0;
                    $newid_exam++;
                    $data_exam['exam_id'] = $newid_exam;
                }
                else {
                    $rowid_exam++;
                    $data_exam['exam_id'] = $rowid_exam;
                }
                $data_exam['exam_type_id'] = $exams;
                $this->db->insert('exam',$data_exam);
            }
        }

        // Notify patient with sms.
        $notify = $this->input->post('notify');
        if($notify != '') {
            $patient_name   =   $this->db->get_where('patient',
                                array('patient_id' => $data['patient_id']))->row()->name;
            $doctor_name    =   $this->db->get_where('doctor',
                                array('doctor_id' => $data['doctor_id']))->row()->name;
            $date           =   date('l, d F Y', $data['timestamp']);
            $time           =   date('g:i a', $data['timestamp']);
            $message        =   $patient_name . ', you have an appointment with doctor ' . $doctor_name . ' on ' . $date . ' at ' . $time . '.';
            $receiver_phone =   $this->db->get_where('patient',
                                array('patient_id' => $data['patient_id']))->row()->phone;

            $this->sms_model->send_sms($message, $receiver_phone);
        }
    }

    function save_requested_appointment_info(){
        $data['timestamp']  = strtotime(str_replace('/','.',$this->input->post('date_timestamp').' '.$this->input->post('time_timestamp')));
        $data['doctor_id']  = $this->input->post('doctor_id');
        $data['patient_id'] = $this->session->userdata('login_user_id');
        $data['status']     = 'pending';

        $this->db->insert('appointment',$data);
    }

    function select_appointment_info_by_doctor_id(){
        $doctor_id = $this->session->userdata('login_user_id');
        return $this->db->get_where('appointment', array('doctor_id' => $doctor_id, 'status' => 'approved'))->result_array();
    }

    function select_appointment_info_by_patient_id(){
        $patient_id = $this->session->userdata('login_user_id');
        return $this->db->get_where('appointment', array('patient_id' => $patient_id, 'status' => 'approved'))->result_array();
    }

    function select_appointment_info($doctor_id = '',$start_timestamp = '',$end_timestamp = ''){
        $response = array();
        if($doctor_id == 'all') {
            /*$this->db->order_by('timestamp', 'asc');
            $appointments = $this->db->get_where('appointment', array('status' => 'approved'))->result_array();*/

            $this->db->select('appointment.appointment_id, appointment.timestamp, doctor.doctor_id, doctor.name as doctor_name, patient.patient_id, patient.name as patient_name, appointment.appointment_return, exam.exam_id,appointment.receipt_doctor_id');
            $this->db->from('appointment');
            $this->db->join('doctor','appointment.doctor_id=doctor.doctor_id');
            $this->db->join('patient','appointment.patient_id=patient.patient_id');
            $this->db->join('exam','appointment.appointment_id=exam.appointment_id','left');
            $this->db->order_by('appointment.appointment_id','asc');
            $query = $this->db->get();
            $appointments = $query->result_array();

            foreach ($appointments as $row) {
                if($row['timestamp'] >= $start_timestamp && $row['timestamp'] <= $end_timestamp)
                    array_push ($response, $row);
            }
        }
        else {
            //$this->db->order_by('timestamp', 'asc');
            //$appointments = $this->db->get_where('appointment', array('doctor_id' => $doctor_id, 'status' => 'approved'))->result_array();

            $this->db->select('appointment.appointment_id, appointment.timestamp, doctor.doctor_id, doctor.name as doctor_name, patient.patient_id, patient.name as patient_name, appointment.appointment_return, exam.exam_id,appointment.receipt_doctor_id');
            $this->db->from('appointment');
            $this->db->join('doctor','appointment.doctor_id=doctor.doctor_id');
            $this->db->join('patient','appointment.patient_id=patient.patient_id');
            $this->db->join('exam','appointment.appointment_id=exam.appointment_id','left');
            $this->db->where('appointment.doctor_id',$doctor_id);
            $this->db->order_by('appointment.appointment_id','asc');
            $query = $this->db->get();
            $appointments = $query->result_array();

            foreach ($appointments as $row) {
                if($row['timestamp'] >= $start_timestamp && $row['timestamp'] <= $end_timestamp)
                    array_push ($response, $row);
            }
        }
        return $response;
    }

    function select_receipt_patient_info($patient_id = '', $start_timestamp = '', $end_timestamp = ''){
        $response = array();
        if($patient_id == 'all') {
            $this->db->order_by('timestamp', 'asc');
            $appointments = $this->db->get_where('appointment', array('status' => 'approved'))->result_array();
            foreach ($appointments as $row) {
                if($row['timestamp'] >= $start_timestamp && $row['timestamp'] <= $end_timestamp)
                    array_push ($response, $row);
            }
        }
        else {
            $this->db->order_by('timestamp', 'asc');
            $appointments = $this->db->get_where('appointment', array('patient_id' => $patient_id, 'status' => 'approved'))->result_array();
            foreach ($appointments as $row) {
                if($row['timestamp'] >= $start_timestamp && $row['timestamp'] <= $end_timestamp)
                    array_push ($response, $row);
            }
        }
        return $response;
    }

    function save_receipt_patient_info(){
        $data['timestamp']          = strtotime($this->input->post('receipt_timestamp'));
        $data['appointment_id']     = $this->input->post('appointment_id');
        $data['payment_type']       = $this->input->post('payment_type');
        $data['payment_installment']= $this->input->post('payment_installment');

        $this->db->insert('receipt_patient',$data);
    }

    function select_receipt_doctor_info(){
        /*$this->db->select('receipt_doctor.timestamp,receipt_doctor.receipt_doctor_id,doctor.name as doctor_name,receipt_doctor.amount');
        $this->db->from('receipt_doctor');
        $this->db->join('appointment','receipt_doctor.receipt_doctor_id=appointment.receipt_doctor_id');
        $this->db->join('doctor','appointment.doctor_id = doctor.doctor_id');
        $this->db->group_by('receipt_doctor.receipt_doctor_id, doctor.name');
        $this->db->order_by('receipt_doctor.timestamp');
        $query = $this->db->get();

        $this->db->select('receipt_doctor.receipt_doctor_id,receipt_doctor.timestamp as receipt_doctor_timestamp,receipt_doctor.amount as receipt_amount,receipt_exam_doctor.receipt_exam_doctor_id,receipt_exam_doctor.timestamp as receipt_exam_doctor_timestamp,receipt_exam_doctor.amount as receipt_exam_amount');
        $this->db->from('receipt_doctor');
        $this->db->join('receipt_exam_doctor','receipt_doctor.timestamp=receipt_exam_doctor.timestamp','left');
        $this->db->order_by('receipt_doctor.timestamp');
        $query = $this->db->get();*/

        $this->db->select('dc.name as doctor_name,rd.receipt_doctor_id,rd.timestamp as receipt_doctor_timestamp, rd.amount as receipt_amount,red.receipt_exam_doctor_id,red.timestamp as receipt_exam_doctor_timestamp,red.amount as receipt_exam_amount');
        $this->db->from('receipt_doctor rd');
        $this->db->join('receipt_exam_doctor red','rd.timestamp=red.timestamp','LEFT');
        $this->db->join('appointment app','rd.receipt_doctor_id=app.receipt_doctor_id');
        $this->db->join('doctor dc','app.doctor_id=dc.doctor_id');
        $this->db->group_by('rd.timestamp');
        $this->db->order_by('rd.timestamp');
        $query = $this->db->get();

        return $query->result_array();
    }

    /*function select_receipt_exam_doctor_info(){
        $this->db->select('receipt_exam_doctor.receipt_exam_doctor_id, receipt_exam_doctor.timestamp,doctor.name as doctor_name, receipt_exam_doctor.amount, receipt_exam_doctor.amount_third');
        $this->db->from('receipt_exam_doctor');
        $this->db->join('exam','exam.receipt_exam_doctor_id=receipt_exam_doctor.receipt_exam_doctor_id');
        $this->db->join('appointment','false');
        $this->db->join('doctor','appointment.doctor_id=doctor.doctor_id');
        $this->db->group_by('receipt_exam_doctor_id');
        $this->db->order_by('timestamp');
        $query = $this->db->get();
        return $query->result_array();
    }*/

    function save_receipt_doctor_info(){
        $data_receipt_array = unserialize(base64_decode($this->input->post('appointments_infos')));
        $data_receipt['timestamp']  = strtotime($this->input->post('receipt_timestamp'));
        $data_receipt_exam['timestamp']  = strtotime($this->input->post('receipt_timestamp'));

        #Adiciona o id do recibo do medico
        $lastid = $this->db->query('SELECT receipt_doctor_id FROM receipt_doctor ORDER BY receipt_doctor_id DESC LIMIT 1');
        $rowid = $lastid->row('receipt_doctor_id');

        if ($rowid == null) {
            $newid_receipt=0;
            $newid_receipt++;
            $data_receipt['receipt_doctor_id'] = $newid_receipt;
        }
        elseif ($rowid == "") {
            $newid_receipt=0;
            $newid_receipt++;
            $data_receipt['receipt_doctor_id'] = $newid_receipt;
        }
        else {
            $rowid++;
            $data_receipt['receipt_doctor_id'] = $rowid;
        }

        #Adiciona o id do recibo de exames do medico
        $lastid2 = $this->db->query('SELECT receipt_exam_doctor_id FROM receipt_exam_doctor ORDER BY receipt_exam_doctor_id DESC LIMIT 1');
        $rowid2 = $lastid2->row('receipt_exam_doctor_id');

        if ($rowid2 == null) {
            $newid_receipt2=0;
            $newid_receipt2++;
            $data_receipt_exam['receipt_exam_doctor_id'] = $newid_receipt2;
        }
        elseif ($rowid2 == "") {
            $newid_receipt2=0;
            $newid_receipt2++;
            $data_receipt_exam['receipt_exam_doctor_id'] = $newid_receipt2;
        }
        else {
            $rowid2++;
            $data_receipt_exam['receipt_exam_doctor_id'] = $rowid2;
        }

        #Inserir na tabela appointment, coluna receipt_doctor_id o id do recibo do médico
        foreach ($data_receipt_array as $single_appointment_info) {
            $data['appointment_id'] = $single_appointment_info['appointment_id'];
            $data['receipt_doctor_id'] = $data_receipt['receipt_doctor_id'];
            $this->db->set('receipt_doctor_id', $data_receipt['receipt_doctor_id']);
            $this->db->where('appointment_id',$data['appointment_id']);
            $this->db->update('appointment');
            #Inserir na tabela exam, coluna receipt_exam_doctor_id o id do recibo de exame do médico
            $exams_info = $this->db->get_where('exam', array('appointment_id' => $single_appointment_info['appointment_id']))->result_array();
            if ($exams_info =! null) {
                $exams_info = $this->db->get_where('exam', array('appointment_id' => $single_appointment_info['appointment_id']))->result_array();
                foreach ($exams_info as $single_exam_info) {
                    $data['exam_id'] = $single_exam_info['exam_id'];
                    $this->db->set('receipt_exam_doctor_id', $data_receipt_exam['receipt_exam_doctor_id']);
                    $this->db->where('exam_id',$data['exam_id']);
                    $this->db->update('exam');
                }
            }
        }

        #Exibe a quantidade de consultas do recibo do médico, soma total das consultas, e informa valor do honorário do médico
        $sql_query1 =    "SELECT
                        COUNT(appointment.appointment_id) as appointments_quantity,
                        department.cost as cost_per_appointment,
                        ROUND(SUM(department.cost),2) as total_cost,
                        doctor.name as doctor_name,
                        ROUND(doctor.honorary,2) as honorary,
                        ROUND((SUM(department.cost) * doctor.honorary / 100),2) as total_honorary
                        FROM appointment
                        JOIN doctor
                        ON appointment.doctor_id=doctor.doctor_id
                        JOIN department
                        ON doctor.department_id=department.department_id
                        WHERE appointment.appointment_return='false'
                        AND appointment.receipt_doctor_id=".$data_receipt['receipt_doctor_id']."
                        GROUP BY appointment.doctor_id";

        $total_amount_receipt = $this->db->query($sql_query1);

        #valor total das consultas
        $data_receipt['amount'] = $total_amount_receipt->row('total_cost');
        #valor total do honorario das consultas
        $data_receipt['amount_honorary'] = $total_amount_receipt->row('total_honorary');
        #insere na tabela de recibo de consultas do medico os dados
        $this->db->insert('receipt_doctor',$data_receipt);

        $exam_id_column = array_column($data_receipt_array, 'exam_id');
        $search_exam_id = array('exam_id' => null);
        $result_diff_examid = array_diff($exam_id_column, $search_exam_id);

        if (!empty($result_diff_examid)) {
            #Exibe os exames do recibo do médico e faz o calculo do honorario por exame
            $sql_query2 =   "SELECT
                            exam.exam_id, exam.receipt_exam_doctor_id, exam.appointment_id,
                            doctor.name as doctor_name,
                            exam_type.value as exam_value, exam_type.third_percent, ROUND(exam_type.value * exam_type.third_percent / 100,2) as total_third
                            FROM exam
                            JOIN exam_type
                            ON exam.exam_type_id=exam_type.exam_type_id
                            JOIN appointment
                            ON appointment.appointment_id=exam.appointment_id
                            JOIN doctor
                            ON appointment.doctor_id=doctor.doctor_id
                            WHERE exam.receipt_exam_doctor_id=".$data_receipt_exam['receipt_exam_doctor_id'];
            $exams_amounts = $this->db->query($sql_query2)->result_array();

            #Inserir na tabela exam, coluna total_third o valor do honorario do exame para terceiros
            foreach ($exams_amounts as $single_exam_info2) {
                $data_exams_amounts['exam_id'] = $single_exam_info2['exam_id'];
                $data_exams_amounts['total_third'] = $single_exam_info2['total_third'];
                $this->db->set('total_third',$data_exams_amounts['total_third']);
                $this->db->where('exam_id',$data_exams_amounts['exam_id']);
                $this->db->update('exam');
            }

            #valor total do honorario de terceiros (somado depois de calucular o porcento por exame)
            $sql_query3 =   "SELECT
                            exam.receipt_exam_doctor_id,
                            ROUND(SUM(exam_type.value),2) as total_receipt,
                            ROUND(SUM(exam.total_third),2) as total_third_receipt
                            FROM exam
                            JOIN exam_type
                            ON exam.exam_type_id=exam_type.exam_type_id
                            WHERE receipt_exam_doctor_id=".$data_receipt_exam['receipt_exam_doctor_id'];
            $receipt_exam_total_third = $this->db->query($sql_query3);

            #valor total dos exames
            $data_receipt_exam['amount'] = $receipt_exam_total_third->row('total_receipt');

            #valor total do honorario de terceiros dos exames
            $data_receipt_exam['amount_third'] = $receipt_exam_total_third->row('total_third_receipt');

            $this->db->insert('receipt_exam_doctor',$data_receipt_exam);
        }

        return $data_receipt['receipt_doctor_id'];
    }

    function select_pending_appointment_info_by_patient_id(){
        $patient_id = $this->session->userdata('login_user_id');
        return $this->db->get_where('appointment', array('patient_id' => $patient_id, 'status' => 'pending'))->result_array();
    }

    function select_requested_appointment_info_by_doctor_id(){
        $doctor_id = $this->session->userdata('login_user_id');
        return $this->db->get_where('appointment', array('doctor_id' => $doctor_id, 'status' => 'pending'))->result_array();
    }

    function select_requested_appointment_info(){
        $this->db->order_by('doctor_id', 'asc');
        return $this->db->get_where('appointment', array('status' => 'pending'))->result_array();
    }

    function select_patient_info_by_doctor_id(){
        $doctor_id = $this->session->userdata('login_user_id');

        $this->db->group_by('patient_id');
        return $this->db->get_where('appointment', array('doctor_id' => $doctor_id, 'status' => 'approved'))->result_array();
    }

    function select_appointments_between_loggedin_patient_and_doctor(){
        $patient_id = $this->session->userdata('login_user_id');

        $this->db->group_by('doctor_id');
        return $this->db->get_where('appointment', array('patient_id' => $patient_id, 'status' => 'approved'))->result_array();
    }

    function update_appointment_info($appointment_id){
        $data['timestamp'] = strtotime($this->input->post('date_timestamp').' '.$this->input->post('time_timestamp'));
        $data['doctor_id'] = $this->input->post('doctor_id');
        $data['patient_id'] = $this->input->post('patient_id');

        $data_exam['exam_id'] = $this->input->post('exam_id');
        $data_exam['exam_type_id'] = $this->input->post('exam_type_id');
        $data_exam['appointment_id'] = $appointment_id;

        if ($this->input->post('appointment_return') == 'on') {
            $data['appointment_return'] = 'true';
        }
        else {
            $data['appointment_return'] = 'false';
        }

        $this->db->where('appointment_id',$appointment_id);
        $this->db->update('appointment',$data);

        $exam_info = $this->db->get_where('exam', array('appointment_id' => $appointment_id))->result_array();

        foreach ($data_exam as $exam_post_info) {
            foreach ($exam_info as $exam_db_info) {
                if ($exam_post_info['appointment_id'] = $exam_db_info['appointment_id'] && $exam_post_info['exam_type_id'] = "") {
                    $exam_post_info['exam_type_id'] = null;
                    /*$this->db->where('appointment_id',$exam_post_info['appointment_id']);
                    $this->db->delete('exam');*/
                } elseif ($exam_post_info['appointment_id'] == $exam_db_info['appointment_id'] && $exam_post_info['exam_type_id'] != $exam_db_info['exam_type_id']) {
                    $this->db->where('appointment_id',$exam_post_info['appointment_id']);
                    $this->db->update('exam',$exam_post_info);
                } else {
                    #Adiciona o id a tabela de exames
                    $lastid_exam = $this->db->query('SELECT exam_id FROM exam ORDER BY exam_id DESC LIMIT 1');
                    $rowid_exam = $lastid_exam->row('exam_id');

                    if ($rowid_exam == null) {
                        $newid_exam=0;
                        $newid_exam++;
                        $data_exam['exam_id'] = $newid_exam;
                    } elseif ($rowid_exam == "") {
                        $newid_exam=0;
                        $newid_exam++;
                        $data_exam['exam_id'] = $newid_exam;
                    } else {
                        $rowid_exam++;
                        $data_exam['exam_id'] = $rowid_exam;
                    }
                }
            }
        }

        $this->db->where('appointment_id',$exam_post_info['appointment_id']);
        $this->db->update('exam',$exam_post_info);

        // Notify patient with sms.
        $notify = $this->input->post('notify');
        if($notify != '') {
            $doctor_id      =   $this->session->userdata('login_user_id');
            $patient_name   =   $this->db->get_where('patient', array('patient_id' => $data['patient_id']))->row()->name;
            $doctor_name    =   $this->db->get_where('doctor', array('doctor_id' => $doctor_id))->row()->name;
            $date           =   date('l, d F Y', $data['timestamp']);
            $time           =   date('g:i a', $data['timestamp']);
            $message        =   $patient_name . ', your appointment with doctor ' . $doctor_name . ' has been updated to ' . $date . ' at ' . $time . '.';
            $receiver_phone =   $this->db->get_where('patient', array('patient_id' => $data['patient_id']))->row()->phone;

            $this->sms_model->send_sms($message, $receiver_phone);
        }
    }

    function approve_appointment_info($appointment_id){
        $data['timestamp']  = strtotime($this->input->post('date_timestamp').' '.$this->input->post('time_timestamp'));
        $data['status']     = 'approved';

        if($this->session->userdata('login_type') == 'receptionist')
            $data['doctor_id'] = $this->input->post('doctor_id');

        $this->db->where('appointment_id',$appointment_id);
        $this->db->update('appointment',$data);

        // Notify patient with sms.
        $notify = $this->input->post('notify');
        if($notify != '') {
            $doctor_id      =   $this->db->get_where('appointment',
                                array('appointment_id' => $appointment_id))->row()->doctor_id;
            $patient_id     =   $this->db->get_where('appointment',
                                array('appointment_id' => $appointment_id))->row()->patient_id;
            $patient_name   =   $this->db->get_where('patient',
                                array('patient_id' => $patient_id))->row()->name;
            $doctor_name    =   $this->db->get_where('doctor',
                                array('doctor_id' => $doctor_id))->row()->name;
            $date           =   date('l, d F Y', $data['timestamp']);
            $time           =   date('g:i a', $data['timestamp']);
            $message        =   $patient_name . ', your requested appointment with doctor ' . $doctor_name . ' on ' . $date . ' at ' . $time . ' has been approved.';
            $receiver_phone =   $this->db->get_where('patient',
                                array('patient_id' => $patient_id))->row()->phone;

            $this->sms_model->send_sms($message, $receiver_phone);
        }
    }

    function delete_appointment_info($appointment_id){
        $this->db->where('appointment_id',$appointment_id);
        $this->db->delete('appointment');
    }

    function save_prescription_info(){
        $data['timestamp']      = strtotime($this->input->post('date_timestamp').' '.$this->input->post('time_timestamp'));
        $data['patient_id']     = $this->input->post('patient_id');
        $data['case_history']   = $this->input->post('case_history');
        $data['medication']     = $this->input->post('medication');
        $data['note']           = $this->input->post('note');
        $data['doctor_id']      = $this->session->userdata('login_user_id');

        $this->db->insert('prescription',$data);
    }

    function select_prescription_info_by_doctor_id(){
        $doctor_id = $this->session->userdata('login_user_id');
        return $this->db->get_where('prescription', array('doctor_id' => $doctor_id))->result_array();
    }

    function select_medication_history($patient_id = ''){
        //teste
        return $this->db->get_where('prescription', array('patient_id' => $patient_id))->result_array();
    }

    function select_prescription_info_by_patient_id(){
        $patient_id = $this->session->userdata('login_user_id');
        return $this->db->get_where('prescription', array('patient_id' => $patient_id))->result_array();
    }

    function update_prescription_info($prescription_id){
        $data['timestamp']      = strtotime($this->input->post('date_timestamp').' '.$this->input->post('time_timestamp') );
        $data['patient_id']     = $this->input->post('patient_id');
        $data['case_history']   = $this->input->post('case_history');
        $data['medication']     = $this->input->post('medication');
        $data['note']           = $this->input->post('note');
        $data['doctor_id']      = $this->session->userdata('login_user_id');

        $this->db->where('prescription_id',$prescription_id);
        $this->db->update('prescription',$data);
    }

    function delete_prescription_info($prescription_id){
        $this->db->where('prescription_id',$prescription_id);
        $this->db->delete('prescription');
    }

    function save_diagnosis_report_info(){
        $data['timestamp']          = strtotime($this->input->post('date_timestamp').' '.$this->input->post('time_timestamp') );
        $data['report_type']        = $this->input->post('report_type');
        $data['file_name']          = $_FILES["file_name"]["name"];
        $data['document_type']      = $this->input->post('document_type');
        $data['description']        = $this->input->post('description');
        $data['prescription_id']    = $this->input->post('prescription_id');

        $this->db->insert('diagnosis_report',$data);

        $diagnosis_report_id        = $this->db->insert_id();
        move_uploaded_file($_FILES["file_name"]["tmp_name"], "uploads/diagnosis_report/" . $_FILES["file_name"]["name"]);
    }

    function select_diagnosis_report_info(){
        //$this->db->order_by('name','asc');
        return $this->db->get('diagnosis_report')->result_array();
    }

    function delete_diagnosis_report_info($diagnosis_report_id){
        $this->db->where('diagnosis_report_id',$diagnosis_report_id);
        $this->db->delete('diagnosis_report');
    }

    function save_notice_info(){
        $data['title']              = $this->input->post('title');
        $data['description']        = $this->input->post('description');
        if($this->input->post('start_timestamp') != '')
            $data['start_timestamp']    = strtotime($this->input->post('start_timestamp'));
        else
            $data['start_timestamp']    = strtotime('today');
        if($this->input->post('end_timestamp') != '')
            $data['end_timestamp']      = strtotime($this->input->post('end_timestamp'));
        else
            $data['end_timestamp']      = $data['start_timestamp'];

        $this->db->insert('notice',$data);
    }

    function select_notice_info(){
        $this->db->order_by('start_timestamp','asc');
        return $this->db->get('notice')->result_array();
    }

    function update_notice_info($notice_id){
        $data['title']              = $this->input->post('title');
        $data['description']        = $this->input->post('description');
        //if($this->input->post('start_timestamp') != $data['start_timestamp'])
            $data['start_timestamp'] = strtotime($this->input->post('start_timestamp'));
        //if($this->input->post('end_timestamp') != $data['end_timestamp'])
            $data['end_timestamp'] = strtotime($this->input->post('end_timestamp'));

        //var_dump($data);
        $this->db->where('notice_id',$notice_id);
        $this->db->update('notice',$data);
    }

    function delete_notice_info($notice_id){
        $this->db->where('notice_id',$notice_id);
        $this->db->delete('notice');
    }

    ////////private message//////
    function send_new_private_message(){
        $message    = $this->input->post('message');
        $timestamp  = strtotime(date("Y-m-d H:i:s"));

        $reciever   = $this->input->post('reciever');
        $sender     = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');

        //check if the thread between those 2 users exists, if not create new thread
        $num1 = $this->db->get_where('message_thread', array('sender' => $sender, 'reciever' => $reciever))->num_rows();
        $num2 = $this->db->get_where('message_thread', array('sender' => $reciever, 'reciever' => $sender))->num_rows();

        if ($num1 == 0 && $num2 == 0) {
            $message_thread_code                        = substr(md5(rand(100000000, 20000000000)), 0, 15);
            $data_message_thread['message_thread_code'] = $message_thread_code;
            $data_message_thread['sender']              = $sender;
            $data_message_thread['reciever']            = $reciever;
            $this->db->insert('message_thread', $data_message_thread);
        }
        if ($num1 > 0)
            $message_thread_code = $this->db->get_where('message_thread', array('sender' => $sender, 'reciever' => $reciever))->row()->message_thread_code;
        if ($num2 > 0)
            $message_thread_code = $this->db->get_where('message_thread', array('sender' => $reciever, 'reciever' => $sender))->row()->message_thread_code;

        $data_message['message_thread_code']    = $message_thread_code;
        $data_message['message']                = $message;
        $data_message['sender']                 = $sender;
        $data_message['timestamp']              = $timestamp;
        $this->db->insert('message', $data_message);

        return $message_thread_code;
    }

    function send_reply_message($message_thread_code){
        $message    = $this->input->post('message');
        $timestamp  = strtotime(date("Y-m-d H:i:s"));
        $sender     = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');

        $data_message['message_thread_code']    = $message_thread_code;
        $data_message['message']                = $message;
        $data_message['sender']                 = $sender;
        $data_message['timestamp']              = $timestamp;
        $this->db->insert('message', $data_message);
    }

    function mark_thread_messages_read($message_thread_code){
        // mark read only the oponnent messages of this thread, not currently logged in user's sent messages
        $current_user = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');
        $this->db->where('sender !=', $current_user);
        $this->db->where('message_thread_code', $message_thread_code);
        $this->db->update('message', array('read_status' => 1));
    }

    function count_unread_message_of_thread($message_thread_code){
        $unread_message_counter = 0;
        $current_user = $this->session->userdata('login_type') . '-' . $this->session->userdata('login_user_id');
        $messages = $this->db->get_where('message', array('message_thread_code' => $message_thread_code))->result_array();
        foreach ($messages as $row) {
            if ($row['sender'] != $current_user && $row['read_status'] == '0')
                $unread_message_counter++;
        }
        return $unread_message_counter;
    }
}

?>