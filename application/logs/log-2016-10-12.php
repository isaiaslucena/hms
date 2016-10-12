<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed'); ?>

ERROR - 12-10-2016 16:51:15 --> Query error: Cannot delete or update a parent row: a foreign key constraint fails (`hms`.`exam`, CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`exam_type_id`) REFERENCES `exam_type` (`exam_type_id`))
ERROR - 12-10-2016 17:21:34 --> Query error: Cannot delete or update a parent row: a foreign key constraint fails (`hms`.`exam`, CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`exam_type_id`) REFERENCES `exam_type` (`exam_type_id`))
ERROR - 12-10-2016 17:23:59 --> Query error: Cannot delete or update a parent row: a foreign key constraint fails (`hms`.`doctor`, CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`))
