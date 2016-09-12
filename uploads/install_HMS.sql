-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Sep 04, 2016 at 03:20 PM
-- Server version: 5.7.14
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms`
--

-- --------------------------------------------------------

--
-- Table structure for table `accountant`
--

CREATE TABLE `accountant` (
  `accountant_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accountant`
--

INSERT INTO `accountant` (`accountant_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'Fatura', 'fatura@policlinicasheilladias.com.br', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`) VALUES
(1, 'Admin', 'admin@policlinicasheilladias.com.br', '4910ab8e415bdbcc70c45cf960864568ddb78b2a');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL,
  `appointment_return` text COLLATE utf8_unicode_ci NOT NULL,
  `receipt_doctor_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bed`
--

CREATE TABLE `bed` (
  `bed_id` int(11) NOT NULL,
  `bed_number` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` longtext NOT NULL COMMENT 'ward,cabin,ICU',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0=unalloted;1=alloted',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bed_allotment`
--

CREATE TABLE `bed_allotment` (
  `bed_allotment_id` int(11) NOT NULL,
  `bed_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `allotment_timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `discharge_timestamp` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blood_bank`
--

CREATE TABLE `blood_bank` (
  `blood_group_id` int(11) NOT NULL,
  `blood_group` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `blood_donor`
--

CREATE TABLE `blood_donor` (
  `blood_donor_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `blood_group` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `last_donation_timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `currency`
--

CREATE TABLE `currency` (
  `currency_id` int(11) NOT NULL,
  `currency_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currency_name` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currency`
--

INSERT INTO `currency` (`currency_id`, `currency_code`, `currency_symbol`, `currency_name`) VALUES
(1, '1', 'R$', 'Real');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cost` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `name`, `description`, `cost`) VALUES
(1, 'Ginecologia', '', 100),
(2, 'Obstetrícia', '', 80),
(3, 'Cardiologia', '', 100),
(4, 'Pediatria', '', 70),
(5, 'Oftalmologia', '', 70),
(6, 'Clínica Médica', '', 60),
(7, 'Dermatologia', '', 70),
(9, 'Fisioterapia', '', 50),
(8, 'Odontologia', '', 80),
(11, 'Farmácia', '', 50);

-- --------------------------------------------------------

--
-- Table structure for table `diagnosis_report`
--

CREATE TABLE `diagnosis_report` (
  `diagnosis_report_id` int(11) NOT NULL,
  `report_type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'xray,blood test',
  `document_type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'text,photo',
  `file_name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `laboratorist_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `street` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `street_number` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `street_comp` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `neighborhood` text NOT NULL,
  `city` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `state` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `department_id` int(11) NOT NULL,
  `council` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `profile` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `honorary` int(3) NOT NULL COMMENT 'percent %'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`doctor_id`, `name`, `email`, `password`, `address`, `street`, `street_number`, `street_comp`, `neighborhood`, `city`, `state`, `phone`, `department_id`, `council`, `profile`, `honorary`) VALUES
(1, 'Sheilla Danielly Dias Souto', 'sheilladias@policlinicasheilladias.com.br', 'd146ea5a95b28ab6e979c43cc883e75da58af60b', '', '0', '0', '0', '', '0', '0', '(83) 99103-9079', 6, 'CRM-PB 7138', '', 50),
(2, 'Ana Maria Veiga de Melo', '', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '', '0', '0', '0', '', '0', '0', '', 3, 'CRM-PB 2786', '', 50),
(3, 'Raísa Magna Brandão de Vasconcelos Falcão', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '0', '0', '0', '', '0', '0', '(83) 99180-8067', 7, 'CRM-PB 8014', '', 60),
(4, 'Bruna de Abrantes Barreto Arnaud', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '0', '0', '0', '', '0', '0', '(83) 99922-8983', 2, 'CRM-PB 8200', '', 50),
(5, 'Taline Cristina de Freitas Lima', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '0', '0', '0', '', '0', '0', '(83) 99928-1196', 9, 'CRM-PB 8321', '', 50),
(6, 'Alexandre Magno da Silva', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '0', '0', '0', '', '0', '0', '(83) 98838-8618', 9, 'CREFITO-PB 21183-F', '', 50),
(7, 'Lilian Correia Rodrigues de Araújo', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '0', '0', '0', '', '0', '0', '(83) 99852-5788', 11, 'CRF-PB 10785', '', 50),
(8, 'Raíra Vasconcelos', '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '0', '0', '0', '', '0', '0', '(83) 99937-7938', 8, 'CRO-PB', '', 50),
(9, 'Renata Luna Ribeiro Vidal', 'renata@policlinicasheilladias.com.br', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '0', '0', '0', '', '0', '0', '(83) 98885-0754', 6, 'CRM-PB', '', 50);

-- --------------------------------------------------------

--
-- Table structure for table `email_template`
--

CREATE TABLE `email_template` (
  `email_template_id` int(11) NOT NULL,
  `task` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `instruction` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam`
--

CREATE TABLE `exam` (
  `exam_id` int(11) NOT NULL,
  `exam_type_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `total_third` double DEFAULT NULL,
  `receipt_exam_doctor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exam_type`
--

CREATE TABLE `exam_type` (
  `exam_type_id` int(11) NOT NULL,
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `third_percent` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exam_type`
--

INSERT INTO `exam_type` (`exam_type_id`, `name`, `value`, `third_percent`) VALUES
(1, 'Lavagem de Ouvido', 80, 50),
(2, 'Eletrocardiograma', 80, 50),
(3, 'Ecocardiograma com Doppler Colorido', 120, 70),
(4, 'Monitorização Ambulatorial de Pressão Arterial', 100, 70),
(5, 'Holter 24 h', 100, 70),
(6, 'Ultrassonografia com Doppler Colorido de Carótidas (Doppler de Carótidas)', 170, 70),
(7, 'Monitorização Residencial de Pressão Arterial', 200, 70),
(8, 'Índice Tornozelo-Braquial', 100, 70),
(9, 'Dilatação Fluxo Mediada da Artéria Braquial', 400, 70),
(10, 'Risco Cirúrgico', 80, 50),
(11, 'Citológico', 30, 80),
(12, 'Dispositivo Intra-uterino', 300, 60),
(13, 'Colposcopia', 120, 60),
(14, 'Captura Híbrida', 250, 80),
(15, 'Histopatológico (fragmento até 1cm - até 3 fragmentos)', 120, 80),
(16, 'Ácido Tricloroacético', 60, 60),
(17, 'Biópsia de Ginecologia', 110, 70),
(18, 'Teste do Olhinho', 80, 50),
(19, 'Aplicação/Preenchimento em Varizes', 80, 50),
(20, 'Teste da Orelhinha/Linguinha', 70, 50),
(22, 'Teste de exame 02', 100.8, 60),
(23, 'Teste de exame 01', 150.65, 65);

-- --------------------------------------------------------

--
-- Table structure for table `form_element`
--

CREATE TABLE `form_element` (
  `form_element_id` int(11) NOT NULL,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `html` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `invoice_number` longtext COLLATE utf8_unicode_ci NOT NULL,
  `patient_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_entries` longtext COLLATE utf8_unicode_ci NOT NULL,
  `creation_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `due_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'paid or unpaid',
  `vat_percentage` longtext COLLATE utf8_unicode_ci NOT NULL,
  `discount_amount` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `laboratorist`
--

CREATE TABLE `laboratorist` (
  `laboratorist_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laboratorist`
--

INSERT INTO `laboratorist` (`laboratorist_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'laboratorio', 'laboratorio@policlinicasheilladias.com.br', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `phrase_id` int(11) NOT NULL,
  `phrase` longtext COLLATE utf8_unicode_ci NOT NULL,
  `english` longtext COLLATE utf8_unicode_ci NOT NULL,
  `portuguese` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`phrase_id`, `phrase`, `english`, `portuguese`) VALUES
(1, 'login', 'Login', 'Login'),
(2, 'forgot_password', 'Forgot Password', 'Esqueceu Sua Senha'),
(3, 'reset_password', 'Reset Password', 'Redefinir Senha'),
(4, 'return_to_login_page', 'Return To Login Page', 'Retornar À Página De Login'),
(5, 'admin_dashboard', 'Admin Dashboard', 'Painel Admin'),
(6, 'welcome', 'Welcome', 'Bem-vindo'),
(7, 'edit_profile', 'Edit Profile', 'Editar Perfil'),
(8, 'change_password', 'Change Password', 'Alterar Senha'),
(9, 'dashboard', 'Dashboard', 'Painel'),
(10, 'department', 'Department', 'Departamento'),
(11, 'doctor', 'Doctor', 'Médico'),
(12, 'patient', 'Patient', 'Paciente'),
(13, 'nurse', 'Nurse', 'Enfermeira'),
(14, 'pharmacist', 'Pharmacist', 'Farmacêutico'),
(15, 'laboratorist', 'Laboratorist', 'Laboratorista'),
(16, 'accountant', 'Accountant', 'Contador'),
(17, 'monitor_hospital', 'Monitor Hospital', 'Monitor Do Hospital'),
(18, 'payment_history', 'Payment History', 'Histórico De Pagamentos'),
(19, 'bed_allotment', 'Bed Allotment', 'Leito Loteamento'),
(20, 'blood_bank', 'Blood Bank', 'Banco De Sangue'),
(21, 'blood_donor', 'Blood Donor', 'Doador De Sangue'),
(22, 'medicine', 'Medicine', 'Medicamento'),
(23, 'operation_report', 'Operation Report', 'Relatório De Operação'),
(24, 'birth_report', 'Birth Report', 'Relatório de Nascimento'),
(25, 'death_report', 'Death Report', 'Relatório de Morte'),
(26, 'settings', 'Settings', 'Configurações'),
(27, 'system_settings', 'System Settings', 'Configurações Do Sistema'),
(28, 'language_settings', 'Language Settings', 'Definições De Idioma'),
(29, 'account', 'Account', 'Conta'),
(30, 'payment', 'Payment', 'Pagamento'),
(31, 'delete', 'Delete', 'Excluir'),
(32, 'cancel', 'Cancel', 'Cancelar'),
(33, 'add_department', 'Add Department', 'Adicionar Departamento'),
(34, 'name', 'Name', 'Nome'),
(35, 'description', 'Description', 'Descrição'),
(36, 'options', 'Options', 'Opções'),
(37, 'add_doctor', 'Add Doctor', 'Adicionar Médico'),
(38, 'image', 'Image', 'Imagem'),
(39, 'email', 'Email', 'Email'),
(40, 'address', 'Address', 'Endereço'),
(41, 'phone', 'Phone', 'Telefone'),
(42, 'profile', 'Profile', 'Perfil'),
(43, 'edit_department', 'Edit Department', 'Editar Departamento'),
(44, 'password', 'Password', 'Senha'),
(45, 'select_department', 'Select Department', 'Selecionar Departamento'),
(46, 'edit_doctor', 'Edit Doctor', 'Editar Médico'),
(47, 'add_patient', 'Add Patient', 'Adicionar Paciente'),
(48, 'sex', 'Sex', 'Sexo'),
(49, 'birth_date', 'Birth Date', 'Data De Nascimento'),
(50, 'age', 'Age', 'Idade'),
(51, 'blood_group', 'Blood Group', 'Grupo Sanguíneo'),
(52, 'select_sex', 'Select Sex', 'Selecione Sexo'),
(53, 'male', 'Male', 'Masculino'),
(54, 'female', 'Female', 'Feminino'),
(55, 'select_blood_group', 'Select Blood Group', 'Selecione Grupo Sanguíneo'),
(56, 'edit_patient', 'Edit Patient', 'Editar Paciente'),
(57, 'add_nurse', 'Add Nurse', 'Adicionar Enfermeira'),
(58, 'edit_nurse', 'Edit Nurse', 'Editar Enfermeira'),
(59, 'add_pharmacist', 'Add Pharmacist', 'Adicionar Farmacêutico'),
(60, 'edit_pharmacist', 'Edit Pharmacist', 'Editar Farmacêutico'),
(61, 'add_laboratorist', 'Add Laboratorist', 'Adicionar Laboratorista'),
(62, 'edit_laboratorist', 'Edit Laboratorist', 'Editar Laboratorista'),
(63, 'add_accountant', 'Add Accountant', 'Adicionar Contador'),
(64, 'edit_accountant', 'Edit Accountant', 'Editar Contador'),
(65, 'invoice_number', 'Invoice Number', 'Número Da Fatura'),
(66, 'title', 'Title', 'Título'),
(67, 'creation_date', 'Creation Date', 'Data De Criação'),
(68, 'due_date', 'Due Date', 'Data De Vencimento'),
(69, 'vat_percentage', 'Vat Percentage', 'Porcentagem Comissão'),
(70, 'discount_amount', 'Discount Amount', 'Total de Desconto'),
(71, 'status', 'Status', 'Status'),
(72, 'bed_number', 'Bed Number', 'Número do Leito'),
(73, 'bed_type', 'Bed Type', 'Tipo De Leito'),
(74, 'allotment_time', 'Allotment Time', 'Tempo do Loteamento'),
(75, 'discharge_time', 'Discharge Time', 'Alta'),
(76, 'issue_date', 'Issue Date', 'Data De Emissão'),
(77, 'payment_to', 'Payment To', 'Pagamento Para'),
(78, 'bill_to', 'Bill To', 'Conta Para'),
(79, 'invoice_entries', 'Invoice Entries', 'Entrada de Fatura'),
(80, 'entry', 'Entry', 'Entrada'),
(81, 'price', 'Price', 'Preço'),
(82, 'sub_total', 'Sub Total', 'Subtotal'),
(83, 'discount', 'Discount', 'Desconto'),
(84, 'grand_total', 'Grand Total', 'Total Geral'),
(85, 'date', 'Date', 'Data'),
(86, 'amount', 'Amount', 'Valor'),
(87, 'method', 'Method', 'Método'),
(88, 'last_donation_date', 'Last Donation Date', 'Data da Última Doação'),
(89, 'medicine_category', 'Medicine Category', 'Categoria Medicamento'),
(90, 'manufacturing_company', 'Manufacturing Company', 'Empresa de Manufatura'),
(91, 'system_name', 'System Name', 'Nome do Sistema'),
(92, 'system_title', 'System Title', 'Título do Sistema'),
(93, 'paypal_email', 'Paypal Email', 'Email Paypal'),
(94, 'currency', 'Currency', 'Câmbio'),
(95, 'system_email', 'System Email', 'Email Do Sistemal'),
(96, 'buyer', 'Buyer', 'Comprador'),
(97, 'value_required', 'Value Required', 'Valor Obrigatório'),
(98, 'purchase_code', 'Purchase Code', 'Código De Compra'),
(99, 'language', 'Language', 'Linguagem'),
(100, 'text_align', 'Text Align', 'Alinhamento do Texto'),
(101, 'save', 'Save', 'Salvar'),
(102, 'manage_language', 'Manage Language', 'Gerenciar Idioma'),
(103, 'phrase_list', 'Phrase List', 'Lista Frase'),
(104, 'add_phrase', 'Add Phrase', 'Adicionar Frase'),
(105, 'add_language', 'Add Language', 'Adicionar Idioma'),
(106, 'option', 'Option', 'Opção'),
(107, 'edit_phrase', 'Edit Phrase', 'Editar Frase'),
(108, 'delete_language', 'Delete Language', 'Excluir Idioma'),
(109, 'phrase', 'Phrase', 'Frase'),
(110, 'update_phrase', 'Update Phrase', 'Atualização Frase'),
(111, 'manage_profile', 'Manage Profile', 'Gerenciar Perfil'),
(112, 'update_profile', 'Update Profile', 'Atualizar Perfil'),
(113, 'current_password', 'Current Password', 'Senha Atual'),
(114, 'new_password', 'New Password', 'Nova Senha'),
(115, 'confirm_new_password', 'Confirm New Password', 'Confirmar Nova Senha'),
(116, 'update_password', 'Update Password', 'Atualizar Senha'),
(117, 'profile_info_updated_successfuly', 'Profile Info Updated Successfuly', 'Informações Do Perfil Atualizado Com Sucesso'),
(118, 'doctor_dashboard', 'Doctor Dashboard', 'Painel Médico'),
(119, 'appointment', 'Appointment', 'Consulta'),
(120, 'prescription', 'Prescription', 'Prescrição'),
(121, 'report', 'Report', 'Relatório'),
(122, 'appointment_schedule', 'Appointment Schedule', 'Agendar Consulta'),
(123, 'add_appointment', 'Add Appointment', 'Adicionar Consulta'),
(124, 'event_schedule', 'Event Schedule', 'Agenda'),
(125, 'select_patient', 'Select Patient', 'Selecionar Paciente'),
(126, 'edit_appointment', 'Edit Appointment', 'Editar Consulta'),
(127, 'add_prescription', 'Add Prescription', 'Adicionar Prescrição'),
(128, 'case_history', 'Case History', 'Histórico do Caso'),
(129, 'medication', 'Medication', 'Medicação'),
(130, 'note', 'Note', 'Nota'),
(131, 'edit_prescription', 'Edit Prescription', 'Editar Prescrição'),
(132, 'report_type', 'Report Type', 'Tipo De Relatório'),
(133, 'document_type', 'Document Type', 'Tipo De Documento'),
(134, 'download', 'Download', 'Baixar'),
(135, 'add_diagnosis_report', 'Add Diagnosis Report', 'Adicionar Relatório De Diagnóstico'),
(136, 'select_report_type', 'Select Report Type', 'Escolha Um Tipo De Relatório'),
(137, 'xray', 'Xray', 'Raio X'),
(138, 'blood_test', 'Blood Test', 'Teste De Sangue'),
(139, 'document', 'Document', 'Documento'),
(140, 'select_document_type', 'Select Document Type', 'Selecione Tipo De Documento'),
(141, 'doc', 'Doc', 'doc'),
(142, 'pdf', 'Pdf', 'pdf'),
(143, 'excel', 'Excel', 'excel'),
(144, 'other', 'Other', 'outro'),
(145, 'add_bed_allotment', 'Add Bed Allotment', 'Adicionar Leito Loteamento'),
(146, 'select_bed_number', 'Select Bed Number', 'Selecione Número Leito'),
(147, 'edit_bed_allotment', 'Edit Bed Allotment', 'Editar Leito Loteamento'),
(148, 'blood_donor_list', 'Blood Donor List', 'Lista Do Doador De Sangue'),
(149, 'blood_bank_status', 'Blood Bank Status', 'Status De Banco De Sangue'),
(150, 'add_report', 'Add Report', 'Adicionar Relatório'),
(151, 'operation', 'Operation', 'Operação'),
(152, 'birth', 'Birth', 'Nascimento'),
(153, 'death', 'Death', 'Morte'),
(154, 'type', 'Type', 'Tipo'),
(155, 'select_type', 'Select Type', 'Selecionar Tipo'),
(156, 'edit_report', 'Edit Report', 'Editar Relatório'),
(157, 'old_password', 'Old Password', 'Senha Antiga'),
(158, 'patient_dashboard', 'Patient Dashboard', 'Painel Paciente'),
(159, 'admit_history', 'Admit History', 'Admita História'),
(160, 'operation_history', 'Operation History', 'Operação História'),
(161, 'invoice', 'Invoice', 'Fatura'),
(162, 'nurse_dashboard', 'Nurse Dashboard', 'Painel Enfermeira'),
(163, 'bed_/_ward', 'Bed / Ward', 'Leito/Enfermaria'),
(164, 'manage_bed', 'Manage Bed', 'Gerenciar Leito'),
(165, 'manage_blood_bank', 'Manage Blood Bank', 'Gerenciar Banco De Sangue'),
(166, 'bed', 'Bed', 'Leito'),
(167, 'add_bed', 'Add Bed', 'Adicionar Leito'),
(168, 'ward', 'Ward', 'Enfermaria'),
(169, 'cabin', 'Cabin', 'Cabine'),
(170, 'icu', 'ICU', 'ICU'),
(171, 'edit_bed', 'Edit Bed', 'Editar Leito'),
(172, 'edit_blood_bank', 'Edit Blood Bank', 'Editar Banco De Sangue'),
(173, 'add_blood_donor', 'Add Blood Donor', 'Adicionar Doador De Sangue'),
(174, 'edit_blood_donor', 'Edit Blood Donor', 'Editar Doador de Sangue'),
(175, 'select_doctor', 'Select Doctor', 'Selecionar Médico'),
(176, 'pharmacist_dashboard', 'Pharmacist Dashboard', 'Painel Farmacêutico'),
(177, 'add_medicine', 'Add Medicine', 'Adicionar Medicamento'),
(178, 'select_medicine_category', 'Select Medicine Category', 'Selecione Medicamento Categoria'),
(179, 'select_status', 'Select Status', 'Selecione Status'),
(180, 'available', 'Available', 'Disponível'),
(181, 'unavailable', 'Unavailable', 'Indisponível'),
(182, 'edit_medicine', 'Edit Medicine', 'Editar Medicamento'),
(183, 'add_medicine_category', 'Add Medicine Category', 'Adicionar Medicamento Categoria'),
(184, 'edit_medicine_category', 'Edit Medicine Category', 'Editar Medicamento Categoria'),
(185, 'laboratorist_dashboard', 'Laboratorist Dashboard', 'Painel Laboratorista'),
(186, 'accountant_dashboard', 'Accountant Dashboard', 'Painel Contador'),
(187, 'add_invoice', 'Add Invoice', 'Adicionar Fatura'),
(188, 'manage_invoice', 'Manage Invoice', 'Gerenciar Fatura'),
(189, 'invoice_title', 'Invoice Title', 'Título Fatura'),
(190, 'select_a_patient', 'Select A Patient', 'Selecione um Paciente'),
(191, 'payment_status', 'Payment Status', 'Situação do Pagamento'),
(192, 'select_a_status', 'Select A Status', 'Selecione um Status'),
(200, 'receptionist', 'Receptionist', 'Recepção'),
(201, 'noticeboard', 'Notice Board', 'Notícias'),
(202, 'sms_settings', 'SMS Settings', 'Ajustes SMS'),
(203, 'receptionist_dashboard', 'Receptionist Dashboard', 'Painel Recepção'),
(204, 'appointment_list', 'Appointment List', 'Consultas Agendadas'),
(205, 'requested_appointments', 'Requested Appointments', 'Consultas Requisitadas'),
(206, 'add_receptionist', 'Add Receptionist', 'Adicionar Usuário Recepção'),
(207, 'settings_updated', 'Settings Updated', 'Configurações Atualizadas'),
(208, 'start_date', 'Start Date', 'Data Inicial'),
(209, 'end_date', 'End Date', 'Data Final'),
(210, 'all_doctors', 'All Doctor', 'Todos os Médicos'),
(211, 'filter_appointments', 'Filter Appointments', 'Filtrar Consultas'),
(241, 'message', 'Message', 'Mensagem'),
(240, 'patient_:_', 'Patient:', 'Paciente:'),
(239, 'doctor_:_', 'Doctor:', 'Médico:'),
(215, 'appointment_info_saved_successfuly', 'Appointment Info Saved Successfuly', 'Consulta Adicionada com Sucesso'),
(216, 'page_not_found', 'Page Not Found', 'Página Não Encontrada'),
(217, 'logout', 'Logout', 'Sair'),
(218, 'requested_appointment', 'Requested Appointment', 'Consultas Requisitadas'),
(219, 'street', 'Street', 'Rua'),
(220, 'number', 'Number', 'Número'),
(221, 'neighborhood', 'Neighborhood', 'Bairro'),
(222, 'complement', 'Complement', 'Complemento'),
(223, 'city', 'City', 'Cidade'),
(224, 'state', 'State', 'Estado'),
(225, 'select_state', 'Select State', 'Selecione o Estado'),
(226, 'add_notice', 'Add Notice', 'Adicionar Notícia'),
(227, 'edit_invoice', 'Edit Invoice', 'Editar Fatura'),
(228, 'paid', 'Paid', 'Pago'),
(229, 'unpaid', 'Unpaid', 'Não Pago'),
(230, 'invoice_entry', 'Invoice Entry', 'Detalhe da Fatura'),
(231, 'add_invoice_entry', 'Add Invoice Entry', 'Adicionar Detalhe da Fatura'),
(232, 'update_invoice', 'Update Invoice', 'Atualizar Fatura'),
(233, 'create_new_invoice', 'Create New Invoice', 'Criar Nova Fatura'),
(234, 'select_image', 'Select Image', 'Selecionar Imagem'),
(235, 'change', 'Change', 'Mudar'),
(236, 'street_number', 'Number', 'Número'),
(237, 'patient_info_saved_successfuly', 'Patient Info Saved Successfully', 'Informações do Paciente Salvo com Sucesso'),
(238, 'patient_info_updated_successfuly', 'Patient Info Updated Successfuly', 'Informação do Paciente Atualizada com Sucesso'),
(242, 'view_all_messages', 'View All Messages', 'Ver todas as Mensagens'),
(243, 'notify_patient_with_', 'Notify Patient With', 'Avisar paciente por'),
(244, 'private_messaging', 'Private Messaging', 'Mensagem Privada'),
(245, 'messages', 'Messages', 'Mensagens'),
(246, 'new_message', 'New Message', 'Nova Mensagem'),
(247, 'edit_receptionist', 'Edit Recepionist', 'Editar Recepção'),
(248, 'edit', 'Edit', 'Editar'),
(249, 'select_date', 'Select Date', 'Selecionar Data'),
(250, 'select_time', 'Select Time', 'Selecionar Hora'),
(251, 'submit', 'Submit', 'Salvar'),
(252, 'update', 'Update', 'Atualizar'),
(253, 'are_you_sure_want_delete', 'Are you sure want delete?', 'Tem certeza que deseja apagar?'),
(254, 'close', 'Close', 'Fechar'),
(255, 'appointment_info_updated_successfuly', 'Appointment Info Updated Successfuly', 'Consulta Atualizada com Sucesso'),
(256, 'time', 'Time', 'Hora'),
(257, 'appointment_deleted_successfully', 'Appointment Deleted Successfully', 'Consulta Apagada com Sucesso'),
(258, 'invoice_info_updated_successfuly', 'Invoice Info Update Successfuly', 'Fatura Atualizada com Sucesso'),
(259, 'invoice_info_saved_successfuly', 'Invoice Info Saved Successfuly', 'Fatura Adicionada com Sucesso'),
(260, 'notice_info_saved_successfuly', 'Notice Info Saved Successfuly', 'Notícia Adicionada com Sucesso'),
(261, 'edit_notice', 'Edit Notice', 'Editar Notícia'),
(262, 'notice_info_updated_successfuly', 'Notice Info Updated Successfuly', 'Notícia Atualizada com Sucesso'),
(263, 'doctor_info_updated_successfuly', 'Doctor Info Updated Successfule', 'Informação do Médico Atualizado com Sucesso'),
(264, 'return', 'Return', 'Retorno'),
(265, 'receipt', 'Receipt', 'Recibo'),
(266, 'add_receipt', 'Add Receipt', 'Adicionar Recibo'),
(267, 'all_patients', 'All Patients', 'Todos os Pacientes'),
(268, 'filter_receipts', 'Filter Receipts', 'Filtar Recibos'),
(269, 'select_appointment', 'Select Appointment', 'Selecione a Consulta'),
(270, 'receipt_date', 'Receipt Date', 'Data do Recibo'),
(271, 'payment_type', 'Payment Type', 'Tipo de Pagamento'),
(272, 'select_payment_type', 'Select Payment Type', 'Selecione Tipo de Pagamento'),
(273, 'cash', 'Cash', 'Dinheiro'),
(274, 'debit', 'Debit', 'Débito'),
(275, 'credit', 'Credit', 'Crédito'),
(276, 'installment', 'Installment', 'Parcelas'),
(277, 'select_installment', 'Select Installment', 'Selecione as Parcelas'),
(278, 'appointment_date', 'Appointment Date', 'Data da Consulta'),
(279, 'receipt_info_saved_successfuly', 'Receipt Info Saved Successfuly', 'Recibo Salvo com Sucesso'),
(281, 'select_a_doctor', 'Select a Doctor', 'Selecione um Médico'),
(282, 'appointments', 'Appointments', 'Consultas'),
(283, 'select_appointments', 'Select Appointments', 'Selecionar Consultas'),
(284, 'create_receipt_doctor', 'Create Doctor Receipt', 'Criar Recibo do Médico'),
(285, 'receipt_number', 'Receipt Number', 'Número do Recibo'),
(287, 'view_receipt', 'View Receipt', 'Visualizar Recibo'),
(290, 'honorary_percentage', 'Honorary Percentage', 'Porcentagem Honorário'),
(289, 'print_receipt', 'Print Receipt', 'Imprimir Recibo'),
(291, 'total_clinic', 'Total Clinic', 'Total Clínica'),
(292, 'total_honorary', 'Total Honorary', 'Total Honorário'),
(293, 'receipt_doctor', 'Receipt Doctor', 'Recibo do Médico'),
(294, 'clickatell_user', 'Clickatell User', 'Usuário Clickatel'),
(295, 'clickatell_password', 'Clicktell Password', 'Senha Clickatel'),
(296, 'clickatell_api_id', 'Clickatell API ID', 'Clickatell API ID'),
(297, 'language_list', 'Language List', 'Lista Idiomas'),
(298, 'honorary', 'Honorary', 'Honorário'),
(299, 'council', 'Council', 'Inscrição Conselho'),
(300, 'cost', 'Cost', 'Custo'),
(301, 'value', 'Value', 'Valor'),
(302, 'department_info_saved_successfuly', 'Department Info Saved Successfuly', 'Departamento Salvo com Sucesso'),
(303, 'department_info_updated_successfuly', 'Department Infor Updated Successfuly', 'Departamento Atualizado com Sucesso'),
(304, 'total', 'Total', 'Total'),
(305, 'exam', 'Exam', 'Exame'),
(306, 'exam_type', 'Exam Type', 'Tipo de Exame'),
(307, 'select_exam_type', 'Select Exam Type', 'Selecione o Tipo de Exame'),
(308, 'date_time', 'Date/Time', 'Data/Hora'),
(310, 'add_exam', 'Add Exam', 'Adicionar Exame'),
(311, 'third_percent', 'Third Percent', 'Terceiros'),
(312, 'add_exam_type', 'Add Exam Type', 'Adicionar Tipo de Exame'),
(313, 'exam_type_info_saved_successfuly', 'Exam Type Info Saved Successfuly', 'Tipo de Exame Salvo com Sucesso'),
(314, 'edit_exam_type', 'Edit Exam Type', 'Editar Tipo de Exame'),
(317, 'total_third', 'Total Third', 'Total Terceiro'),
(316, 'exams', 'Exams', 'Exames'),
(318, 'amount_receipt', 'Amount Receipt', 'Valor Consultas'),
(319, 'amount_exam_receipt', 'Amount Exam Receipt', 'Valor Exames'),
(320, 'click_to_show', 'Click to Show', 'Clique para exibir'),
(321, 'total_receipt', 'Total Receipt', 'Total Receipt'),
(322, 'total_receipt_third', 'Total Receipt Third', 'Total Honorário e Terceiro ');

-- --------------------------------------------------------

--
-- Table structure for table `medicine`
--

CREATE TABLE `medicine` (
  `medicine_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medicine_category_id` int(11) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` longtext COLLATE utf8_unicode_ci NOT NULL,
  `manufacturing_company` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicine_category`
--

CREATE TABLE `medicine_category` (
  `medicine_category_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `message_id` int(11) NOT NULL,
  `message_thread_code` longtext NOT NULL,
  `message` longtext NOT NULL,
  `sender` longtext NOT NULL,
  `timestamp` longtext NOT NULL,
  `read_status` int(11) NOT NULL DEFAULT '0' COMMENT '0 unread 1 read'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message_thread`
--

CREATE TABLE `message_thread` (
  `message_thread_id` int(11) NOT NULL,
  `message_thread_code` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sender` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reciever` longtext COLLATE utf8_unicode_ci NOT NULL,
  `last_message_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `note`
--

CREATE TABLE `note` (
  `note_id` int(11) NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_type` longtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `color` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp_create` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp_last_update` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notice`
--

CREATE TABLE `notice` (
  `notice_id` int(11) NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `start_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `end_timestamp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notice`
--

INSERT INTO `notice` (`notice_id`, `title`, `description`, `start_timestamp`, `end_timestamp`) VALUES
(5, 'Falta', 'Dra. Bruna não virá.', '1462158000', '1462417200'),
(6, 'teste de noticia', 'Teste', '1461898800', '1461898800'),
(7, 'teste de noticia2', 'teste', '1461898800', '1461985200');

-- --------------------------------------------------------

--
-- Table structure for table `noticeboard`
--

CREATE TABLE `noticeboard` (
  `notice_id` int(11) NOT NULL,
  `notice_title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `notice` longtext COLLATE utf8_unicode_ci NOT NULL,
  `create_timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nurse`
--

CREATE TABLE `nurse` (
  `nurse_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nurse`
--

INSERT INTO `nurse` (`nurse_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'Enfermeira', 'enfermeira@policlinicasheilladias.com.br', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8_unicode_ci NOT NULL,
  `street` longtext COLLATE utf8_unicode_ci NOT NULL,
  `street_number` int(11) NOT NULL,
  `street_comp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `neighborhood` longtext COLLATE utf8_unicode_ci NOT NULL,
  `city` longtext COLLATE utf8_unicode_ci NOT NULL,
  `state` longtext COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sex` longtext COLLATE utf8_unicode_ci NOT NULL,
  `birth_date` longtext COLLATE utf8_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `blood_group` longtext COLLATE utf8_unicode_ci NOT NULL,
  `account_opening_timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `name`, `email`, `street`, `street_number`, `street_comp`, `neighborhood`, `city`, `state`, `phone`, `sex`, `birth_date`, `age`, `blood_group`, `account_opening_timestamp`) VALUES
(17, 'Sofia Aguiar Cunha Souza Bezerra', 'contato@policlinicasheilladias.com.br', 'Moriz de Miranda Usmão', 725, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98123-1293', 'female', '1438138800', 0, '', 0),
(18, 'Tereza Cristina Alves', 'contato@policlinicasheilladias.com.br', 'Caetano Figueiredo', 770, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98737-5692', 'female', '225774000', 0, '', 0),
(12, 'Larissa Ribeiro Barreto', 'contato@policlinicasheilladias.com.br', 'Ranieri Mazilli', 1719, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98894-1344', 'female', '671770800', 0, '', 0),
(13, 'Giovanna Barbosa Oliveira', 'contato@policlinicasheilladias.com.br', 'Bom Jesus', 421, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98891-2751', 'female', '1412996400', 0, '', 0),
(14, 'Elizabeth de Lucena Osias Estrela', 'contato@policlinicasheilladias.com.br', 'Valdemar de Mesquita Acciole', 928, '0', 'Bancários', 'João Pessoa', 'PB', '(83) 98857-0333', 'female', '1286852400', 0, '', 0),
(15, 'Maria das Neves Batista Oliveira', 'contato@policlinicasheilladias.com.br', 'Antonio Teotonio', 755, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98861-9316', 'female', '-63842400', 0, '', 0),
(16, 'Jaiane de Medeiros Lima', 'contato@policlinicasheilladias.com.br', 'Elias Cavalcante de Albuquerque', 29, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98739-8310', 'female', '674622000', 0, '', 0),
(11, 'Clecineide de Aguiar Bezerra', '', 'Rua dos Milagres', 2680, '', 'Cristo', 'João Pessoa', 'PB', '(83) 986203214', 'female', '118897200', 42, '', 0),
(19, 'Denilde da Rocha Bezerril', 'contato@policlinicasheilladias.com.br', 'Mari José Rique', 381, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3508-3639', 'female', '46407600', 0, '', 0),
(20, 'Lucia Maria Figueiredo de Souza', 'contato@policlinicasheilladias.com.br', '2 de Fevereiro', 1665, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98862-1045', 'female', '-372632400', 57, '', 0),
(21, 'Maria Antonia da Silva Gouveia', 'contato@policlinicasheilladias.com.br', 'Avenida Oceano Pacifico', 382, '0', 'Intermares', 'Cabedelo', 'PB', '(83) 99104-2024', 'female', '1359424800', 0, '', 0),
(22, 'Ronal Mckeon', 'contato@policlinicasheilladias.com.br', 'Pedro Alves de Andrade', 501, '0', 'Bancários', 'João Pessoa', 'PB', '(83) 3034-4033', 'male', '-512946000', 0, '', 0),
(23, 'Francisco das Chagas Santos', 'contato@policlinicasheilladias.com.br', 'dos Indutriários', 601, '0', 'das Indústrias', 'João Pessoa', 'PB', '(83) 98752-0929', 'male', '-83365200', 0, '', 0),
(24, 'Breno Barreto da Rocha Arnaud', 'contato@policlinicasheilladias.com.br', 'Ranieri Mazilli', 1804, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99922-8983', 'male', '1313031600', 0, '', 0),
(25, 'Damiana Vieira Araújo ', 'contato@policlinicasheilladias.com.br', 'Moriz Miranda Gusmão', 1412, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98820-8632', 'female', '14612400', 0, '', 0),
(26, 'Josafá Batista da Silva', 'contato@policlinicasheilladias.com.br', 'Moriz Miranda Gusmão', 665, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98878-4533', 'male', '-369694800', 0, '', 0),
(27, 'Jessé de Oliveira Teófilo', 'contato@policlinicasheilladias.com.br', 'José Francisco da SIlva', 1950, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-6410', 'male', '794199600', 0, '', 0),
(28, 'Amisaday de Oliveira Muniz', 'contato@policlinicasheilladias.com.br', 'Napoleão Duré', 271, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99897-3022', 'male', '768538800', 0, '', 0),
(29, 'Lucia Maria Ferreira da Silva', 'contato@policlinicasheilladias.com.br', 'Arnaldo Costa', 25, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98870-6404', 'female', '232254000', 0, '', 0),
(30, 'Irany de Oliveira Teófilo', 'contato@policlinicasheilladias.com.br', 'José Francisco da SIlva', 1950, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-6410', 'female', '-149547600', 0, '', 0),
(31, 'Maria Eduarda Virginio Aquino Gonçalves', 'contato@policlinicasheilladias.com.br', 'Antonio Gomes da Silveira', 1205, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98766-3218', 'female', '1371524400', 2, '', 0),
(32, 'João Miguel Travassos de Oliveira ', 'contato@policlinicasheilladias.com.br', 'Rua Tenente João Gomes', 193, '0', 'Centro', 'João Pessoa', 'PB', '(83) 99940-8753', 'male', '1449194400', 0, '', 0),
(33, 'Luciana Trajano da Silva', 'contato@policlinicasheilladias.com.br', 'Rute Magalhães', 85, '0', 'Geisel', 'João Pessoa', 'PB', '(83) 98839-6996', 'female', '238561200', 0, '', 0),
(34, 'Andrews Lopes Meireles', 'contato@policlinicasheilladias.com.br', 'Clemente Pereira', 15, '0', 'Centro', 'Guarabira', 'PB', '(83) 98725-3427', 'male', '536810400', 0, '', 0),
(35, 'Géssica Thaís Lima de Sá', 'contato@policlinicasheilladias.com.br', 'Orlando Pereira de Brito', 0, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99912-8818', 'female', '818560800', 0, '', 0),
(36, 'Emilia Maria Pereira Menezes', 'contato@policlinicasheilladias.com.br', 'Sebastiana Silva Santos', 229, '0', 'Geisel', 'João Pessoa', 'PB', '(83) 98843-3364', 'female', '318222000', 0, '', 0),
(37, 'Luana Karla Pereira Menezes', 'contato@policlinicasheilladias.com.br', 'Sebastiana Silva Santos', 229, '0', 'Geisel', 'João Pessoa', 'PB', '(83) 98843-3364', 'female', '1058756400', 0, '', 0),
(38, 'Manoel Medeiros de Lucena', 'contato@policlinicasheilladias.com.br', 'Pedro Ivo de Paiva', 101, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98899-4711', 'male', '-204066000', 0, '', 0),
(39, 'Benedita Neta dos Santos', 'contato@policlinicasheilladias.com.br', 'Professor Arcanjo Cavalcante', 573, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98893-6152', 'female', '76993200', 0, '', 0),
(40, 'Genival Teixeira da Cruz', 'contato@policlinicasheilladias.com.br', 'Odília T.Sabadelli', 287, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98822-1326', 'male', '-423608400', 0, '', 0),
(41, 'Creumágda Ielpo de Mendonça', 'contato@policlinicasheilladias.com.br', 'Pedro Freire de Mendonça', 127, '0', 'Geisel', 'João Pessoa', 'PB', '(83) 98807-2378', 'female', '36990000', 0, '', 0),
(42, 'Irinaldo Laureano Dantas', 'contato@policlinicasheilladias.com.br', 'Joaquim dos Santos Sobrinho', 15, '0', 'Mangabeira V', 'João Pessoa', 'PB', '(83) 98871-8904', 'male', '113022000', 0, '', 0),
(43, 'Samylla Wolff Dionísio', 'contato@policlinicasheilladias.com.br', 'Juiz Helmano Pereira de Siqueira', 144, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99109-8268', 'female', '1386900000', 0, '', 0),
(44, 'Ana Vitoria Batista', 'contato@policlinicasheilladias.com.br', 'Abidias dos Santos Passaro', 453, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98772-1065', 'female', '1442977200', 0, '', 0),
(45, 'Severina Maria da Conceição', 'contato@policlinicasheilladias.com.br', 'Industrial João Urso', 449, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-7409', 'female', '-1373835600', 0, '', 0),
(46, 'Ana Paula Pereira Andrade ', 'contato@policlinicasheilladias.com.br', 'Caetano Figueiredo', 1392, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98650-0681', 'female', '390884400', 0, '', 0),
(47, 'Aroldo Costa da Cunha', 'contato@policlinicasheilladias.com.br', 'Arnaldo Costa', 100, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-1312', 'male', '81054000', 0, '', 0),
(48, 'Hasenclever da Silva Pires', 'contato@policlinicasheilladias.com.br', 'Avenida Nego', 935, '0', 'Tambaú', 'João Pessoa', 'PB', '(83) 98831-9604', 'male', '-85006800', 0, '', 0),
(49, 'João Victor Silva Soares', 'contato@policlinicasheilladias.com.br', 'Orlando Pereira de Brito', 943, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98797-4401', 'male', '1309057200', 0, '', 0),
(50, 'George Coutinho de Araujo', 'contato@policlinicasheilladias.com.br', 'Antonia Gomes da Silveira', 1984, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 9805-6551', 'male', '-425854800', 0, '', 0),
(51, 'Lyanna Pathricia Pereira Serafim ', 'contato@policlinicasheilladias.com.br', 'Maria das Neves Medeiros Rodrigues', 229, '0', 'Valentina', 'João Pessoa', 'PB', '(83) 98855-7067', 'female', '129178800', 0, '', 0),
(52, 'Rosangela Gomes da Silva', 'contato@policlinicasheilladias.com.br', 'Felinto de Arruda Escolastico', 234, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98786-8752', 'female', '125031600', 0, '', 0),
(53, 'Aryana de Assunção Santiago', 'contato@policlinicasheilladias.com.br', 'Luiz Romualdo da Silva', 23, '0', 'Cuiá', 'João Pessoa', 'PB', '(83) 99376-8210', 'female', '709527600', 0, '', 0),
(54, 'Andreia Flávia Campos de Paiva', 'contato@policlinicasheilladias.com.br', 'Arnaldo Costa', 850, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98897-0977', 'female', '242622000', 0, '', 0),
(55, 'Jocielma Nascimento Maciel dos Santos', 'contato@policlinicasheilladias.com.br', 'Horacio Trajano de Oliveira', 255, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98843-9629', 'female', '505620000', 0, '', 0),
(56, 'Joana Nicacio da Silva', 'contato@policlinicasheilladias.com.br', 'Leonel Pinto de Abreu', 1604, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99885-9371', 'female', '-849819600', 0, '', 0),
(57, 'Rosamar de Lima Nunes Ataide', 'contato@policlinicasheilladias.com.br', 'Francisco Manoel de Andrade', 0, '0', 'Geisel', 'João Pessoa', 'PB', '(83) 98864-4388', 'female', '66193200', 0, '', 0),
(58, 'Severina Maria Baltar', 'contato@policlinicasheilladias.com.br', 'Antonia Gomes da Silveira', 1579, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98798-6283', 'female', '-766789200', 0, '', 0),
(59, 'Gabriel Ramalho Dias', 'contato@policlinicasheilladias.com.br', 'Rangel Travassos', 1165, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98769-0204', 'male', '1422842400', 0, '', 0),
(60, 'Dilka Marisa Rocha', 'contato@policlinicasheilladias.com.br', 'dos Milagres', 2565, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-5063', 'female', '-547333200', 0, '', 0),
(61, 'Daniela Karina Antão Marques', 'contato@policlinicasheilladias.com.br', 'José Francisco da SIlva', 1620, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98839-5337', 'female', '299991600', 0, '', 0),
(62, 'Julio Cesar Antão Marques', 'contato@policlinicasheilladias.com.br', 'José Francisco da SIlva', 1620, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98839-5337', 'male', '1092884400', 0, '', 0),
(63, 'Fernando Canedo Zapata', 'contato@policlinicasheilladias.com.br', 'Ovidia Mendonça', 100, '0', 'Miramar', 'João Pessoa', 'PB', '(83) 99927-6936', 'male', '-488840400', 0, '', 0),
(64, 'Michael Marcelo da Silva Alves', 'contato@policlinicasheilladias.com.br', '2 de Fevereiro', 0, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 3223-4002', 'male', '1257818400', 0, '', 0),
(65, 'Josias Leonel de Oliveira', 'contato@policlinicasheilladias.com.br', 'Rangel Travassos', 1230, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98720-5252', 'male', '-645397200', 0, '', 0),
(66, 'Adna Pontes Neves Lopes', 'contato@policlinicasheilladias.com.br', 'Farmaceutico Vimario Lacerda Nere', 110, '0', 'Cuiá', 'João Pessoa', 'PB', '(83) 99940-5727', 'female', '555649200', 0, '', 0),
(67, 'Lucas Vinicius Alves de Moura', 'contato@policlinicasheilladias.com.br', 'Arnaldo Costa', 1035, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98743-8959', 'male', '1451095200', 0, '', 0),
(68, 'Djenane Nunes de Araújo', 'contato@policlinicasheilladias.com.br', 'Edvaldo Toscano de Brito', 135, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 98725-4068', 'female', '83473200', 0, '', 0),
(69, 'Gabriela Gomes Dantas', 'contato@policlinicasheilladias.com.br', 'Ozório Queiroga Diassis', 321, '0', 'Bessa', 'João Pessoa', 'PB', '(83) 98847-5945', 'female', '419914800', 0, '', 0),
(70, 'Mayara Ana Pereira Cordeiro', 'contato@policlinicasheilladias.com.br', 'dos Milagres', 2111, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-2612', 'female', '599968800', 0, '', 0),
(71, 'Alice Cordeiro Pedrosa Costa', 'contato@policlinicasheilladias.com.br', 'dos Milagres', 2111, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-2612', 'female', '1198720800', 0, '', 0),
(72, 'Elaine Lira Nascimento', 'contato@policlinicasheilladias.com.br', 'Bom Jesus', 440, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98707-9254', 'female', '528087600', 0, '', 0),
(73, 'Raquel Fernandes Guedes', 'contato@policlinicasheilladias.com.br', 'Orlando Pereira de Brito', 1250, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98813-8460', 'female', '165726000', 0, '', 0),
(74, 'Lindbergh Regis da SIlva', 'contato@policlinicasheilladias.com.br', 'Presidente Carlos Luz', 98, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99806-0055', 'male', '256014000', 0, '', 0),
(75, 'Rejane Ribeiro de Azevedo', 'contato@policlinicasheilladias.com.br', 'Luzia Pedrosa', 1726, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-2569', 'female', '-35326800', 0, '', 0),
(76, 'Jessika Mikaela Silva Santos', 'contato@policlinicasheilladias.com.br', 'Orlando Pereira de Brito', 70, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98871-9246', 'female', '684298800', 0, '', 0),
(77, 'Luzia de Jesus Madruga', 'contato@policlinicasheilladias.com.br', 'José Francisco da SIlva', 820, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3221-8660', 'female', '-1286830800', 0, '', 0),
(78, 'Aldo Sousa de Araujo', 'contato@policlinicasheilladias.com.br', 'Avenida Guarabira', 753, '0', 'Manaira', 'João Pessoa', 'PB', '(83) 3226-3677', 'male', '227070000', 0, '', 0),
(79, 'Gildo Janio de Araujo Silva', 'contato@policlinicasheilladias.com.br', 'Leonel Pinto de Abreu', 1266, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98709-3844', 'male', '280119600', 0, '', 0),
(80, 'Vera Marcia Araujo Dias', 'contato@policlinicasheilladias.com.br', 'Maria Jose Rique', 357, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98895-2447', 'female', '-249253200', 0, '', 0),
(81, 'Maria Aparecida Pereira de Oliveira', 'contato@policlinicasheilladias.com.br', 'Rangel Travassos', 1230, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 3223-1782', 'female', '-564703200', 0, '', 0),
(82, 'Claudeci dos Santos', 'contato@policlinicasheilladias.com.br', 'Presidente Carlos Luz', 98, '0', 'Cristo', 'João Pessoa', 'PB', '(66) 98434-0020', 'male', '-100904400', 0, '', 0),
(83, 'Urbano Feitosa Fragoso', 'contato@policlinicasheilladias.com.br', 'Avenida Dom Bosco', 1021, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98779-8073', 'male', '-641682000', 0, '', 0),
(84, 'Maria Aparecida dos Santos', 'contato@policlinicasheilladias.com.br', 'Pedro Ivo de Paiva', 61, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98875-3276', 'female', '316062000', 0, '', 0),
(85, 'Alice da silva Nunes Gomes', 'contato@policlinicasheilladias.com.br', 'Luzia Pedrosa', 95, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-1220', 'female', '1377226800', 0, '', 0),
(86, 'Marina Perez de Alpenez Pedrosa', 'contato@policlinicasheilladias.com.br', 'dos Milagres', 2111, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98812-3797', 'female', '1435201200', 0, '', 0),
(87, 'Adriana Helena Souza Uchoa', 'contato@policlinicasheilladias.com.br', 'dos Milagres', 1481, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99672-1255', 'female', '246682800', 0, '', 0),
(88, 'Dario Gomes do Nascimento Junior', 'contato@policlinicasheilladias.com.br', 'dos Milagres', 1481, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98828-9289', 'male', '387860400', 0, '', 0),
(89, 'Camile de Assis Schulle', 'contato@policlinicasheilladias.com.br', 'Aviador Roberto Marques', 159, '0', 'Bessa', 'João Pessoa', 'PB', '(47) 99855-5685', 'female', '942976800', 0, '', 0),
(90, 'Josineide Nascimento Silva', 'contato@policlinicasheilladias.com.br', 'Mourize Miranda Gusmão', 197, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-3862', 'female', '440564400', 0, '', 0),
(91, 'Manoel Jacinto da Costa Neto', 'contato@policlinicasheilladias.com.br', 'Luiza Dantas de Medeiros', 261, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 98827-8676', 'male', '976068000', 0, '', 0),
(92, 'José Rivalcy Lacerda Rolim', 'contato@policlinicasheilladias.com.br', 'Epitácio Pessoa', 4840, '0', 'Cabo Branco', 'João Pessoa', 'PB', '(83) 98831-3011', 'male', '-632440800', 0, '', 0),
(93, 'Edmilson José Silva', 'contato@policlinicasheilladias.com.br', 'Maria Jose Rique', 443, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98887-1056', 'male', '1453255200', 0, '', 0),
(94, 'Maria Maximo de Oliveira', 'contato@policlinicasheilladias.com.br', 'Pedro Ivo de Paiva', 332, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-1311', 'female', '-690498000', 0, '', 0),
(95, 'Anne Caroline Bino da Costa', 'contato@policlinicasheilladias.com.br', 'Antonio Marinho Correia', 109, '0', 'Cidade Universitária', 'João Pessoa', 'PB', '(83) 98888-0084', 'female', '941853600', 0, '', 0),
(96, 'Cristiane Andrade Baltar', 'contato@policlinicasheilladias.com.br', 'Antonia Gomes da Silveira', 1579, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98798-6183', 'female', '535687200', 0, '', 0),
(97, 'Ana Sophia Silva Luna', 'contato@policlinicasheilladias.com.br', 'São Judas Tadeus', 328, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98722-8413', 'female', '1311044400', 0, '', 0),
(98, 'Pedro Antonio Alves da Silva', 'contato@policlinicasheilladias.com.br', 'Maurina de Oliveira Santos', 0, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 98756-1892', 'male', '1357610400', 0, '', 0),
(99, 'Ivone Salete Bonafim', 'contato@policlinicasheilladias.com.br', 'Presidente Carlos Luz', 98, '0', 'Cristo', 'João Pessoa', 'PB', '(66) 8434-0020', 'female', '-84834000', 0, '', 0),
(100, 'Gildemberg Batista dos Santos', 'contato@policlinicasheilladias.com.br', 'Avenida Florianópolis', 430, '0', 'Valentina', 'João Pessoa', 'PB', '(83) 98767-3347', 'male', '427431600', 0, '', 0),
(101, 'Ezequiel Santos Soares', 'contato@policlinicasheilladias.com.br', 'Pedro Ivo de Paiva', 61, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98875-3276', 'male', '977968800', 15, '', 0),
(102, 'Iarani Xavier Rodrigues', 'contato@policlinicasheilladias.com.br', 'Rua Jose Francisco da Silva', 811, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-2218', 'female', '-435790800', 0, '', 0),
(103, 'Andreia Rocha Valdevino  ', 'contato@policlinicasheilladias.com.br', 'dos Milagres', 2565, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99985-3178', 'female', '583815600', 0, '', 0),
(104, 'Mariselma de Vasconcelos Cavalcante', 'contato@policlinicasheilladias.com.br', 'Caetano Fig9ueiredo', 1660, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98856-7145', 'female', '452401200', 0, '', 0),
(105, 'Viviane Barbosa de Araujo Silva', 'contato@policlinicasheilladias.com.br', 'dos Milagres', 2001, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99869-6791', 'female', '356583600', 0, '', 0),
(106, 'Bruna Caroline Bonafn', 'contato@policlinicasheilladias.com.br', 'Presidente Carlos Luz', 98, '0', 'Cristo', 'João Pessoa', 'PB', '(66) 84300-20', 'female', '963370800', 0, '', 0),
(107, 'Valderi Pereira da Silva', 'contato@policlinicasheilladias.com.br', 'Feliciano Dourado', 427, '0', 'Torre', 'João Pessoa', 'PB', '(83) 98822-4503', 'male', '-1179608400', 0, '', 0),
(108, 'Gabriele Ariel Telis de Souza', 'contato@policlinicasheilladias.com.br', 'Pedro Ivo de Paiva', 205, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98771-2719', 'female', '920343600', 0, '', 0),
(109, 'Sofia Lorena Silva de Albuquerque', 'contato@policlinicasheilladias.com.br', 'Italia', 29, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98824-8377', 'female', '1451440800', 0, '', 0),
(110, 'Maria Dalva Fernandes da Silva', 'contato@policlinicasheilladias.com.br', 'Felice di Belle', 2010, '0', 'Coste e Silva', 'João Pessoa', 'PB', '(83) 98850-6754', 'female', '-708814800', 0, '', 0),
(111, 'Ivanildo Moreira Paletó', 'contato@policlinicasheilladias.com.br', 'José Francisco da SIlva', 123, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98868-1366', 'male', '-259189200', 0, '', 0),
(112, 'Deverina de Paiva Alves da Silva', 'contato@policlinicasheilladias.com.br', 'Rua Jose Francisco da Silva', 1670, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99302-3042', 'female', '-504910800', 0, '', 0),
(113, 'Heitor Morais Teixeira', 'contato@policlinicasheilladias.com.br', 'Travessa São Luiz', 3, '0', 'Cruz das Armas', 'João Pessoa', 'PB', '(83) 98665-1969', 'male', '1453341600', 0, '', 0),
(114, 'Gizelda Aparecida Diniz Ferreira', 'contato@policlinicasheilladias.com.br', 'Horacio Trajano de Oliveira', 1643, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98849-7407', 'female', '-664405200', 0, '', 0),
(115, 'Claudia Maria de Almeida', 'contato@policlinicasheilladias.com.br', 'Jose Filadelfio de Carvalho', 215, '0', 'Cuiá', 'João Pessoa', 'PB', '(83) 98726-8299', 'female', '6663600', 0, '', 0),
(116, 'Jessica Taylane Santana Barbosa', 'contato@policlinicasheilladias.com.br', 'Desportista Wilson Moura de Almeida', 96, '0', 'João Paulo II', 'João Pessoa', 'PB', '(83) 98734-6078', 'female', '862887600', 0, '', 0),
(117, 'Ivana Godinho de Andrade', 'contato@policlinicasheilladias.com.br', 'Josery Serrano de Assis', 63, '0', 'Cristo', 'João Pessoa', 'PB', '(92) 9229-3718', 'female', '403930800', 0, '', 0),
(118, 'Elza Eleuterio da Costa Vieira', 'contato@policlinicasheilladias.com.br', 'Mourize Miranda Gusmão', 684, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98815-0667', 'female', '-138229200', 0, '', 0),
(119, 'Josefa Felix de Lima', 'contato@policlinicasheilladias.com.br', 'Antonio Teotonio', 55, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3923-5904', 'female', '-1260651600', 0, '', 0),
(120, 'Marcia Luiza Dias da Silva', 'contato@policlinicasheilladias.com.br', 'Maria Jose Rique', 357, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99853-8533', 'female', '752378400', 0, '', 0),
(121, 'Viviane Paula Rodrigues da Costa', 'contato@policlinicasheilladias.com.br', 'Ubirajara dos Santos Lima', 17, '0', 'Cuiá', 'João Pessoa', 'PB', '(83) 98781-0629', 'female', '169095600', 0, '', 0),
(122, 'Alice Gabriele Tavares Silva', 'contato@policlinicasheilladias.com.br', 'Maria Nely Trajano de Souza', 386, '0', 'Agua Fria', 'João Pessoa', 'PB', '(83) 98861-4576', 'female', '1401937200', 0, '', 0),
(123, 'Julia Soares de Oliveira', 'contato@policlinicasheilladias.com.br', 'Avenida 2 de Fevereiro', 1370, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99962-5653', 'female', '1349924400', 0, '', 0),
(124, 'Henrique Gabriel Ferreira de Souza', 'contato@policlinicasheilladias.com.br', 'Dr. Mario Coutinho Sobrinho', 144, '0', 'Valentina', 'João Pessoa', 'PB', '(83) 98822-5286', 'male', '1374634800', 0, '', 0),
(125, 'Kamila Santana Ferreira da Silva', 'contato@policlinicasheilladias.com.br', 'Elias Cavalcante de Albuquerque', 291, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98839-6274', 'female', '1167357600', 0, '', 0),
(126, 'Beatriz Santana Ferreira Pedrosa', 'contato@policlinicasheilladias.com.br', 'Elias Cavalcante de Albuquerque', 291, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98839-6274', 'female', '1056250800', 0, '', 0),
(127, 'Bruno Eduardo Santana Ferreira Pedrosa', 'contato@policlinicasheilladias.com.br', 'Elias Cavalcante de Albuquerque', 291, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98839-6274', 'male', '1093143600', 0, '', 0),
(128, 'Mariana Guilherme Santana da Silva', 'contato@policlinicasheilladias.com.br', 'Elias Cavalcante de Albuquerque', 291, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98839-6274', 'female', '749617200', 0, '', 0),
(129, 'Eugenio Souza ', 'contato@policlinicasheilladias.com.br', 'Antonio Gomes da Silveira', 1363, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99162-8444', 'male', '529556400', 0, '', 0),
(130, 'Rhayssa Souza de Mattos', 'contato@policlinicasheilladias.com.br', 'Fernando Cunha Lima', 1275, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99656-6746', 'female', '712378800', 0, '', 0),
(131, 'Izeneide Vieira Lacerda', 'contato@policlinicasheilladias.com.br', 'Radialista Marconi Almirante', 179, '0', 'Geisel', 'João Pessoa', 'PB', '(83) 3231-1906', 'female', '-916347600', 0, '', 0),
(132, 'Izenete Vieira de Melo', 'contato@policlinicasheilladias.com.br', 'Horacio Trajano de Oliveira', 1830, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3566-8684', 'female', '-986245200', 0, '', 0),
(133, 'Lorenzo Araujo de Brito', 'contato@policlinicasheilladias.com.br', 'Eraldo Ferreira de Nascimento', 11, '0', 'Gramame', 'João Pessoa', 'PB', '(83) 98700-9927', 'male', '1453946400', 0, '', 0),
(134, 'Maia Pérez de Albeniz Pedrosa', 'contato@policlinicasheilladias.com.br', 'Philadelpho Pinto de Carvalho', 167, '0', 'Bessa', 'João Pessoa', 'PB', '(83) 98644-2112', 'female', '1330657200', 0, '', 0),
(135, 'Carlos Andre Lopes da Silva', 'contato@policlinicasheilladias.com.br', 'José Soares', 0, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98739-8689', 'male', '245646000', 0, '', 0),
(136, 'Guilherme Araujo Dela Biana', 'contato@policlinicasheilladias.com.br', 'Avenida Dom Bosco', 879, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98889-7494', 'male', '-209768400', 0, '', 0),
(137, 'Antonio Jose Falcão da Silva', 'contato@policlinicasheilladias.com.br', 'Avenida Guarabira', 521, '0', 'Manaira', 'João Pessoa', 'PB', '(83) 99306-8817', 'male', '-251845200', 0, '', 0),
(138, 'Maria do Socorro Lucena do Nascimento', 'contato@policlinicasheilladias.com.br', 'Maria Jose Rique', 309, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-2537', 'female', '-749336400', 0, '', 0),
(139, 'Cinira Batista de Souza Pedrosa', 'contato@policlinicasheilladias.com.br', 'Professora Luiza Fernandes Vieira', 481, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3512-4144', 'female', '-518302800', 0, '', 0),
(140, 'Tarcio Oliveira', 'contato@policlinicasheilladias.com.br', 'Fernando Cunha Lima', 470, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98848-4156', 'male', '713588400', 0, '', 0),
(141, 'Laisse Cunha de Medeiros', 'contato@policlinicasheilladias.com.br', 'Joana Morais Lordao', 346, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98700-5100', 'female', '901076400', 0, '', 0),
(142, 'Kelly Deise Macedo de Araujo', 'contato@policlinicasheilladias.com.br', 'Francisco Souza Filho', 150, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 32313-50', 'female', '667105200', 0, '', 0),
(143, 'Aline Cristina Ribeiro dos Santos', 'contato@policlinicasheilladias.com.br', 'Horacio Trajano de Oliveira', 615, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98608-1169', 'female', '331700400', 0, '', 0),
(144, 'Maria Amelia Ribeiro Vanderley', 'contato@policlinicasheilladias.com.br', 'Horacio Trajano de Oliveira', 615, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98608-1169', 'female', '1395284400', 0, '', 0),
(145, 'Aghata Julia Cardoso de Medeiros', 'contato@policlinicasheilladias.com.br', 'Ana Leal Ramos', 112, '0', 'Valentina', 'João Pessoa', 'PB', '(83) 98823-3857', 'female', '1410663600', 0, '', 0),
(146, 'Antoniele Cassiano dos Anjos Vaz', 'contato@policlinicasheilladias.com.br', 'Anotnio Gomes da Silveira', 1177, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98603-5507', 'female', '362372400', 0, '', 0),
(147, 'Alessandra da Cunha Chaves', 'contato@policlinicasheilladias.com.br', 'dos Milagres', 1927, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98811-6619', 'female', '207198000', 0, '', 0),
(148, 'Artur Luiz Vieira de Souza', 'contato@policlinicasheilladias.com.br', 'Benicio de Oliveira Lima', 689, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 98603-0162', 'male', '706244400', 0, '', 0),
(149, 'Alessandra Soares de Lima Gomes', 'contato@policlinicasheilladias.com.br', 'São Estevan', 127, '0', 'Alto do Mateus', 'João Pessoa', 'PB', '(83) 98680-5001', 'female', '567050400', 0, '', 0),
(150, 'Jaqueline Ventura de Marque', 'contato@policlinicasheilladias.com.br', 'Morise Miranda Gusmão', 1069, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99838-2000', 'female', '512276400', 0, '', 0),
(151, 'Ana Lucia Pedrosa Costa', 'contato@policlinicasheilladias.com.br', 'dos Milagres', 2111, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-2612', 'female', '-203288400', 0, '', 0),
(152, 'Thalles Kerven Gomes Lins', 'contato@policlinicasheilladias.com.br', 'Compositor Augustim Lara', 1730, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98605-2965', 'male', '916797600', 0, '', 0),
(153, 'Antonio Soares Peixoto', 'contato@policlinicasheilladias.com.br', 'Joana Morais Lordao', 430, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98897-3067', 'male', '-1073077200', 0, '', 0),
(154, 'Anacleide Soares Alves', 'contato@policlinicasheilladias.com.br', 'Adelaide Novais', 488, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98714-0569', 'female', '376714800', 0, '', 0),
(155, 'Maria Laura Dutra Lima', 'contato@policlinicasheilladias.com.br', 'Bom Jesus', 879, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98605-0119', 'female', '1445392800', 0, '', 0),
(156, 'Ivania de Andrade Sá', 'contato@policlinicasheilladias.com.br', 'Avenida Monteiro Lobato', 501, '0', 'Tambaú', 'João Pessoa', 'PB', '(83) 98726-1804', 'female', '-245451600', 0, '', 0),
(157, 'Rita Soares da Silva', 'contato@policlinicasheilladias.com.br', 'Adelaide Novais', 488, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 32230-727', 'female', '-504910800', 62, '', 0),
(158, 'Dione Figueiredo Vanderlei', 'contato@policlinicasheilladias.com.br', 'Vandique Filgueiras', 610, '0', 'Tambauzinho', 'João Pessoa', 'PB', '(83) 98700-6381', 'female', '0', 0, '', 0),
(159, 'Guilherme Teixeira Subam', 'contato@policlinicasheilladias.com.br', 'Antonia Gomes da Silveira', 450, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98750-4091', 'male', '1409108400', 0, '', 0),
(160, 'Mayara Lira SIlva', 'contato@policlinicasheilladias.com.br', 'Antonio Teotonio', 738, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98888-8162', 'female', '505533600', 0, '', 0),
(161, 'Angelica Mota Albuquerque de Lima', 'contato@policlinicasheilladias.com.br', 'Mourize Miranda Gusmão', 710, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-9918', 'female', '339044400', 0, '', 0),
(162, 'Sheilla Danielly Dias Souto', 'contato@policlinicasheilladias.com.br', 'Marieta Steimbach Silva', 106, '0', 'Miramar', 'João Pessoa', 'PB', '(83) 98858-9709', 'female', '438058800', 0, '', 0),
(163, 'Maria Celina Prince da Silva', 'contato@policlinicasheilladias.com.br', 'Bom Jesus', 1220, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98646-9321', 'female', '1356660000', 0, '', 0),
(164, 'Alexandre Magno Jardim', 'contato@policlinicasheilladias.com.br', 'São Miguel', 0, '0', 'Varadouro', 'João Pessoa', 'PB', '(83) 98718-2808', 'male', '0', 0, '', 0),
(165, 'Obde Maria de Lima', 'contato@policlinicasheilladias.com.br', 'Horacio Trajano de Oliveira', 805, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-9918', 'female', '87534000', 0, '', 0),
(166, 'Cristiano Henrique Silva Souto', 'contato@policlinicasheilladias.com.br', 'Marieta Steimbach Silva', 106, '0', 'Miramar', 'João Pessoa', 'PB', '(83) 3566-4879', 'male', '325566000', 0, '', 0),
(167, 'Paulo Ricardo Marques Gonçalves', 'contato@policlinicasheilladias.com.br', 'Afonso Campos', 125, '0', 'Centro', 'João Pessoa', 'PB', '(83) 98857-7382', 'male', '524804400', 0, '', 0),
(168, 'Rosinete Maria Dantas Costa', 'contato@policlinicasheilladias.com.br', 'Vicente Cozza', 481, '0', 'Geisel', 'João Pessoa', 'PB', '(83) 98771-5330', 'female', '13921200', 0, '', 0),
(169, 'Thiago Ferreira de Oliveira', 'contato@policlinicasheilladias.com.br', 'Avenida Rendenção', 626, '0', 'Ilha do Bispo', 'João Pessoa', 'PB', '(83) 98808-0757', 'male', '570938400', 0, '', 0),
(170, 'Rayanna Maria Araujo Alexandre', 'contato@policlinicasheilladias.com.br', 'Mourize Miranda Gusmão', 1202, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-3978', 'female', '1405479600', 0, '', 0),
(171, 'Ana Beatriz Chaves de Oliveira Eliziario', 'contato@policlinicasheilladias.com.br', 'Crlos Dias Fernandes', 415, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98721-4068', 'female', '1454637600', 0, '', 0),
(172, 'Antonio Pires Benjamin', 'contato@policlinicasheilladias.com.br', 'Nereu Ramos', 1854, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98886-7904', 'male', '-709592400', 0, '', 0),
(173, 'Lucimere Medeiros Cavalcantes', 'contato@policlinicasheilladias.com.br', 'José Gomes da Silveira', 783, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98825-9040', 'female', '144471600', 0, '', 0),
(174, 'Aisamaque de Oliveira Muniz', 'contato@policlinicasheilladias.com.br', 'Deputado Napoleão Curel', 271, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98730-1064', 'male', '726026400', 0, '', 0),
(175, 'Elizabete Rodrigues da Silva', 'contato@policlinicasheilladias.com.br', 'Rejane Freire Correia', 771, '0', 'Cidade Universitária', 'João Pessoa', 'PB', '(83) 98848-9690', 'female', '-379026000', 0, '', 0),
(176, 'Duany Cristiny Vieira da Silva', 'contato@policlinicasheilladias.com.br', 'José Francisco da SIlva', 1105, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99998-7832', 'female', '202532400', 0, '', 0),
(177, 'Carla Patricia Silva', 'contato@policlinicasheilladias.com.br', 'Orlando Pereira de Brito', 943, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98797-4401', 'female', '327898800', 0, '', 0),
(178, 'Alice Vitoria Lopes Araujo', 'contato@policlinicasheilladias.com.br', 'Danilo da Penha Paiva', 0, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98622-0453', 'female', '1276570800', 0, '', 0),
(179, 'Maria Jose de Araujo', 'contato@policlinicasheilladias.com.br', 'Olegário Filgueira Napoleao', 17, '0', 'Funcionário II', 'João Pessoa', 'PB', '(83) 98774-2352', 'female', '353818800', 0, '', 0),
(180, 'Edileusa Mateus Gomes', 'contato@policlinicasheilladias.com.br', 'Joana Morais Lordao', 394, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98814-9217', 'female', '-146178000', 0, '', 0),
(181, 'Petronio Borges da Silva', 'contato@policlinicasheilladias.com.br', 'dos Milagres', 1450, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98723-9592', 'male', '211086000', 0, '', 0),
(182, 'Joseilda Cosa da Silva Ribeiro', 'contato@policlinicasheilladias.com.br', 'Coronel João Augusto Lima', 178, '0', 'Geisel', 'João Pessoa', 'PB', '(83) 3231-7165', 'female', '271393200', 0, '', 0),
(183, 'Daniel Brilhante de Oliveira', 'contato@policlinicasheilladias.com.br', 'Rua Jose Francisco da Silva', 1634, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98876-8555', 'male', '340426800', 0, '', 0),
(184, 'Dario Americo Batista', 'contato@policlinicasheilladias.com.br', 'Elijane Feitosa D´Albuquerque', 29, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 98807-4276', 'male', '-54680400', 0, '', 0),
(185, 'Josefa Felix da Silva ', 'contato@policlinicasheilladias.com.br', 'São Geraldo', 544, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98890-4520', 'female', '-450306000', 0, '', 0),
(186, 'Rebeca Ferreira dos Santos', 'contato@policlinicasheilladias.com.br', 'Avenida 2 de Fevereiro', 965, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98842-7335', 'female', '1026961200', 0, '', 0),
(187, 'Iraci Vieira de Freitas', 'contato@policlinicasheilladias.com.br', 'Professor Fenelon Camara', 74, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98850-1968', 'female', '-1329253200', 0, '', 0),
(188, 'Caue Allan Bento Martins', 'contato@policlinicasheilladias.com.br', 'Deputado Napoleão Plinio Salgado', 118, '0', 'Mangabeira I', 'João Pessoa', 'PB', '(83) 98887-1063', 'male', '1054522800', 0, '', 0),
(189, 'Paulo Fernando Gomes dos Santos', 'contato@policlinicasheilladias.com.br', 'Horacio Trajano de Oliveira', 480, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-7651', 'male', '-1268168400', 0, '', 0),
(190, 'Laura Baptista dos Santos', 'contato@policlinicasheilladias.com.br', 'Horacio Trajano de Oliveira', 480, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-7651', 'female', '-1207947600', 0, '', 0),
(191, 'Jeann Klecio da Silva', 'contato@policlinicasheilladias.com.br', 'Leonel Pinto de Abreu', 1337, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98888-1892', 'male', '291265200', 0, '', 0),
(192, 'Helysa Alves do Nascimendo', 'contato@policlinicasheilladias.com.br', 'Belo Horizonte', 0, '0', 'Valentina', 'João Pessoa', 'PB', '(83) 98860-7661', 'female', '1416708000', 0, '', 0),
(193, 'Maria Ferreira da Silva Irmã', 'contato@policlinicasheilladias.com.br', 'Petraca Grisi', 498, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98819-3612', 'female', '-1422651600', 0, '', 0),
(194, 'Pedro Siva da Veiga Pessoa', 'contato@policlinicasheilladias.com.br', 'Caetano de Figueiredo', 1627, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98766-2278', 'male', '1442545200', 0, '', 0),
(195, 'Carlos Emanuel Batista Soares da Silva', 'contato@policlinicasheilladias.com.br', 'Cuiabá', 54, '0', 'Valentina', 'João Pessoa', 'PB', '(83) 3237-8117', 'male', '1122692400', 0, '', 0),
(196, 'Joana D\'arc Lira dos Santos', 'contato@policlinicasheilladias.com.br', 'Presidente Carlos Luz', 674, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98866-6428', 'female', '3121200', 0, '', 0),
(197, 'Lenildo de Sousa Paulino', 'contato@policlinicasheilladias.com.br', 'Maria Araujo de Lima', 160, '0', 'Valentina', 'João Pessoa', 'PB', '(83) 98843-0853', 'male', '540529200', 0, '', 0),
(198, 'Jessé de Oliveira Teófilo', 'contato@policlinicasheilladias.com.br', 'José Francisco da SIlva', 1950, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99657-2220', 'male', '794199600', 0, '', 0),
(199, 'Isabeli Fernandes Marinho', 'contato@policlinicasheilladias.com.br', 'Padre Pedro Maria Serrão', 45, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98786-8824', 'female', '0', 0, '', 0),
(200, 'Aniely Ribeiro de Morais', 'contato@policlinicasheilladias.com.br', 'Doutor Ilton Guedes Pereira', 41, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98816-8348', 'female', '327553200', 0, '', 0),
(201, 'Flavia Janyelle de SOusa Almeida', 'contato@policlinicasheilladias.com.br', 'Maria Alves da SIlva', 116, '0', 'Mangabeira VII', 'João Pessoa', 'PB', '(83) 98604-0024', 'female', '358052400', 0, '', 0),
(202, 'Lucilene de Souza Alves', 'contato@policlinicasheilladias.com.br', 'Avenida 2 de Fevereiro', 1665, '0', 'Rangel', 'João Pessoa', 'PB', '(83) 98888-8598', 'female', '1458270000', 0, '', 0),
(203, 'Silvina Maria Monteiro', 'contato@policlinicasheilladias.com.br', 'Eduardo Felix do Nascimento', 38, '0', 'Valentina', 'João Pessoa', 'PB', '(83) 98765-5744', 'female', '150346800', 0, '', 0),
(204, 'Josinaldo Galdino de Souza', 'contato@policlinicasheilladias.com.br', 'Eduardo Felix do Nascimento', 38, '0', 'Valentina', 'João Pessoa', 'PB', '(83) 98690-5969', 'male', '14007600', 0, '', 0),
(205, 'Carlos Alberto da Silva Alves', 'contato@policlinicasheilladias.com.br', 'Eunápio Vieira Carneiro', 182, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 98730-8378', 'male', '-57531600', 0, '', 0),
(206, 'Mariana Thais de Souza Costa', 'contato@policlinicasheilladias.com.br', 'Manoel Brito', 401, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98731-3051', 'female', '1374462000', 0, '', 0),
(207, 'José Levir Angelo da Silva', 'contato@policlinicasheilladias.com.br', 'Pedro Firmino do Nascime', 567, '0', 'Altiplano', 'João Pessoa', 'PB', '(83) 99984-4007', 'male', '665632800', 0, '', 0),
(208, 'Heliomarques Sales Gomes Pereira', 'contato@policlinicasheilladias.com.br', 'Nereu Ramos', 2085, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98844-0211', 'male', '411102000', 0, '', 0),
(209, 'Adailma de Lima Alverga', 'contato@policlinicasheilladias.com.br', '0', 0, '0', '0', '0', '0', '(83) 98813-4849', 'female', '0', 0, '', 0),
(210, 'Maria Carmem da Rocha Cunha', 'contato@policlinicasheilladias.com.br', 'Petrarca Grisi', 261, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98881-3542', 'female', '-555800400', 0, '', 0),
(211, 'Sophia Nicole Fonseca de Lima', 'contato@policlinicasheilladias.com.br', 'Petrarca Grisi', 174, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98750-3823', 'female', '1278471600', 0, '', 0),
(212, 'João Victor Oliveira de Lucena', 'contato@policlinicasheilladias.com.br', 'Odília T.Sabadelli', 143, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98858-6264', 'male', '879127200', 0, '', 0),
(213, 'Matheus Barbosa de Assis', 'contato@policlinicasheilladias.com.br', 'Arnaldo Costa', 1641, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3508-7497', 'male', '1315278000', 0, '', 0),
(214, 'Clovis Conceição Santos', 'contato@policlinicasheilladias.com.br', 'Caetano de Figueiredo', 1605, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-1480', 'male', '-398725200', 0, '', 0),
(215, 'Schayrone Regina Rodrigues Ribeiro', 'contato@policlinicasheilladias.com.br', 'Professora Luiza Fernandes Vieira', 100, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98702-3767', 'female', '1023332400', 0, '', 0),
(216, 'Luar Barreto Agra', 'contato@policlinicasheilladias.com.br', 'Antonia Gomes da Silveira', 1344, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99857-8854', 'female', '1387159200', 0, '', 0),
(217, 'Maria Alicia de Andrade Pacheco', 'contato@policlinicasheilladias.com.br', 'Presidente José Linhares', 89, '0', 'Bessa', 'João Pessoa', 'PB', '(83) 99191-0592', 'female', '-30227115212', 0, '', 0),
(218, 'Sofia Helena Ferreira de Souza', 'contato@policlinicasheilladias.com.br', 'Avenida Rendenção', 626, '0', 'Ilha do Bispo', 'João Pessoa', 'PB', '(83) 98750-4443', 'female', '1427943600', 0, '', 0),
(219, 'Kyvia Pessoa de Oliveira', 'contato@policlinicasheilladias.com.br', 'Vicente Cozza', 481, '0', 'Geisel', 'João Pessoa', 'PB', '(83) 98884-7815', 'female', '429332400', 0, '', 0),
(220, 'Sergio Ricardo de Andrade Virginio Filho', 'contato@policlinicasheilladias.com.br', 'Antonia Gomes da Silveira', 1609, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99695-8888', 'male', '621831600', 0, '', 0),
(221, 'Juliana da Silva Barbosa', 'contato@policlinicasheilladias.com.br', 'José Francisco da SIlva', 1825, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98604-5853', 'female', '458881200', 0, '', 0),
(222, 'Camilla da Rocha Bezerril', 'contato@policlinicasheilladias.com.br', 'Maria Jose Rique', 381, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3508-3639', 'female', '849146400', 0, '', 0),
(223, 'José Aderaldo de Medeiros Guedes', 'contato@policlinicasheilladias.com.br', 'Arnaldo Costa', 1534, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98783-7945', 'male', '-908744400', 0, '', 0),
(224, 'Guilherme da Rocha Bezerril', 'contato@policlinicasheilladias.com.br', 'Maria Jose Rique', 381, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3508-3639', 'male', '1016852400', 0, '', 0),
(225, 'Marta Maria Alves', 'contato@policlinicasheilladias.com.br', 'Amauri Marcelino Pereira', 36, '0', 'Mangabeira I', 'João Pessoa', 'PB', '(83) 98893-0931', 'female', '92890800', 0, '', 0),
(226, 'Thais Ingrid de Oliveira Tavares', 'contato@policlinicasheilladias.com.br', 'Mourize Miranda Gusmão', 2264, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98892-1987', 'female', '880077600', 0, '', 0),
(227, 'Isabela dos Santos Lourenço', 'contato@policlinicasheilladias.com.br', 'Julia Ribeiro da Silva', 151, '0', 'Centro', 'João Pessoa', 'PB', '(83) 98807-1010', 'female', '1348801200', 0, '', 0),
(228, 'Isabela Domingos do Nascimento', 'contato@policlinicasheilladias.com.br', 'Mourize Miranda Gusmão', 1219, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98844-0631', 'female', '1239591600', 0, '', 0),
(229, 'Kevin Lucas da Costa Emele', 'contato@policlinicasheilladias.com.br', 'Antonia Gomes da Silveira', 1625, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98624-6513', 'male', '967172400', 0, '', 0),
(230, 'Sabrina Rodrigues Targino', 'contato@policlinicasheilladias.com.br', 'Adelaide Novais', 325, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-6540', 'female', '1207796400', 0, '', 0),
(231, 'Eliza Janaina Leite Gomes', 'contato@policlinicasheilladias.com.br', 'José Soares', 894, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98852-6590', 'female', '701665200', 0, '', 0),
(232, 'Thayse de Andrade Brito', 'contato@policlinicasheilladias.com.br', 'Avenida Dom Bosco', 500, '0', 'Mangabeira I', 'João Pessoa', 'PB', '(83) 99969-0377', 'female', '535600800', 0, '', 0),
(233, 'Jose Lucio de Macedo Neto', 'contato@policlinicasheilladias.com.br', 'Olivia de Almeida Guedes', 129, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-4203', 'male', '798692400', 0, '', 0),
(234, 'Davi Rodrigues Leão', 'contato@policlinicasheilladias.com.br', 'Horacio Trajano de Oliveira', 1975, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3231-6086', 'male', '688096800', 0, '', 0),
(235, 'Denise Helen de Souza Pedroza', 'contato@policlinicasheilladias.com.br', 'Professora Luiza Fernandes Vieira', 481, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3512-4144', 'female', '628826400', 0, '', 0),
(236, 'Heloysa Laura Bezerra da Silva', 'contato@policlinicasheilladias.com.br', 'Antonio Martins', 9, '0', 'Geisel', 'João Pessoa', 'PB', '(83) 98870-0743', 'female', '1219201200', 0, '', 0),
(237, 'Severino Ferreira Lopes', 'contato@policlinicasheilladias.com.br', 'Antonio de Paiva Vasconcelos', 337, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 9867-0359', 'male', '-15195600', 0, '', 0),
(238, 'David Alberte de Silva Alves', 'contato@policlinicasheilladias.com.br', 'Eunápio Vieira Carneiro', 182, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 98730-8378', 'male', '1301281200', 0, '', 0),
(239, 'Valdir Lacerda Cavalcante', 'contato@policlinicasheilladias.com.br', 'Caetano de Figueiredo', 1275, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3566-8196', 'male', '-502146000', 0, '', 0),
(240, 'Manoel Farias Marciel', 'contato@policlinicasheilladias.com.br', 'Presidente Carlos Luz', 458, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99882-2236', 'male', '-871333200', 0, '', 0),
(241, 'Franci Erika da Silva Rocha', 'contato@policlinicasheilladias.com.br', 'Arnaldo Costa', 1434, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98744-3300', 'female', '339735600', 0, '', 0),
(242, 'Rebeca Uchoa Rangel Farias', 'contato@policlinicasheilladias.com.br', 'Paulo Gomes de Almeida', 52, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 98867-8835', 'female', '990586800', 0, '', 0),
(243, 'Aparecida de Fatima Uchoa Rangel', 'contato@policlinicasheilladias.com.br', 'Paulo Gomes de Almeida', 52, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 98867-8835', 'female', '-340059600', 0, '', 0),
(244, 'Telma Cilene Rocha Ramalho', 'contato@policlinicasheilladias.com.br', 'José Gomes da Silveira', 855, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-2401', 'female', '-93564000', 0, '', 0),
(245, 'Ana Delia Correia Guedes Duque de Abrantes ', 'contato@policlinicasheilladias.com.br', 'Arnaldo Costa', 1534, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98783-7945', 'female', '-153784800', 0, '', 0),
(246, 'Aercio Segundo Costa Soares', 'contato@policlinicasheilladias.com.br', 'Orlando do Rego Luga', 120, '0', 'Muçumagro', 'João Pessoa', 'PB', '(83) 98807-5774', 'male', '1414375200', 0, '', 0),
(247, 'Gabriel Deivysson Soares da Silva', 'contato@policlinicasheilladias.com.br', 'Orlando do Rego Luga', 120, '0', 'Muçumagro', 'João Pessoa', 'PB', '(83) 98807-5774', 'male', '1227232800', 0, '', 0),
(248, 'Thiago Serafim da silva', 'contato@policlinicasheilladias.com.br', 'Petrarca Grisi', 261, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98679-2161', 'male', '1188442800', 0, '', 0),
(249, 'Sebastião Torre dos Santos', 'contato@policlinicasheilladias.com.br', 'Luiza Dantas de Medeiros', 411, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 98854-6120', 'male', '-820789200', 0, '', 0),
(250, 'Bianca Almeia Cavalcante', 'contato@policlinicasheilladias.com.br', 'Benetico Cesar Paiva', 85, '0', 'Mangabeira I', 'João Pessoa', 'PB', '(83) 98881-9954', 'female', '1092279600', 0, '', 0),
(251, 'Glivaldete Costa de Macedo', 'contato@policlinicasheilladias.com.br', 'Olivia de Almeida Guedes', 129, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-4203', 'female', '-42411600', 0, '', 0),
(252, 'Bianca de Sousa Marinho', 'contato@policlinicasheilladias.com.br', 'Adão Viana Rosa', 29, '0', 'Aeroclube', 'João Pessoa', 'PB', '(22) 99920-7094', 'female', '511585200', 0, '', 0),
(253, 'Soraya Figueredo Brilhante Vasconcelos', 'contato@policlinicasheilladias.com.br', 'Joana Domingos Alves', 124, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 99138-0140', 'female', '373345200', 0, '', 0),
(254, 'João Victor Lima Aureliano', 'contato@policlinicasheilladias.com.br', 'Arnaldo Costa', 14, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 3223-2344', 'male', '1276138800', 0, '', 0),
(255, 'Genilton de França Barros', 'contato@policlinicasheilladias.com.br', 'Luiza Dantas de Medeiros', 261, '0', 'José Américo', 'João Pessoa', 'PB', '(83) 99868-5177', 'male', '-10962000', 0, '', 0),
(256, 'Ligia Rolim de Alencar Marques Costa', 'contato@policlinicasheilladias.com.br', 'Joana Morais Lordao', 370, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98870-1023', 'female', '-9838800', 0, '', 0),
(257, 'Thomaz Alex Pessoa Camelo', 'contato@policlinicasheilladias.com.br', 'Jose da Costa Gomes', 94, '0', 'Agua Fria', 'João Pessoa', 'PB', '(83) 98663-0144', 'male', '374036400', 0, '', 0),
(258, 'Carla da Silva Santos', 'contato@policlinicasheilladias.com.br', 'Professora Luiza Fernandes Vieira', 1551, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98833-8139', 'female', '430455600', 0, '', 0),
(259, 'Iasmim Araújo de Souza Coutinho', 'contato@policlinicasheilladias.com.br', 'Ranieri Mazilli', 1755, '0', 'Cristo', 'João Pessoa', 'PB', '(83) 98861-2831', 'female', '872737200', 0, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'income expense',
  `amount` longtext COLLATE utf8_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `payment_method` longtext COLLATE utf8_unicode_ci NOT NULL,
  `invoice_number` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pharmacist`
--

CREATE TABLE `pharmacist` (
  `pharmacist_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacist`
--

INSERT INTO `pharmacist` (`pharmacist_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'farmaceutico', 'farmaceutico@policlinicashilladias.com.br', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `prescription`
--

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `case_history` longtext COLLATE utf8_unicode_ci NOT NULL,
  `medication` longtext COLLATE utf8_unicode_ci NOT NULL,
  `note` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `prescription`
--

INSERT INTO `prescription` (`prescription_id`, `timestamp`, `doctor_id`, `patient_id`, `case_history`, `medication`, `note`) VALUES
(1, '1446127200', 3, 1, '', 'Uso horal medicamento etc.<br>', '');

-- --------------------------------------------------------

--
-- Table structure for table `receipt_doctor`
--

CREATE TABLE `receipt_doctor` (
  `receipt_doctor_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `amount` double NOT NULL,
  `amount_honorary` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_exam_doctor`
--

CREATE TABLE `receipt_exam_doctor` (
  `receipt_exam_doctor_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `amount` double NOT NULL,
  `amount_third` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_exam_patient`
--

CREATE TABLE `receipt_exam_patient` (
  `receipt_exam_patient_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `amount` double NOT NULL,
  `amont_honorary` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipt_patient`
--

CREATE TABLE `receipt_patient` (
  `receipt_pacient_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `payment_type` text COLLATE utf8_unicode_ci NOT NULL,
  `payment_installment` int(11) NOT NULL,
  `amount` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receptionist`
--

CREATE TABLE `receptionist` (
  `receptionist_id` int(11) NOT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `receptionist`
--

INSERT INTO `receptionist` (`receptionist_id`, `name`, `email`, `password`, `address`, `phone`) VALUES
(1, 'Recepção', 'recepcao@policlinicasheilladias.com.br', 'f57c336b51e4d75f1c18032e5bb9258eea1deed3', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `type` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT 'operation,birth,death',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` longtext COLLATE utf8_unicode_ci NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `settings_id` int(11) NOT NULL,
  `type` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`settings_id`, `type`, `description`) VALUES
(1, 'system_name', 'HMS'),
(2, 'system_title', 'HMS'),
(3, 'address', 'Av Ranieri Massili, 1681'),
(4, 'phone', '(83)99963-3221'),
(5, 'paypal_email', 'paypal@policlinicasheilladias.com.br'),
(6, 'currency', 'R$'),
(7, 'system_email', 'contato@policlinicasheilladias.com.br'),
(8, 'buyer', 'SheillaDias'),
(9, 'purchase_code', '0000'),
(11, 'language', 'portuguese'),
(12, 'text_align', 'left-to-right'),
(13, 'system_currency_id', '1'),
(14, 'clickatell_user', 'ISAIASNETO'),
(15, 'clickatell_password', 'djpara5751'),
(16, 'clickatell_api_id', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accountant`
--
ALTER TABLE `accountant`
  ADD PRIMARY KEY (`accountant_id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `bed`
--
ALTER TABLE `bed`
  ADD PRIMARY KEY (`bed_id`);

--
-- Indexes for table `bed_allotment`
--
ALTER TABLE `bed_allotment`
  ADD PRIMARY KEY (`bed_allotment_id`);

--
-- Indexes for table `blood_bank`
--
ALTER TABLE `blood_bank`
  ADD PRIMARY KEY (`blood_group_id`);

--
-- Indexes for table `blood_donor`
--
ALTER TABLE `blood_donor`
  ADD PRIMARY KEY (`blood_donor_id`);

--
-- Indexes for table `currency`
--
ALTER TABLE `currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `diagnosis_report`
--
ALTER TABLE `diagnosis_report`
  ADD PRIMARY KEY (`diagnosis_report_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doctor_id`);

--
-- Indexes for table `email_template`
--
ALTER TABLE `email_template`
  ADD PRIMARY KEY (`email_template_id`);

--
-- Indexes for table `exam`
--
ALTER TABLE `exam`
  ADD PRIMARY KEY (`exam_id`),
  ADD UNIQUE KEY `exam_id` (`exam_id`);

--
-- Indexes for table `exam_type`
--
ALTER TABLE `exam_type`
  ADD PRIMARY KEY (`exam_type_id`),
  ADD UNIQUE KEY `exam_type_id` (`exam_type_id`);

--
-- Indexes for table `form_element`
--
ALTER TABLE `form_element`
  ADD PRIMARY KEY (`form_element_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indexes for table `laboratorist`
--
ALTER TABLE `laboratorist`
  ADD PRIMARY KEY (`laboratorist_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`phrase_id`);

--
-- Indexes for table `medicine`
--
ALTER TABLE `medicine`
  ADD PRIMARY KEY (`medicine_id`);

--
-- Indexes for table `medicine_category`
--
ALTER TABLE `medicine_category`
  ADD PRIMARY KEY (`medicine_category_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`);

--
-- Indexes for table `note`
--
ALTER TABLE `note`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `notice`
--
ALTER TABLE `notice`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `noticeboard`
--
ALTER TABLE `noticeboard`
  ADD PRIMARY KEY (`notice_id`);

--
-- Indexes for table `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`nurse_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pharmacist`
--
ALTER TABLE `pharmacist`
  ADD PRIMARY KEY (`pharmacist_id`);

--
-- Indexes for table `prescription`
--
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`prescription_id`);

--
-- Indexes for table `receipt_doctor`
--
ALTER TABLE `receipt_doctor`
  ADD PRIMARY KEY (`receipt_doctor_id`);

--
-- Indexes for table `receipt_exam_doctor`
--
ALTER TABLE `receipt_exam_doctor`
  ADD PRIMARY KEY (`receipt_exam_doctor_id`);

--
-- Indexes for table `receipt_patient`
--
ALTER TABLE `receipt_patient`
  ADD PRIMARY KEY (`receipt_pacient_id`);

--
-- Indexes for table `receptionist`
--
ALTER TABLE `receptionist`
  ADD PRIMARY KEY (`receptionist_id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`settings_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accountant`
--
ALTER TABLE `accountant`
  MODIFY `accountant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `bed`
--
ALTER TABLE `bed`
  MODIFY `bed_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bed_allotment`
--
ALTER TABLE `bed_allotment`
  MODIFY `bed_allotment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blood_bank`
--
ALTER TABLE `blood_bank`
  MODIFY `blood_group_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `blood_donor`
--
ALTER TABLE `blood_donor`
  MODIFY `blood_donor_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `currency`
--
ALTER TABLE `currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `diagnosis_report`
--
ALTER TABLE `diagnosis_report`
  MODIFY `diagnosis_report_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `doctor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `email_template`
--
ALTER TABLE `email_template`
  MODIFY `email_template_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `exam_type`
--
ALTER TABLE `exam_type`
  MODIFY `exam_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `form_element`
--
ALTER TABLE `form_element`
  MODIFY `form_element_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `laboratorist`
--
ALTER TABLE `laboratorist`
  MODIFY `laboratorist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `phrase_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;
--
-- AUTO_INCREMENT for table `medicine`
--
ALTER TABLE `medicine`
  MODIFY `medicine_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `medicine_category`
--
ALTER TABLE `medicine_category`
  MODIFY `medicine_category_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `note`
--
ALTER TABLE `note`
  MODIFY `note_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notice`
--
ALTER TABLE `notice`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `noticeboard`
--
ALTER TABLE `noticeboard`
  MODIFY `notice_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nurse`
--
ALTER TABLE `nurse`
  MODIFY `nurse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;
--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pharmacist`
--
ALTER TABLE `pharmacist`
  MODIFY `pharmacist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `prescription`
--
ALTER TABLE `prescription`
  MODIFY `prescription_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `receipt_patient`
--
ALTER TABLE `receipt_patient`
  MODIFY `receipt_pacient_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `receptionist`
--
ALTER TABLE `receptionist`
  MODIFY `receptionist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `settings_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
