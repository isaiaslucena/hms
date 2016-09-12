CREATE TABLE accountant (
	accountant_id int NOT NULL,
	"name" text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	address text NOT NULL,
	phone text NOT NULL,
	PRIMARY KEY (accountant_id)
);
CREATE TABLE "admin" (
	admin_id int NOT NULL,
	"name" text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	PRIMARY KEY (admin_id)
);
CREATE TABLE appointment (
	appointment_id int NOT NULL,
	"timestamp" text NOT NULL,
	doctor_id int NOT NULL,
	patient_id int NOT NULL,
	status text NOT NULL,
	PRIMARY KEY (appointment_id)
);
CREATE TABLE bed (
	bed_id int NOT NULL,
	bed_number text NOT NULL,
	"type" text NOT NULL,
	status int NOT NULL,
	description text NOT NULL,
	PRIMARY KEY (bed_id)
);
CREATE TABLE bed_allotment (
	bed_allotment_id int NOT NULL,
	bed_id int NOT NULL,
	patient_id int NOT NULL,
	allotment_timestamp text NOT NULL,
	discharge_timestamp text NOT NULL,
	PRIMARY KEY (bed_allotment_id)
);
CREATE TABLE blood_bank (
	blood_group_id int NOT NULL,
	blood_group text NOT NULL,
	status text NOT NULL,
	PRIMARY KEY (blood_group_id)
);
CREATE TABLE blood_donor (
	blood_donor_id int NOT NULL,
	"name" text NOT NULL,
	blood_group text NOT NULL,
	sex text NOT NULL,
	age int NOT NULL,
	phone text NOT NULL,
	email text NOT NULL,
	address text NOT NULL,
	last_donation_timestamp int NOT NULL,
	PRIMARY KEY (blood_donor_id)
);
CREATE TABLE currency (
	currency_id int NOT NULL,
	currency_code text NOT NULL,
	currency_symbol text NOT NULL,
	currency_name text NOT NULL,
	PRIMARY KEY (currency_id)
);
CREATE TABLE department (
	department_id int NOT NULL,
	"name" text NOT NULL,
	description text NOT NULL,
	PRIMARY KEY (department_id)
);
CREATE TABLE diagnosis_report (
	diagnosis_report_id int NOT NULL,
	report_type text NOT NULL,
	document_type text NOT NULL,
	file_name text NOT NULL,
	prescription_id int NOT NULL,
	description text NOT NULL,
	"timestamp" int NOT NULL,
	laboratorist_id int NOT NULL,
	PRIMARY KEY (diagnosis_report_id)
);
CREATE TABLE doctor (
	doctor_id int NOT NULL,
	"name" text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	address text NOT NULL,
	phone text NOT NULL,
	department_id int NOT NULL,
	profile text NOT NULL,
	PRIMARY KEY (doctor_id)
);
CREATE TABLE email_template (
	email_template_id int NOT NULL,
	task text NOT NULL,
	subject text NOT NULL,
	body text NOT NULL,
	instruction text NOT NULL,
	PRIMARY KEY (email_template_id)
);
CREATE TABLE form_element (
	form_element_id int NOT NULL,
	"type" text NOT NULL,
	html text NOT NULL,
	PRIMARY KEY (form_element_id)
);
CREATE TABLE invoice (
	invoice_id int NOT NULL,
	invoice_number text NOT NULL,
	patient_id int NOT NULL,
	title text NOT NULL,
	invoice_entries text NOT NULL,
	creation_timestamp text NOT NULL,
	due_timestamp text NOT NULL,
	status text NOT NULL,
	vat_percentage text NOT NULL,
	discount_amount text NOT NULL,
	PRIMARY KEY (invoice_id)
);
CREATE TABLE laboratorist (
	laboratorist_id int NOT NULL,
	"name" text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	address text NOT NULL,
	phone text NOT NULL,
	PRIMARY KEY (laboratorist_id)
);
CREATE TABLE "language" (
	phrase_id int NOT NULL,
	phrase text NOT NULL,
	english text NOT NULL,
	bengali text NOT NULL,
	spanish text NOT NULL,
	arabic text NOT NULL,
	dutch text NOT NULL,
	polish text NOT NULL,
	german text NOT NULL,
	french text NOT NULL,
	italian text NOT NULL,
	russian text NOT NULL,
	portugese text NOT NULL,
	PRIMARY KEY (phrase_id)
);
CREATE TABLE medicine (
	medicine_id int NOT NULL,
	"name" text NOT NULL,
	medicine_category_id int NOT NULL,
	description text NOT NULL,
	price text NOT NULL,
	manufacturing_company text NOT NULL,
	status text NOT NULL,
	PRIMARY KEY (medicine_id)
);
CREATE TABLE medicine_category (
	medicine_category_id int NOT NULL,
	"name" text NOT NULL,
	description text NOT NULL,
	PRIMARY KEY (medicine_category_id)
);
CREATE TABLE message (
	message_id int NOT NULL,
	message_thread_code text NOT NULL,
	message text NOT NULL,
	sender text NOT NULL,
	"timestamp" text NOT NULL,
	read_status int NOT NULL,
	PRIMARY KEY (message_id)
);
CREATE TABLE message_thread (
	message_thread_id int NOT NULL,
	message_thread_code text NOT NULL,
	sender text NOT NULL,
	reciever text NOT NULL,
	last_message_timestamp text NOT NULL,
	PRIMARY KEY (message_thread_id)
);
CREATE TABLE note (
	note_id int NOT NULL,
	note text NOT NULL,
	user_type text NOT NULL,
	user_id int NOT NULL,
	color text NOT NULL,
	timestamp_create text NOT NULL,
	timestamp_last_update text NOT NULL,
	PRIMARY KEY (note_id)
);
CREATE TABLE notice (
	notice_id int NOT NULL,
	title text NOT NULL,
	description text NOT NULL,
	start_timestamp text NOT NULL,
	end_timestamp text NOT NULL,
	PRIMARY KEY (notice_id)
);
CREATE TABLE noticeboard (
	notice_id int NOT NULL,
	notice_title text NOT NULL,
	notice text NOT NULL,
	create_timestamp int NOT NULL,
	PRIMARY KEY (notice_id)
);
CREATE TABLE nurse (
	nurse_id int NOT NULL,
	"name" text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	address text NOT NULL,
	phone text NOT NULL,
	PRIMARY KEY (nurse_id)
);
CREATE TABLE patient (
	patient_id int NOT NULL,
	"name" text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	address text NOT NULL,
	phone text NOT NULL,
	sex text NOT NULL,
	birth_date text NOT NULL,
	age int NOT NULL,
	blood_group text NOT NULL,
	account_opening_timestamp int NOT NULL,
	PRIMARY KEY (patient_id)
);
CREATE TABLE payment (
	payment_id int NOT NULL,
	"type" text NOT NULL,
	amount text NOT NULL,
	title text NOT NULL,
	description text NOT NULL,
	payment_method text NOT NULL,
	invoice_number text NOT NULL,
	"timestamp" text NOT NULL,
	PRIMARY KEY (payment_id)
);
CREATE TABLE pharmacist (
	pharmacist_id int NOT NULL,
	"name" text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	address text NOT NULL,
	phone text NOT NULL,
	PRIMARY KEY (pharmacist_id)
);
CREATE TABLE prescription (
	prescription_id int NOT NULL,
	"timestamp" text NOT NULL,
	doctor_id int NOT NULL,
	patient_id int NOT NULL,
	case_history text NOT NULL,
	medication text NOT NULL,
	note text NOT NULL,
	PRIMARY KEY (prescription_id)
);
CREATE TABLE receptionist (
	receptionist_id int NOT NULL,
	"name" text NOT NULL,
	email text NOT NULL,
	"password" text NOT NULL,
	address text NOT NULL,
	phone text NOT NULL,
	PRIMARY KEY (receptionist_id)
);
CREATE TABLE report (
	report_id int NOT NULL,
	"type" text NOT NULL,
	description text NOT NULL,
	"timestamp" text NOT NULL,
	doctor_id int NOT NULL,
	patient_id int NOT NULL,
	PRIMARY KEY (report_id)
);
CREATE TABLE settings (
	settings_id int NOT NULL,
	"type" text NOT NULL,
	description text NOT NULL,
	PRIMARY KEY (settings_id)
);
INSERT INTO admin(admin_id, "name", email, "password") VALUES (1, 'Mr. Admin', 'admin@tear.inf.br', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (1, 'login', 'Login', 'লগইন', 'Iniciar Sesión', 'تسجيل الدخول', 'Login', 'Login', 'Einloggen', 'S''identifier', 'Login', 'Войти', 'Conecte-Se');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (2, 'forgot_password', 'Forgot Password', 'পাসওয়ার্ড ভুলে গেছেন', '¿Has Olvidado Tu Contraseña', 'هل نسيت كلمة المرور', 'Wachtwoord vergeten', 'Nie pamiętam hasła', 'Passwort Vergessen', 'Mot De Passe Oublié', 'Ha Dimenticato La Password', 'Забыли пароль', 'Esqueceu Sua Senha');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (3, 'reset_password', 'Reset Password', 'পাসওয়ার্ড রিসেট', 'Restablecer contraseña', 'إعادة تعيين كلمة المرور', 'Reset Password', 'Resetowanie hasła', 'Kennwort zurücksetzen', 'Réinitialiser mot de passe', 'Ripristino password', 'Сбросить пароль', 'Reset Password');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (4, 'return_to_login_page', 'Return To Login Page', 'পাতা লগইন ফিরে', 'Volver a inicio página', 'العودة إلى تسجيل الدخول الصفحة', 'Keer terug naar Inlogpagina', 'Powrót do logowania Page', 'Zurück zur Anmeldeseite Seite', 'Return to Login page', 'Torna a Login Pagina', 'Вернуться на страницу входа', 'Retornar à página de login');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (5, 'admin_dashboard', 'Admin Dashboard', 'অ্যাডমিন ড্যাশবোর্ড', 'Dashboard de administración', 'المشرف لوحة', 'Admin Dashboard', 'Panel administratora', 'Admin-Dashboard', 'Admin Dashboard', 'Admin Dashboard', 'Админ Панель', 'Admin Dashboard');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (6, 'welcome', 'Welcome', 'স্বাগত', 'Bienvenida', 'ترحيب', 'Welkom', 'Powitanie', 'Willkommen', 'Bienvenue', 'Benvenuto', 'Добро пожаловать', 'Bem-vindo');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (7, 'edit_profile', 'Edit Profile', 'প্রোফাইল সম্পাদনা করুন', 'Editar Perfil', 'تعديل الملف الشخصي', 'Profiel Bewerken', 'Edytuj Profil', 'Profil bearbeiten', 'Modifier le profil', 'Modifica profilo', 'Редактировать профиль', 'Editar Perfil');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (8, 'change_password', 'Change Password', 'পাসওয়ার্ড পরিবর্তন করুন', 'Cambiar la contraseña', 'تغيير كلمة المرور', 'Wachtwoord wijzigen', 'Zmień hasło', 'Kennwort ändern', 'Changer le mot de passe', 'Cambiare la password', 'Сменить пароль', 'Alterar a senha');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (9, 'dashboard', 'Dashboard', 'ড্যাশবোর্ড', 'Salpicadero', 'لوحة القيادة', 'Dashboard', 'Tablica rozdzielcza', 'Armaturenbrett', 'Tableau de bord', 'Cruscotto', 'Приборная панель', 'Painel de instrumentos');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (10, 'department', 'Department', 'বিভাগ', 'Departamento', 'قسم', 'Afdeling', 'Dział', 'Abteilung', 'Département', 'Reparto', 'Отдел', 'Departamento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (11, 'doctor', 'Doctor', 'ডাক্তার', 'Médico', 'طبيب', 'Dokter', 'Lekarz', 'Arzt', 'Médecin', 'Medico', 'Врач', 'Médico');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (12, 'patient', 'Patient', 'রোগী', 'Paciente', 'المريض', 'Patiënt', 'Pacjent', 'Patient', 'Patient', 'Paziente', 'Пациент', 'Paciente');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (13, 'nurse', 'Nurse', 'নার্স', 'Enfermera', 'ممرضة', 'Verpleegster', 'Pielęgniarka', 'Krankenschwester', 'Infirmière', 'Infermiera', 'Медсестра', 'Enfermeira');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (14, 'pharmacist', 'Pharmacist', 'কম্পউণ্ডার', 'Farmacéutico', 'صيدلي', 'Apotheker', 'Farmaceuta', 'Apotheker', 'Pharmacien', 'Farmacista', 'Фармацевт', 'Farmacêutico');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (15, 'laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorio Unidad', 'Laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorist', 'Laboratorista');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (16, 'accountant', 'Accountant', 'হিসাবরক্ষক', 'Contador', 'محاسب', 'Accountant', 'Księgowy', 'Buchhalter', 'Comptable', 'Ragioniere', 'Бухгалтер', 'Contador');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (17, 'monitor_hospital', 'Monitor Hospital', 'মনিটর হাসপাতালে', 'Hospital de monitor', 'مستشفى رصد', 'Monitor Ziekenhuis', 'Szpital monitora', 'Monitor-Krankenhaus', 'Hôpital Moniteur', 'Monitor Ospedale', 'Больница Monitor', 'Hospital do Monitor');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (18, 'payment_history', 'Payment History', 'অর্থ প্রদান ইতিহাস', 'Historial de pagos', 'تاريخ الدفع', 'Betaalgeschiedenis', 'Historia płatności', 'Zahlungsverlauf', 'Historique des paiements', 'Cronologia pagamenti', 'История платежей', 'Histórico de pagamentos');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (19, 'bed_allotment', 'Bed Allotment', 'বিছানা নাস্তা বরাদ্দ', 'Asignación de cama', 'السرير التخصيص', 'Bed Toewijzing', 'Łóżko Przydziału', 'Bed Zuteilung', 'Chambres surallocation', 'Bed Allotment', 'Кровать Выделение', 'Bed Loteamento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (20, 'blood_bank', 'Blood Bank', 'রক্তভাণ্ডার', 'Banco de sangre', 'بنك الدم', 'Bloedbank', 'Bank Krwi', 'Blutbank', 'Banque de sang', 'Banca del Sangue', 'Банк крови', 'Banco de sangue');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (21, 'blood_donor', 'Blood Donor', 'রক্ত দাতার', 'Donante de sangre', 'المتبرعين بالدم', 'Blood Donor', 'Dawców Krwi', 'Blutspender', 'don de sang', 'Donatori di sangue', 'Донора крови', 'Doador de sangue');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (22, 'medicine', 'Medicine', 'ঔষধ', 'Medicina', 'دواء', 'Geneeskunde', 'Medycyna', 'Medizin', 'Médecine', 'Medicina', 'Медицина', 'Medicina');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (23, 'operation_report', 'Operation Report', 'অপারেশন রিপোর্ট', 'Operación Reportar', 'عملية تقرير', 'Operatie Report', 'Operacja Zgłoś', 'Betriebsbericht', 'Rapport d''opération', 'Rapporto Operazione', 'Операция Сообщить', 'Relatório de Operação');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (24, 'birth_report', 'Birth Report', 'জন্ম রিপোর্ট', 'Informe Nacimiento', 'تقرير الميلاد', 'Geboorte Report', 'Zgłoś urodzenia', 'Geburt Bericht', 'Naissance Rapport', 'Nascita Rapporto', 'Сообщить о рождении', 'Relatório Nascimento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (25, 'death_report', 'Death Report', 'মৃত্যু রিপোর্ট', 'Informe de la Muerte', 'الموت تقرير', 'Dood Report', 'Śmierć Zgłoś', 'Tod Bericht', 'Rapport mort', 'Morte Relazione', 'Смерть Сообщить', 'Relatório Morte');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (26, 'settings', 'Settings', 'সেটিংস', 'Ajustes', 'الإعدادات', 'Instellingen', 'Ustawienia', 'Einstellungen', 'Paramètres', 'Impostazioni', 'Настройки', 'Definições');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (27, 'system_settings', 'System Settings', 'সিস্টেম সেটিংস', 'Configuración del sistema', 'إعدادات النظام', 'Systeeminstellingen', 'Ustawienia systemowe', 'Systemeinstellungen', 'Paramètres système', 'Impostazioni di sistema', 'Системные настройки', 'Configurações do sistema');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (28, 'language_settings', 'Language Settings', 'ভাষা সেটিংস', 'Configuración de idioma', 'إعدادات اللغة', 'Taalinstellingen', 'Ustawienia języka', 'Spracheinstellungen', 'Paramètres de langue', 'Impostazioni lingua', 'Настройки языка', 'Definições de idioma');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (29, 'account', 'Account', 'হিসাব', 'Cuenta', 'حساب', 'Rekening', 'Konto', 'Konto', 'Compte', 'Conto', 'Счет', 'Conta');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (30, 'payment', 'Payment', 'প্রদান', 'Pago', 'دفع', 'Betaling', 'Płatność', 'Bezahlung', 'Paiement', 'Pagamento', 'Оплата', 'Pagamento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (31, 'delete', 'Delete', 'মুছে দিন', 'Borrar', 'حذف', 'Verwijderen', 'Usunąć', 'Löschen', 'Effacer', 'Cancellare', 'Удалять', 'Excluir');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (32, 'cancel', 'Cancel', 'বাতিল', 'Cancelar', 'إلغاء', 'Annuleren', 'Anulować', 'Stornieren', 'Annuler', 'Cancellare', 'Отменить', 'Cancelar');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (33, 'add_department', 'Add Department', 'বিভাগ যোগ করুন', 'Añadir Departamento', 'إضافة زارة', 'Toevoegen afdeling', 'Dodaj Działem', 'In Abteilung', 'Ajouter Département', 'Aggiungere Dipartimento', 'Добавить в отдел', 'Adicionar Departamento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (34, 'name', 'Name', 'নাম', 'Nombre', 'اسم', 'Naam', 'Nazwa', 'Name', 'Nom', 'Nome', 'Имя', 'Nome');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (35, 'description', 'Description', 'বর্ণনা', 'Descripción', 'وصف', 'Beschrijving', 'Opis', 'Beschreibung', 'Description', 'Descrizione', 'Описание', 'Descrição');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (36, 'options', 'Options', 'বিকল্প', 'Opciones', 'خيارات', 'Opties', 'Opcje', 'Optionen', 'Options', 'Opzioni', 'Опции', 'Opções');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (37, 'add_doctor', 'Add Doctor', 'ডাক্তার যোগ করুন', 'Añadir Médico', 'إضافة طبيب', 'Voeg Doctor', 'Dodaj Doctor', 'Fügen Doktor', 'Ajouter Docteur', 'Aggiungi Dottore', 'Добавить доктор', 'Adicionar Doctor');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (38, 'image', 'Image', 'ভাবমূর্তি', 'Imagen', 'صورة', 'Afbeelding', 'Obraz', 'Bild', 'Image', 'Immagine', 'Изображение', 'Imagem');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (39, 'email', 'Email', 'ইমেল', 'Correo electrónico', 'البريد الإلكتروني', 'E-mail', 'E-mail', 'E-Mail', 'Email', 'Email', 'Email', 'Email');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (40, 'address', 'Address', 'ঠিকানা', 'Dirección', 'عنوان', 'Adres', 'Adres', 'Anschrift', 'Adresse', 'Indirizzo', 'Адрес', 'Endereço');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (41, 'phone', 'Phone', 'ফোন', 'Teléfono', 'هاتف', 'Telefoon', 'Telefon', 'Telefon', 'Téléphone', 'Telefono', 'Телефон', 'Telefone');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (42, 'profile', 'Profile', 'প্রোফাইল', 'Perfil', 'الملف الشخصي', 'Profiel', 'Profil', 'Profil', 'Profil', 'Profilo', 'Профиль', 'Perfil');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (43, 'edit_department', 'Edit Department', 'সম্পাদনা করুন বিভাগের', 'Editar Departamento', 'تحرير زارة', 'Afdeling bewerken', 'Edycja Wydział', 'Abteilung bearbeiten', 'Modifier Département', 'Modifica Dipartimento', 'Редактировать Департамент', 'Editar Departamento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (44, 'password', 'Password', 'পাসওয়ার্ড', 'Contraseña', 'كلمة المرور', 'Wachtwoord', 'Hasło', 'Passwort', 'Mot de passe', 'Password', 'Пароль', 'Senha');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (45, 'select_department', 'Select Department', 'নির্বাচন বিভাগের', 'Seleccione Departamento', 'وزارة اختر', 'Afdeling Select', 'Wybierz Wydział', 'Wählen Sie die Abteilung', 'Sélectionnez Département', 'Selezionare Dipartimento', 'Выберите отдел', 'Selecionar Departamento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (46, 'edit_doctor', 'Edit Doctor', 'সম্পাদনা করুন ডাক্তার', 'Editar Médico', 'تحرير طبيب', 'Bewerk Doctor', 'Edycja Doktor', 'Bearbeiten Doktor', 'Modifier Docteur', 'Modifica Dottore', 'Редактировать доктор', 'Editar Doctor');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (47, 'add_patient', 'Add Patient', 'রোগীর যোগ করুন', 'Añadir Paciente', 'إضافة المريض', 'Patient toevoegen', 'Dodaj pacjenta', 'Patient hinzufügen', 'Ajouter des patients', 'Aggiungi Paziente', 'Добавить пациент', 'Adicionar Patient');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (48, 'sex', 'Sex', 'লিঙ্গ', 'Sexo', 'جنس', 'Geslacht', 'Seks', 'Sex', 'Sexe', 'Sesso', 'Секс', 'Sexo');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (49, 'birth_date', 'Birth Date', 'জন্ম তারিখ', 'Fecha de nacimiento', 'تاريخ الولادة', 'Geboortedatum', 'Data urodzenia', 'Geburtsdatum', 'Date de naissance', 'Data di nascita', 'Дата рождения', 'Data de nascimento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (50, 'age', 'Age', 'বয়স', 'Edad', 'عمر', 'Leeftijd', 'Wiek', 'Alter', 'Âge', 'Età', 'Возраст', 'Idade');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (51, 'blood_group', 'Blood Group', 'রক্তের গ্রুপ', 'Grupo sanguíneo', 'المجموعة الدم', 'Bloedgroep', 'Grupa krwi', 'Blutgruppe', 'Groupe sanguin', 'Gruppo sanguigno', 'Группа крови', 'Grupo sanguíneo');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (52, 'select_sex', 'Select Sex', 'নির্বাচন সেক্স', 'Seleccionar sexo', 'اختر الجنس', 'Selecteer Sex', 'Wybierz Seks', 'Wählen Sex', 'Choisir le sexe', 'Seleziona Sex', 'Выберите Секс', 'Select Sex');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (53, 'male', 'Male', 'পুরুষ', 'Masculino', 'ذكر', 'Mannelijk', 'Mężczyzna', 'Männlich', 'Mâle', 'Maschio', 'Мужчина', 'Masculino');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (54, 'female', 'Female', 'মহিলা', 'Femenino', 'أنثى', 'Vrouwelijk', 'Żeński', 'Weiblich', 'Femelle', 'Femminile', 'Женщина', 'Feminino');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (55, 'select_blood_group', 'Select Blood Group', 'রক্তের গ্রুপ নির্বাচন করুন', 'Seleccionar grupo sanguíneo', 'تحديد فصيلة الدم', 'Selecteer Blood Group', 'Wybierz grupę krwi', 'Wählen Sie Blutgruppe', 'Sélectionnez Groupe sanguin', 'Selezionare gruppo sanguigno', 'Выберите группу крови', 'Selecione Grupo Sanguíneo');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (56, 'edit_patient', 'Edit Patient', 'সম্পাদনা করুন রোগীর', 'Editar paciente', 'تحرير المريض', 'Patiënt bewerken', 'Edycja pacjenta', 'Patient bearbeiten', 'Modifier des patients', 'Modifica paziente', 'Редактировать пациента', 'Editar Patient');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (57, 'add_nurse', 'Add Nurse', 'নার্স যোগ করুন', 'Añadir Enfermera', 'إضافة ممرضة', 'Nurse Toevoegen', 'Dodaj Pielęgniarka', 'Nurse hinzufügen', 'Ajouter infirmière', 'Aggiungi Nurse', 'Добавить Медсестра', 'Adicionar Nurse');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (58, 'edit_nurse', 'Edit Nurse', 'সম্পাদনা করুন নার্সের', 'Editar Enfermera', 'تحرير ممرضة', 'Verpleegster bewerken', 'Edycja Pielęgniarka', 'Nurse bearbeiten', 'Modifier infirmière', 'Modifica Nurse', 'Редактировать Медсестра', 'Editar Nurse');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (59, 'add_pharmacist', 'Add Pharmacist', 'ফার্মাসিস্ট যোগ করুন', 'Añadir Farmacéutico', 'إضافة صيدلي', 'Voeg Apotheker', 'Dodaj Farmaceuty', 'Fügen Apotheker', 'Ajouter Pharmacien', 'Aggiungi Farmacista', 'Добавить Фармацевт', 'Adicionar Farmacêutico');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (60, 'edit_pharmacist', 'Edit Pharmacist', 'সম্পাদনা করুন ফার্মাসিস্ট', 'Editar Farmacéutico', 'تحرير صيدلي', 'Bewerk Apotheker', 'Edycja Farmaceuta', 'Bearbeiten Apotheker', 'Modifier Pharmacien', 'Modifica Farmacista', 'Редактировать Фармацевт', 'Editar Farmacêutico');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (61, 'add_laboratorist', 'Add Laboratorist', 'Laboratorist যোগ করুন', 'Añadir Laboratorio Unidad', 'إضافة Laboratorist', 'Voeg Laboratorist', 'Dodaj Laboratorist', 'Fügen Laboratorist', 'Ajouter Laboratorist', 'Aggiungi Laboratorist', 'Добавить Laboratorist', 'Adicionar laboratorista');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (62, 'edit_laboratorist', 'Edit Laboratorist', 'সম্পাদনা করুন Laboratorist', 'Edición de Laboratorio', 'تحرير Laboratorist', 'Bewerk Laboratorist', 'Edycja Laboratorist', 'Bearbeiten Laboratorist', 'Modifier Laboratorist', 'Modifica Laboratorist', 'Редактировать Laboratorist', 'Editar laboratorista');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (63, 'add_accountant', 'Add Accountant', 'একাউন্টেন্ট যোগ করুন', 'Añadir Contador', 'إضافة محاسب', 'Voeg Accountant', 'Dodaj Accountant', 'Fügen Accountant', 'Ajouter comptable', 'Aggiungi Accountant', 'Добавить бухгалтера', 'Adicionar Contador');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (64, 'edit_accountant', 'Edit Accountant', 'সম্পাদনা করুন একাউন্টেন্ট', 'Editar Contador', 'تحرير محاسب', 'Bewerk Accountant', 'Edycja Księgowy', 'Bearbeiten Accountant', 'Modifier comptable', 'Modifica Accountant', 'Редактировать Бухгалтер', 'Editar Contador');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (65, 'invoice_number', 'Invoice Number', 'চালান নম্বর', 'Número de factura', 'رقم الفاتورة', 'Factuurnummer', 'Numer faktury', 'Rechnungsnummer', 'Numéro de facture', 'Numero fattura', 'Номер счета', 'Número da Fatura');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (66, 'title', 'Title', 'খেতাব', 'Título', 'لقب', 'Titel', 'Tytuł', 'Titel', 'Titre', 'Titolo', 'Название', 'Título');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (67, 'creation_date', 'Creation Date', 'তৈরির তারিখ', 'Fecha de creación', 'تاريخ الأنشاء', 'Creation Date', 'Data utworzenia', 'Erstellungsdatum', 'Date de création', 'Data di creazione', 'Дата создания', 'Data de Criação');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (68, 'due_date', 'Due Date', 'দরুন জন্ম', 'Fecha de vencimiento', 'تاريخ الاستحقاق', 'Vervaldag', 'Due Date', 'Fälligkeitsdatum', 'Date d''échéance', 'Scadenza', 'Срок Оплаты', 'Data de vencimento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (69, 'vat_percentage', 'Vat Percentage', 'ভ্যাট শতাংশ', 'Vat Porcentaje', 'ضريبة القيمة المضافة النسبة المئوية', 'Vat Percentage', 'Procentowy vat', 'Mehrwertsteuersatz', 'Vat Pourcentage', 'Iva Percentuale', 'НДС в процентах', 'Vat Percentual');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (70, 'discount_amount', 'Discount Amount', 'ডিসকাউন্ট পরিমাণ', 'Cantidad de Descuento', 'مقدار الخصم', 'Korting Bedrag', 'Kwota z rabatem', 'Rabatt Menge', 'Montant de la remise', 'Importo Sconto', 'Сумма скидки', 'Quantidade de desconto');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (71, 'status', 'Status', 'অবস্থা', 'Estado', 'وضع', 'Toestand', 'Status', 'Status', 'Statut', 'Stato', 'Статус', 'Estado');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (72, 'bed_number', 'Bed Number', 'বিছানা নাস্তা সংখ্যা', 'Número de cama', 'عدد السرير', 'Bed Aantal', 'Ilość łóżko', 'Bed Anzahl', 'Nombre de lit', 'Number Bed', 'Кровать Количество', 'Número Bed');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (73, 'bed_type', 'Bed Type', 'বিছানা নাস্তা প্রকার', 'Tipo Bed', 'نوع السرير', 'Bed Type', 'Rodzaj łóżka', 'Bettentyp', 'Type de lit', 'Tipo di letto', 'Кровать Тип', 'Tipo de cama');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (74, 'allotment_time', 'Allotment Time', 'বরাদ্দ সময়', 'Asignación Tiempo', 'تخصيص وقت', 'Toewijzing Tijd', 'Przydział czasu', 'Zuteilungszeit', 'Lotissement Temps', 'Allotment Tempo', 'Выделение Время', 'Loteamento Tempo');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (75, 'discharge_time', 'Discharge Time', 'সময় যখন স্রাব', 'Tiempo de descarga', 'تصريف الوقت', 'Kwijting Tijd', 'Czas rozładowania', 'Entladezeit', 'Temps de décharge', 'Scarico Tempo', 'Время разряда', 'Quitação Tempo');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (76, 'issue_date', 'Issue Date', 'ইস্যু তারিখ', 'Fecha de asunto', 'تاريخ الإصدار', 'Uitgiftedatum', 'Data wydania', 'Ausgabetag', 'Date d''émission', 'Data di emissione', 'Дата выпуска', 'Data de emissão');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (77, 'payment_to', 'Payment To', 'পেমেন্ট', 'Pago Para', 'دفع ل', 'Betaling aan', 'Płatność Do', 'Zahlung Um', 'Pour le paiement', 'Pagamento A', 'Оплата Для', 'Pagamento Para');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (78, 'bill_to', 'Bill To', 'বিল', 'Cobrar a', 'مشروع قانون ل', 'Bill Om', 'Bill', 'Gesetzesentwurf für', 'Facturer', 'Disegno di legge per', 'Плательщик', 'Projeto de lei para');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (79, 'invoice_entries', 'Invoice Entries', 'চালান দাখিলা', 'Entradas Factura', 'فاتورة مقالات', 'Factuur Entries', 'Faktura Wpisy', 'Rechnungs Einträge', 'Entrées facture', 'Voci della fattura', 'Счет-фактура Записи', 'Fatura Entries');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (80, 'entry', 'Entry', 'প্রবেশ', 'Entrada', 'دخول', 'Binnenkomst', 'Wejście', 'Eintrag', 'Entrée', 'Ingresso', 'Запись', 'Entrada');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (81, 'price', 'Price', 'মূল্য', 'Precio', 'السعر', 'Prijs', 'Cena', 'Preis', 'Prix', 'Prezzo', 'Цена', 'Preço');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (82, 'sub_total', 'Sub Total', 'উপ মোট', 'Sub Total', 'المجموع الفرعي', 'Subtotaal', 'Sub Razem', 'Zwischensumme', 'Sous-total', 'Sub Total', 'Промежуточный итог', 'Subtotal');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (83, 'discount', 'Discount', 'ডিসকাউন্ট', 'Descuento', 'خصم', 'Korting', 'Zniżka', 'Rabatt', 'Rabais', 'Sconto', 'Скидка', 'Desconto');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (84, 'grand_total', 'Grand Total', 'সর্বমোট', 'Gran Total', 'المجموع الإجمالي', 'Algemeen totaal', 'Suma całkowita', 'Gesamtsumme', 'Total', 'Somma totale', 'Общий Итог', 'Total Geral');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (85, 'date', 'Date', 'তারিখ', 'Fecha', 'تاريخ', 'Datum', 'Data', 'Datum', 'Date', 'Data', 'Дата', 'Data');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (86, 'amount', 'Amount', 'পরিমাণ', 'Cantidad', 'كمية', 'Bedrag', 'Ilość', 'Höhe', 'Montant', 'Importo', 'Количество', 'Quantidade');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (87, 'method', 'Method', 'পদ্ধতি', 'Método', 'طريقة', 'Methode', 'Metoda', 'Verfahren', 'Méthode', 'Metodo', 'Метод', 'Método');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (88, 'last_donation_date', 'Last Donation Date', 'গত রক্তদান তারিখ', 'Última Donación Fecha', 'التبرع آخر تاريخ للمشاركة', 'Laatste Donatie Date', 'Ostatni Darowizna Data', 'Letzte Donation Datum', 'Dernière date don', 'Ultimo Donazione Data', 'Последнее Пожертвование Дата', 'Última Doação Data');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (89, 'medicine_category', 'Medicine Category', 'মেডিসিন বিভাগ', 'Medicina Categoría', 'الطب الفئة', 'Geneeskunde Categorie', 'Medycyna Kategoria', 'Medizin Kategorie', 'Médecine Catégorie', 'Medicina Categoria', 'Медицина Категория', 'Medicina Categoria');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (90, 'manufacturing_company', 'Manufacturing Company', 'ম্যানুফ্যাকচারিং কোম্পানি', 'Empresa de Produccion', 'شركة تصنيع', 'Manufacturing Company', 'Firma Produkcyjna', 'Manufacturing Company', 'Société de fabrication', 'Azienda manifatturiera', 'Производственная фирма', 'Manufacturing Company');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (91, 'system_name', 'System Name', 'সিস্টেম নাম', 'Nombre del sistema', 'اسم النظام', 'System Name', 'Name System', 'System Name', 'Name System', 'Nome Sistema', 'Name System', 'Name System');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (92, 'system_title', 'System Title', 'সিস্টেম শিরোনাম', 'Sistema Título', 'نظام العنوان', 'Systeem Titel', 'Tytuł systemu', 'System-Titel', 'Système Titre', 'Sistema Titolo', 'Система Название', 'Sistema de Título');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (93, 'paypal_email', 'Paypal Email', 'PayPal এর ইমেইল', 'PayPal Correo electrónico', 'باي بال البريد الإلكتروني', 'Paypal E-mail', 'Paypal email', 'Paypal E-Mail', 'Paypal Email', 'Paypal Email', 'Paypal Email', 'Paypal Email');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (94, 'currency', 'Currency', 'মুদ্রা', 'Moneda', 'عملة', 'Valuta', 'Waluta', 'Währung', 'Monnaie', 'Valuta', 'Валюта', 'Moeda');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (95, 'system_email', 'System Email', 'সিস্টেম ইমেল', 'Sistema electrónico', 'نظام البريد الإلكتروني', 'Systeem E-mail', 'System E-mail', 'System-E-Mail', 'Système Email', 'Sistema Email', 'Система E-mail', 'Sistema de E-mail');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (96, 'buyer', 'Buyer', 'ক্রেতা', 'Comprador', 'مشتر', 'Koper', 'Kupujący', 'Käufer', 'Acheteur', 'Compratore', 'Покупатель', 'Comprador');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (97, 'value_required', 'Value Required', 'মূল্য প্রয়োজনীয়', 'Valor Obligatorio', 'القيمة المطلوبة', 'Value Required', 'Wartość Wymagany', 'Wert Erforderlich', 'Valeur Obligatoire', 'Valore Obbligatorio', 'Значение Обязательный', 'Valor Obrigatório');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (98, 'purchase_code', 'Purchase Code', 'ক্রয় কোড', 'Código de Compra', 'كود شراء', 'Aankoop Code', 'Zakup Code', 'Kauf-Code', 'Code d''Achat', 'Codice di acquisto', 'Покупка код', 'Código de Compra');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (99, 'language', 'Language', 'ভাষা', 'Idioma', 'لغة', 'Taal', 'Język', 'Sprache', 'Langue', 'Lingua', 'Язык', 'Língua');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (100, 'text_align', 'Text Align', 'টেক্সট সারিবদ্ধ', 'Texto Alinear', 'محاذاة النص', 'Tekst uitlijnen', 'Tekst Wyrównaj', 'Text Align', 'Text Align', 'Testo Allinea', 'Text Align', 'Texto Align');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (101, 'save', 'Save', 'সংরক্ষণ করুন', 'Guardar', 'حفظ', 'Opslaan', 'Zapisz', 'Speichern', 'Enregistrer', 'Salva', 'Сохранить', 'Salvar');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (102, 'manage_language', 'Manage Language', 'ভাষা পরিচালনা', 'Administrar Idioma', 'إدارة اللغة', 'Beheer Taal', 'Zarządzaj język', 'Sprache verwalten', 'Gérer Langue', 'Gestisci Lingua', 'Управление языками', 'Gerenciar Idioma');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (103, 'phrase_list', 'Phrase List', 'শব্দবন্ধ তালিকা', 'Lista Frase', 'قائمة العبارة', 'Uitdrukking Lijst', 'Lista zdanie', 'Phrasenliste', 'Liste phrase', 'Lista Frase', 'Фраза Список', 'Lista Frase');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (104, 'add_phrase', 'Add Phrase', 'শব্দবন্ধ যোগ করুন', 'Añadir Frase', 'إضافة العبارة', 'Uitdrukking toe te voegen', 'Dodaj wyrażenie', 'Ausdruck hinzufügen', 'Ajouter Phrase', 'Aggiungi Frase', 'Добавить фразу', 'Adicionar Frase');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (105, 'add_language', 'Add Language', 'ভাষা যোগ করা', 'Agregar idioma', 'إضافة اللغة', 'Voeg Taal', 'Dodaj język', 'Sprache hinzufügen', 'Ajouter une langue', 'Aggiungi lingua', 'Добавить язык', 'Adicionar idioma');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (106, 'option', 'Option', 'পছন্দ', 'Opción', 'خيار', 'Optie', 'Opcja', 'Option', 'Option', 'Opzione', 'Опция', 'Opção');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (107, 'edit_phrase', 'Edit Phrase', 'সম্পাদনা করুন শব্দবন্ধ', 'Editar Frase', 'تحرير العبارة', 'Phrase bewerken', 'Edycja wyrażenie', 'Phrase bearbeiten', 'Modifier Phrase', 'Modifica Frase', 'Редактировать Фраза', 'Editar Frase');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (108, 'delete_language', 'Delete Language', 'ভাষা মুছে দিন', 'Eliminar Idioma', 'حذف اللغة', 'Verwijderen Taal', 'Usuń język', 'Sprache löschen', 'Supprimer Langue', 'Elimina Lingua', 'Удалить Язык', 'Excluir Idioma');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (109, 'phrase', 'Phrase', 'বাক্য', 'Frase', 'العبارة', 'Uitdrukking', 'Zwrot', 'Ausdruck', 'Phrase', 'Frase', 'Фраза', 'Frase');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (110, 'update_phrase', 'Update Phrase', 'আপডেট শব্দবন্ধ', 'Actualización Frase', 'تحديث العبارة', 'Phrase-update', 'Aktualizacja wyrażenie', 'Update-Satz', 'Mise à jour Phrase', 'Aggiornamento Frase', 'Обновление Фраза', 'Atualização Frase');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (111, 'manage_profile', 'Manage Profile', 'লগ', 'Administrar perfil', 'إدارة الملف', 'Profiel beheren', 'Zarządzaj profilu', 'Profil verwalten', 'Gérer le profil', 'Gestisci profilo', 'Управление профиля', 'Gerenciar perfil');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (112, 'update_profile', 'Update Profile', 'প্রোফাইল আপডেট করুন', 'Perfil de actualización', 'تحديث الملف الشخصي', 'Profiel bijwerken', 'Aktualizacja profilu', 'Profil aktualisieren', 'Mise à jour le profil', 'Aggiorna profilo', 'Обновление профиля', 'Atualizar Perfil');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (113, 'current_password', 'Current Password', 'বর্তমান পাসওয়ার্ড', 'Contraseña Actual', 'كلمة المرور الحالية', 'Huidig ​​wachtwoord', 'Aktualny Hasło', 'Aktuelles Passwort', 'Mot de passe actuel', 'Password attuale', 'Текущий пароль', 'Senha atual');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (114, 'new_password', 'New Password', 'নতুন পাসওয়ার্ড', 'Nueva contraseña', 'كلمة المرور الجديدة', 'Nieuw wachtwoord', 'Nowe hasło', 'Neues Passwort', 'Nouveau mot de passe', 'Nuova password', 'Новый пароль', 'Nova Senha');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (115, 'confirm_new_password', 'Confirm New Password', 'পাসওয়ার্ড', 'Confirmar nueva contraseña', 'تأكيد كلمة السر الجديدة', 'Nieuw wachtwoord bevestigen', 'Potwierdź nowe hasło', 'Neues Passwort bestätigen', 'Confirmer le nouveau mot de passe', 'Conferma nuova password', 'Подтвердите новый пароль', 'Confirmar nova senha');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (116, 'update_password', 'Update Password', 'আপডেট পাসওয়ার্ড', 'Actualizar contraseña', 'تحديث كلمة المرور', 'Wachtwoord bijwerken', 'Zaktualizuj hasło', 'Passwort aktualisieren', 'Mise à jour le mot de passe', 'Aggiorna password', 'Обновление Пароль', 'Atualizar Senha');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (117, 'profile_info_updated_successfuly', 'Profile Info Updated Successfuly', 'প্রোফাইল তথ্য আপডেট করা হয়েছে Successfuly', 'Información del Perfil Actualizado exitosamente', 'الملف الشخصي تحديث معلومات بنجاح', 'Profiel Info Bijgewerkt Successfuly', 'Informacje o profilu Updated powodzeniem', 'Profil-Information aktualisiert Erfolgreicher', 'Info Profil Mise à jour avec succès', 'Profilo Info Aggiornato con successo', 'Профиль пользователя Обновлено успешно', 'Informações do Perfil Atualizado com sucesso');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (118, 'doctor_dashboard', 'Doctor Dashboard', 'ডাক্তার ড্যাশবোর্ড', 'Médico Dashboard', 'الطبيب لوحة', 'Arts Dashboard', 'Doktor Dashboard', 'Doktor-Dashboard', 'Docteur Dashboard', 'Dottore Dashboard', 'Доктор Dashboard', 'Doctor Painel');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (119, 'appointment', 'Appointment', 'এপয়েন্টমেন্ট', 'Nombramiento', 'موعد', 'Afspraak', 'Powołanie', 'Ernennung', 'Rendez-vous', 'Appuntamento', 'Назначение', 'Nomeação');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (120, 'prescription', 'Prescription', 'প্রেসক্রিপশন', 'Receta', 'وصفة طبية', 'Recept', 'Recepta', 'Verschreibung', 'Prescription', 'Prescrizione', 'Рецепт', 'Prescrição');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (121, 'report', 'Report', 'রিপোর্ট', 'Informe', 'تقرير', 'Rapport', 'Raport', 'Bericht', 'Rapport', 'Relazione', 'Отчет', 'Relatório');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (122, 'appointment_schedule', 'Appointment Schedule', 'নিয়োগ সূচি', 'Programar una cita', 'جدول التعيين', 'Afspraak Schedule', 'Powołanie Harmonogram', 'Terminvereinbarung', 'Horaire de rendez-vous', 'Schedule Appuntamento', 'Расписание встреч', 'Marcar Nomeação');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (123, 'add_appointment', 'Add Appointment', 'নিয়োগ যোগ করুন', 'Añadir cita', 'إضافة التعيين', 'Afspraak toevoegen', 'Dodaj Powoływanie', 'Neuer Termin', 'Ajouter Nomination', 'Aggiungi Appuntamento', 'Добавить Назначение', 'Adicionar Nomeação');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (124, 'event_schedule', 'Event Schedule', 'অনুষ্ঠান সূচি', 'Calendario de eventos', 'جدول الحدث', 'Evenementenschema', 'Harmonogram zdarzeń', 'Veranstaltungstermine', 'Horaire de l''événement', 'Programma dell''evento', 'Расписание событий', 'Agenda de Eventos');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (125, 'select_patient', 'Select Patient', 'নির্বাচন রোগীর', 'Seleccionar paciente', 'حدد المريض', 'Selecteer Patient', 'Wybierz pacjenta', 'Wählen Patient', 'Sélectionner un patient', 'Selezionare Paziente', 'Выберите пациента', 'Select Patient');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (126, 'edit_appointment', 'Edit Appointment', 'সম্পাদনা করুন নিয়োগ', 'Modificar cita', 'تحرير تعيين', 'Afspraak bewerken', 'Edycja Powołanie', 'Termin bearbeiten', 'Modifier Nomination', 'Modifica appuntamento', 'Изменить назначение', 'Editar compromisso');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (127, 'add_prescription', 'Add Prescription', 'প্রেসক্রিপশন যোগ করুন', 'Agregar Receta', 'إضافة وصفة طبية', 'Prescription toevoegen', 'Dodaj Prescription', 'Rezept hinzufügen', 'Ajouter Prescription', 'Aggiungi Ricetta', 'Добавить предписание', 'Adicionar Prescription');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (128, 'case_history', 'Case History', 'রোগীর স্বাস্থ্যাদির বিবরণ', 'Case History', 'حالة التاريخ', 'Case History', 'Sprawa Historia', 'Anamnese', 'Histoire Case', 'Case History', 'История болезни', 'Case History');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (129, 'medication', 'Medication', 'চিকিত্সা', 'Medicación', 'دواء', 'Geneesmiddel', 'Lek', 'Medikation', 'Médicament', 'Medicazione', 'Лечение', 'Medicação');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (130, 'note', 'Note', 'নোট', 'Nota', 'ملاحظة', 'Notitie', 'Uwaga', 'Hinweis', 'Remarque', 'Nota', 'Заметка', 'Nota');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (131, 'edit_prescription', 'Edit Prescription', 'সম্পাদনা করুন প্রেসক্রিপশন', 'Editar Prescription', 'تحرير وصفة طبية', 'Prescription bewerken', 'Edycja receptę', 'Rezept bearbeiten', 'Modifier Prescription', 'Modifica prescrizione', 'Редактировать Рецепт', 'Editar Prescription');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (132, 'report_type', 'Report Type', 'রিপোর্ট প্রকার', 'Tipo de informe', 'نوع التقرير', 'Type rapport', 'Zgłoś Rodzaj', 'Berichtstyp', 'Type de rapport', 'Tipo di rapporto', 'Тип отчета', 'Tipo de relatório');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (133, 'document_type', 'Document Type', 'ডকুমেন্ট প্রকার', 'Tipo de Documento', 'نوع الوثيقة', 'Soort document', 'Rodzaj dokumentu', 'Dokumenttyp', 'Type de document', 'Tipo di documento', 'Тип документа', 'Tipo de Documento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (134, 'download', 'Download', 'ডাউনলোড করুন', 'Descargar', 'تحميل', 'Download', 'Pobierz', 'Herunterladen', 'Télécharger', 'Scarica', 'Скачать', 'Baixar');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (135, 'add_diagnosis_report', 'Add Diagnosis Report', 'রোগ নির্ণয় রিপোর্ট যোগ করুন', 'Añadir Informe de Diagnóstico', 'إضافة التشخيص تقرير', 'Voeg Diagnose Rapport', 'Dodaj raport Diagnosis', 'Fügen Diagnose Bericht', 'Ajouter un rapport de diagnostic', 'Aggiungi Diagnosi Relazione', 'Добавить Диагностика отчет', 'Adicionar Relatório de Diagnóstico');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (136, 'select_report_type', 'Select Report Type', 'রিপোর্ট টাইপ নির্বাচন করুন', 'Seleccione el tipo de informe', 'اختر نوع التقرير', 'Rapport selecteren Type', 'Wybierz Typ raportu', 'Wählen Sie die Art des Berichts', 'Sélectionnez le type de rapport', 'Selezionare Tipo di rapporto', 'Выберите Тип отчета', 'Escolha um tipo de relatório');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (137, 'xray', 'Xray', 'Xray', 'Radiografía', 'الأشعة السينية', 'Xray', 'Xray', 'Xray', 'Xray', 'Xray', 'Xray', 'Raio X');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (138, 'blood_test', 'Blood Test', 'রক্তের টেস্ট', 'Análisis de sangre', 'فحص الدم', 'Bloedonderzoek', 'Badanie krwi', 'Bluttest', 'Blood Test', 'Esame del sangue', 'Анализ крови', 'Teste de sangue');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (139, 'document', 'Document', 'দলিল', 'Documento', 'وثيقة', 'Document', 'Dokument', 'Dokument', 'Document', 'Documento', 'Документ', 'Documento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (140, 'select_document_type', 'Select Document Type', 'ডকুমেন্ট টাইপ নির্বাচন করুন', 'Seleccionar tipo de documento', 'اختر نوع الوثيقة', 'Selecteer Document Type', 'Wybierz typ dokumentu', 'Wählen Sie Dokumenttyp', 'Sélectionnez le type de document', 'Seleziona tipo di documento', 'Выбор типа документа', 'Selecione Tipo de Documento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (141, 'doc', 'Doc', 'ডক', 'Doctor', 'وثيقة', 'Dokter', 'Doc', 'Doc', 'Doc', 'Doc', 'Доктор', 'Doutor');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (142, 'pdf', 'Pdf', 'পিডিএফ', 'Pdf', 'قوات الدفاع الشعبي', 'Pdf', 'Pdf', 'Pdf', 'Pdf', 'Pdf', 'Pdf', 'Pdf');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (143, 'excel', 'Excel', 'সীমা অতিক্রম করা', 'Sobresalir', 'تفوق', 'Uitmunten', 'Przewyższać', 'Übertreffen', 'Exceller', 'Eccellere', 'Превосходить', 'Sobressair');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (144, 'other', 'Other', 'অন্যান্য', 'Otro', 'آخر', 'Ander', 'Inny', 'Andere', 'Autre', 'Altro', 'Другой', 'Outro');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (145, 'add_bed_allotment', 'Add Bed Allotment', 'বিছানা নাস্তা বরাদ্দ যোগ করুন', 'Añadir Asignación Cama', 'إضافة سرير التخصيص', 'Voeg Bed Toewijzing', 'Dodaj Bed Przydziału', 'In Bed Zuteilung', 'Ajouter Bed surallocation', 'Aggiungi Bed Allotment', 'Добавить кровать Расспределение', 'Adicionar Bed Loteamento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (146, 'select_bed_number', 'Select Bed Number', 'নির্বাচন বিছানা নাস্তা সংখ্যা', 'Seleccione un número de cama', 'حدد عدد سرير', 'Select Bed Aantal', 'Wybierz Ilość Bed', 'Wählen Bed Anzahl', 'Sélectionnez Nombre de lit', 'Selezionare Numero Bed', 'Выберите Кровать Количество', 'Selecione Número Bed');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (147, 'edit_bed_allotment', 'Edit Bed Allotment', 'সম্পাদনা করুন বিছানা নাস্তা বরাদ্দ', 'Editar Bed Loteo', 'تحرير سرير التخصيص', 'Bed bewerken Toewijzing', 'Edycja Przydział B', 'Bearbeiten Bed Zuteilung', 'Modifier Bed surallocation', 'Modifica Bed Allotment', 'Редактировать кровать Выделение', 'Editar Bed Loteamento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (148, 'blood_donor_list', 'Blood Donor List', 'রক্ত দাতার তালিকা', 'Lista de Donación de Sangre', 'قائمة المتبرعين بالدم', 'Blood Donor List', 'Lista Dawców Krwi', 'Blutspendeliste', 'Liste des donneurs de sang', 'Sangue lista dei donatori', 'Список доноров крови', 'Lista do Doador de Sangue');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (149, 'blood_bank_status', 'Blood Bank Status', 'ব্লাড ব্যাংক স্থিতি', 'Estado del Banco de Sangre', 'مركز بنك الدم', 'Bloedbank Status', 'Stan Banku Krwi', 'Blutbank-Status', 'Statut de la Banque de Sang', 'Stato Banca del Sangue', 'Банк крови Статус', 'Status de Banco de Sangue');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (150, 'add_report', 'Add Report', 'রিপোর্ট যোগ করুন', 'Añadir Reportar', 'إضافة تقرير', 'Rapport toevoegen', 'Dodaj raport', 'Bericht hinzufügen', 'Ajouter un rapport', 'Aggiungi relazione', 'Добавить отчет', 'Adicionar relatório');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (151, 'operation', 'Operation', 'অপারেশন', 'Operación', 'عملية', 'Operatie', 'Operacja', 'Betrieb', 'Opération', 'Operazione', 'Операция', 'Operação');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (152, 'birth', 'Birth', 'জন্ম', 'Nacimiento', 'الولادة', 'Geboorte', 'Narodziny', 'Geburt', 'Naissance', 'Nascita', 'Рождения', 'Nascimento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (153, 'death', 'Death', 'মৃতু্য', 'Muerte', 'الموت', 'Dood', 'Śmierć', 'Tod', 'Mort', 'Morte', 'Смерть', 'Morte');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (154, 'type', 'Type', 'আদর্শ', 'Tipo', 'نوع', 'Type', 'Typ', 'Art', 'Type', 'Tipo', 'Тип', 'Tipo');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (155, 'select_type', 'Select Type', 'নির্বাচন করুন', 'Seleccionar tipo', 'حدد نوع', 'Kies een type', 'Wybierz typ', 'Wählen Sie Art', 'Sélectionner le type', 'Seleziona tipo', 'Выберите тип', 'Selecionar Tipo');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (156, 'edit_report', 'Edit Report', 'সম্পাদনা করুন ক্লিক করুন', 'Editar informe', 'تحرير تقرير', 'Rapport bewerken', 'Edycja Zgłoś', 'Bericht bearbeiten', 'Modifier le rapport', 'Modifica report', 'Редактировать отчет', 'Editar relatório');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (157, 'old_password', 'Old Password', 'পুরাতন পাসওয়ার্ড', 'Contraseña anterior', 'كلمة المرور القديمة', 'Oud wachtwoord', 'Stare hasło', 'Altes Passwort', 'Ancien mot de passe', 'Vecchia password', 'Старый пароль', 'Senha Antiga');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (158, 'patient_dashboard', 'Patient Dashboard', 'রোগীর ড্যাশবোর্ড', 'Dashboard Paciente', 'لوحة المرضى', 'Patiënt Dashboard', 'Panel Pacjenta', 'Patient-Dashboard', 'Tableau de bord des patients', 'Dashboard paziente', 'Dashboard пациента', 'Painel Patient');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (159, 'admit_history', 'Admit History', 'ইতিহাস মানা', 'Admitir Historia', 'أعترف التاريخ', 'Toegeven Geschiedenis', 'Przyznaj Historia', 'Zugeben Geschichte', 'Admettez Histoire', 'Ammettere Storia', 'Признайтесь История', 'Admita História');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (160, 'operation_history', 'Operation History', 'অপারেশন ইতিহাস', 'Historia Operación', 'عملية التاريخ', 'Operatie Geschiedenis', 'Historia operacji', 'Betriebsgeschichte', 'Opération Histoire', 'Storia Funzionamento', 'Операция История', 'Operação História');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (161, 'invoice', 'Invoice', 'চালান', 'Factura', 'فاتورة', 'Factuur', 'Faktura', 'Rechnung', 'Facture', 'Fattura', 'Счет-фактура', 'Fatura');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (162, 'nurse_dashboard', 'Nurse Dashboard', 'নার্স ড্যাশবোর্ড', 'Dashboard Enfermera', 'ممرضة لوحة', 'Verpleegkundige Dashboard', 'Pielęgniarka Dashboard', 'Krankenschwester-Dashboard', 'Infirmière Dashboard', 'Nurse Dashboard', 'Медсестра Dashboard', 'Painel Nurse');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (163, 'bed_/_ward', 'Bed / Ward', 'বিছানা / ওয়ার্ড', 'Cama / sala', 'سرير / وارد', 'Bed / Ward', 'Łóżko / Ward', 'Bed / Ward', 'Chambres / Ward', 'Letto / Ward', 'Кровать / Ward', 'Cama / Ward');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (164, 'manage_bed', 'Manage Bed', 'বিছানা নাস্তা পরিচালনা', 'Administrar Cama', 'إدارة سرير', 'Beheerder bent van Bed', 'Zarządzaj Bed', 'Bed verwalten', 'Gérer Chambres', 'Gestisci Bed', 'Управление Кровать', 'Gerenciar Bed');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (165, 'manage_blood_bank', 'Manage Blood Bank', 'ব্লাড ব্যাংক পরিচালনা', 'Administrar el Banco de Sangre', 'إدارة بنك الدم', 'Beheer Bloedbank', 'Zarządzaj Bank Krwi', 'Verwalten Blutbank', 'Gérer banque de sang', 'Gestisci Blood Bank', 'Управление банком крови', 'Gerenciar Banco de Sangue');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (166, 'bed', 'Bed', 'বিছানা', 'Cama', 'قاع', 'Bed', 'Łóżko', 'Bett', 'Lit', 'Letto', 'Кровать', 'Cama');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (167, 'add_bed', 'Add Bed', 'বিছানা নাস্তা যোগ করুন', 'Añadir Cama', 'إضافة سرير', 'Bed voegen', 'Dodaj Bed', 'In Bed', 'Ajouter Chambres', 'Aggiungi Bed', 'Добавить Bed', 'Adicionar Bed');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (168, 'ward', 'Ward', 'পাটক', 'Sala', 'جناح', 'Afdeling', 'Wychowanek', 'Station', 'Quartier', 'Reparto', 'Подопечный', 'Enfermaria');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (169, 'cabin', 'Cabin', 'কেবিন', 'Cabina', 'قمرة', 'Cabine', 'Kabina', 'Kabine', 'Cabine', 'Cabina', 'Кабина', 'Cabine');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (170, 'icu', 'Icu', 'ICU', 'Icu', 'وحدة العناية المركزة', 'Icu', 'Icu', 'Icu', 'Icu', 'Icu', 'Icu', 'Icu');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (171, 'edit_bed', 'Edit Bed', 'সম্পাদনা করুন বিছানা নাস্তা', 'Editar Cama', 'تحرير سرير', 'Bewerk Bed', 'Edycja B', 'Bed bearbeiten', 'Modifier Chambres', 'Modifica Bed', 'Редактировать кровать', 'Editar Bed');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (172, 'edit_blood_bank', 'Edit Blood Bank', 'সম্পাদনা করুন ব্লাড ব্যাংক', 'Editar Banco de Sangre', 'تحرير بنك الدم', 'Bewerk Bloedbank', 'Edycja Bank Krwi', 'Bearbeiten Blutbank', 'Modifier banque de sang', 'Modifica Banca del Sangue', 'Редактировать банка крови', 'Editar Banco de Sangue');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (173, 'add_blood_donor', 'Add Blood Donor', 'রক্ত দাতার যোগ করুন', 'Añadir Donante de Sangre', 'إضافة للمتبرعين بالدم', 'Voeg Blood Donor', 'Dodaj dawców krwi', 'In der Blutspender', 'Ajouter don de sang', 'Aggiungi Blood Donor', 'Добавить донорской крови', 'Adicionar Doador de Sangue');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (174, 'edit_blood_donor', 'Edit Blood Donor', 'সম্পাদনা করুন রক্ত ​​দাতার', 'Edición del Donante de Sangre', 'تحرير متبرعين بالدم', 'Bewerk Blood Donor', 'Edycja Dawców Krwi', 'Bearbeiten-Blutspender', 'Modifier don de sang', 'Modifica Blood Donor', 'Редактировать донора крови', 'Editar do Doador de Sangue');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (175, 'select_doctor', 'Select Doctor', 'নির্বাচন ডাক্তার', 'Seleccionar Médico', 'حدد طبيب', 'Selecteer Doctor', 'Wybierz Doktor', 'Wählen Doktor', 'Sélectionnez Docteur', 'Seleziona Dottore', 'Выберите Доктор', 'Select Doctor');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (176, 'pharmacist_dashboard', 'Pharmacist Dashboard', 'ফার্মাসিস্ট ড্যাশবোর্ড', 'Dashboard Farmacéutico', 'لوحة الصيدلي', 'Apotheker Dashboard', 'Farmaceuta Dashboard', 'Apotheker-Dashboard', 'Dashboard Pharmacien', 'Dashboard Farmacista', 'Фармацевт Dashboard', 'Painel Farmacêutico');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (177, 'add_medicine', 'Add Medicine', 'মেডিসিন যোগ করুন', 'Añadir Medicina', 'إضافة الطب', 'Medicine', 'Dodaj Medycyna', 'Medizin hinzufügen', 'Ajouter médecine', 'Aggiungi Medicina', 'Добавить Медицина', 'Adicionar Medicina');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (178, 'select_medicine_category', 'Select Medicine Category', 'মেডিসিন বিভাগ নির্বাচন করুন', 'Seleccione Medicina Categoría', 'حدد الطب الفئة', 'Selecteer Geneeskunde Categorie', 'Wybierz kategorię Medycyna', 'Wählen Sie Kategorie Medizin', 'Sélectionnez médecine Catégorie', 'Seleziona Medicine Categoria', 'Выберите Медицина Категория', 'Selecione Medicine Categoria');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (179, 'select_status', 'Select Status', 'নির্বাচন স্থিতি', 'Seleccione Estado', 'اختر الحالة', 'Selecteer Status', 'Wybierz status', 'Wählen Sie Status', 'Sélectionnez État', 'Selezionare Stato', 'Выберите Состояние', 'Selecione Status');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (180, 'available', 'Available', 'পাওয়া যায়', 'Disponible', 'متاح', 'Beschikbaar', 'Dostępny', 'Verfügbar', 'Disponible', 'Disponibile', 'Доступный', 'Disponível');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (181, 'unavailable', 'Unavailable', 'অপ্রাপ্য', 'Indisponible', 'غير متاح', 'Niet beschikbaar', 'Niedostępny', 'Nicht verfügbar', 'Indisponible', 'Non disponibile', 'Недоступен', 'Indisponível');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (182, 'edit_medicine', 'Edit Medicine', 'সম্পাদনা করুন মেডিসিন', 'Editar Medicina', 'تحرير الطب', 'Geneeskunde bewerken', 'Edycja Medycyna', 'Bearbeiten Medizin', 'Modifier Médecine', 'Modifica Medicine', 'Редактировать Медицина', 'Editar Medicina');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (183, 'add_medicine_category', 'Add Medicine Category', 'মেডিসিন বিভাগ যোগ করুন', 'Añadir Medicina Categoría', 'إضافة الطب الفئة', 'Voeg Geneeskunde Categorie', 'Dodaj Medicine Kategoria', 'In Medizin Kategorie', 'Ajouter médecine Catégorie', 'Aggiungi Medicine Categoria', 'Добавить медицины Категория', 'Adicionar Medicine Categoria');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (184, 'edit_medicine_category', 'Edit Medicine Category', 'সম্পাদনা করুন মেডিসিন বিভাগ', 'Editar Medicina Categoría', 'تحرير الطب الفئة', 'Geneeskunde Categorie bewerken', 'Edycja Medycyna Kategoria', 'Bearbeiten Medizin Kategorie', 'Modifier médecine Catégorie', 'Modifica Medicine Categoria', 'Редактировать Медицина Категория', 'Editar Medicine Categoria');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (185, 'laboratorist_dashboard', 'Laboratorist Dashboard', 'Laboratorist ড্যাশবোর্ড', 'Dashboard de Laboratorio', 'لوحة Laboratorist', 'Laboratorist Dashboard', 'Laboratorist Dashboard', 'Laboratorist Armaturenbrett', 'Dashboard Laboratorist', 'Dashboard Laboratorist', 'Laboratorist Dashboard', 'Painel laboratorista');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (186, 'accountant_dashboard', 'Accountant Dashboard', 'একাউন্টেন্ট ড্যাশবোর্ড', 'Dashboard Contador', 'لوحة محاسب', 'Accountant Dashboard', 'Księgowy Dashboard', 'Accountant-Dashboard', 'Dashboard comptable', 'Dashboard Accountant', 'Бухгалтер Dashboard', 'Painel Accountant');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (187, 'add_invoice', 'Add Invoice', 'চালান যোগ করুন', 'Añadir Factura', 'إضافة الفاتورة', 'Voeg Factuur', 'Dodaj faktury', 'In Rechnung', 'Ajouter Facture', 'Aggiungi Fattura', 'Добавить счет-фактуру', 'Adicionar Invoice');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (188, 'manage_invoice', 'Manage Invoice', 'চালান পরিচালনা', 'Administrar Factura', 'إدارة الفاتورة', 'Beheer Factuur', 'Zarządzaj faktury', 'Rechnung verwalten', 'Gérer facture', 'Gestisci Fattura', 'Управление Счет', 'Gerenciar Invoice');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (189, 'invoice_title', 'Invoice Title', 'চালান টাইটেল', 'Factura Título', 'عنوان الفاتورة', 'Factuur Titel', 'Faktura Tytuł', 'Rechnungs Titel', 'Titre facture', 'Titolo Fattura', 'Счет Название', 'Título Invoice');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (190, 'select_a_patient', 'Select A Patient', 'একটি রোগীর নির্বাচন করুন', 'Seleccione un paciente', 'حدد المريض', 'Selecteer een Patiënt', 'Wybierz pacjenta', 'Wählen Sie einen Patienten', 'Sélectionner un patient', 'Selezionare un paziente', 'Выберите пациента', 'Seleccione um paciente');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (191, 'payment_status', 'Payment Status', 'পেমেন্ট অবস্থা', 'El estado del pedido', 'الحالة الدفع', 'Betaling Status', 'Płatność status', 'Payment Status', 'Statut de paiement', 'Pagamento Stato', 'Оплата Статус', 'Situação do pagamento');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (192, 'select_a_status', 'Select A Status', 'একটি অবস্থা নির্বাচন করুন', 'Seleccione un Estado', 'اختر الحالة', 'Selecteer A Status', 'Wybierz status', 'Wählen Sie einen Status', 'Sélectionnez un état', 'Selezionare uno stato', 'Выберите статус', 'Selecione um status');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (193, 'paid', 'Paid', 'প্রদত্ত', 'Pagado', 'مدفوع', 'Betaald', 'Płatny', 'Bezahlt', 'Payé', 'Pagato', 'Платный', 'Pago');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (194, 'unpaid', 'Unpaid', 'অবৈতনিক', 'No pagado', 'غير مدفوع', 'Onbetaald', 'Niezapłacone', 'Unbezahlt', 'Non rémunéré', 'Non pagato', 'Неоплаченный', 'Não remunerado');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (195, 'invoice_entry', 'Invoice Entry', 'চালান এন্ট্রি', 'Entrada de facturas', 'الدخول فاتورة', 'Factuur Entry', 'Faktura Wejście', 'Rechnungserfassung', 'Saisie des factures', 'Fattura Entry', 'Счет запись', 'Nota Fiscal de Entrada');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (196, 'add_invoice_entry', 'Add Invoice Entry', 'চালান এন্ট্রি যোগ করুন', 'Añadir entrada Factura', 'إضافة إدخال الفاتورة', 'Voeg Factuur Entry', 'Dodaj wpis faktury', 'Fügen Rechnungserfassung', 'Ajouter Saisie des factures', 'Aggiungi Fattura Entry', 'Добавить счет-фактуру запись', 'Adicionar Nota Fiscal de Entrada');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (197, 'create_new_invoice', 'Create New Invoice', 'নতুন চালান তৈরি করুন', 'Crear Nueva factura', 'خلق فاتورة جديدة', 'Maak Nieuwe factuur', 'Utwórz nową fakturę', 'Neues Rechnungs', 'Créer une nouvelle facture', 'Crea nuova fattura', 'Создать новую фактуру', 'Criar Nova Fatura');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (198, 'edit_invoice', 'Edit Invoice', 'সম্পাদনা করুন চালান', 'Editar Factura', 'تحرير الفاتورة', 'Bewerk Factuur', 'Edycja faktury', 'Bearbeiten Rechnung', 'Modifier facture', 'Modifica fattura', 'Редактировать Счет', 'Editar Invoice');
INSERT INTO language(phrase_id, phrase, english, bengali, spanish, arabic, dutch, polish, german, french, italian, russian, portugese) VALUES (199, 'update_invoice', 'Update Invoice', 'আপডেট চালান', 'Actualización Factura', 'تحديث الفاتورة', 'Bijwerken Factuur', 'Aktualizacja Faktura', 'Update-Rechnung', 'Mise à jour des factures', 'Aggiornamento Fattura', 'Обновление счета', 'Atualização Invoice');
INSERT INTO settings(settings_id, "type", description) VALUES (1, 'system_name', 'Bayanno Hospital Management System');
INSERT INTO settings(settings_id, "type", description) VALUES (2, 'system_title', 'Bayanno Hospital Management System');
INSERT INTO settings(settings_id, "type", description) VALUES (3, 'address', 'Dhaka, Bangladesh');
INSERT INTO settings(settings_id, "type", description) VALUES (4, 'phone', '+8012654159');
INSERT INTO settings(settings_id, "type", description) VALUES (5, 'paypal_email', 'payment@creativeitem.com');
INSERT INTO settings(settings_id, "type", description) VALUES (6, 'currency', 'usd');
INSERT INTO settings(settings_id, "type", description) VALUES (7, 'system_email', 'admin@example.com');
INSERT INTO settings(settings_id, "type", description) VALUES (8, 'buyer', '[ your-codecanyon-username-here ]');
INSERT INTO settings(settings_id, "type", description) VALUES (9, 'purchase_code', '[ your-purchase-code-here ]');
INSERT INTO settings(settings_id, "type", description) VALUES (11, 'language', 'english');
INSERT INTO settings(settings_id, "type", description) VALUES (12, 'text_align', 'left-to-right');
INSERT INTO settings(settings_id, "type", description) VALUES (13, 'system_currency_id', '1');
INSERT INTO settings(settings_id, "type", description) VALUES (14, 'clickatell_user', '[YOUR CLICKATELL USERNAME]');
INSERT INTO settings(settings_id, "type", description) VALUES (15, 'clickatell_password', '[YOUR CLICKATELL PASSWORD]');
INSERT INTO settings(settings_id, "type", description) VALUES (16, 'clickatell_api_id', '[YOUR CLICKATELL API ID]');
