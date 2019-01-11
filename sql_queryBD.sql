SET search_path TO SistemaDeControldeNotas,public;
-------------------------------------------------------TipoUsuario---------------------------------------------------

INSERT INTO public."INTO_tipousuario" (codigo_tipo_usuario, tipo_usuario, descripcion_tipo_usuario) VALUES ('admin', 'Administrador', 'Encargado de administrar los datos, crear usuarios para alumnos y maestros.');
INSERT INTO public."INTO_tipousuario" (codigo_tipo_usuario, tipo_usuario, descripcion_tipo_usuario) VALUES ('alumno', 'Alumno', 'Tendra acceso para ver sus notas por periodo y anual.');
INSERT INTO public."INTO_tipousuario" (codigo_tipo_usuario, tipo_usuario, descripcion_tipo_usuario) VALUES ('docente', 'Docente', 'Encargado de administrar sus evaluaciones y luego ingresar las notas de los alumnos.');

--------------------------------------------------------Usuario------------------------------------------------------

--Admin
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$1a6JTCw6uGb8$DjF9gmdCTZKl/U6OmNJDwu7BQIm9wuTJ5F1bTDJCEcw=','2018-12-20 16:09:28.079707-06', 'TRUE', 'admin01','Diego', 'Campos', 'diegoc01@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
--Docente
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente01','Manuel', 'Lopez', 'manuell01@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente02','Pablo', 'Sanchez', 'pablos02@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente03','Jorge', 'Coto', 'jorgec03@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente04','Sofia', 'Mejia', 'sofiam04@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente05','Evelyn', 'Diaz', 'evelynd05@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente06','Diego', 'Cruz', 'diegoc06@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente07','Alejandro', 'Mendoza', 'alejandrom07@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente08','Alexis', 'Alvarez', 'alexisa08@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente09','Cristina', 'Mejia', 'cristinam09@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente10','Santos', 'Garcia', 'santosg10@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente11','Diana', 'Hernandez', 'dianah11@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente12','Jeanette', 'Mejia', 'jeanettem12@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente13','Oscar', 'Aldana', 'oscara13@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente14','Jose', 'Valladares', 'josev14@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$STpyJek5uMKm$V73zxEU2ayLMqWCfu65oTQXpBYoElYTyZCFRT/PmPd0=','2018-12-20 16:09:28.079707-06', 'FALSE', 'docente15','Bryan', 'Montano', 'bryanm15@hotmail.com', 'TRUE', 'TRUE','2019-01-07 10:21:37-06');
--Alumno
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno01','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno02','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno03','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno04','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno05','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno06','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno07','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno08','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno09','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno10','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno11','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno12','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno13','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno14','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno15','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno16','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno17','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno18','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno19','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno20','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno21','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno22','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno23','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno24','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno25','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno26','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno27','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno28','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno29','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno30','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno31','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno32','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno33','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno34','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno35','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno36','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno37','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno38','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno39','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno40','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno41','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno42','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno43','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno44','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno45','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno46','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno47','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno48','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno49','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno50','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno51','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno52','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno53','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno54','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno55','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno56','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno57','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno58','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno59','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno60','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno61','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno62','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno63','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno64','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno65','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno66','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno67','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno68','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno69','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno70','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno71','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno72','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno73','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno74','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno75','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno76','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno77','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno78','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno79','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno80','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno81','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno82','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno83','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno84','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno85','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno86','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno87','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno88','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno89','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno90','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno91','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno92','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno93','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno94','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno95','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno96','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno97','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno98','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno99','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');
INSERT INTO auth_user(id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) VALUES(default,'pbkdf2_sha256$100000$NLf084Nv4cNW$+XB75AVoUOmALBEAemRCCGb0AIUEOrufrNQyWh8PFek=','2018-12-20 16:09:28.079707-06', 'FALSE', 'Alumno100','', '', '', 'FALSE', 'TRUE','2019-01-07 10:21:37-06');

-------------------------------------------------------TipoUsuario---------------------------------------------------

--Admin
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'admin', (SELECT id FROM auth_user WHERE username = 'admin01'));
--Docente
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente01'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente02'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente03'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente04'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente05'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente06'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente07'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente08'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente09'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente10'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente11'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente12'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente13'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente14'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'docente', (SELECT id FROM auth_user WHERE username = 'docente15'));
--Alumno
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno01'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno02'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno03'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno04'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno05'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno06'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno07'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno08'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno09'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno10'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno11'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno12'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno13'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno14'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno15'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno16'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno17'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno18'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno19'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno20'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno21'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno22'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno23'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno24'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno25'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno26'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno27'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno28'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno29'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno30'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno31'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno32'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno33'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno34'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno35'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno36'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno37'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno38'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno39'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno40'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno41'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno42'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno43'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno44'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno45'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno46'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno47'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno48'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno49'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno50'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno51'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno52'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno53'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno54'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno55'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno56'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno57'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno58'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno59'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno60'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno61'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno62'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno63'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno64'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno65'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno66'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno67'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno68'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno69'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno70'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno71'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno72'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno73'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno74'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno75'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno76'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno77'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno78'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno79'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno80'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno81'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno82'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno83'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno84'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno85'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno86'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno87'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno88'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno89'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno90'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno91'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno92'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno93'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno94'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno95'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno96'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno97'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno98'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno99'));
INSERT INTO public."INTO_asignaciontipousuario" (id, tipo_usuario_id, usuario_id) VALUES (default, 'alumno', (SELECT id FROM auth_user WHERE username = 'Alumno100'));

-----------------------------------------------Docente--------------------------------------------

INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('05833241-1','Manuel','Lopez','manuell01@hotmail.com','1987-06-07','2234-2125','2000-07-07','San Jacinto',(SELECT id FROM auth_user WHERE username = 'docente01'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('11534242-3','Pablo', 'Sanchez', 'pablos02@hotmail.com','1988-06-07','2537-2134','2000-07-08','Santo Tomas',(SELECT id FROM auth_user WHERE username = 'docente02'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('25738212-2','Jorge', 'Coto', 'jorgec03@hotmail.com','1987-06-06','2237-2828','2000-01-01','Zacatecoluca',(SELECT id FROM auth_user WHERE username = 'docente03'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('15528172-3','Sofia', 'Mejia', 'sofiam04@hotmail.com','1997-06-06','2231-4751','2000-01-01','Santa Marta',(SELECT id FROM auth_user WHERE username = 'docente04'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('01158242-3','Evelyn', 'Diaz', 'evelynd05@hotmail.com','1997-07-06','2232-5821','2000-01-02','Zacatecoluca',(SELECT id FROM auth_user WHERE username = 'docente05'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('03532231-3','Diego', 'Cruz', 'diegoc06@hotmail.com','1957-07-06','2531-4796','2010-01-02','Olocuilta',(SELECT id FROM auth_user WHERE username = 'docente06'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('05417242-4','Alejandro', 'Mendoza', 'alejandrom07@hotmail.com','1957-07-06','2232-2114','2010-01-02','Santa Ana',(SELECT id FROM auth_user WHERE username = 'docente07'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('07734242-1','Alexis', 'Alvarez', 'alexisa08@hotmail.com','1990-06-01','2531-1467','2010-01-02','Santa Tecla',(SELECT id FROM auth_user WHERE username = 'docente08'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('02534252-1','Cristina', 'Mejia', 'cristinam09@hotmail.com','1991-05-02','2236-6996','2011-01-01','Santa Tecla',(SELECT id FROM auth_user WHERE username = 'docente09'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('05138254-3','Santos', 'Garcia', 'santosg10@hotmail.com','1991-05-03','2555-1234','2011-01-01','Santa Ana',(SELECT id FROM auth_user WHERE username = 'docente10'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('03358242-3','Diana', 'Hernandez', 'dianah11@hotmail.com','1992-01-01','2421-6971','2011-01-01','San Juan Opico',(SELECT id FROM auth_user WHERE username = 'docente11'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('19538232-2','Jeanette', 'Mejia', 'jeanettem12@hotmail.com','1993-12-31','2365-4477','2012-01-01','San Jacinto',(SELECT id FROM auth_user WHERE username = 'docente12'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('11538241-1','Oscar', 'Aldana', 'oscara13@hotmail.com','1991-05-05','2241-6971','2012-01-01','Olocuilta',(SELECT id FROM auth_user WHERE username = 'docente13'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('21537242-3','Jose', 'Valladares', 'josev14@hotmail.com','1990-02-02','2231-2727','2013-01-01','Santo Tomas',(SELECT id FROM auth_user WHERE username = 'docente14'));
INSERT INTO public."INTO_docente" (dui_docente, nombre_docente, apellidos_docente, email_docente, fecha_nacimiento_docente, telefono_docente, fecha_contratacion_docente, direccion_docente, usuario_docente_id) VALUES ('40531221-6','Bryan', 'Montano', 'bryanm15@hotmail.com','1990-02-03','2537-2961','2014-01-01','San Luis Talpa',(SELECT id FROM auth_user WHERE username = 'docente15'));

-------------------------------------------Especialidad--------------------------------------------

INSERT INTO public."INTO_especialidad" (codigo_especialidad, nombre_especialidad, descripcion_especialidad, anios_especialidad) VALUES('esp_contab','Contabilidad','Crear contadores de primer nivel',3);
INSERT INTO public."INTO_especialidad" (codigo_especialidad, nombre_especialidad, descripcion_especialidad, anios_especialidad) VALUES('esp_dsw','Desarrollo de Software','Crear programadores de primer nivel',3);
INSERT INTO public."INTO_especialidad" (codigo_especialidad, nombre_especialidad, descripcion_especialidad, anios_especialidad) VALUES('esp_genral','General','Desarrollar las bases para la universidad',2);
INSERT INTO public."INTO_especialidad" (codigo_especialidad, nombre_especialidad, descripcion_especialidad, anios_especialidad) VALUES('esp_hyt','Hoteleria y Turismo','Desarrollar las habilidades para trabajar en area de turismo',3);
INSERT INTO public."INTO_especialidad" (codigo_especialidad, nombre_especialidad, descripcion_especialidad, anios_especialidad) VALUES('esp_secret','Secretariado','Crear secretarias de primer nivel',3);


-----------------kilmer---------------

-------------------------------------------Encargados-------------------------------------------
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234560-1','juan carlos','lopez quijada','22458565','76548124','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234560-2','carlos antonio','dolores gutierrez','21456398','73548962','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234560-3','jose rodolfo','lopez castro','26548714','75468952','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234560-4','maria idalia','rivas de la o','26547841','78954212','madre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234560-5','jefry alexander','montano perez','26541478','74125896','tio');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234560-6','antonio juan','perez perez','26541478','77552211','primo');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234560-7','francisco javier','rosales huezo','21546398','78952145','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234560-8','juan jose','huezo rosales','24875461','75321456','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234560-9','carlos alfredo','diaz colato','21564789','74125896','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234561-0','carlos antonio','diaz rivas','24156378','78521456','padre');

INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234561-1','jose javier','lopez lopez','22458565','76768124','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234561-2','juana antonia','dolores ordoñez','21456568','73548962','madre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234561-3','cecilia karla','ordoñez castro','26548776','75468982','tia');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234561-4','andrea elizabeth','rivas de la u','26237841','75554212','madre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234561-5','jose carlos','maravilla lopez','26541668','74128996','tio');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234561-6','nelson alfredo','ochoa garcia','26541488','77552711','primo');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234561-7','diego javier','bautista soraya','21546335','78934545','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234561-8','jose aristides','gonzales muñor','24875981','75321766','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234561-9','amilcar carlos','hernandez mejia','23464789','74455896','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234562-0','jonathan david','diaz rivas','24156878','78521465','padre');

INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234562-1','javier ernesto','estupinian lopez','23358565','76763324','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234522-2','karla paola','castro figueroa','21433568','73548933','madre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234562-3','karla ester','garcia arevalo','26543376','75468332','tia');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234562-4','keely ester','gonzales mendez','23337841','75334212','madre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234562-5','alvaro jey','perez garcia','26541633','74128933','tio');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234562-6','jayden fernando','ochoa garcia','26541433','73352711','primo');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234562-7','fabricio carlos','colorado lopez','21533335','78933545','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234562-8','jonathan jose','zenaida lopez','24875981','75321336','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234562-9','herbert amilcar','hernandez mejia','23364789','74335896','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234563-0','jonathan david','colato diaz','24156833','78521433','padre');

INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234563-1','luis fernando','estupinian lopez','23358543','76343324','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234523-2','karla patricia','puchini lopez','21456568','73545933','madre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234563-3','ester patricia','garcia arevalo','26653376','75988332','tia');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234563-4','ana ester','conde san francisco','23336541','75332312','madre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234563-5','augusto jey','maravilla lopez','26651633','74458933','tio');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234563-6','jayden fernando','lopez ventura','26541433','76752711','primo');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234563-7','carlos carlos','flores ventura','21567335','78998545','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234563-8','david jose','contraste perez','248754541','75328736','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234563-9','herbert jose','turcios mejia','23363389','74335876','padre');
INSERT INTO public."INTO_encargado" (dui_encargado, nombre_encargado, apellidos_encargado,telefono,celular,parentesco) VALUES('01234564-0','jonathan david','lopez medrano','24178833','78521433','padre');

------------------------------------------Materia-----------------------------------

INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('MAT','Matematicas','Materia enfocado en el calculo y la logica','Que el alumno pueda desarrollar su logica y resolver problemas');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('CN','Ciencias naturales','Materia enfocada en los conocimientos sobre la naturaleza','Que el alumno comprenda el porque de la naturaleza');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('ES','Estudios sociales','Materia que estudia a la sociedad','Que el alumno comprenda la sociedad y sus problemas');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('LYL','Lenguaje y literatura','Materia que estudia el lenguaje y la lengua','Que el alumno mejore su habla y su escritura');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('TEC','Tecnologia','Materia encargada de estudiar las areas tecnicas','Introducir al alumno conocimientos del area tecnica');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('OPV','Orientacion para la vida','Materia las relaciones del ser humano','Crear en el alumno una correcta forma de dirio vivir');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('LC','Laboratirio de creatividad','Materia que motiva a la creatividad','Motivar al alumno a ser cosas creativas');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('PRN','Programacion','Materia que estudia la logica de la programacion','Desarrollar un nivel de logica en el alumno atraves de la programacion');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('TAL','Taller','Materia de aplicacion de la materia de tecnologia','Aplicar los conocimientos del area tecnica');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('DT','Dibujo tecnico','Materia encargada de ver los aspectos de diseño','Crear una mentalidad de diseño');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('INF','Informatica','Materia encargada del conocimiento sobre ofimatica','Desarrollar en el alumno conocimientos sobre las herramientas que posee un computador');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('EN','Ingles','Materia encargada de enseñar el idioma ingles','Introducir al alumno a aprender a escribir y hablar otro idioma');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('EDF','Educacion fisica','Materia que impulsa el ejercicio para la salud del alumno','Crear habitos saludables en el alumno');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('IC','Introduccion a la contaduria','Materia que introduce a la contaduria','Introducir al alumno al area de finanzas y contaduria');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('FN','Finanzas','Materia que se encarga de aplicar conocimientos de finanazas','Introducir al alumno al area de finanzas y contaduria');
INSERT INTO public."INTO_materia" (codigo_materia, nombre_materia,descripcion_materia, objetivos) VALUES('SM','Seminario','Materia que se encarga de enseñar reglas para realizacion de documentos','Introducir al alumno al seminario');


-------------------------------------------ALUMNO--------------------------------------------
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0001', 'Juan José', 'Pereira Sosa', '12/04/2000', '7851-5468','casa de su mamá','M', '01/01/2018', '01234560-1','esp_contab',1);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0002', 'Pedro', 'andrade', '04/07/1999', '7851-5468','casa de su mamá','M', '01/01/2017', '01234560-1','esp_contab',2);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0003', 'Alcides Juan', 'arevalo', '04/10/2000', '7851-5468','casa de su mamá','M', '01/01/2019', '01234560-2','esp_contab',3);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0004', 'Balmore', 'aristides', '12/04/2001', '7851-5468','casa de su mamá','M', '01/01/2017', '01234560-2','esp_contab',4);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0005', 'Juan', 'aguilar', '12/07/1999', '7851-5468','casa de su mamá','M', '01/01/2019', '01234560-3','esp_contab',5);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0006', 'José', 'andino', '02/01/2000', '7851-5468','casa de su mamá','M', '01/01/2018', '01234560-3','esp_contab',6);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0007', 'Augusto', 'batres', '12/12/2002', '7851-5468','casa de su mamá','M', '01/01/2017', '01234560-4','esp_contab',7);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0008', 'Arturo', 'binagrosa', '08/02/2002', '7851-5468','casa de su mamá','M', '01/01/2018', '01234560-4','esp_contab',8);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0009', 'Agustin', 'bonilla', '30/04/2000', '7851-5468','casa de su mamá','M', '01/01/2019', '01234560-5','esp_contab',9);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0010', 'Buso', 'cabrera', '31/03/2001', '7851-5468','casa de su mamá','M', '01/01/2017', '01234560-5','esp_contab',10);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0011', 'Boni', 'cordoba', '06/01/2000', '7851-5468','casa de su mamá','M', '01/01/2018', '01234560-6','esp_contab',11);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0012', 'Carlos', 'campos', '01/01/1009', '7851-5468','casa de su mamá','M', '01/01/2019', '01234560-6','esp_contab',12);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0013', 'cesar', 'cordero', '02/02/2000', '7851-5468','casa de su mamá','M', '01/01/2017', '01234560-7','esp_contab',13);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0014', 'cornelio', 'castro', '03/03/2001', '7851-5468','casa de su mamá','M', '01/01/2018', '01234560-7','esp_contab',14);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0015', 'cinimaro', 'casas', '04/04/2002', '7851-5468','casa de su mamá','M', '01/01/2019', '01234560-8','esp_contab',15);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0016', 'causto', 'cuellar', '05/05/1999', '7851-5468','casa de su mamá','M', '01/01/2017', '01234560-8','esp_contab',16);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0017', 'daniel', 'duarte', '06/06/2000', '7851-5468','casa de su mamá','M', '01/01/2018', '01234560-9','esp_contab',17);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0018', 'dante', 'alvarez', '07/07/2001', '7851-5468','casa de su mamá','M', '01/01/2019', '01234560-9','esp_contab',18);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0019', 'Dimaria', 'davila', '08/08/2002', '7851-5468','casa de su mamá','M', '01/01/2017', '01234561-0','esp_contab',19);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0020', 'Aquiles', 'dolores', '09/09/1999', '7851-5468','casa de su mamá','M', '01/01/2018', '01234561-0','esp_contab',20);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0021', 'Enrique', 'espinoza', '10/10/2000', '7851-5468','casa de su mamá','M', '01/01/2019', '01234561-1','esp_dsw',21);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0022', 'Ernesto', 'estrada', '11/11/2001', '7851-5468','casa de su mamá','M', '01/01/2017', '01234561-1','esp_dsw',22);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0023', 'emerson', 'figueroa', '12/12/2002', '7851-5468','casa de su mamá','M', '01/01/2018', '01234561-2','esp_dsw',23);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0024', 'Aristides', 'fuentes', '13/01/2003', '7851-5468','casa de su mamá','M', '01/01/2019', '01234560-2','esp_dsw',24);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0025', 'Eber', 'funes', '14/02/1999', '7851-5468','casa de su mamá','M', '01/01/2017', '01234561-3','esp_dsw',25);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0026', 'elias', 'Pereira', '15/03/2000', '7851-5468','casa de su mamá','M', '01/01/2018', '01234561-3','esp_dsw',26);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0027', 'eliezer', 'ferro', '16/05/2001', '7851-5468','casa de su mamá','M', '01/01/2019', '01234561-4','esp_dsw',27);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0028', 'fabricio', 'jurado', '17/06/2002', '7851-5468','casa de su mamá','M', '01/01/2017', '01234561-4','esp_dsw',28);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0029', 'fabian', 'linares', '18/07/2003', '7851-5468','casa de su mamá','M', '01/01/2018', '01234561-5','esp_dsw',29);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0030', 'fabio', 'lisvoa', '19/08/1998', '7851-5468','casa de su mamá','M', '01/01/2019', '01234561-5','esp_dsw',30);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0031', 'gustavo', 'lima', '20/09/1999', '7851-5468','casa de su mamá','M', '01/01/2017', '01234561-6','esp_dsw',31);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0032', 'hugo', 'lula', '21/10/2000', '7851-5468','casa de su mamá','M', '01/01/2018', '01234561-6','esp_dsw',32);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0033', 'antonio', 'dasilva', '22/11/2001', '7851-5468','casa de su mamá','M', '01/01/2019', '01234561-7','esp_dsw',33);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0034', 'jorge', 'marroquin', '23/12/2002', '7851-5468','casa de su mamá','M', '01/01/2017', '01234561-7','esp_dsw',34);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0035', 'jilberto', 'masariego', '24/01/2003', '7851-5468','casa de su mamá','M', '01/01/2018', '01234561-8','esp_dsw',35);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0036', 'Jonathan', 'martinez', '25/02/2004', '7851-5468','casa de su mamá','M', '01/01/2019', '01234561-8','esp_dsw',36);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0037', 'cristian', 'morales', '26/03/1998', '7851-5468','casa de su mamá','M', '01/01/2017', '01234561-9','esp_dsw',37);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0038', 'karlos', 'medina', '27/04/1999', '7851-5468','casa de su mamá','M', '01/01/2018', '01234561-9','esp_dsw',38);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0039', 'kabuto', 'mostraviego', '28/05/2000', '7851-5468','casa de su mamá','M', '01/01/2019', '01234562-0','esp_dsw',39);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0040', 'naruto', 'estupinian', '29/06/2001', '7851-5468','casa de su mamá','M', '01/01/2017', '01234562-0','esp_dsw',40);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0041', 'gilberto', 'menjivar', '30/07/2002', '7851-5468','casa de su mamá','M', '01/01/2018', '01234562-1','esp_genral',41);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0042', 'givo', 'maravilla', '31/08/2003', '7851-5468','casa de su mamá','M', '01/01/2019', '01234562-1','esp_genral',42);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0043', 'leandro', 'najera', '01/09/1998', '7851-5468','casa de su mamá','M', '01/01/2017', '01234522-2','esp_genral',43);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0044', 'leonel', 'nogeira', '02/10/1999', '7851-5468','casa de su mamá','M', '01/01/2018', '01234522-2','esp_genral',44);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0045', 'Leo', 'novert', '03/11/2000', '7851-5468','casa de su mamá','M', '01/01/2019', '01234562-3','esp_genral',45);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0046', 'Ludovico', 'osorio', '04/12/2001', '7851-5468','casa de su mamá','M', '01/01/2017', '01234562-3','esp_genral',46);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0047', 'marco', 'Perez', '05/01/2002', '7851-5468','casa de su mamá','M', '01/01/2018', '01234562-4','esp_genral',47);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0048', 'marcos', 'Pereira', '06/02/2003', '7851-5468','casa de su mamá','M', '01/01/2019', '01234562-4','esp_genral',48);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0049', 'manrique', 'Pereira perez', '07/03/1998', '7851-5468','casa de su mamá','M', '01/01/2017', '01234562-5','esp_genral',49);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0050', 'margarito', 'Pereira nieto', '08/04/1999', '7851-5468','casa de su mamá','M', '01/01/2018', '01234562-5','esp_genral',50);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0051', 'mercedes', 'arias', '09/05/2000', '7851-5468','casa de su mamá','F', '01/01/2019', '01234562-6','esp_genral',51);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0052', 'nicolas', 'garcia', '10/06/2001', '7851-5468','casa de su mamá','F', '01/01/2017', '01234562-6','esp_genral',52);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0053', 'nico', 'hernandez', '11/07/2002', '7851-5468','casa de su mamá','F', '01/01/2018', '01234562-7','esp_genral',53);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0054', 'nicho', 'lopez', '12/08/2003', '7851-5468','casa de su mamá','F', '01/01/2019', '01234562-7','esp_genral',54);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0055', 'andrea', 'dimas', '13/09/1999', '7851-5468','casa de su mamá','F', '01/01/2017', '01234562-8','esp_genral',55);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0056', 'andres', 'abarca', '14/10/2000', '7851-5468','casa de su mamá','F', '01/01/2018', '01234562-8','esp_genral',56);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0057', 'abigail', 'pineda', '15/11/2001', '7851-5468','casa de su mamá','F', '01/01/2019', '01234562-9','esp_genral',57);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0058', 'antonia', 'Pomes', '16/12/2002', '7851-5468','casa de su mamá','F', '01/01/2017', '01234562-9','esp_genral',58);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0059', 'agustina', 'Poma', '17/01/2003', '7851-5468','casa de su mamá','F', '01/01/2018', '01234563-0','esp_genral',60);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0060', 'bety', 'puma', '18/02/1999', '7851-5468','casa de su mamá','F', '01/01/2019', '01234563-0','esp_genral',61);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0061', 'beatriz', 'Peraza', '19/03/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234563-1','esp_hyt',62);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0062', 'carla', 'Peralte', '20/04/2001', '7851-5468','casa de su mamá','F', '01/01/2018', '01234563-1','esp_hyt',63);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0063', 'cecia', 'quevedo', '21/05/2002', '7851-5468','casa de su mamá','F', '01/01/2019', '01234523-2','esp_hyt',64);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0064', 'cecia', 'quiros', '22/06/2003', '7851-5468','casa de su mamá','F', '01/01/2017', '01234523-2','esp_hyt',65);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0065', 'cecilia', 'Puentes', '23/07/2004', '7851-5468','casa de su mamá','F', '01/01/2018', '01234563-3','esp_hyt',66);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0066', 'clemente', 'ramos', '24/08/1999', '7851-5468','casa de su mamá','F', '01/01/2019', '01234563-3','esp_hyt',67);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0067', 'clementina', 'ramirez', '25/09/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234563-4','esp_hyt',68);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0068', 'alejandra', 'rivera', '26/10/2001', '7851-5468','casa de su mamá','F', '01/01/2018', '01234563-4','esp_hyt',69);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0069', 'alexandra', 'rosco', '27/11/2002', '7851-5468','casa de su mamá','F', '01/01/2019', '01234563-5','esp_hyt',70);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0070', 'alondra', 'suarez', '28/12/2003', '7851-5468','casa de su mamá','F', '01/01/2017', '01234563-5','esp_hyt',71);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0071', 'alba', 'Sosa', '29/04/2000', '7851-5468','casa de su mamá','F', '01/01/2018', '01234563-6','esp_hyt',72);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0072', 'carmen', 'toloza', '30/04/2000', '7851-5468','casa de su mamá','F', '01/01/2019', '01234563-6','esp_hyt',73);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0073', 'camelia', 'toledo', '01/05/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234563-7','esp_hyt',74);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0074', 'daniela', 'umaña', '02/05/2000', '7851-5468','casa de su mamá','F', '01/01/2018', '01234563-7','esp_hyt',75);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0075', 'dalia', 'vasquez', '12/05/2000', '7851-5468','casa de su mamá','F', '01/01/2019', '01234563-8','esp_hyt',76);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0076', 'dalila ', 'ventura', '03/05/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234563-8','esp_hyt',77);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0077', 'dinora', 'flores', '04/05/2000', '7851-5468','casa de su mamá','F', '01/01/2018', '01234563-9','esp_hyt',78);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0078', 'dolores', 'barillas', '05/05/2000', '7851-5468','casa de su mamá','F', '01/01/2019', '01234564-0','esp_hyt',79);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0079', 'enriqueta', 'cabrera', '06/06/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234564-0','esp_hyt',80);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0080', 'ernesta', 'Perez', '07/06/2000', '7851-5468','casa de su mamá','F', '01/01/2018', '01234560-1','esp_secret',81);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0081', 'fatima', 'linares', '08/07/2000', '7851-5468','casa de su mamá','F', '01/01/2019', '01234560-1','esp_secret',82);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0082', 'faustina', 'arias', '09/05/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234561-2','esp_secret',83);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0083', 'ingrid', 'nieto', '10/05/2000', '7851-5468','casa de su mamá','F', '01/01/2018', '01234561-2','esp_secret',84);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0084', 'isela', 'osorio', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2019', '01234561-3','esp_secret',59);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0085', 'juana', 'marroquin', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234562-3','esp_secret',85);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0086', 'josefa', 'gavidia', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2018', '01234562-4','esp_secret',86);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0087', 'eunice', 'gomez', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2019', '01234563-4','esp_secret',87);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0088', 'aurelia', 'guzman', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234563-5','esp_secret',88);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0089', 'erica', 'hernandez', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2018', '01234563-6','esp_secret',89);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0090', 'arely', 'peraza', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2019', '01234560-6','esp_secret',90);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0091', 'ivania', 'dimas', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234560-7','esp_secret',91);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0092', 'keely', 'campos', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2018', '01234560-7','esp_secret',92);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0093', 'ester', 'abarca', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2019', '01234561-8','esp_secret',93);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0094', 'krisia', 'sorto', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234561-8','esp_secret',94);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0095', 'leonor', 'cordoba', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2018', '01234562-9','esp_secret',95);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0096', 'leonora', 'fuentes', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2019', '01234562-9','esp_secret',96);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0097', 'ludovica', 'figueroa', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234563-1','esp_secret',97);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0098', 'monica', 'duarte', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2018', '01234563-1','esp_secret',98);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0099', 'michelle', 'arevalo', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2019', '01234561-1','esp_secret',99);
INSERT INTO public."INTO_alumno"(nie, nombre_alumno, apellidos_alumno, fecha_nacimiento_alumno,telefono_alumno, direccion_alumno, sexo_alumno, anio_ingreso, encargado_id, especialidad_alumno_id, usuario_alumno_id)VALUES ('nie0100', 'xiomara', 'andrade', '12/04/2000', '7851-5468','casa de su mamá','F', '01/01/2017', '01234560-1','esp_secret',100);

