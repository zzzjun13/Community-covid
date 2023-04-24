/*
 Navicat MySQL Data Transfer

 Source Server         : management
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : localhost:3306
 Source Schema         : jun

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 23/04/2023 19:22:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件类型',
  `size` bigint NULL DEFAULT NULL COMMENT '文件大小(kb)',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件md5',
  `is_delete` tinyint NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_md5`(`md5`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (48, '0171145e64f80da8012165184464d8.jpg@1280w_1l_2o_100sh.jpg', 'jpg', 173, 'http://localhost:9090/file/bd58a8eeb20342149e27e48b9fd1de02.jpg', '7ec92abe40d2baf9ed705c9b4ce5f7de', 0, 1);
INSERT INTO `sys_file` VALUES (50, '1.21.jpg', 'jpg', 355, 'http://localhost:9090/file/f075219d9d16418dbe778f9434ecdd59.jpg', '60b26cceeff5b2b274b627f89bd629c9', 0, 1);
INSERT INTO `sys_file` VALUES (58, '01fce05e8166a6a8012165183a720d.jpg@1280w_1l_2o_100sh.jpg', 'jpg', 203, 'http://localhost:9090/file/f3f0dcf1bb8c4c4f966859f5d6bed3f4.jpg', '5a9f9370d1f9bbc7db3a4455730902a0', 0, 1);
INSERT INTO `sys_file` VALUES (59, '017eb45dc1277ba801209e1f9f33e2.jpg@1280w_1l_2o_100sh.jpg', 'jpg', 146, 'http://localhost:9090/file/457349f5505044d4826b84a26cc9488a.jpg', '4e5deed1f8e18522e922482012053a30', 0, 1);
INSERT INTO `sys_file` VALUES (62, '01f9535cda6146a801214168ce864c.jpg@1280w_1l_2o_100sh.jpg', 'jpg', 38, 'http://localhost:9090/file/7ef8ba4d52d5456b8e7c2062d70fc658.jpg', '5efbcb0dfa3cb4e4f4506efd9aa04b52', 0, 1);

-- ----------------------------
-- Table structure for sys_iden
-- ----------------------------
DROP TABLE IF EXISTS `sys_iden`;
CREATE TABLE `sys_iden`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名字',
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `idcard` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '手机号码',
  `statas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '是否确诊',
  `idate` date NULL DEFAULT NULL COMMENT '就诊日期',
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '就诊医院',
  `redate` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '登记日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_iden`(`statas`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_iden
-- ----------------------------
INSERT INTO `sys_iden` VALUES (1, 'zzz', 1, '321302000000001234', '19846579845', '阳', '2023-04-11', '南京', '2023-04-11 01:34:45');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id ',
  `username` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '地址',
  `create_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 116 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '123456', '管理员', 'admin@qq.com', '13588775599', '江苏南京', '2023-04-03 22:00:31', 'http://localhost:9090/file/7ef8ba4d52d5456b8e7c2062d70fc658.jpg');
INSERT INTO `sys_user` VALUES (2, 'zhu', '123456', '猪八戒', 'zhu@qq.com', '13566778899', '花果山水帘洞', '2023-04-03 22:47:44', 'https://profile-avatar.csdnimg.cn/default.jpg');
INSERT INTO `sys_user` VALUES (11, 'tang', '123456', '唐僧', 'tang1@qq.com', '13655778899', '长安1', '2023-04-05 01:47:19', 'https://img.zcool.cn/community/01aeeb5e1c29b9a801216518080a75.png@1280w_1l_2o_100sh.png');
INSERT INTO `sys_user` VALUES (12, 'student', '123456', '学生', 'xue@qq.com', '1568237', '上海', '2023-04-05 03:48:45', 'https://img.zcool.cn/community/01aeeb5e1c29b9a801216518080a75.png@1280w_1l_2o_100sh.png');
INSERT INTO `sys_user` VALUES (13, 'qiao', '123456', '乔丹', 'qiao@qq.com', '14745697456', '美国', '2023-04-05 03:49:27', 'https://img.zcool.cn/community/01aeeb5e1c29b9a801216518080a75.png@1280w_1l_2o_100sh.png');
INSERT INTO `sys_user` VALUES (14, 'zzzz', '123456', 'zxc', 'zxc@qq.com', '12345678900', '北京', '2023-04-05 20:46:02', 'https://img.zcool.cn/community/01aeeb5e1c29b9a801216518080a75.png@1280w_1l_2o_100sh.png');
INSERT INTO `sys_user` VALUES (16, 'ys', '123456', '亚瑟', 'ys@qq.com', '13588775599', '欧洲', '2023-04-06 19:40:33', 'https://img.zcool.cn/community/01aeeb5e1c29b9a801216518080a75.png@1280w_1l_2o_100sh.png');
INSERT INTO `sys_user` VALUES (24, 'zjx', '123456', '翔仔', 'zjx@qq.com', '13485025836', '', '2023-04-06 23:59:54', 'https://img.zcool.cn/community/01aeeb5e1c29b9a801216518080a75.png@1280w_1l_2o_100sh.png');
INSERT INTO `sys_user` VALUES (29, 'angle', '123456', '安其拉', 'angle@qq.com', '13588775599', '', '2023-04-07 00:38:22', 'https://profile-avatar.csdnimg.cn/default.jpg');
INSERT INTO `sys_user` VALUES (30, 'yun', '456132', '赵云', 'yun@qq.com', '13566778899', '', '2023-04-07 00:38:22', 'https://profile-avatar.csdnimg.cn/default.jpg');
INSERT INTO `sys_user` VALUES (31, 'ying', '123456', '嬴政', 'ying@qq.com', '19856568988', '', '2023-04-07 00:38:22', 'https://profile-avatar.csdnimg.cn/default.jpg');
INSERT INTO `sys_user` VALUES (32, 'diao', '123456', '貂蝉', 'diao@qq.com', '13485025836', '', '2023-04-07 00:38:22', 'https://profile-avatar.csdnimg.cn/default.jpg');
INSERT INTO `sys_user` VALUES (34, 'angle', '123456', '安其拉', 'angle@qq.com', '13588775599', '', '2023-04-07 01:51:35', 'https://profile-avatar.csdnimg.cn/default.jpg');
INSERT INTO `sys_user` VALUES (35, 'yun', '456132', '赵云', 'yun@qq.com', '13566778899', '', '2023-04-07 01:51:35', 'https://profile-avatar.csdnimg.cn/default.jpg');
INSERT INTO `sys_user` VALUES (36, 'ying', '123456', '嬴政', 'ying@qq.com', '19856568988', '', '2023-04-07 01:51:35', 'https://profile-avatar.csdnimg.cn/default.jpg');
INSERT INTO `sys_user` VALUES (37, 'diao', '123456', '貂蝉', 'diao@qq.com', '13485025836', '', '2023-04-07 01:51:35', 'https://profile-avatar.csdnimg.cn/default.jpg');
INSERT INTO `sys_user` VALUES (114, 'sir', '123456', '管家', 'guan@qq.com', '15645678945', '北京', '2023-04-08 03:59:38', 'https://profile-avatar.csdnimg.cn/default.jpg');
INSERT INTO `sys_user` VALUES (115, 'zzzjun', '123456', '翔仔真不会', 'xiang@qq.com', '15648915648', '江苏苏州', '2023-04-08 19:31:44', '');

SET FOREIGN_KEY_CHECKS = 1;
