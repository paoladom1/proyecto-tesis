CREATE TABLE `settings` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `key` varchar(255),
  `display_name` varchar(255),
  `value` text,
  `details` text,
  `type` varchar(255),
  `order` int(11),
  `group` varchar(255)
);

CREATE TABLE `password_resets` (
  `email` varchar(255),
  `token` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `translations` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255),
  `column_name` varchar(255),
  `foreign_key` int(10),
  `locale` varchar(255),
  `value` text,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `personal_access_tokens` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255),
  `tokenable_id` bigint(20),
  `name` varchar(255),
  `token` varchar(64),
  `abilities` text,
  `last_used_at` timestamp,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `failed_jobs` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255),
  `connection` text,
  `queue` text,
  `payload` longtext,
  `exception` longtext,
  `failed_at` timestamp
);

CREATE TABLE `migrations` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `migration` varchar(255),
  `batch` int(11)
);

CREATE TABLE `data_types` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255),
  `slug` varchar(255),
  `display_name_singular` varchar(255),
  `display_name_plural` varchar(255),
  `icon` varchar(255),
  `model_name` varchar(255),
  `policy_name` varchar(255),
  `controller` varchar(255),
  `description` varchar(255),
  `generate_permissions` tinyint(1),
  `server_side` tinyint(4),
  `details` text,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `data_rows` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10),
  `field` varchar(255),
  `type` varchar(255),
  `display_name` varchar(255),
  `required` tinyint(1),
  `browse` tinyint(1),
  `read` tinyint(1),
  `edit` tinyint(1),
  `add` tinyint(1),
  `delete` tinyint(1),
  `details` text,
  `order` tinyint(1)
);

CREATE TABLE `menus` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `menu_items` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `menu_id` int(10),
  `title` varchar(255),
  `url` varchar(255),
  `target` varchar(255),
  `icon_class` varchar(255),
  `color` varchar(255),
  `parent_id` int(11),
  `order` int(11),
  `created_at` timestamp,
  `updated_at` timestamp,
  `route` varchar(255),
  `parameters` text
);

CREATE TABLE `roles` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255),
  `display_name` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `users` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20),
  `name` varchar(255),
  `email` varchar(255),
  `avatar` varchar(255),
  `email_verified_at` timestamp,
  `password` varchat(255),
  `remember_token` varchar(100),
  `settings` text,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`)
);

CREATE TABLE `permissions` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `key` varchar(255),
  `table_name` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `permission_role` (
  `permission_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`)
);

ALTER TABLE `data_rows` ADD FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`);

ALTER TABLE `menu_items` ADD FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

ALTER TABLE `user_roles` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

ALTER TABLE `user_roles` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `permission_role` ADD FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

ALTER TABLE `permission_role` ADD FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`);