--------------------------------Especialidad_materia-------------------------------------------

INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('01','1','esp_genral','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('02','1','esp_genral','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('03','1','esp_genral','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('04','1','esp_genral','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('05','1','esp_genral','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('06','1','esp_genral','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('07','1','esp_genral','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('08','1','esp_genral','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('09','1','esp_genral','SM');

INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('10','2','esp_genral','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('11','2','esp_genral','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('12','2','esp_genral','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('13','2','esp_genral','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('14','2','esp_genral','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('15','2','esp_genral','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('16','2','esp_genral','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('17','2','esp_genral','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('18','2','esp_genral','SM');

INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('19','1','esp_contab','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('20','1','esp_contab','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('21','1','esp_contab','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('22','1','esp_contab','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('23','1','esp_contab','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('24','1','esp_contab','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('25','1','esp_contab','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('26','1','esp_contab','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('27','1','esp_contab','SM');

INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('200','2','esp_contab','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('201','2','esp_contab','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('202','2','esp_contab','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('203','2','esp_contab','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('204','2','esp_contab','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('205','2','esp_contab','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('206','2','esp_contab','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('207','2','esp_contab','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('208','2','esp_contab','SM');

INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('28','3','esp_contab','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('29','3','esp_contab','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('30','3','esp_contab','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('31','3','esp_contab','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('32','3','esp_contab','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('33','3','esp_contab','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('34','3','esp_contab','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('35','3','esp_contab','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('36','3','esp_contab','SM');


INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('37','1','esp_dsw','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('38','1','esp_dsw','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('39','1','esp_dsw','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('40','1','esp_dsw','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('41','1','esp_dsw','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('42','1','esp_dsw','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('43','1','esp_dsw','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('44','1','esp_dsw','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('45','1','esp_dsw','SM');

INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('46','2','esp_dsw','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('47','2','esp_dsw','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('48','2','esp_dsw','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('49','2','esp_dsw','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('50','2','esp_dsw','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('51','2','esp_dsw','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('52','2','esp_dsw','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('53','2','esp_dsw','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('54','2','esp_dsw','SM');

INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('55','3','esp_dsw','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('56','3','esp_dsw','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('57','3','esp_dsw','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('58','3','esp_dsw','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('59','3','esp_dsw','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('60','3','esp_dsw','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('61','3','esp_dsw','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('62','3','esp_dsw','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('63','3','esp_dsw','SM');


INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('64','1','esp_hyt','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('65','1','esp_hyt','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('66','1','esp_hyt','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('67','1','esp_hyt','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('68','1','esp_hyt','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('69','1','esp_hyt','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('70','1','esp_hyt','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('71','1','esp_hyt','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('72','1','esp_hyt','SM');

INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('73','2','esp_hyt','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('74','2','esp_hyt','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('75','2','esp_hyt','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('76','2','esp_hyt','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('77','2','esp_hyt','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('78','2','esp_hyt','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('79','2','esp_hyt','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('80','2','esp_hyt','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('81','2','esp_hyt','SM');

INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('82','3','esp_hyt','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('83','3','esp_hyt','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('84','3','esp_hyt','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('85','3','esp_hyt','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('86','3','esp_hyt','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('87','3','esp_hyt','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('88','3','esp_hyt','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('89','3','esp_hyt','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('90','3','esp_hyt','SM');


INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('91','1','esp_secret','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('92','1','esp_secret','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('93','1','esp_secret','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('94','1','esp_secret','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('95','1','esp_secret','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('96','1','esp_secret','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('97','1','esp_secret','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('98','1','esp_secret','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('99','1','esp_secret','SM');

INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('100','2','esp_secret','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('101','2','esp_secret','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('102','2','esp_secret','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('103','2','esp_secret','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('104','2','esp_secret','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('105','2','esp_secret','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('106','2','esp_secret','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('107','2','esp_secret','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('108','2','esp_secret','SM');

INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('109','3','esp_secret','CN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('110','3','esp_secret','EDF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('111','3','esp_secret','EN');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('112','3','esp_secret','ES');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('113','3','esp_secret','INF');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('114','3','esp_secret','LYL');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('115','3','esp_secret','MAT');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('116','3','esp_secret','OPV');
INSERT INTO public."INTO_especialidad_materia" (id, nivel_materia_especialidad,codigo_especialidad_id, codigo_materia_id) VALUES('117','3','esp_secret','SM');

-------------------------------------------------------Parte Marco---------------------------------------------------

-------------------------------------------------------Grupo---------------------------------------------------
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-01', '1', 'C-01', '2019', '01158242-3', 'esp_contab');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-02', '2', 'C-02', '2018', '02534252-1', 'esp_contab');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-03', '3', 'C-03', '2017', '03358242-3', 'esp_contab');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-04', '1', 'D-01', '2019', '03532231-3', 'esp_dsw');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-05', '2', 'D-02', '2018', '05138254-3', 'esp_dsw');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-06', '3', 'D-03', '2017', '05417242-4', 'esp_dsw');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-07', '1', 'G-1B', '2019', '05833241-1', 'esp_genral');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-08', '1', 'G-1A', '2017', '07734242-1', 'esp_genral');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-09', '2', 'G-02', '2018', '11534242-3', 'esp_genral');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-10', '1', 'H-01', '2019', '11538241-1', 'esp_hyt');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-11', '2', 'H-02', '2018', '15528172-3', 'esp_hyt');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-12', '3', 'H-03', '2017', '19538232-2', 'esp_hyt');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-13', '1', 'S-01', '2019', '21537242-3', 'esp_secret');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-14', '2', 'S-02', '2018', '25738212-2', 'esp_secret');
INSERT INTO public."INTO_grupo" (codigo_grupo, nivel_especialidad, seccion, anio, codigo_docente_encargado_id, codigo_especialidad_id) VALUES ('GP-15', '3', 'S-03', '2017', '40531221-6', 'esp_secret');
-------------------------------------------------------Alumno_Grupo---------------------------------------------------
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-01', 'nie0003');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-01', 'nie0005');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-01', 'nie0009');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-01', 'nie0012');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-01', 'nie0015');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-01', 'nie0018');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-02', 'nie0001');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-02', 'nie0006');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-02', 'nie0008');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-02', 'nie0011');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-02', 'nie0014');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-02', 'nie0017');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-02', 'nie0020');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-03', 'nie0002');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-03', 'nie0004');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-03', 'nie0007');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-03', 'nie0010');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-03', 'nie0013');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-03', 'nie0016');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-03', 'nie0019');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-04', 'nie0021');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-04', 'nie0024');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-04', 'nie0027');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-04', 'nie0030');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-04', 'nie0033');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-04', 'nie0036');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-04', 'nie0039');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-05', 'nie0023');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-05', 'nie0026');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-05', 'nie0029');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-05', 'nie0032');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-05', 'nie0035');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-05', 'nie0038');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-06', 'nie0022');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-06', 'nie0025');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-06', 'nie0028');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-06', 'nie0031');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-06', 'nie0034');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-06', 'nie0037');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-06', 'nie0040');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-07', 'nie0042');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-07', 'nie0045');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-07', 'nie0048');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-07', 'nie0051');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-07', 'nie0054');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-07', 'nie0057');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-07', 'nie0060');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-08', 'nie0043');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-08', 'nie0046');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-08', 'nie0049');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-08', 'nie0052');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-08', 'nie0055');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-08', 'nie0058');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-09', 'nie0041');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-09', 'nie0044');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-09', 'nie0047');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-09', 'nie0050');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-09', 'nie0053');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-09', 'nie0056');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-09', 'nie0059');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-10', 'nie0063');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-10', 'nie0066');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-10', 'nie0069');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-10', 'nie0072');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-10', 'nie0075');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-10', 'nie0078');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-11', 'nie0062');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-11', 'nie0065');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-11', 'nie0068');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-11', 'nie0071');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-11', 'nie0074');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-11', 'nie0077');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-12', 'nie0061');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-12', 'nie0064');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-12', 'nie0067');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-12', 'nie0070');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-12', 'nie0073');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-12', 'nie0076');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-12', 'nie0079');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-13', 'nie0081');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-13', 'nie0084');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-13', 'nie0087');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-13', 'nie0090');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-13', 'nie0093');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-13', 'nie0096');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-13', 'nie0099');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-14', 'nie0080');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-14', 'nie0083');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-14', 'nie0086');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-14', 'nie0089');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-14', 'nie0092');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-14', 'nie0095');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-14', 'nie0098');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-15', 'nie0082');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-15', 'nie0085');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-15', 'nie0088');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-15', 'nie0091');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-15', 'nie0094');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-15', 'nie0097');
INSERT INTO public."INTO_alumno_grupo" (id, codigo_grupo_id, nie_id) VALUES (default, 'GP-15', 'nie0100');
-------------------------------------------------------AnioLectivo---------------------------------------------------
INSERT INTO public."INTO_aniolectivo" (anio_lectivo, terminado) VALUES ('2017', 'True');
INSERT INTO public."INTO_aniolectivo" (anio_lectivo, terminado) VALUES ('2018', 'True');
INSERT INTO public."INTO_aniolectivo" (anio_lectivo, terminado) VALUES ('2019', 'False');
-------------------------------------------------------Periodo---------------------------------------------------
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2017_PER_1', 'True', '2017');
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2017_PER_2', 'True', '2017');
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2017_PER_3', 'True', '2017');
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2017_PER_4', 'True', '2017');
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2018_PER_1', 'True', '2018');
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2018_PER_2', 'True', '2018');
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2018_PER_3', 'True', '2018');
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2018_PER_4', 'True', '2018');
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2019_PER_1', 'False', '2019');
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2019_PER_2', 'False', '2019');
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2019_PER_3', 'False', '2019');
INSERT INTO public."INTO_periodo" (codigo_periodo, finalizado, anio_lectivo_id) VALUES ('2019_PER_4', 'False', '2019');



