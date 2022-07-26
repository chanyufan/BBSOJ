/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : bbs

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 04/06/2022 17:34:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissions_group_id_b120cbf9`(`group_id`) USING BTREE,
  INDEX `auth_group_permissions_permission_id_84c5c92e`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  INDEX `auth_permission_content_type_id_2f476e4b`(`content_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 49 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add article', 7, 'add_article');
INSERT INTO `auth_permission` VALUES (26, 'Can change article', 7, 'change_article');
INSERT INTO `auth_permission` VALUES (27, 'Can delete article', 7, 'delete_article');
INSERT INTO `auth_permission` VALUES (28, 'Can view article', 7, 'view_article');
INSERT INTO `auth_permission` VALUES (29, 'Can add user profile', 8, 'add_userprofile');
INSERT INTO `auth_permission` VALUES (30, 'Can change user profile', 8, 'change_userprofile');
INSERT INTO `auth_permission` VALUES (31, 'Can delete user profile', 8, 'delete_userprofile');
INSERT INTO `auth_permission` VALUES (32, 'Can view user profile', 8, 'view_userprofile');
INSERT INTO `auth_permission` VALUES (33, 'Can add comment', 9, 'add_comment');
INSERT INTO `auth_permission` VALUES (34, 'Can change comment', 9, 'change_comment');
INSERT INTO `auth_permission` VALUES (35, 'Can delete comment', 9, 'delete_comment');
INSERT INTO `auth_permission` VALUES (36, 'Can view comment', 9, 'view_comment');
INSERT INTO `auth_permission` VALUES (37, 'Can add category', 10, 'add_category');
INSERT INTO `auth_permission` VALUES (38, 'Can change category', 10, 'change_category');
INSERT INTO `auth_permission` VALUES (39, 'Can delete category', 10, 'delete_category');
INSERT INTO `auth_permission` VALUES (40, 'Can view category', 10, 'view_category');
INSERT INTO `auth_permission` VALUES (41, 'Can add code editor', 11, 'add_codeeditor');
INSERT INTO `auth_permission` VALUES (42, 'Can change code editor', 11, 'change_codeeditor');
INSERT INTO `auth_permission` VALUES (43, 'Can delete code editor', 11, 'delete_codeeditor');
INSERT INTO `auth_permission` VALUES (44, 'Can view code editor', 11, 'view_codeeditor');
INSERT INTO `auth_permission` VALUES (45, 'Can add pro blem', 12, 'add_problem');
INSERT INTO `auth_permission` VALUES (46, 'Can change pro blem', 12, 'change_problem');
INSERT INTO `auth_permission` VALUES (47, 'Can delete pro blem', 12, 'delete_problem');
INSERT INTO `auth_permission` VALUES (48, 'Can view pro blem', 12, 'view_problem');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$320000$oJOYJ3HTKbqSf8qDjfpWM1$sfHM8IvHefxxZjWBe9XioNer5f9m6Y5YzDKPzOnOFNc=', '2022-05-08 01:45:35.850903', 1, 'admin', '', '', '', 1, 1, '2022-04-04 11:03:54.653851');
INSERT INTO `auth_user` VALUES (2, 'pbkdf2_sha256$320000$TJTfUJQSnlKYLhEWrRkQFu$o50mAtNaQTNo52s6P90nz4g9lfXBlq8FrxZQCHYlCSI=', '2022-05-07 11:37:42.572241', 0, 'cyf', '', '', 'cyf@qq.com', 0, 1, '2022-04-13 00:29:56.685081');
INSERT INTO `auth_user` VALUES (3, 'pbkdf2_sha256$320000$7biUaeCHWM5ccvJ1sR9cCC$3nAscjtHNI6O57rsP84+VQMCRzby2be0gMYI1Zw647c=', NULL, 0, 'cyf1', '', '', 'cyf@qq.com', 0, 1, '2022-04-13 00:54:53.065058');
INSERT INTO `auth_user` VALUES (4, 'pbkdf2_sha256$320000$71PVCoLa6H5uNV8SQiLVZA$Hc44c16QiJEUXiR3Gk45XEcX6K1XHz3Q/RDJsnNI57E=', NULL, 0, 'cyf2', '', '', 'cyf@qq.com', 0, 1, '2022-04-13 01:14:29.605617');
INSERT INTO `auth_user` VALUES (5, 'pbkdf2_sha256$320000$4HXSQw3Kh8xkLU9PxDROIv$iIagB6f6+TkhkxdfXHnVunEyr+SqoQXHMx9suQMet5c=', NULL, 0, 'cyf3', '', '', 'cyf@qq.com', 0, 1, '2022-04-13 01:15:29.906089');
INSERT INTO `auth_user` VALUES (6, 'pbkdf2_sha256$320000$d7rkuXmzF2wtS6wPQClgyK$5xccyaQMPewQmEWW56AQL+7bW8RJ6HCRBSyEFEbfNLw=', NULL, 0, 'cyf4', '', '', 'cyf@qq.com', 0, 1, '2022-04-13 01:15:48.489020');
INSERT INTO `auth_user` VALUES (7, 'pbkdf2_sha256$320000$MlBBKjTmlAX2BIjY0ozskM$mso7/FhkZNUUxYjqo/9Iuu6KdCeKNkbzwt9VoIzZGB0=', NULL, 0, 'cyf5', '', '', 'cyf@qq.com', 0, 1, '2022-04-13 01:17:34.241255');
INSERT INTO `auth_user` VALUES (8, 'pbkdf2_sha256$320000$lnEnQSZ5qGrEz4phuZU7se$k334Lrzv2AknOiezQVhvgcBIprCNTCk4riJyJUoRjI0=', '2022-05-07 11:39:30.657354', 0, 'ccc', '', '', 'yygqdata@qq.com', 0, 1, '2022-05-07 11:39:25.509330');
INSERT INTO `auth_user` VALUES (9, 'pbkdf2_sha256$320000$xlqgirVglt9m8ViQmfQfkM$3gHAHdw7+nX+WyhInZv/8zo318VoxxnAYXKzIQDQUwA=', '2022-05-08 01:38:13.689426', 0, 'fff', '', '', 'aaa@qq.com', 0, 1, '2022-05-08 01:38:06.423083');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id`, `group_id`) USING BTREE,
  INDEX `auth_user_groups_user_id_6a12ed8b`(`user_id`) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544`(`group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id`, `permission_id`) USING BTREE,
  INDEX `auth_user_user_permissions_user_id_a95ead1b`(`user_id`) USING BTREE,
  INDEX `auth_user_user_permissions_permission_id_1fbb5f2c`(`permission_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_article
-- ----------------------------
DROP TABLE IF EXISTS `bbs_article`;
CREATE TABLE `bbs_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `brief` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pub_date` datetime(6) NULL DEFAULT NULL,
  `last_modify` datetime(6) NOT NULL,
  `priority` int(11) NOT NULL,
  `head_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `users_liked` int(11) NOT NULL,
  `users_thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bbs_article_author_id_e30f26b3`(`author_id`) USING BTREE,
  INDEX `bbs_article_category_id_87bc5c16`(`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_article
-- ----------------------------
INSERT INTO `bbs_article` VALUES (1, 'cg', 'cg', '<p>cg</p>', NULL, '2022-05-07 11:39:48.759418', 1000, 'uploads/星星与你_晚上_一对情侣看流星_4k壁纸_彼岸图网.jpg', 'published', 1, 1, 1, 'ccc');
INSERT INTO `bbs_article` VALUES (2, 'Linux Thrift Study Note', 'Linux Thrift 学习笔记', '<h4><strong>创建match-server</strong></h4><blockquote><p><br>cd homework/lesson_6/thrift_lesson/match_system/src<br>thrift -r --gen cpp ../../thrift/match.thrift<br>mv gen-cpp match_server<br>rm match_server/Match_server.skeleton.cpp<br>&nbsp;</p></blockquote><h4><strong>创建save-client</strong><br>&nbsp;</h4><blockquote><p><br>cd homework/lesson_6/thrift_lesson/match_system/src<br>thrift -r --gen cpp ../../thrift/save.thrift<br>mv gen-cpp save_client<br>rm save_client/Save_server.skeleton.cpp<br>&nbsp;</p></blockquote><h4><a href=\"https://git.acwing.com/ccfancy/thrift_lesson/-/blob/master/match_system/src/main.cpp\"><strong>创建 main.cpp</strong></a>&nbsp;<br>&nbsp;</h4><blockquote><p><br>cd homework/lesson_6/thrift_lesson/match_system/src<br>vim main.cpp &nbsp;<br>&nbsp;</p></blockquote><h4><strong>编译</strong><br>&nbsp;</h4><blockquote><p><br>g++ -c main.cpp match_server/*.cpp save_client/*.cpp<br>&nbsp;</p></blockquote><h4><strong>链接</strong></h4><blockquote><p><br>g++ *.o -o main -lthrift -pthread&nbsp;</p><p>&nbsp;</p></blockquote><h4><strong>启动服务</strong></h4><blockquote><p><br>./main<br>&nbsp;</p></blockquote>', NULL, '2022-05-07 11:39:43.066214', 1000, 'uploads/po.jpg', 'published', 1, 1, 3, 'admin cyf ccc');
INSERT INTO `bbs_article` VALUES (3, 'ssh中配置免密登录', 'ssh中配置免密登录', '<h4><strong>在家目录下的 .ssh 文件夹中的 config文件中添加服务器别名和用户名和端口号（端口号可以不添加）</strong></h4><blockquote><h4><br>vim ~/.ssh/config</h4><p>Host server1<br>&nbsp; &nbsp;HostName 120.78.213.20<br>&nbsp; &nbsp;User acs</p><p>[Esc]<br>:wq</p><p>ssh server1<br>// 输入密码查看是否能登录</p><p>// 登录成功<br>logout</p><p>ssh-copy-id server1<br>// 输入密码</p><p>//完成配置<br>logout</p></blockquote>', NULL, '2022-05-07 11:39:37.150271', 1000, 'uploads/m16jl9z22q0qkbgslzkx.jpg', 'published', 1, 1, 3, 'cyf admin ccc');
INSERT INTO `bbs_article` VALUES (4, 'ccc', 'ccc', '<p><strong>CCC</strong></p><p><strong>ccc</strong></p><p><strong>ccc</strong></p>', NULL, '2022-05-08 01:38:35.158426', 1000, 'uploads/default.jpg', 'published', 8, 1, 2, 'ccc fff');
INSERT INTO `bbs_article` VALUES (5, 'sdasd', 'dasd', '<p>dasdasd</p>', NULL, '2022-05-08 01:39:04.360707', 1000, 'uploads/default.jpg', 'published', 9, 1, 2, '0 fff');

-- ----------------------------
-- Table structure for bbs_category
-- ----------------------------
DROP TABLE IF EXISTS `bbs_category`;
CREATE TABLE `bbs_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `brief` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `set_as_top_menu` tinyint(1) NOT NULL,
  `position_index` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_category
-- ----------------------------
INSERT INTO `bbs_category` VALUES (1, 'other', 'other', 1, 1);

-- ----------------------------
-- Table structure for bbs_category_admins
-- ----------------------------
DROP TABLE IF EXISTS `bbs_category_admins`;
CREATE TABLE `bbs_category_admins`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `userprofile_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `bbs_category_admins_category_id_userprofile_id_bfda4129_uniq`(`category_id`, `userprofile_id`) USING BTREE,
  INDEX `bbs_category_admins_category_id_aed69e53`(`category_id`) USING BTREE,
  INDEX `bbs_category_admins_userprofile_id_f2b3e32d`(`userprofile_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of bbs_category_admins
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_codeeditor
-- ----------------------------
DROP TABLE IF EXISTS `bbs_codeeditor`;
CREATE TABLE `bbs_codeeditor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_codeeditor
-- ----------------------------

-- ----------------------------
-- Table structure for bbs_comment
-- ----------------------------
DROP TABLE IF EXISTS `bbs_comment`;
CREATE TABLE `bbs_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_type` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `article_id` int(11) NOT NULL,
  `parent_comment_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `bbs_comment_article_id_b2d3fff2`(`article_id`) USING BTREE,
  INDEX `bbs_comment_parent_comment_id_8d6bc5f9`(`parent_comment_id`) USING BTREE,
  INDEX `bbs_comment_user_id_3fa31689`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_comment
-- ----------------------------
INSERT INTO `bbs_comment` VALUES (1, 1, '2022-04-04 11:08:23.116884', '<p><code>cong ge</code></p>', 1, NULL, 1);
INSERT INTO `bbs_comment` VALUES (2, 1, '2022-04-04 11:08:40.695035', '<p>congge</p>', 1, 1, 1);
INSERT INTO `bbs_comment` VALUES (3, 1, '2022-04-04 11:24:29.029977', '<p>content</p>', 1, NULL, 1);
INSERT INTO `bbs_comment` VALUES (4, 1, '2022-04-04 11:24:56.788074', '<p>2</p>', 1, 1, 1);
INSERT INTO `bbs_comment` VALUES (5, 1, '2022-04-04 11:25:01.244599', '<p>3</p>', 1, 4, 1);
INSERT INTO `bbs_comment` VALUES (6, 1, '2022-04-04 11:25:04.474168', '<p>3</p>', 1, 2, 1);
INSERT INTO `bbs_comment` VALUES (7, 1, '2022-04-14 06:17:54.185595', '<p><del>我没有</del></p>', 1, NULL, 1);
INSERT INTO `bbs_comment` VALUES (8, 1, '2022-04-14 07:47:43.626599', '<pre><code>$(&#39;.thumb&#39;).onclick(function () {\n        $.ajax({\n                url: &#39;http://127.0.0.1:8000/thumb/&#39;,\n                type: &quot;POST&quot;,\n                data: {\n                    article_id: {{ article_obj.id}},\n                    username: {{  request.user.userprofile.name  }},\n\n                },\n                success: function (resp) {\n                    // console.log(resp);\n                    if (resp.state === &#39;Success&#39;) {\n                        output.html(resp.output)\n                        time.html(resp.time)\n                    }\n                }\n            })\n    });\n</code></pre>', 1, NULL, 1);
INSERT INTO `bbs_comment` VALUES (9, 1, '2022-04-14 07:52:59.821331', '<p>srtsrtyxtyh</p>', 1, NULL, 1);
INSERT INTO `bbs_comment` VALUES (10, 1, '2022-04-14 07:55:45.598034', '<p>adjadbjadb mwdjsd</p>', 1, NULL, 1);
INSERT INTO `bbs_comment` VALUES (11, 1, '2022-04-14 07:56:27.561846', '<p>4</p>', 1, 6, 1);
INSERT INTO `bbs_comment` VALUES (12, 1, '2022-04-14 07:56:32.783936', '<p>5</p>', 1, 11, 1);
INSERT INTO `bbs_comment` VALUES (13, 1, '2022-04-14 07:56:37.034426', '<p>6</p>', 1, 12, 1);
INSERT INTO `bbs_comment` VALUES (14, 1, '2022-04-15 09:37:52.376281', '<p>[thmub]</p>', 2, NULL, 1);
INSERT INTO `bbs_comment` VALUES (15, 1, '2022-04-15 09:38:01.495766', '<p>牛牛</p>', 2, NULL, 1);
INSERT INTO `bbs_comment` VALUES (16, 1, '2022-05-07 11:45:41.608906', '<p>&#39;sadsadasd&#39;</p>', 4, NULL, 8);
INSERT INTO `bbs_comment` VALUES (17, 1, '2022-05-07 11:45:47.249916', '<p>asdasdasdasd</p>', 4, 16, 8);
INSERT INTO `bbs_comment` VALUES (18, 1, '2022-05-08 01:38:32.204702', '<p>asdasd</p>', 4, NULL, 9);
INSERT INTO `bbs_comment` VALUES (19, 1, '2022-05-08 01:39:08.503295', '<p>sadasds</p>', 5, NULL, 9);
INSERT INTO `bbs_comment` VALUES (20, 1, '2022-05-08 01:43:34.729251', '<p>&#39;s = input().split()\nprint(int(s[0]) * int(s[1]))&#39;</p>', 5, NULL, 9);

-- ----------------------------
-- Table structure for bbs_problem
-- ----------------------------
DROP TABLE IF EXISTS `bbs_problem`;
CREATE TABLE `bbs_problem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `problem_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `input_style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `output_style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `input_sample` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `output_sample` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `problem_degree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `space_limit` int(11) NULL DEFAULT NULL,
  `input` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `output` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `problem_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `problem_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time_limit` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_problem
-- ----------------------------
INSERT INTO `bbs_problem` VALUES (1, '输入两个整数，求这两个整数的和是多少。', '输入两个整数A,B，用空格隔开', '输出一个整数，表示这两个数的和', '0≤A,B≤10e8', '3 4', '7', '简单', 65536, 'problem_judge_data/1.in', '7', 'A+B problem', '1', 1000);
INSERT INTO `bbs_problem` VALUES (2, '有 N 件物品和一个容量是 V 的背包。每件物品只能使用一次。  第 i 件物品的体积是 vi，价值是 wi。  求解将哪些物品装入背包，可使这些物品的总体积不超过背包容量，且总价值最大。 输出最大价值。', '第一行两个整数，N，V，用空格隔开，分别表示物品数量和背包容积。  接下来有 N 行，每行两个整数 vi,wi，用空格隔开，分别表示第 i 件物品的体积和价值。', '输出一个整数，表示最大价值。', '0<N,V≤1000  0<vi,wi≤1000', '4 5 1 2 2 4 3 4 4 5', '8', '简单', 65536, '4 5 1 2 2 4 3 4 4 5', '8', '01背包问题', '2', 1000);
INSERT INTO `bbs_problem` VALUES (3, '读取四个整数 A,B,C,D，并计算 (A×B−C×D) 的值。', '输入共四行，第一行包含整数 A，第二行包含整数 B，第三行包含整数 C，第四行包含整数 D。', '输出格式为 DIFERENCA = X，其中 X 为 (A×B−C×D) 的结果。', '−10000≤A,B,C,D≤10000', '5 6 7 8', 'DIFERENCA = -26', '简单', 65536, 'problem_judge_data/2.in', 'DIFERENCA = -26', '差', '3', 1000);
INSERT INTO `bbs_problem` VALUES (4, '一个字符串的非空子串是指字符串中长度至少为 1 的连续的一段字符组成 的串。例如，字符串aaab 有非空子串a, b, aa, ab, aaa, aab, aaab，一共 7 个。 注意在计算时，只算本质不同的串的个数。 请问，字符串0100110001010001 有多少个不同的非空子串？', 'none', 'none', 'none', 'none', 'none', '简单', 65536, 'problem_judge_data/1_Q76L1WX.in', 'problem_judge_data/1.out', '不同子串', '4', 1000);
INSERT INTO `bbs_problem` VALUES (5, '把 2019 分解成 3 个各不相同的正整数之和，并且要求每个正整数都不包 含数字 2 和 4，一共有多少种不同的分解方法？ 注意交换 3 个整数的顺序被视为同一种方法，例如 1000+1001+18 和 1001+1000+18 被视为同一种。', 'none', 'none', 'none', 'none', 'none', '简单', 65536, 'problem_judge_data/1.in', 'problem_judge_data/1.out', '数的分解', '5', 1000);

-- ----------------------------
-- Table structure for bbs_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `bbs_userprofile`;
CREATE TABLE `bbs_userprofile`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `head_img` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bbs_userprofile
-- ----------------------------
INSERT INTO `bbs_userprofile` VALUES (1, 'admin', 'congge', 'media/星星与你_晚上_一对情侣看流星_4k壁纸_彼岸图网.jpg', 1);
INSERT INTO `bbs_userprofile` VALUES (2, 'cyf', '', 'media/default.jpg', 2);
INSERT INTO `bbs_userprofile` VALUES (3, 'cyf1', '', 'media/default.jpg', 3);
INSERT INTO `bbs_userprofile` VALUES (4, 'cyf2', '', 'media/default.jpg', 4);
INSERT INTO `bbs_userprofile` VALUES (5, 'cyf3', '', 'media/default.jpg', 5);
INSERT INTO `bbs_userprofile` VALUES (6, 'cyf4', '', 'media/default.jpg', 6);
INSERT INTO `bbs_userprofile` VALUES (7, 'cyf5', '', 'media/default.jpg', 7);
INSERT INTO `bbs_userprofile` VALUES (8, 'ccc', '', 'media/default.jpg', 8);
INSERT INTO `bbs_userprofile` VALUES (9, 'fff', '', 'media/default.jpg', 9);

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6`(`user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2022-04-04 11:07:55.412287', '1', 'admin', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2022-04-04 11:13:29.157287', '1', 'Problem object (1)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (3, '2022-04-15 14:19:43.587788', '2', 'Problem object (2)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (4, '2022-04-15 14:21:35.206170', '2', 'Problem object (2)', 2, '[{\"changed\": {\"fields\": [\"Input sample\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (5, '2022-04-15 14:23:31.474869', '1', 'Problem object (1)', 2, '[{\"changed\": {\"fields\": [\"Problem title\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (6, '2022-04-15 14:24:23.832786', '1', 'Problem object (1)', 2, '[]', 12, 1);
INSERT INTO `django_admin_log` VALUES (7, '2022-04-16 08:26:00.915921', '3', 'Problem object (3)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (8, '2022-05-05 16:48:53.212340', '1', 'Problem object (1)', 2, '[{\"changed\": {\"fields\": [\"Input\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (9, '2022-05-05 16:51:46.461717', '3', 'Problem object (3)', 2, '[{\"changed\": {\"fields\": [\"Input\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (10, '2022-05-05 16:52:09.694852', '3', 'Problem object (3)', 2, '[{\"changed\": {\"fields\": [\"Input\"]}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (11, '2022-05-07 03:39:03.358605', '4', 'Problem object (4)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (12, '2022-05-07 04:26:59.242410', '5', 'Problem object (5)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (13, '2022-05-07 12:21:57.634320', '6', 'Problem object (6)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (14, '2022-05-07 13:12:21.804853', '6', 'Problem object (6)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (15, '2022-05-07 14:25:23.071980', '7', 'Problem object (7)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (16, '2022-05-07 14:37:16.049966', '7', 'Problem object (7)', 3, '', 12, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (7, 'bbs', 'article');
INSERT INTO `django_content_type` VALUES (8, 'bbs', 'userprofile');
INSERT INTO `django_content_type` VALUES (9, 'bbs', 'comment');
INSERT INTO `django_content_type` VALUES (10, 'bbs', 'category');
INSERT INTO `django_content_type` VALUES (11, 'bbs', 'codeeditor');
INSERT INTO `django_content_type` VALUES (12, 'bbs', 'problem');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2022-04-04 11:00:58.924191');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2022-04-04 11:00:59.168321');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2022-04-04 11:00:59.264092');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2022-04-04 11:00:59.281048');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2022-04-04 11:00:59.292018');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2022-04-04 11:00:59.327748');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2022-04-04 11:00:59.354931');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2022-04-04 11:00:59.385832');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2022-04-04 11:00:59.397799');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2022-04-04 11:00:59.424729');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2022-04-04 11:00:59.428717');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2022-04-04 11:00:59.437692');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2022-04-04 11:00:59.471643');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2022-04-04 11:00:59.491620');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2022-04-04 11:00:59.508575');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2022-04-04 11:00:59.518548');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2022-04-04 11:00:59.556447');
INSERT INTO `django_migrations` VALUES (18, 'bbs', '0001_initial', '2022-04-04 11:00:59.811061');
INSERT INTO `django_migrations` VALUES (19, 'bbs', '0002_codeeditor_problem', '2022-04-04 11:00:59.829015');
INSERT INTO `django_migrations` VALUES (20, 'bbs', '0003_problem_problem_title', '2022-04-04 11:00:59.845969');
INSERT INTO `django_migrations` VALUES (21, 'bbs', '0004_problem_problem_number', '2022-04-04 11:00:59.862922');
INSERT INTO `django_migrations` VALUES (22, 'sessions', '0001_initial', '2022-04-04 11:00:59.885861');
INSERT INTO `django_migrations` VALUES (23, 'bbs', '0005_rename_time_space_limit_problem_space_limit_and_more', '2022-04-14 02:47:49.589404');
INSERT INTO `django_migrations` VALUES (24, 'bbs', '0006_alter_problem_space_limit_alter_problem_time_limit', '2022-04-14 04:52:06.390701');
INSERT INTO `django_migrations` VALUES (25, 'bbs', '0007_alter_problem_space_limit_alter_problem_time_limit', '2022-04-14 05:07:23.595866');
INSERT INTO `django_migrations` VALUES (26, 'bbs', '0008_article_users_liked', '2022-04-14 06:24:16.161034');
INSERT INTO `django_migrations` VALUES (27, 'bbs', '0009_alter_article_users_liked', '2022-04-14 06:25:56.566109');
INSERT INTO `django_migrations` VALUES (28, 'bbs', '0010_alter_article_users_liked', '2022-04-14 06:26:42.435101');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('ihja6uyuxv0ligo9o2epul8pembr3vqc', '.eJxVjMsOwiAQRf-FtSEdHqW4dO83kBkYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnAeL0uxHGB9cdpDvWW5Ox1XWZSe6KPGiX15b4eTncv4OCvXxra1V2lCl770eyCpxFm9AYmMhp9hFIu0hqGnnwA2QGTJS1Q21QWQbx_gDkBTgA:1nfMiv:S9fQL98bYxUyciH1L4RaOgFXFfzQIGJXsr9o9_DPyN0', '2022-04-29 14:14:57.380609');
INSERT INTO `django_session` VALUES ('5fg5whpnfaa2oydfnfibnixxhv475f6e', '.eJxVjMsOwiAQRf-FtSEdHqW4dO83kBkYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnAeL0uxHGB9cdpDvWW5Ox1XWZSe6KPGiX15b4eTncv4OCvXxra1V2lCl770eyCpxFm9AYmMhp9hFIu0hqGnnwA2QGTJS1Q21QWQbx_gDkBTgA:1nfIA0:LI2FgE7TVFDxzU8o5fR-BRiSU__OSnWcLdNFzgyfIdY', '2022-04-29 09:22:36.071042');
INSERT INTO `django_session` VALUES ('j3bg74azt26q7qzmfgwtzwzvwx6xrafq', '.eJxVjMsOwiAQRf-FtSEdHqW4dO83kBkYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnAeL0uxHGB9cdpDvWW5Ox1XWZSe6KPGiX15b4eTncv4OCvXxra1V2lCl770eyCpxFm9AYmMhp9hFIu0hqGnnwA2QGTJS1Q21QWQbx_gDkBTgA:1nnVzL:EZzUOGCjn8gJw23Ox55gdvh-4WIBxfTbjyqtGucghZo', '2022-05-22 01:45:35.856926');
INSERT INTO `django_session` VALUES ('wj2xvm6azo8wvoegk2zu3n9d14kuscs1', '.eJxVjMsOwiAQRf-FtSEdHqW4dO83kBkYpGogKe3K-O_apAvd3nPOfYmA21rC1nkJcxJnAeL0uxHGB9cdpDvWW5Ox1XWZSe6KPGiX15b4eTncv4OCvXxra1V2lCl770eyCpxFm9AYmMhp9hFIu0hqGnnwA2QGTJS1Q21QWQbx_gDkBTgA:1nn2mn:qOz1RJ0rNcvOSzG-Y8eoETVqLv_fKwgQd5aBIuoHsfc', '2022-05-20 18:34:41.775933');

SET FOREIGN_KEY_CHECKS = 1;
