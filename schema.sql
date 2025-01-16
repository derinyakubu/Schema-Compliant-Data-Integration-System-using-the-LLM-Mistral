CREATE TABLE `addresses` (
  `id` bigint PRIMARY KEY NOT NULL,
  `addressable_type` varchar(255) NOT NULL,
  `addressable_id` bigint NOT NULL,
  `address_line_1` varchar(255) DEFAULT null,
  `address_line_2` varchar(255) DEFAULT null,
  `address_line_3` varchar(255) DEFAULT null,
  `town_city` varchar(255) DEFAULT null,
  `state_county` varchar(255) DEFAULT null,
  `postcode_zipcode` varchar(255) DEFAULT null,
  `country` varchar(255) DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `appointments` (
  `id` bigint PRIMARY KEY NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `location_id` bigint DEFAULT null,
  `number` varchar(255) DEFAULT null,
  `patient_id` bigint NOT NULL,
  `practitioner_id` bigint DEFAULT null,
  `patient_case_id` bigint NOT NULL,
  `status` ENUM ('draft', 'completed', 'Arrived', 'Did Not Arrive') NOT NULL DEFAULT 'draft',
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `completed_at` datetime DEFAULT null,
  `high_priority` tinyint(1) NOT NULL DEFAULT '0',
  `made_on_booking_portal` tinyint(1) NOT NULL DEFAULT '0',
  `details` text,
  `scheduled_at` timestamp DEFAULT null,
  `notified_at` timestamp DEFAULT null,
  `started_at` timestamp DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null,
  `cliniko_id` text
);

CREATE TABLE `appointment_details` (
  `id` bigint PRIMARY KEY NOT NULL,
  `appointment_id` bigint NOT NULL,
  `chief_complaint` text,
  `description` text,
  `attitude_to_illness` text,
  `effects_on_lifestyle` text,
  `examination_details` text,
  `diagnosis` text,
  `flags` text,
  `plan` text,
  `care_provided` text,
  `past_history` text,
  `social_history` text,
  `drug_history` text,
  `family_history` text,
  `motivational_interviewing` text,
  `diagram_svg_paths` longtext,
  `aftercare_note` longtext,
  `informed_consent` datetime DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `appointment_forms` (
  `id` bigint PRIMARY KEY NOT NULL,
  `created_by` bigint NOT NULL,
  `name` text NOT NULL,
  `description` text,
  `is_template` tinyint DEFAULT null,
  `deleted_at` date DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `appointment_form_questions` (
  `id` bigint PRIMARY KEY NOT NULL,
  `appointment_form_id` bigint NOT NULL,
  `section` text NOT NULL,
  `order` tinyint DEFAULT null,
  `name` text NOT NULL,
  `question` text NOT NULL,
  `type` text NOT NULL,
  `is_required` tinyint DEFAULT null,
  `deleted_at` date DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `appointment_goals` (
  `id` bigint PRIMARY KEY NOT NULL,
  `appointment_id` bigint NOT NULL,
  `name` varchar(255) DEFAULT null,
  `description` text,
  `progress` int DEFAULT '0',
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `appointment_payments` (
  `id` bigint PRIMARY KEY NOT NULL,
  `appointment_id` bigint NOT NULL,
  `payment_intent_id` varchar(255) DEFAULT null,
  `amount` bigint DEFAULT null,
  `currency` varchar(255) NOT NULL DEFAULT 'GBP',
  `amount_capturable` bigint DEFAULT null,
  `amount_received` bigint DEFAULT null,
  `application_fee_amount` bigint DEFAULT null,
  `status` varchar(255) DEFAULT null,
  `stripe_receipt` varchar(255) DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `method` int DEFAULT null,
  `discount` bigint NOT NULL DEFAULT '0'
);

CREATE TABLE `appointment_services` (
  `id` bigint PRIMARY KEY NOT NULL,
  `appointment_id` bigint NOT NULL,
  `service_user_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `time_required_minutes` int DEFAULT null,
  `start_minutes_past_hour` int DEFAULT null,
  `price` int DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `categories` (
  `id` bigint PRIMARY KEY NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null,
  `created_by` bigint NOT NULL,
  `practice_id` bigint NOT NULL,
  `cliniko_id` text
);

CREATE TABLE `failed_jobs` (
  `id` bigint PRIMARY KEY NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE `impersonation_auths` (
  `id` bigint PRIMARY KEY NOT NULL,
  `practice_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `code` varchar(255) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `jobs` (
  `id` bigint PRIMARY KEY NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint NOT NULL,
  `reserved_at` int DEFAULT null,
  `available_at` int NOT NULL,
  `created_at` int NOT NULL
);

CREATE TABLE `locations` (
  `id` bigint PRIMARY KEY NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `practice_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone_number` varchar(255) DEFAULT null,
  `email` varchar(255) DEFAULT null,
  `website` varchar(255) DEFAULT null,
  `visible_on_booking_portal` tinyint(1) NOT NULL DEFAULT '0',
  `auto_email_form` tinyint(1) NOT NULL DEFAULT '0',
  `booking_portal_payments_active` tinyint(1) NOT NULL DEFAULT '0',
  `booking_portal_description` text,
  `booking_portal_policy_excerpt` text,
  `booking_portal_policy_link` varchar(255) DEFAULT null,
  `booking_portal_gdpr_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `media` (
  `id` bigint PRIMARY KEY NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint NOT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT null,
  `disk` varchar(255) NOT NULL,
  `size` bigint NOT NULL,
  `manipulations` json NOT NULL,
  `custom_properties` json NOT NULL,
  `responsive_images` json NOT NULL,
  `order_column` int DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `migrations` (
  `id` int PRIMARY KEY NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL
);

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint NOT NULL,
  PRIMARY KEY (`permission_id`, `model_id`, `model_type`)
);

CREATE TABLE `model_has_roles` (
  `role_id` bigint NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`, `model_id`, `model_type`)
);

CREATE TABLE `notifications` (
  `id` char(36) PRIMARY KEY NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `parent_services` (
  `id` bigint PRIMARY KEY NOT NULL,
  `practice_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null,
  `cliniko_id` text
);

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp DEFAULT null
);

CREATE TABLE `patient_cases` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `number` varchar(255) DEFAULT null,
  `chief_complaint` text,
  `description` text,
  `copy_dialog_preference` ENUM ('copy', 'dont_copy') DEFAULT null,
  `closed_at` datetime DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null,
  `cliniko_id` text
);

CREATE TABLE `patient_details` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `phone_number` varchar(255) DEFAULT null,
  `secondary_phone_number` varchar(255) DEFAULT null,
  `gender` varchar(255) DEFAULT null,
  `date_of_birth` datetime DEFAULT null,
  `email_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sms_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `booking_reminders_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `referral_source` ENUM ('social_media', 'website', 'word_of_mouth', 'advert', 'google', 'other') DEFAULT null,
  `cliniko_id` text,
  `additional_fields` json DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null,
  `rehabmypatient_synced_at` datetime DEFAULT null,
  `medical_alerts` json DEFAULT null
);

CREATE TABLE `patient_emergency_contacts` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `name` varchar(255) DEFAULT null,
  `phone_number` varchar(255) DEFAULT null,
  `relationship` varchar(255) DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `patient_files` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `patient_case_id` bigint DEFAULT null,
  `name` varchar(255) DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `patient_gdpr_details` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `email_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `phone_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sms_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `patient_gps` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `gp_name` varchar(255) DEFAULT null,
  `surgery_name` varchar(255) DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `patient_medical_histories` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `past_history` text,
  `social_history` text,
  `drug_history` text,
  `family_history` text,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `patient_notes` (
  `id` bigint PRIMARY KEY NOT NULL,
  `patient_id` bigint NOT NULL,
  `practitioner_id` bigint NOT NULL,
  `title` text NOT NULL,
  `status` text,
  `fields` json DEFAULT null,
  `note` longtext,
  `cliniko_id` bigint DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `patient_treatment_plans` (
  `id` bigint PRIMARY KEY NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `practitioner_id` bigint NOT NULL,
  `patient_id` bigint NOT NULL,
  `location_id` bigint NOT NULL,
  `appointment_id` bigint DEFAULT null,
  `description` longtext,
  `message` longtext,
  `plans` json DEFAULT null,
  `default_plan` bigint DEFAULT null,
  `selected_plan` bigint DEFAULT null,
  `patient_replay` longtext,
  `status` varchar(255) DEFAULT null,
  `selected_at` date DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `permissions` (
  `id` bigint PRIMARY KEY NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `practices` (
  `id` bigint PRIMARY KEY NOT NULL,
  `unique_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT null,
  `booking_portal_active` tinyint(1) NOT NULL DEFAULT '0',
  `booking_reminders_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `sms_enabled` tinyint(1) NOT NULL DEFAULT '0',
  `sms_from_name` varchar(255) DEFAULT null,
  `connected_stripe_account_id` varchar(255) DEFAULT null,
  `stripe_id` varchar(255) DEFAULT null,
  `rehabmypatient_api_key` text,
  `mailerlite_api_key` text,
  `pm_type` varchar(255) DEFAULT null,
  `pm_last_four` varchar(4) DEFAULT null,
  `trial_ends_at` timestamp DEFAULT null,
  `timezone` varchar(255) NOT NULL DEFAULT 'Europe/London',
  `currency` varchar(255) NOT NULL DEFAULT 'GBP',
  `disable_notifications` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `practitioner_details` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `phone_number` varchar(255) DEFAULT null,
  `position` varchar(255) DEFAULT null,
  `working_hours` json DEFAULT null,
  `biography` text,
  `visible_on_booking_portal` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null,
  `cliniko_id` text
);

CREATE TABLE `roles` (
  `id` bigint PRIMARY KEY NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`)
);

CREATE TABLE `services` (
  `id` bigint PRIMARY KEY NOT NULL,
  `parent_service_id` bigint NOT NULL,
  `appointment_form_id` bigint DEFAULT null,
  `service_information_link` int DEFAULT null,
  `send_form_email` tinyint(1) DEFAULT null,
  `name` varchar(255) NOT NULL,
  `description` text,
  `time_required_minutes` int DEFAULT null,
  `start_minutes_past_hour` int DEFAULT null,
  `price` int DEFAULT null,
  `visible_on_booking_portal` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(255) DEFAULT '#08BA98',
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null,
  `category_id` bigint DEFAULT null,
  `schedule_type` int DEFAULT null,
  `buffer_time` int DEFAULT '0',
  `cliniko_id` text
);

CREATE TABLE `service_user` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `service_id` bigint NOT NULL,
  `appointment_form_id` bigint DEFAULT null,
  `send_form_email` tinyint(1) DEFAULT null,
  `time_required_minutes` int DEFAULT null,
  `start_minutes_past_hour` int DEFAULT null,
  `price` int DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null,
  `schedule_type` int DEFAULT null,
  `buffer_time` int DEFAULT null
);

CREATE TABLE `sessions` (
  `id` varchar(255) PRIMARY KEY NOT NULL,
  `user_id` bigint DEFAULT null,
  `ip_address` varchar(45) DEFAULT null,
  `user_agent` text,
  `payload` text NOT NULL,
  `last_activity` int NOT NULL
);

CREATE TABLE `sms` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `practice_id` bigint NOT NULL,
  `type` ENUM ('basic') DEFAULT null,
  `send_date` datetime NOT NULL,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `stripe_sms_subscription_details` (
  `id` bigint PRIMARY KEY NOT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_product_id` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `display_price` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `stripe_subscription_details` (
  `id` bigint PRIMARY KEY NOT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_product_id` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `display_price` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `access` ENUM ('free', 'full_access') NOT NULL DEFAULT 'full_access',
  `trial_length_days` int NOT NULL DEFAULT '0',
  `initial_user_count` int NOT NULL DEFAULT '1',
  `additional_user_price` int NOT NULL DEFAULT '0',
  `additional_user_display_price` varchar(255) NOT NULL DEFAULT '0',
  `max_user_count` int DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `subscriptions` (
  `id` bigint PRIMARY KEY NOT NULL,
  `practice_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_status` varchar(255) NOT NULL,
  `stripe_price` varchar(255) DEFAULT null,
  `quantity` int DEFAULT null,
  `trial_ends_at` timestamp DEFAULT null,
  `ends_at` timestamp DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `subscription_items` (
  `id` bigint PRIMARY KEY NOT NULL,
  `subscription_id` bigint NOT NULL,
  `stripe_id` varchar(255) NOT NULL,
  `stripe_product` varchar(255) NOT NULL,
  `stripe_price` varchar(255) NOT NULL,
  `quantity` int DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null
);

CREATE TABLE `treatment_plans` (
  `id` bigint PRIMARY KEY NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `link` varchar(255) DEFAULT null,
  `practice_id` bigint DEFAULT null,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `treatment_plan_templates` (
  `id` bigint PRIMARY KEY NOT NULL,
  `practice_id` bigint DEFAULT null,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `summary` longtext,
  `plans` json NOT NULL,
  `default_plan` bigint DEFAULT null,
  `message` longtext,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `users` (
  `id` bigint PRIMARY KEY NOT NULL,
  `title` ENUM ('Mr', 'Mrs', 'Miss', 'Ms', 'Mx', 'Sir', 'Dr', 'Lady', 'Lord', 'Master', 'Other') DEFAULT null,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT null,
  `email` varchar(255) DEFAULT null,
  `practice_id` bigint DEFAULT null,
  `email_verified_at` timestamp DEFAULT null,
  `remember_token` varchar(100) DEFAULT null,
  `notes` text,
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null,
  `stripe_id` varchar(255) DEFAULT null,
  `pm_type` varchar(255) DEFAULT null,
  `pm_last_four` varchar(4) DEFAULT null,
  `trial_ends_at` timestamp DEFAULT null,
  `discounted` tinyint(1) DEFAULT null,
  `privacy_policy_agreed_at` timestamp DEFAULT null,
  `terms_conditions_agreed_at` timestamp DEFAULT null,
  `cliniko_id` text,
  `imported_id` text,
  `last_location` bigint DEFAULT null
);

CREATE TABLE `user_unavailable` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `note` text,
  `visible_on_booking_portal` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

CREATE TABLE `user_working_hours_overrides` (
  `id` bigint PRIMARY KEY NOT NULL,
  `user_id` bigint NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `visible_on_booking_portal` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp DEFAULT null,
  `updated_at` timestamp DEFAULT null,
  `deleted_at` timestamp DEFAULT null
);

ALTER TABLE `appointments` ADD CONSTRAINT `appointments_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

ALTER TABLE `appointments` ADD CONSTRAINT `appointments_patient_case_id_foreign` FOREIGN KEY (`patient_case_id`) REFERENCES `patient_cases` (`id`);

ALTER TABLE `appointments` ADD CONSTRAINT `appointments_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);

ALTER TABLE `appointments` ADD CONSTRAINT `appointments_practitioner_id_foreign` FOREIGN KEY (`practitioner_id`) REFERENCES `users` (`id`);

ALTER TABLE `appointment_details` ADD CONSTRAINT `appointment_details_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);

ALTER TABLE `appointment_forms` ADD CONSTRAINT `appointment_forms_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `appointment_form_questions` ADD CONSTRAINT `appointment_form_questions_appointment_form_id_foreign` FOREIGN KEY (`appointment_form_id`) REFERENCES `appointment_forms` (`id`);

ALTER TABLE `appointment_goals` ADD CONSTRAINT `appointment_goals_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);

ALTER TABLE `appointment_payments` ADD CONSTRAINT `appointment_payments_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);

ALTER TABLE `appointment_services` ADD CONSTRAINT `appointment_services_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);

ALTER TABLE `appointment_services` ADD CONSTRAINT `appointment_services_service_user_id_foreign` FOREIGN KEY (`service_user_id`) REFERENCES `service_user` (`id`);

ALTER TABLE `locations` ADD CONSTRAINT `locations_practice_id_foreign` FOREIGN KEY (`practice_id`) REFERENCES `practices` (`id`);

ALTER TABLE `model_has_permissions` ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

ALTER TABLE `model_has_roles` ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

ALTER TABLE `parent_services` ADD CONSTRAINT `parent_services_practice_id_foreign` FOREIGN KEY (`practice_id`) REFERENCES `practices` (`id`);

ALTER TABLE `patient_cases` ADD CONSTRAINT `patient_cases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_details` ADD CONSTRAINT `patient_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_emergency_contacts` ADD CONSTRAINT `patient_emergency_contacts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_files` ADD CONSTRAINT `patient_files_patient_case_id_foreign` FOREIGN KEY (`patient_case_id`) REFERENCES `patient_cases` (`id`);

ALTER TABLE `patient_files` ADD CONSTRAINT `patient_files_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_gdpr_details` ADD CONSTRAINT `patient_gdpr_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_gps` ADD CONSTRAINT `patient_gps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_medical_histories` ADD CONSTRAINT `patient_medical_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_notes` ADD CONSTRAINT `patient_notes_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_notes` ADD CONSTRAINT `patient_notes_practitioner_id_foreign` FOREIGN KEY (`practitioner_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_treatment_plans` ADD CONSTRAINT `patient_treatment_plans_appointment_id_foreign` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`);

ALTER TABLE `patient_treatment_plans` ADD CONSTRAINT `patient_treatment_plans_default_plan_foreign` FOREIGN KEY (`default_plan`) REFERENCES `treatment_plans` (`id`);

ALTER TABLE `patient_treatment_plans` ADD CONSTRAINT `patient_treatment_plans_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`);

ALTER TABLE `patient_treatment_plans` ADD CONSTRAINT `patient_treatment_plans_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_treatment_plans` ADD CONSTRAINT `patient_treatment_plans_practitioner_id_foreign` FOREIGN KEY (`practitioner_id`) REFERENCES `users` (`id`);

ALTER TABLE `patient_treatment_plans` ADD CONSTRAINT `patient_treatment_plans_selected_plan_foreign` FOREIGN KEY (`selected_plan`) REFERENCES `treatment_plans` (`id`);

ALTER TABLE `practitioner_details` ADD CONSTRAINT `practitioner_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `role_has_permissions` ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

ALTER TABLE `role_has_permissions` ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

ALTER TABLE `services` ADD CONSTRAINT `services_parent_service_id_foreign` FOREIGN KEY (`parent_service_id`) REFERENCES `parent_services` (`id`);

ALTER TABLE `service_user` ADD CONSTRAINT `service_user_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`);

ALTER TABLE `service_user` ADD CONSTRAINT `service_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `sms` ADD CONSTRAINT `sms_practice_id_foreign` FOREIGN KEY (`practice_id`) REFERENCES `practices` (`id`);

ALTER TABLE `sms` ADD CONSTRAINT `sms_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `treatment_plans` ADD CONSTRAINT `treatment_plans_practice_id_foreign` FOREIGN KEY (`practice_id`) REFERENCES `practices` (`id`);

ALTER TABLE `treatment_plan_templates` ADD CONSTRAINT `treatment_plan_templates_default_plan_foreign` FOREIGN KEY (`default_plan`) REFERENCES `treatment_plans` (`id`);

ALTER TABLE `treatment_plan_templates` ADD CONSTRAINT `treatment_plan_templates_practice_id_foreign` FOREIGN KEY (`practice_id`) REFERENCES `practices` (`id`);

ALTER TABLE `users` ADD CONSTRAINT `users_last_location_foreign` FOREIGN KEY (`last_location`) REFERENCES `locations` (`id`);

ALTER TABLE `users` ADD CONSTRAINT `users_practice_id_foreign` FOREIGN KEY (`practice_id`) REFERENCES `practices` (`id`);

ALTER TABLE `user_unavailable` ADD CONSTRAINT `user_unavailable_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `user_working_hours_overrides` ADD CONSTRAINT `user_working_hours_overrides_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