------------------------------------------------------Parte DIEGO------------------------------------------------------
----Tipo_actividad------------

INSERT INTO "INTO_tipo_actividad"(codigo_tipo_actividad, nombre_tipo_actividad, descripcion)VALUES ('Exposicion', 'Exposicion', 'Los Alumnos Exponen');
INSERT INTO "INTO_tipo_actividad"(codigo_tipo_actividad, nombre_tipo_actividad, descripcion)VALUES ('Examen', 'Examen', 'Para subir puntos');
INSERT INTO "INTO_tipo_actividad"(codigo_tipo_actividad, nombre_tipo_actividad, descripcion)VALUES ('Baile', 'Baile', 'Los Alumnos Ganan Puntos al Bailar');
INSERT INTO "INTO_tipo_actividad"(codigo_tipo_actividad, nombre_tipo_actividad, descripcion)VALUES ('Asistencia', 'Asistencia', 'Dar Puntos Por asistir a clases');

-----------Actividad-------------------

----------Actividades del año 2017-----------------
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per1_2017', 0.35, '1','2017_PER_1', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per1_2017', 0.35, '2','2017_PER_1', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per1_2017', 0.30, '1','2017_PER_1', 'Examen');

INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per2_2017', 0.35, '4','2017_PER_2', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per2_2017', 0.35, '1','2017_PER_2', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per2_2017', 0.30, '1','2017_PER_2', 'Examen');

INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per3_2017', 0.35, '1','2017_PER_3', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per3_2017', 0.35, '1','2017_PER_3', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per3_2017', 0.30, '1','2017_PER_3', 'Examen');

INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per4_2017', 0.35, '1','2017_PER_4', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per4_2017', 0.35, '1','2017_PER_4', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per4_2017', 0.30, '1','2017_PER_4', 'Examen');

----------Actividades del año 2018-----------------
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per1_2018', 0.35, '1','2018_PER_1', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per1_2018', 0.35, '2','2018_PER_1', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per1_2018', 0.30, '1','2018_PER_1', 'Examen');

INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per2_2018', 0.35, '4','2018_PER_2', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per2_2018', 0.35, '1','2018_PER_2', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per2_2018', 0.30, '1','2018_PER_2', 'Examen');

INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per3_2018', 0.35, '1','2018_PER_3', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per3_2018', 0.35, '1','2018_PER_3', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per3_2018', 0.30, '1','2018_PER_3', 'Examen');

INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per4_2018', 0.35, '1','2018_PER_4', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per4_2018', 0.35, '1','2018_PER_4', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per4_2018', 0.30, '1','2018_PER_4', 'Examen');

----------Actividades del año 2019-----------------
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per1_2019', 0.35, '1','2019_PER_1', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per1_2019', 0.35, '2','2019_PER_1', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per1_2019', 0.30, '1','2019_PER_1', 'Examen');

INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per2_2019', 0.35, '4','2019_PER_2', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per2_2019', 0.35, '1','2019_PER_2', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per2_2019', 0.30, '1','2019_PER_2', 'Examen');

INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per3_2019', 0.35, '1','2019_PER_3', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per3_2019', 0.35, '1','2019_PER_3', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per3_2019', 0.30, '1','2019_PER_3', 'Examen');

INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act1_per4_2019', 0.35, '1','2019_PER_4', 'Exposicion');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('act2_per4_2019', 0.35, '1','2019_PER_4', 'Baile');
INSERT INTO "INTO_actividad"(codigo_actividad, porcentaje_actividad, cantidad_max_sub_act,codigo_periodo_id, codigo_tipo_actividad_id) 
VALUES ('exa1_per4_2019', 0.30, '1','2019_PER_4', 'Examen');

-----------------sub_actividad-------------------------------
----------------------AÑO 2017--------------------------------
---------Sub-Actividades primer periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per1_2017',0.35,'Entrega de Guion de Obra','act1_per1_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per1_2017',0.175,'Hacer Baile Merengue','act2_per1_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub2_act2_per1_2017',0.175,'Hacer Baile de Salsa','act2_per1_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per1_2017',0.30,'Examen Trimestral','exa1_per1_2017');
---------Sub-Actividades segundo periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per2_2017',0.0875,'Exposicion 1','act1_per2_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub2_act1_per2_2017',0.0875,'Exposicion 2','act1_per2_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub3_act1_per2_2017',0.0875,'Exposicion 3','act1_per2_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub4_act1_per2_2017',0.0875,'Exposicion 4','act1_per2_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per2_2017',0.35,'Baile de Regaeton','act2_per1_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per2_2017',0.30,'Examen Trimestral','exa1_per1_2017');
---------Sub-Actividades tercer periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per3_2017',0.35,'Entrega de Guion de Obra','act1_per3_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per3_2017',0.35,'Hacer Baile Merengue','act2_per3_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per3_2017',0.30,'Examen Trimestral','exa1_per3_2017');
---------Sub-Actividades tercer periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per4_2017',0.35,'Entrega de Guion de Obra','act1_per4_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per4_2017',0.35,'Hacer Baile Bachata','act2_per4_2017');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per4_2017',0.30,'Examen Trimestral','exa1_per4_2017');

