CREATE TABLE `SETTINGS` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `key` varchar(255),
  `display_name` varchar(255),
  `value` text,
  `details` text,
  `type` varchar(255),
  `order` int(11),
  `group` varchar(255)
);

CREATE TABLE `PASSWORD_RESETS` (
  `email` varchar(255),
  `token` varchar(255),
  `created_at` timestamp
);

CREATE TABLE `TRANSLATIONS` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255),
  `column_name` varchar(255),
  `foreign_key` int(10),
  `locale` varchar(255),
  `value` text,
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `MIGRATIONS` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `migration` varchar(255),
  `batch` int(11)
);

CREATE TABLE `DATA_TYPES` (
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

CREATE TABLE `DATA_ROWS` (
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

CREATE TABLE `MENUS` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `MENU_ITEMS` (
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

CREATE TABLE `ROLES` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(255),
  `display_name` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `USERS` (
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

CREATE TABLE `USER_ROLES` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`)
);

CREATE TABLE `PERMISSIONS` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `key` varchar(255),
  `table_name` varchar(255),
  `created_at` timestamp,
  `updated_at` timestamp
);

CREATE TABLE `PERMISSION_ROLE` (
  `permission_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`permission_id`, `role_id`)
);

ALTER TABLE `DATA_ROWS` ADD FOREIGN KEY (`data_type_id`) REFERENCES `DATA_TYPES` (`id`);

ALTER TABLE `MENU_ITEMS` ADD FOREIGN KEY (`menu_id`) REFERENCES `MENUS` (`id`);

ALTER TABLE `USERS` ADD FOREIGN KEY (`role_id`) REFERENCES `ROLES` (`id`);

ALTER TABLE `USER_ROLES` ADD FOREIGN KEY (`role_id`) REFERENCES `ROLES` (`id`);

ALTER TABLE `USER_ROLES` ADD FOREIGN KEY (`user_id`) REFERENCES `USERS` (`id`);

ALTER TABLE `PERMISSION_ROLE` ADD FOREIGN KEY (`role_id`) REFERENCES `ROLES` (`id`);

ALTER TABLE `PERMISSION_ROLE` ADD FOREIGN KEY (`permission_id`) REFERENCES `PERMISSIONS` (`id`);
