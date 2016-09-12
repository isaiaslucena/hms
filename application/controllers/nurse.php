<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

class Nurse extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    
    function index() 
    {
        if ($this->session->userdata('nurse_login') != 1)
        {
            $this->session->set_userdata('last_page' , current_url());
            redirect(base_url(), 'refresh');
        }
        
        $data['page_name']      = 'dashboard';
        $data['page_title']     = get_phrase('nurse_dashboard');
        $this->load->view('backend/index', $data);
    }
    
    function patient($task = "", $patient_id = "")
    {
        if ($this->session->userdata('nurse_login') != 1)
        {
            $this->session->set_userdata('last_page' , current_url());
            redirect(base_url(), 'refresh');
        }
        
        if ($task == "create")
        {
            $this->crud_model->save_patient_info();
            $this->session->set_flashdata('message' , get_phrase('patient_info_saved_successfuly'));
            redirect('index.php?nurse/patient');
        }
        
        if ($task == "update")
        {
            $this->crud_model->update_patient_info($patient_id);
            $this->session->set_flashdata('message' , get_phrase('patient_info_updated_successfuly'));
            redirect('index.php?nurse/patient');
        }
        
        if ($task == "delete")
        {
            $this->crud_model->delete_patient_info($patient_id);
            redirect('index.php?nurse/patient');
        }
        
        $data['patient_info']   = $this->crud_model->select_patient_info();
        $data['page_name']      = 'manage_patient';
        $data['page_title']     = get_phrase('patient');
        $this->load->view('backend/index', $data);
    }
    
    function bed($task = "", $bed_id = "")
    {
        if ($this->session->userdata('nurse_login') != 1)
        {
            $this->session->set_userdata('last_page' , current_url());
            redirect(base_url(), 'refresh');
        }
        
        if ($task == "create")
        {
            $this->crud_model->save_bed_info();
            $this->session->set_flashdata('message' , get_phrase('bed_info_saved_successfuly'));
            redirect('index.php?nurse/bed');
        }
        
        if ($task == "update")
        {
            $this->crud_model->update_bed_info($bed_id);
            $this->session->set_flashdata('message' , get_phrase('bed_info_updated_successfuly'));
            redirect('index.php?nurse/bed');
        }
        
        if ($task == "delete")
        {
            $this->crud_model->delete_bed_info($bed_id);
            redirect('index.php?nurse/bed');
        }
        
        $data['bed_info']       = $this->crud_model->select_bed_info();
        $data['page_name']      = 'manage_bed';
        $data['page_title']     = get_phrase('bed');
        $this->load->view('backend/index', $data);
    }
    
    function bed_allotment($task = "", $bed_allotment_id = "")
    {
        if ($this->session->userdata('nurse_login') != 1)
        {
            $this->session->set_userdata('last_page' , current_url());
            redirect(base_url(), 'refresh');
        }
        
        if ($task == "create")
        {
            $this->crud_model->save_bed_allotment_info();
            $this->session->set_flashdata('message' , get_phrase('bed_allotment_info_saved_successfuly'));
            redirect('index.php?nurse/bed_allotment');
        }
        
        if ($task == "update")
        {
            $this->crud_model->update_bed_allotment_info($bed_allotment_id);
            $this->session->set_flashdata('message' , get_phrase('bed_allotment_info_updated_successfuly'));
            redirect('index.php?nurse/bed_allotment');
        }
        
        if ($task == "delete")
        {
            $this->crud_model->delete_bed_allotment_info($bed_allotment_id);
            redirect('index.php?nurse/bed_allotment');
        }
        
        $data['bed_allotment_info'] = $this->crud_model->select_bed_allotment_info();
        $data['page_name']          = 'manage_bed_allotment';
        $data['page_title']         = get_phrase('bed_allotment');
        $this->load->view('backend/index', $data);
    }
    
    function blood_bank($task = "", $blood_group_id = "")
    {
        if ($this->session->userdata('nurse_login') != 1)
        {
                $this->session->set_userdata('last_page' , current_url());
                redirect(base_url(), 'refresh');
        }
        
        if ($task == "update")
        {
            $this->crud_model->update_blood_bank_info($blood_group_id);
            $this->session->set_flashdata('message' , get_phrase('blood_bank_info_updated_successfuly'));
            redirect('index.php?nurse/blood_bank');
        }
        
        $data['blood_bank_info']    = $this->crud_model->select_blood_bank_info();
        $data['page_name']          = 'manage_blood_bank';
        $data['page_title']         = get_phrase('blood_bank');
        $this->load->view('backend/index', $data);
    }
    
    function blood_donor($task = "", $blood_donor_id = "")
    {
        if ($this->session->userdata('nurse_login') != 1)
        {
            $this->session->set_userdata('last_page' , current_url());
            redirect(base_url(), 'refresh');
        }
        
        if ($task == "create")
        {
            $this->crud_model->save_blood_donor_info();
            $this->session->set_flashdata('message' , get_phrase('blood_donor_info_saved_successfuly'));
            redirect('index.php?nurse/blood_donor');
        }
        
        if ($task == "update")
        {
            $this->crud_model->update_blood_donor_info($blood_donor_id);
            $this->session->set_flashdata('message' , get_phrase('blood_donor_info_updated_successfuly'));
            redirect('index.php?nurse/blood_donor');
        }
        
        if ($task == "delete")
        {
            $this->crud_model->delete_blood_donor_info($blood_donor_id);
            redirect('index.php?nurse/blood_donor');
        }
        
        $data['blood_donor_info']   = $this->crud_model->select_blood_donor_info();
        $data['page_name']          = 'manage_blood_donor';
        $data['page_title']         = get_phrase('blood_donor');
        $this->load->view('backend/index', $data);
    }
    
    function report($task = "", $report_id = "")
    {
        if ($this->session->userdata('nurse_login') != 1)
        {
            $this->session->set_userdata('last_page' , current_url());
            redirect(base_url(), 'refresh');
        }
        
        if ($task == "create")
        {
            $this->crud_model->save_report_info();
            $this->session->set_flashdata('message' , get_phrase('report_info_saved_successfuly'));
            redirect('index.php?nurse/report');
        }
        
        if ($task == "update")
        {
            $this->crud_model->update_report_info($report_id);
            $this->session->set_flashdata('message' , get_phrase('report_info_updated_successfuly'));
            redirect('index.php?nurse/report');
        }
        
        if ($task == "delete")
        {
            $this->crud_model->delete_report_info($report_id);
            redirect('index.php?nurse/report');
        }
        
        $data['page_name']      = 'manage_report';
        $data['page_title']     = get_phrase('report');
        $this->load->view('backend/index', $data);
    }
    
    function profile($task = "")
    {
        if ($this->session->userdata('nurse_login') != 1)
        {
            $this->session->set_userdata('last_page' , current_url());
            redirect(base_url(), 'refresh');
        }
        
        $nurse_id      = $this->session->userdata('login_user_id');
        if ($task == "update")
        {
            $this->crud_model->update_nurse_info($nurse_id);
            $this->session->set_flashdata('message' , get_phrase('profile_info_updated_successfuly'));
            redirect('index.php?nurse/profile');
        }
        
        if ($task == "change_password")
        {
            $password               = $this->db->get_where('nurse', array('nurse_id' => $nurse_id))->row()->password;
            $old_password           = sha1($this->input->post('old_password'));
            $new_password           = $this->input->post('new_password');
            $confirm_new_password   = $this->input->post('confirm_new_password');
            
            if($password==$old_password && $new_password==$confirm_new_password)
            {
                $data['password'] = sha1($new_password);
                
                $this->db->where('nurse_id',$nurse_id);
                $this->db->update('nurse',$data);
                
                $this->session->set_flashdata('message' , get_phrase('password_info_updated_successfuly'));
                redirect('index.php?nurse/profile');
            }
            else
            {
                $this->session->set_flashdata('message' , get_phrase('password_update_failed'));
                redirect('index.php?nurse/profile');
            }
        }
        
        $data['page_name']      = 'edit_profile';
        $data['page_title']     = get_phrase('profile');
        $this->load->view('backend/index', $data);
    }
}