----------------------AÑO 2018--------------------------------
---------Sub-Actividades primer periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per1_2018',0.35,'Entrega de Guion de Obra','act1_per1_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per1_2018',0.175,'Hacer Baile Merengue','act2_per1_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub2_act2_per1_2018',0.175,'Hacer Baile de Salsa','act2_per1_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per1_2018',0.30,'Examen Trimestral','exa1_per1_2018');
---------Sub-Actividades segundo periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per2_2018',0.0875,'Exposicion 1','act1_per2_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub2_act1_per2_2018',0.0875,'Exposicion 2','act1_per2_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub3_act1_per2_2018',0.0875,'Exposicion 3','act1_per2_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub4_act1_per2_2018',0.0875,'Exposicion 4','act1_per2_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per2_2018',0.35,'Baile de Regaeton','act2_per1_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per2_2018',0.30,'Examen Trimestral','exa1_per1_2018');
---------Sub-Actividades tercer periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per3_2018',0.35,'Entrega de Guion de Obra','act1_per3_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per3_2018',0.35,'Hacer Baile Merengue','act2_per3_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per3_2018',0.30,'Examen Trimestral','exa1_per3_2018');
---------Sub-Actividades tercer periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per4_2018',0.35,'Entrega de Guion de Obra','act1_per4_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per4_2018',0.35,'Hacer Baile Bachata','act2_per4_2018');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per4_2018',0.30,'Examen Trimestral','exa1_per4_2018');

----------------------AÑO 2019--------------------------------
---------Sub-Actividades primer periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per1_2019',0.35,'Entrega de Guion de Obra','act1_per1_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per1_2019',0.175,'Hacer Baile Merengue','act2_per1_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub2_act2_per1_2019',0.175,'Hacer Baile de Salsa','act2_per1_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per1_2019',0.30,'Examen Trimestral','exa1_per1_2019');
---------Sub-Actividades segundo periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per2_2019',0.0875,'Exposicion 1','act1_per2_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub2_act1_per2_2019',0.0875,'Exposicion 2','act1_per2_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub3_act1_per2_2019',0.0875,'Exposicion 3','act1_per2_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub4_act1_per2_2019',0.0875,'Exposicion 4','act1_per2_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per2_2019',0.35,'Baile de Regaeton','act2_per1_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per2_2019',0.30,'Examen Trimestral','exa1_per1_2019');
---------Sub-Actividades tercer periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per3_2019',0.35,'Entrega de Guion de Obra','act1_per3_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per3_2019',0.35,'Hacer Baile Merengue','act2_per3_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per3_2019',0.30,'Examen Trimestral','exa1_per3_2019');
---------Sub-Actividades tercer periodo----------------------
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act1_per4_2019',0.35,'Entrega de Guion de Obra','act1_per4_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_act2_per4_2019',0.35,'Hacer Baile Bachata','act2_per4_2019');
INSERT INTO "INTO_sub_actividad"(codigo_sub_actividad, porcentaje_sub_actividad, descripcion_sub_actividad,codigo_actividad_id)
VALUES ('sub1_exa1_per4_2019',0.30,'Examen Trimestral','exa1_per4_2019');


-----docente_materia---------
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '01158242-3', 'CN');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '02534252-1', 'CN');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '03358242-3', 'CN');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '03532231-3', 'CN');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '05417242-4', 'CN');

INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '01158242-3', 'EDF');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '02534252-1', 'EDF');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '03358242-3', 'EDF');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '03532231-3', 'EDF');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '05417242-4', 'EDF');

INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '01158242-3', 'EN');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '02534252-1', 'EN');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '03358242-3', 'EN');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '03532231-3', 'EN');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '05417242-4', 'EN');

INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '01158242-3', 'IC');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '02534252-1', 'IC');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '03358242-3', 'IC');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '03532231-3', 'IC');
INSERT INTO "INTO_docente_materia"(id, codigo_docente_id, codigo_materia_id) VALUES (default, '05417242-4', 'IC');

