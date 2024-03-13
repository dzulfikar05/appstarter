/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL-LARAGON 3305
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3305
 Source Schema         : travel

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 13/03/2024 20:23:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city
-- ----------------------------

-- ----------------------------
-- Table structure for configurations
-- ----------------------------
DROP TABLE IF EXISTS `configurations`;
CREATE TABLE `configurations`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bot_tele_id` int NULL DEFAULT NULL,
  `no_telp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `no_wa` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ig` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tele` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `x` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updated_by` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of configurations
-- ----------------------------

-- ----------------------------
-- Table structure for destinations
-- ----------------------------
DROP TABLE IF EXISTS `destinations`;
CREATE TABLE `destinations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `city_id` bigint NULL DEFAULT NULL,
  `province_id` bigint NULL DEFAULT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` int NULL DEFAULT NULL,
  `is_active` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of destinations
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `number_order` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `customer_id` bigint NULL DEFAULT NULL,
  `destination_id` bigint NULL DEFAULT NULL,
  `date_start` date NULL DEFAULT NULL,
  `date_end` date NULL DEFAULT NULL,
  `driver_id` bigint NULL DEFAULT NULL,
  `vehicle_id` bigint NULL DEFAULT NULL,
  `day` int NULL DEFAULT NULL,
  `pickup_point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `person` int NULL DEFAULT NULL,
  `bill` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for province
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of province
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'ADM', 'admin', NULL, NULL, NULL);
INSERT INTO `role` VALUES (2, 'SPAD', 'Superadmin', NULL, NULL, NULL);
INSERT INTO `role` VALUES (3, 'SUPER', 'superadmin', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `desc` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` int NULL DEFAULT NULL,
  `alias` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of route
-- ----------------------------
INSERT INTO `route` VALUES (1, 'dashboard', 'menu-dashboard', '1', 1, 'Dashboard');
INSERT INTO `route` VALUES (2, 'role/destroy', 'sub', '3.5', 1, 'Role - Delete');
INSERT INTO `route` VALUES (10, 'profile', 'menu-profile', '2', 1, 'Profile');
INSERT INTO `route` VALUES (11, 'profile/store', 'sub', '2.1', 1, 'Profile - Save');
INSERT INTO `route` VALUES (12, 'profile/edit', 'sub', '2.2', 1, 'Profile - Edit');
INSERT INTO `route` VALUES (13, 'profile/update', 'sub', '2.3', 1, 'Profile - Update');
INSERT INTO `route` VALUES (14, 'profile/destroy', 'sub', '2.4', 1, 'Profile - Delete');
INSERT INTO `route` VALUES (15, 'role', 'menu-role', '3', 1, 'Role');
INSERT INTO `route` VALUES (16, 'role/table', 'sub', '3.1', 1, 'Role - View Table');
INSERT INTO `route` VALUES (17, 'role/store', 'sub', '3.2', 1, 'Role - Save');
INSERT INTO `route` VALUES (18, 'role/edit', 'sub', '3.3', 1, 'Role - Edit');
INSERT INTO `route` VALUES (19, 'role/update', 'sub', '3.4', 1, 'Role - Update');
INSERT INTO `route` VALUES (20, 'user', 'menu-user', '4', 1, 'User');
INSERT INTO `route` VALUES (21, 'user/table', 'sub', '4.1', 1, 'User - View Table');
INSERT INTO `route` VALUES (22, 'user/store', 'sub', '4.2', 1, 'User - Save');
INSERT INTO `route` VALUES (23, 'user/edit', 'sub', '4.3', 1, 'User - Edit');
INSERT INTO `route` VALUES (24, 'user/update', 'sub', '4.4', 1, 'User - Update');
INSERT INTO `route` VALUES (25, 'user/destroy', 'sub', '4.5', 1, 'User - Hapus');
INSERT INTO `route` VALUES (26, 'role/show', 'sub', '3.6', 1, 'Role - Show');
INSERT INTO `route` VALUES (27, 'role/saveRole', 'sub', '3.7', 1, 'Role - Save Role');
INSERT INTO `route` VALUES (28, 'role/combobox', 'sub', '3.8', 1, 'Role - Combobox');

-- ----------------------------
-- Table structure for slideshow
-- ----------------------------
DROP TABLE IF EXISTS `slideshow`;
CREATE TABLE `slideshow`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `update_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of slideshow
-- ----------------------------

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint NULL DEFAULT NULL,
  `route_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 3, 1);
INSERT INTO `user_role` VALUES (2, 3, 2);
INSERT INTO `user_role` VALUES (10, 3, 10);
INSERT INTO `user_role` VALUES (11, 3, 11);
INSERT INTO `user_role` VALUES (12, 3, 12);
INSERT INTO `user_role` VALUES (13, 3, 13);
INSERT INTO `user_role` VALUES (14, 3, 14);
INSERT INTO `user_role` VALUES (15, 3, 15);
INSERT INTO `user_role` VALUES (16, 3, 16);
INSERT INTO `user_role` VALUES (17, 3, 17);
INSERT INTO `user_role` VALUES (18, 3, 18);
INSERT INTO `user_role` VALUES (19, 3, 19);
INSERT INTO `user_role` VALUES (20, 3, 20);
INSERT INTO `user_role` VALUES (21, 3, 21);
INSERT INTO `user_role` VALUES (22, 3, 22);
INSERT INTO `user_role` VALUES (23, 3, 23);
INSERT INTO `user_role` VALUES (24, 3, 24);
INSERT INTO `user_role` VALUES (25, 3, 25);
INSERT INTO `user_role` VALUES (26, 3, 26);
INSERT INTO `user_role` VALUES (27, 3, 27);
INSERT INTO `user_role` VALUES (28, 3, 28);
INSERT INTO `user_role` VALUES (29, 1, 1);
INSERT INTO `user_role` VALUES (30, 1, 10);
INSERT INTO `user_role` VALUES (31, 1, 11);
INSERT INTO `user_role` VALUES (32, 1, 12);
INSERT INTO `user_role` VALUES (33, 1, 13);
INSERT INTO `user_role` VALUES (34, 1, 14);
INSERT INTO `user_role` VALUES (35, 1, 15);
INSERT INTO `user_role` VALUES (36, 1, 16);
INSERT INTO `user_role` VALUES (37, 1, 17);
INSERT INTO `user_role` VALUES (38, 1, 18);
INSERT INTO `user_role` VALUES (39, 1, 19);
INSERT INTO `user_role` VALUES (40, 1, 2);
INSERT INTO `user_role` VALUES (41, 1, 20);
INSERT INTO `user_role` VALUES (42, 1, 21);
INSERT INTO `user_role` VALUES (43, 1, 22);
INSERT INTO `user_role` VALUES (44, 1, 23);
INSERT INTO `user_role` VALUES (45, 1, 24);
INSERT INTO `user_role` VALUES (46, 1, 25);
INSERT INTO `user_role` VALUES (47, 1, 26);
INSERT INTO `user_role` VALUES (48, 1, 27);
INSERT INTO `user_role` VALUES (49, 1, 28);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `google_auth` int NULL DEFAULT NULL,
  `ktp` int NULL DEFAULT NULL,
  `sim` int NULL DEFAULT NULL,
  `no_telp` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `no_wa` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `id_tele` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `role_id` bigint NULL DEFAULT NULL,
  `is_active` int NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Superrz', NULL, 'super', '$2y$10$jrZdLYJiPW1o4KDDRHU8fOZ5pTa8zhmeWIU8KMkOka/oiUYuIWJc2', 'superadmin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (2, 'supra', NULL, 'supra', 'supra', 'supra@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (3, 'Agus hari', NULL, 'agus', '$2y$10$4.EprrvY6Pw0zUtgr4CsBuBiwogJ490it8/WVzuZb1tHbDIs284cG', 'agus@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (4, 'Superadmin', NULL, 'superadmin', '$2y$10$stEyAyWzQ4TqeDojv0ggqegHt2kTt8thOgsSIDTXfIUw6SqC.fw8e', 'superadmin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (5, 'Kleper Sopan 123', NULL, 'admin', '$2y$10$stEyAyWzQ4TqeDojv0ggqegHt2kTt8thOgsSIDTXfIUw6SqC.fw8e', 'admin@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (6, 'Dzulfikar', NULL, 'dzulfikar', '$2y$10$jrZdLYJiPW1o4KDDRHU8fOZ5pTa8zhmeWIU8KMkOka/oiUYuIWJc2', 'fikaralghifari0504@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, NULL, NULL, NULL);
INSERT INTO `users` VALUES (7, 'Dzulfikar Muhammad Al Ghifari', NULL, NULL, NULL, 'dzulfikar0456@gmail.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for vehicles
-- ----------------------------
DROP TABLE IF EXISTS `vehicles`;
CREATE TABLE `vehicles`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nopol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `merk` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `color` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `seat` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NULL DEFAULT NULL,
  `updated_at` datetime NULL DEFAULT NULL,
  `deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of vehicles
-- ----------------------------

-- ----------------------------
-- View structure for v_user_roles
-- ----------------------------
DROP VIEW IF EXISTS `v_user_roles`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_user_roles` AS select `user_role`.`id` AS `id`,`user_role`.`role_id` AS `role_id`,`user_role`.`route_id` AS `route_id`,`role`.`code` AS `code`,`route`.`name` AS `name`,`route`.`desc` AS `desc`,`route`.`order` AS `order`,`route`.`is_active` AS `is_active`,`route`.`alias` AS `alias` from ((`user_role` join `role` on((`user_role`.`role_id` = `role`.`id`))) join `route` on((`user_role`.`route_id` = `route`.`id`)));

SET FOREIGN_KEY_CHECKS = 1;
