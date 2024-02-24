/*
 Navicat Premium Data Transfer

 Source Server         : LOCAL-XAMPP 3306
 Source Server Type    : MySQL
 Source Server Version : 100413
 Source Host           : localhost:3306
 Source Schema         : app_starter

 Target Server Type    : MySQL
 Target Server Version : 100413
 File Encoding         : 65001

 Date: 11/07/2023 20:26:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role`  (
  `role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_kode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_nama` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_created_at` datetime NULL DEFAULT NULL,
  `role_updated_at` datetime NULL DEFAULT NULL,
  `role_deleted_at` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_role
-- ----------------------------
INSERT INTO `tb_role` VALUES ('asdfc36qf1gk63d3', 'ADM', 'Admin', '2023-01-20 20:51:36', NULL, NULL);
INSERT INTO `tb_role` VALUES ('tc9rh9w741coc84k', 'SPAD', 'Superadmin', NULL, '2023-01-21 07:24:16', '2023-01-21 07:26:07');
INSERT INTO `tb_role` VALUES ('tttrgn0tgs0owk40', 'SUPER', 'superadmin', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tb_route
-- ----------------------------
DROP TABLE IF EXISTS `tb_route`;
CREATE TABLE `tb_route`  (
  `route_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `route_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_desc` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_order` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_active` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_alias` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`route_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_route
-- ----------------------------
INSERT INTO `tb_route` VALUES ('1', 'dashboard', 'menu-dashboard', '1', '1', 'Dashboard');
INSERT INTO `tb_route` VALUES ('10', 'profile', 'menu-profile', '2', '1', 'Profile');
INSERT INTO `tb_route` VALUES ('11', 'profile/store', 'sub', '2.1', '1', 'Profile - Save');
INSERT INTO `tb_route` VALUES ('12', 'profile/edit', 'sub', '2.2', '1', 'Profile - Edit');
INSERT INTO `tb_route` VALUES ('13', 'profile/update', 'sub', '2.3', '1', 'Profile - Update');
INSERT INTO `tb_route` VALUES ('14', 'profile/destroy', 'sub', '2.4', '1', 'Profile - Delete');
INSERT INTO `tb_route` VALUES ('15', 'role', 'menu-role', '3', '1', 'Role');
INSERT INTO `tb_route` VALUES ('16', 'role/table', 'sub', '3.1', '1', 'Role - View Table');
INSERT INTO `tb_route` VALUES ('17', 'role/store', 'sub', '3.2', '1', 'Role - Save');
INSERT INTO `tb_route` VALUES ('18', 'role/edit', 'sub', '3.3', '1', 'Role - Edit');
INSERT INTO `tb_route` VALUES ('19', 'role/update', 'sub', '3.4', '1', 'Role - Update');
INSERT INTO `tb_route` VALUES ('2', 'role/destroy', 'sub', '3.5', '1', 'Role - Delete');
INSERT INTO `tb_route` VALUES ('20', 'user', 'menu-user', '4', '1', 'User');
INSERT INTO `tb_route` VALUES ('21', 'user/table', 'sub', '4.1', '1', 'User - View Table');
INSERT INTO `tb_route` VALUES ('22', 'user/store', 'sub', '4.2', '1', 'User - Save');
INSERT INTO `tb_route` VALUES ('23', 'user/edit', 'sub', '4.3', '1', 'User - Edit');
INSERT INTO `tb_route` VALUES ('24', 'user/update', 'sub', '4.4', '1', 'User - Update');
INSERT INTO `tb_route` VALUES ('25', 'user/destroy', 'sub', '4.5', '1', 'User - Hapus');
INSERT INTO `tb_route` VALUES ('26', 'role/show', 'sub', '3.6', '1', 'Role - Show');
INSERT INTO `tb_route` VALUES ('27', 'role/saveRole', 'sub', '3.7', '1', 'Role - Save Role');
INSERT INTO `tb_route` VALUES ('28', 'role/combobox', 'sub', '3.8', '1', 'Role - Combobox');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user`  (
  `user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_nama` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_password` varchar(124) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_active` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_created_at` datetime NULL DEFAULT NULL,
  `user_updated_at` datetime NULL DEFAULT NULL,
  `user_deleted_at` datetime NULL DEFAULT NULL,
  `user_role` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('63c41ff41563d', 'SMKS', 'smk', 'smk@gmail.com', 'smk', 'yc3YikUI3lT5Zg3Lih7XOHc8wkOZL8j5lWrqlVy4.png', '1', '2023-01-15 15:47:00', '2023-01-19 18:23:37', NULL, NULL);
INSERT INTO `tb_user` VALUES ('63cf4cd02a5d2', 'supra', 'supra', 'supra@gmail.com', 'supra', NULL, NULL, '2023-01-24 03:13:20', NULL, '2023-01-24 03:14:07', 'asdfc36qf1gk63d3');
INSERT INTO `tb_user` VALUES ('kliqc3fu3678nbvw', 'Superadmin', 'superadmin', 'superadmin@gmail.com', '$2y$10$stEyAyWzQ4TqeDojv0ggqegHt2kTt8thOgsSIDTXfIUw6SqC.fw8e', NULL, NULL, '2023-01-15 20:17:53', NULL, '2023-01-16 04:25:41', NULL);
INSERT INTO `tb_user` VALUES ('qfg234huo367se3e', 'Kleper Sopan 123', 'admin', 'admin@gmail.com', '$2y$10$stEyAyWzQ4TqeDojv0ggqegHt2kTt8thOgsSIDTXfIUw6SqC.fw8e', '87hrNxtdpNSTtMtWpAmin5LMtAjC4cRQHD6aEGUx.jpg', '1', '2023-01-15 20:17:53', '2023-01-24 05:46:15', NULL, 'asdfc36qf1gk63d3');

-- ----------------------------
-- Table structure for tb_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_role`;
CREATE TABLE `tb_user_role`  (
  `user_role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_role_role_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_role_route_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_user_role
-- ----------------------------
INSERT INTO `tb_user_role` VALUES ('', NULL, '28');
INSERT INTO `tb_user_role` VALUES ('4puiaqcw3q808c0k', 'asdfc36qf1gk63d3', '14');
INSERT INTO `tb_user_role` VALUES ('5zc71l841dog8o0c', 'tttrgn0tgs0owk40', '20');
INSERT INTO `tb_user_role` VALUES ('6iwa8x5w3bgoswk4', 'asdfc36qf1gk63d3', '2');
INSERT INTO `tb_user_role` VALUES ('6ug7o4nozag48kw0', 'asdfc36qf1gk63d3', '1');
INSERT INTO `tb_user_role` VALUES ('80gppzt9t58oskw0', 'asdfc36qf1gk63d3', '17');
INSERT INTO `tb_user_role` VALUES ('8evkrhs51ukgwocs', 'asdfc36qf1gk63d3', '13');
INSERT INTO `tb_user_role` VALUES ('8q6uixzlgk084s00', 'tttrgn0tgs0owk40', '25');
INSERT INTO `tb_user_role` VALUES ('8t3mpj8h49ogo48w', 'tttrgn0tgs0owk40', '21');
INSERT INTO `tb_user_role` VALUES ('90rhn98rji0wc88s', 'tttrgn0tgs0owk40', '24');
INSERT INTO `tb_user_role` VALUES ('982tmun2ukg0kosk', 'asdfc36qf1gk63d3', '11');
INSERT INTO `tb_user_role` VALUES ('9p32o9t7frwgw8og', 'tttrgn0tgs0owk40', '14');
INSERT INTO `tb_user_role` VALUES ('d5jw409etrsw844o', 'asdfc36qf1gk63d3', '20');
INSERT INTO `tb_user_role` VALUES ('dlll6ipvw1s08kk4', 'asdfc36qf1gk63d3', '16');
INSERT INTO `tb_user_role` VALUES ('efrv80wbs5k4woss', 'asdfc36qf1gk63d3', '24');
INSERT INTO `tb_user_role` VALUES ('fiphb4iqyfww4ggs', 'tttrgn0tgs0owk40', '10');
INSERT INTO `tb_user_role` VALUES ('j3i0vvc9ilckcgw0', 'asdfc36qf1gk63d3', '25');
INSERT INTO `tb_user_role` VALUES ('j8t27bv5cgoc0c88', 'tttrgn0tgs0owk40', '12');
INSERT INTO `tb_user_role` VALUES ('jxegriml734gggo8', 'asdfc36qf1gk63d3', '21');
INSERT INTO `tb_user_role` VALUES ('kco3ull5wzkw80k0', 'asdfc36qf1gk63d3', '18');
INSERT INTO `tb_user_role` VALUES ('n3jnij9vw6ooss0s', 'asdfc36qf1gk63d3', '19');
INSERT INTO `tb_user_role` VALUES ('naijb2a01ass0o0g', 'asdfc36qf1gk63d3', '26');
INSERT INTO `tb_user_role` VALUES ('o1vyotr4bdw0cw84', 'tttrgn0tgs0owk40', '23');
INSERT INTO `tb_user_role` VALUES ('o2i00ekn6yskkw48', 'asdfc36qf1gk63d3', '23');
INSERT INTO `tb_user_role` VALUES ('oix1gd743b4wo0c8', 'asdfc36qf1gk63d3', '15');
INSERT INTO `tb_user_role` VALUES ('p6wlj8de9a80wg8k', 'asdfc36qf1gk63d3', '12');
INSERT INTO `tb_user_role` VALUES ('ppbegc0ij9wscg8s', 'tttrgn0tgs0owk40', '13');
INSERT INTO `tb_user_role` VALUES ('qdwgk7jes40cwwwg', 'tttrgn0tgs0owk40', '11');
INSERT INTO `tb_user_role` VALUES ('qujpujh45mskc8sc', 'tttrgn0tgs0owk40', '22');
INSERT INTO `tb_user_role` VALUES ('ri0mgn97k9ccg80c', 'asdfc36qf1gk63d3', '10');
INSERT INTO `tb_user_role` VALUES ('risvdiblqxw0o4kk', 'tttrgn0tgs0owk40', '1');
INSERT INTO `tb_user_role` VALUES ('t3qyndmilz4wwkwg', 'asdfc36qf1gk63d3', '22');
INSERT INTO `tb_user_role` VALUES ('t7i5rprki1ww84ss', 'asdfc36qf1gk63d3', '28');
INSERT INTO `tb_user_role` VALUES ('td339epcx3k808o0', 'asdfc36qf1gk63d3', '27');

-- ----------------------------
-- View structure for v_user_roles
-- ----------------------------
DROP VIEW IF EXISTS `v_user_roles`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_user_roles` AS SELECT
	tb_user_role.user_role_id, 
	tb_user_role.user_role_role_id, 
	tb_user_role.user_role_route_id, 
	tb_route.route_name, 
	tb_route.route_desc, 
	tb_route.route_order, 
	tb_role.role_kode, 
	tb_role.role_nama, 
	tb_route.route_alias
FROM
	tb_user_role
	INNER JOIN
	tb_route
	ON 
		tb_user_role.user_role_route_id = tb_route.route_id
	INNER JOIN
	tb_role
	ON 
		tb_user_role.user_role_role_id = tb_role.role_id ; ;

SET FOREIGN_KEY_CHECKS = 1;