----Evaluacion------
----------------AÑO 2017----------------------------
----------------Periodo 1----------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (1, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',2, 'sub1_act1_per1_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (2, 'Baile Bueno 1','Para que Aprendan a Bailar 1',2, 'sub1_act2_per1_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (3, 'Baile Bueno 2','Para que Aprendan a Bailar 2',2, 'sub2_act2_per1_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (4, 'Examen Final','Examen Para Evaluar todo lo del periodo',2, 'sub1_exa1_per1_2017');
----------------Periodo 2-----------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (5, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',3, 'sub1_act1_per2_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (6, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',5, 'sub2_act1_per2_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (7, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',7, 'sub3_act1_per2_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (8, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',8, 'sub4_act1_per2_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (9, 'Baile Bueno','Para que Aprendan a Bailar 2',12, 'sub1_act2_per2_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (10, 'Examen Final','Examen Para Evaluar todo lo del periodo',16, 'sub1_exa1_per2_2017');
----------------Periodo 3-------------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (11, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',9, 'sub1_act1_per3_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (12, 'Baile Bueno','Para que Aprendan a Bailar 2',1, 'sub1_act2_per3_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (13, 'Examen Final','Examen Para Evaluar todo lo del periodo',5, 'sub1_exa1_per3_2017');
----------------Periodo 4-------------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (14, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',7, 'sub1_act1_per4_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (15, 'Baile Bueno','Para que Aprendan a Bailar 2',6, 'sub1_act2_per4_2017');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (16, 'Examen Final','Examen Para Evaluar todo lo del periodo',3, 'sub1_exa1_per4_2017');

----------------AÑO 2018----------------------------
----------------Periodo 1----------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (17, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',3, 'sub1_act1_per1_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (18, 'Baile Bueno 1','Para que Aprendan a Bailar 1',8, 'sub1_act2_per1_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (19, 'Baile Bueno 2','Para que Aprendan a Bailar 2',7, 'sub2_act2_per1_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (20, 'Examen Final','Examen Para Evaluar todo lo del periodo',18, 'sub1_exa1_per1_2018');
----------------Periodo 2-----------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (21, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',15, 'sub1_act1_per2_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (22, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',11, 'sub2_act1_per2_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (23, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',1, 'sub3_act1_per2_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (24, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',17, 'sub4_act1_per2_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (25, 'Baile Bueno','Para que Aprendan a Bailar 2',19, 'sub1_act2_per2_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (26, 'Examen Final','Examen Para Evaluar todo lo del periodo',20, 'sub1_exa1_per2_2018');
----------------Periodo 3-------------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (27, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',5, 'sub1_act1_per3_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (28, 'Baile Bueno','Para que Aprendan a Bailar 2',4, 'sub1_act2_per3_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (29, 'Examen Final','Examen Para Evaluar todo lo del periodo',1, 'sub1_exa1_per3_2018');
----------------Periodo 4-------------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (30, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',6, 'sub1_act1_per4_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (31, 'Baile Bueno','Para que Aprendan a Bailar 2',3, 'sub1_act2_per4_2018');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (32, 'Examen Final','Examen Para Evaluar todo lo del periodo',7, 'sub1_exa1_per4_2018');

----------------AÑO 2019----------------------------
----------------Periodo 1----------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (33, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',8, 'sub1_act1_per1_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (34, 'Baile Bueno 1','Para que Aprendan a Bailar 1',9, 'sub1_act2_per1_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (35, 'Baile Bueno 2','Para que Aprendan a Bailar 2',10, 'sub2_act2_per1_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (36, 'Examen Final','Examen Para Evaluar todo lo del periodo',19, 'sub1_exa1_per1_2019');
----------------Periodo 2-----------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (37, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',2, 'sub1_act1_per2_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (38, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',4, 'sub2_act1_per2_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (39, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',7, 'sub3_act1_per2_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (40, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',4, 'sub4_act1_per2_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (41, 'Baile Bueno','Para que Aprendan a Bailar 2',6, 'sub1_act2_per2_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (42, 'Examen Final','Examen Para Evaluar todo lo del periodo',9, 'sub1_exa1_per2_2019');
----------------Periodo 3-------------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (43, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',4, 'sub1_act1_per3_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (44, 'Baile Bueno','Para que Aprendan a Bailar 2',14, 'sub1_act2_per3_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (45, 'Examen Final','Examen Para Evaluar todo lo del periodo',13, 'sub1_exa1_per3_2019');
----------------Periodo 4-------------------------------
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (46, 'Obra la Ultima Guinda','Conocimientos sobre la trama y personajes',16, 'sub1_act1_per4_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (47, 'Baile Bueno','Para que Aprendan a Bailar 2',6, 'sub1_act2_per4_2019');
INSERT INTO "INTO_evaluacion"(codigo_evaluacion, nombre_evaluacion, descripcion_evaluacion,codigo_docente_materia_id, codigo_sub_actividad_id)
VALUES (48, 'Examen Final','Examen Para Evaluar todo lo del periodo',5, 'sub1_exa1_per4_2019');
----------------------------------------------------Finalizacion parte DIEGO-------------------------------------------

INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (1, 'El estudiante fue encontrado fuera del instituro en horas en que posee clases', '01/08/2018', '05833241-1', 'nie0001');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (2, 'El estudiante cometio actos de fraude en los examenes', '01/10/2018', '05833241-1', 'nie0001');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (3, 'El estudiante no obedece las normativas institucionales', '07/03/2019', '05833241-1', 'nie0001');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (4, 'El estudiante no trajo su uniforme escolar y no presente ninguna justificacion ', '05/04/2018', '11534242-3', 'nie0002');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (5, 'El estudiante muestra escenas de noviazgo no permitidos', '01/08/2018', '11534242-3', 'nie0002');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (6, 'Al estudiante se le encotró armas corto punsantes en su mochila', '23/03/2018', '25738212-2', 'nie0003');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (7, 'El estudiante se escapo de la institucion este dia ', '01/11/2018', '25738212-2', 'nie0003');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (8, 'El estudiante agredio a una compañera', '02/02/2018', '05833241-1', 'nie0003');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (9, 'El estudiante es malcriado', '01/03/2018', '01158242-3', 'nie0005');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (10, 'El estudiante come en clases', '20/04/2018', '03532231-3', 'nie0006');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (11, 'El estudiante no participa en actos civicos', '01/05/2018', '05417242-4', 'nie0007');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (12, 'El estudiante se porto mal', '30/06/2018', '05417242-4', 'nie0007');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (13, 'El estudiante', '09/04/2018', '03532231-3', 'nie0006');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (14, 'El estudiante', '02/07/2018', '01158242-3', 'nie0005');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (15, 'El estudiante', '05/08/2018', '05417242-4', 'nie0007');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (16, 'El estudiante', '06/09/2018', '05833241-1', 'nie0004');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (17, 'El estudiante', '08/10/2018', '01158242-3', 'nie0005');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (18, 'El estudiante', '10/11/2018', '05417242-4', 'nie0007');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (19, 'El estudiante', '01/02/2019', '05833241-1', 'nie0006');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (20, 'El estudiante', '31/08/2019', '05833241-1', 'nie0001');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (21, 'El estudiante', '01/03/2019', '07734242-1', 'nie0008');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (22, 'El estudiante', '01/03/2019', '02534252-1', 'nie0009');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (23, 'El estudiante', '02/04/2019', '02534252-1', 'nie0010');
INSERT INTO public."INTO_anotacion" (id, descripcion, fecha_anotacion, dui_docente_id, nie_id) VALUES (24, 'El estudiante', '08/04/2019', '05417242-4', 'nie0007');


INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (1, 7.26, 1,'nie0003' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (2, 8.26, 2,'nie0005' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (3, 3.4, 2,'nie0009' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (4, 7.78, 2,'nie0012' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (5, 8.46, 2,'nie0015' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (6, 7.32, 2,'nie0018' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (7, 4.78, 3,'nie0003' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (8,9.2, 3,'nie0005' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (9, 6.35, 3,'nie0009' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (10, 8.5, 3,'nie0012' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (11, 7.26, 3,'nie0015' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (12, 7.26, 3,'nie0018' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (13, 7.26, 4,'nie0003' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (14, 7.26, 4,'nie0005' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (15, 7.26, 4,'nie0009' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (16, 7.26, 4,'nie0012' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (17, 7.26, 4,'nie0018' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (18, 7.26, 4,'nie0003' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (19, 7.26, 5,'nie0005' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (20, 7.26, 5,'nie0009' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (21, 7.26, 5,'nie0012' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (22, 7.26, 5,'nie0015' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (23, 7.26, 5,'nie0018' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (24, 7.26, 5,'nie0003' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (25, 7.26, 6,'nie0005' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (26, 7.26, 6,'nie0009' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (27, 7.26, 6,'nie0012' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (28, 7.26, 6,'nie0015' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (29, 7.26, 6,'nie0018' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (30, 7.26, 6,'nie0003' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (31, 7.26, 7,'nie0005' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (32, 7.26, 7,'nie0009' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (33, 7.26, 7,'nie0012' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (34, 7.26, 7,'nie0015' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (35, 7.26, 7,'nie0018' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (36, 7.26, 7,'nie0003' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (37, 7.26, 8,'nie0005' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (38, 7.26, 8,'nie0009' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (39, 7.26, 8,'nie0012' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (40, 7.26, 8,'nie0015' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (41, 7.26, 8,'nie0018' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (42, 7.26, 8,'nie0003' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (43, 7.26, 9,'nie0005' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (44, 7.26, 9,'nie0009' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (45, 7.26, 9,'nie0012' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (46, 7.26, 9,'nie0015' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (47, 7.26, 9,'nie0018' );

INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (48, 8.26, 10,'nie0001' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (49, 8.26, 10,'nie0006' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (50, 8.26, 10,'nie0008' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (51, 8.26, 10,'nie0011' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (52, 8.26, 10,'nie0014' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (53, 8.26, 10,'nie0017' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (54, 8.26, 10,'nie0020' );

INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (55, 6.35, 11,'nie0001' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (56, 8.26, 11,'nie0006' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (57, 8.26, 11,'nie0008' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (58, 8.26, 11,'nie0011' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (59, 8.26, 11,'nie0014' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (60, 8.26, 11,'nie0017' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (61, 8.26, 11,'nie0020' );

INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (62, 7.86, 12,'nie0001' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (63, 7.86, 12,'nie0006' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (64, 7.86, 12,'nie0011' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (65, 7.86, 12,'nie0014' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (66, 7.86, 12,'nie0017' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (67, 7.86, 12,'nie0020' );

INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (68, 7.86, 13,'nie0001' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (69, 7.86, 13,'nie0006' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (70, 7.86, 13,'nie0008' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (71, 7.86, 13,'nie0011' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (72, 7.86, 13,'nie0014' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (73, 7.86, 13,'nie0017' );
INSERT INTO public."INTO_calificacion" (id, nota, codigo_evaluacion_id, nie_id) VALUES (74, 7.86, 13,'nie0020' );
