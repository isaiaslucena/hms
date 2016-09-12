<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Receptionist extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    function index()
    {
        if ($this->session->userdata('receptionist_login') != 1)
        {
            $this->session->set_userdata('last_page' , base_url('?receptionist'));
            redirect(base_url(), 'refresh');
        }

        $data['page_name']      = 'dashboard';
        $data['page_title']     = get_phrase('receptionist_dashboard');
        $this->load->view('backend/index', $data);
    }

    function patient($task = "", $patient_id = "")
    {
        if ($this->session->userdata('receptionist_login') != 1)
        {
            $this->session->set_userdata('last_page' , current_url());
            redirect(base_url(), 'refresh');
        }

        if ($task == "create")
        {
            $this->crud_model->save_patient_info();
            $this->session->set_flashdata('message' , get_phrase('patient_info_saved_successfuly'));
            redirect('index.php?receptionist/patient');
        }

        if ($task == "update")
        {
            $this->crud_model->update_patient_info($patient_id);
            $this->session->set_flashdata('message' , get_phrase('patient_info_updated_successfuly'));
            redirect('index.php?receptionist/patient');
        }

        if ($task == "delete")
        {
            $this->crud_model->delete_patient_info($patient_id);
            redirect('index.php?receptionist/patient');
        }

        $data['patient_info']   = $this->crud_model->select_patient_info();
        $data['page_name']      = 'manage_patient';
        $data['page_title']     = get_phrase('patient');
        $this->load->view('backend/index', $data);
    }

    function appointment($task = "", $doctor_id = 'all', $start_timestamp = "", $end_timestamp = "")
    {
        if ($this->session->userdata('receptionist_login') != 1)
        {
            $this->session->set_userdata('last_page' , base_url('?receptionist/appointment'));
            redirect(base_url(), 'refresh');
        }

        if ($task == 'filter')
        {
            $doctor_id          = $this->input->post('doctor_id');
            $start_timestamp    = strtotime($this->input->post('start_timestamp').' 00:00');
            $end_timestamp      = strtotime($this->input->post('end_timestamp'). ' 23:59');
            redirect('index.php?receptionist/appointment/search/'.$doctor_id.'/'.$start_timestamp.'/'.$end_timestamp);
        }

        if ($task == "create")
        {
            $this->crud_model->save_appointment_info();
            $this->session->set_flashdata('message' , get_phrase('appointment_info_saved_successfuly'));
            redirect('index.php?receptionist/appointment');
        }

        $data['doctor_id'] = $doctor_id;

        if($start_timestamp == '')
            $data['start_timestamp']    = strtotime(date('d-m-Y 00:00'));
        else
            $data['start_timestamp']    = $start_timestamp;

        if($end_timestamp == '')
            $data['end_timestamp']      = strtotime(date('d-m-Y 23:59'));
        else
            $data['end_timestamp']      = $end_timestamp;

        $data['appointment_info']   = $this->crud_model->select_appointment_info($doctor_id,$data['start_timestamp'],$data['end_timestamp']);
        $data['page_name']          = 'show_appointment';
        $data['page_title']         = get_phrase('appointment');
        $this->load->view('backend/index', $data);
    }

    function appointment_management($task = "", $appointment_id = "")
    {
        if ($this->session->userdata('receptionist_login') != 1)
        {
            $this->session->set_userdata('last_page' , base_url('?receptionist/appointment'));
            redirect(base_url(), 'refresh');
        }

        if ($task == "update")
        {
            $this->crud_model->update_appointment_info($appointment_id);
            $this->session->set_flashdata('message' , get_phrase('appointment_info_updated_successfuly'));
            redirect('index.php?receptionist/appointment');
        }

        if ($task == "delete")
        {
            $this->crud_model->delete_appointment_info($appointment_id);
            $this->session->set_flashdata('message' , get_phrase('appointment_deleted_successfully'));
            redirect('index.php?receptionist/appointment');
        }

        $data['appointment_info']   = $this->crud_model->select_appointment_info();
        $data['page_name']          = 'show_appointment';
        $data['page_title']         = get_phrase('appointment');
        $this->load->view('backend/index', $data);
    }

    function receipt_patient_add($task = "", $timestamp = "")
    {

        if ($this->session->userdata('receptionist_login') != 1)
        {
            $this->session->set_userdata('last_page' , base_url('?receptionist/receipt_patient_manage'));
            redirect(base_url(), 'refresh');
        }

        if ($task == "create")
        {
            $this->crud_model->save_receipt_patient_info();
            $this->session->set_flashdata('message' , get_phrase('receipt_info_saved_successfuly'));
            redirect('index.php?receptionist/appointment');
        }

        $data['appointment_info']   = $this->crud_model->select_appointment_info($doctor_id, $data['start_timestamp'], $data['end_timestamp']);
        $data['page_name']          = 'show_appointment';
        $data['page_title']         = get_phrase('appointment');
        $this->load->view('backend/index', $data);
    }

    function receipt_patient_manage($task = "", $patient_id = 'all', $start_timestamp = "", $end_timestamp = "")
    {
        if ($this->session->userdata('receptionist_login') != 1)
        {
            $this->session->set_userdata('last_page' , base_url('?receptionist/receipt_doctor_manage'));
            redirect(base_url(), 'refresh');
        }

        if ($task == 'filter')
        {
            $patient_id         = $this->input->post('patient_id');
            $start_timestamp    = strtotime($this->input->post('start_timestamp'));
            $end_timestamp      = strtotime($this->input->post('end_timestamp'));
            redirect('index.php?receptionist/receipt_patient_manage/search/' . $patient_id . '/' . $start_timestamp . '/' . $end_timestamp);
        }

        if ($task == "update")
        {
            $this->crud_model->update_receipt_patient($invoice_id);
            $this->session->set_flashdata('message' , get_phrase('receipt_info_updated_successfuly'));
            redirect('index.php?receptionist/show_receipt_patient');
        }

        if ($task == "delete")
        {
            $this->crud_model->delete_invoice($invoice_id);
            redirect('index.php?receptionist/show_receipt_patient');
        }

        $data['patient_id'] = $patient_id;
        if($start_timestamp == '')
            $data['start_timestamp']    = strtotime('today');
        else
            $data['start_timestamp']    = $start_timestamp;
        if($end_timestamp == '')
            $data['end_timestamp']      = strtotime('today');
        else
            $data['end_timestamp']      = $end_timestamp;


        $data['receipt_patient_info']   = $this->crud_model->select_receipt_patient_info($patient_id, $data['start_timestamp'], $data['end_timestamp']);
        $data['page_name']      = 'show_receipt_patient';
        $data['page_title']     = get_phrase('receipt');
        $this->load->view('backend/index', $data);
    }

    function receipt_doctor_add($task = "", $timestamp = "")
    {
        if ($this->session->userdata('receptionist_login') != 1)
        {
            $this->session->set_userdata('last_page' , base_url('?receptionist/receipt_doctor_manage'));
            redirect(base_url(), 'refresh');
        }

        if ($task == "create")
        {
            $this->crud_model->save_receipt_doctor_info();
            $this->session->set_flashdata('message' , get_phrase('receipt_info_saved_successfuly'));
            redirect('index.php?receptionist/receipt_doctor_manage');

        }

        $data['page_name']      = 'add_receipt_doctor';
        $data['page_title']     = get_phrase('receipt');
        $this->load->view('backend/index', $data);
    }

    function receipt_doctor_manage($task = "", $receipt_doctor_id = "")
    {
        if ($this->session->userdata('receptionist_login') != 1)
        {
            $this->session->set_userdata('last_page' , base_url('?receptionist/receipt_doctor_manage'));
            redirect(base_url(), 'refresh');
        }

        if ($task == "update")
        {
            $this->crud_model->update_receipt_doctor($receipt_doctor_id);
            $this->session->set_flashdata('message' , get_phrase('receipt_info_updated_successfuly'));
            redirect('index.php?receptionist/receipt_doctor_manage');
        }

        if ($task == "delete")
        {
            $this->crud_model->delete_receipt_doctor($receipt_doctor_id);
            redirect('index.php?receptionist/receipt_doctor_manage');
        }

        $data['receipt_doctor_info']   = $this->crud_model->select_receipt_doctor_info();
        //$data['receipt_exam_doctor_info'] = $this->crud_model->select_receipt_exam_doctor_info();
        $data['page_name']      = 'manage_receipt_doctor';
        $data['page_title']     = get_phrase('receipt');
        $this->load->view('backend/index', $data);
    }

    function invoice_add($task = "")
    {
        if ($this->session->userdata('receptionist_login') != 1)
        {
            $this->session->set_userdata('last_page' , base_url('?receptionist/invoice_manage'));
            redirect(base_url(), 'refresh');
        }

        if ($task == "create")
        {
            $this->crud_model->create_invoice();
            $this->session->set_flashdata('message' , get_phrase('invoice_info_saved_successfuly'));
            redirect('index.php?receptionist/invoice_add');
        }

        $data['page_name']      = 'add_invoice';
        $data['page_title']     = get_phrase('invoice');
        $this->load->view('backend/index', $data);
    }

    function invoice_manage($task = "", $invoice_id = "")
    {
        if ($this->session->userdata('receptionist_login') != 1)
        {
            $this->session->set_userdata('last_page' , base_url('?receptionist/invoice_manage'));
            redirect(base_url(), 'refresh');
        }

        if ($task == "update")
        {
            $this->crud_model->update_invoice($invoice_id);
            $this->session->set_flashdata('message' , get_phrase('invoice_info_updated_successfuly'));
            redirect('index.php?receptionist/invoice_manage');
        }

        if ($task == "delete")
        {
            $this->crud_model->delete_invoice($invoice_id);
            redirect('index.php?receptionist/invoice_manage');
        }

        $data['invoice_info']   = $this->crud_model->select_invoice_info();
        $data['page_name']      = 'manage_invoice';
        $data['page_title']     = get_phrase('invoice');
        $this->load->view('backend/index', $data);
    }

    function notice($task = "", $notice_id = "")
    {
        if ($this->session->userdata('receptionist_login') != 1) {
            $this->session->set_userdata('last_page' , base_url('?receptionist/notice'));
            redirect(base_url(), 'refresh');
        }

        if ($task == "create") {
            $this->crud_model->save_notice_info();
            $this->session->set_flashdata('message', get_phrase('notice_info_saved_successfuly'));
            redirect('index.php?receptionist/notice');
        }

        if ($task == "update") {
            $this->crud_model->update_notice_info($notice_id);
            $this->session->set_flashdata('message', get_phrase('notice_info_updated_successfuly'));
            redirect('index.php?receptionist/notice');
        }

        if ($task == "delete") {
            $this->crud_model->delete_notice_info($notice_id);
            redirect('index.php?receptionist/notice');
        }

        $data['notice_info'] = $this->crud_model->select_notice_info();
        $data['page_name'] = 'manage_notice';
        $data['page_title'] = get_phrase('noticeboard');
        $this->load->view('backend/index', $data);
    }

    function profile($task = "")
    {
        if ($this->session->userdata('receptionist_login') != 1)
        {
            $this->session->set_userdata('last_page' , base_url('?receptionist/profile'));
            redirect(base_url(), 'refresh');
        }

        $receptionist_id      = $this->session->userdata('login_user_id');
        if ($task == "update")
        {
            $this->crud_model->update_receptionist_info($receptionist_id);
            $this->session->set_flashdata('message' , get_phrase('profile_info_updated_successfuly'));
            redirect('index.php?receptionist/profile');
        }

        if ($task == "change_password")
        {
            $password               = $this->db->get_where('receptionist', array('receptionist_id' => $receptionist_id))->row()->password;
            $old_password           = sha1($this->input->post('old_password'));
            $new_password           = $this->input->post('new_password');
            $confirm_new_password   = $this->input->post('confirm_new_password');

            if($password==$old_password && $new_password==$confirm_new_password)
            {
                $data['password'] = sha1($new_password);

                $this->db->where('receptionist_id',$receptionist_id);
                $this->db->update('receptionist',$data);

                $this->session->set_flashdata('message' , get_phrase('password_info_updated_successfuly'));
                redirect('index.php?receptionist/profile');
            }
            else
            {
                $this->session->set_flashdata('message' , get_phrase('password_update_failed'));
                redirect('index.php?receptionist/profile');
            }
        }

        $data['page_name']      = 'edit_profile';
        $data['page_title']     = get_phrase('profile');
        $this->load->view('backend/index', $data);
    }
}