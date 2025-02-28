/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80100
 Source Host           : localhost:3306
 Source Schema         : running

 Target Server Type    : MySQL
 Target Server Version : 80100
 File Encoding         : 65001

 Date: 12/12/2024 20:56:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accept_orders
-- ----------------------------
DROP TABLE IF EXISTS `accept_orders`;
CREATE TABLE `accept_orders`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order_id` int(0) DEFAULT NULL,
  `runner_id` int(0) DEFAULT NULL,
  `is_end` tinyint(0) DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `runner_order_unique`(`order_id`, `runner_id`, `is_end`) USING BTREE COMMENT '跑手订单唯一索引，避免重复接单'
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `school_id` int(0) NOT NULL DEFAULT 0 COMMENT '学校id',
  `addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地图选点地址',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `addr_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '粘贴板内容',
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '经度',
  `lng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '纬度',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认',
  `created_at` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '收货地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int unsigned NOT NULL COMMENT '主键',
  `username` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `nickname` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `mobile` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `is_used` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用(1:是 -1:否)',
  `created_user` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_user` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for balance_records
-- ----------------------------
DROP TABLE IF EXISTS `balance_records`;
CREATE TABLE `balance_records`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '余额记录ID',
  `userid` int(0) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `money` float NOT NULL COMMENT '金额',
  `balance` float NOT NULL DEFAULT 0 COMMENT '当前余额',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '余额记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for big_file
-- ----------------------------
DROP TABLE IF EXISTS `big_file`;
CREATE TABLE `big_file`  (
  `id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '文件名称',
  `size` int(0) NOT NULL DEFAULT 0 COMMENT '文件大小',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '文件相对路径',
  `full_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '文件绝对路径',
  `mime_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '文件类型',
  `source` tinyint(0) NOT NULL DEFAULT 0 COMMENT '文件来源  0 - 本地，1 - 腾讯云 2 - 七牛云',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '描述',
  `md5` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'md5',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` datetime(0) DEFAULT NULL,
  `updated_at` datetime(0) DEFAULT NULL,
  `deleted_at` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for casbin_rule
-- ----------------------------
DROP TABLE IF EXISTS `casbin_rule`;
CREATE TABLE `casbin_rule`  (
  `ptype` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v0` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v2` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v3` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v4` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `v5` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for coin_records
-- ----------------------------
DROP TABLE IF EXISTS `coin_records`;
CREATE TABLE `coin_records`  (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `created_at` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted_at` datetime(0) DEFAULT NULL COMMENT '删除时间',
  `user_id` int(0) NOT NULL COMMENT '用户ID，关联用户表',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '金币来源（例如抽奖、任务奖励等）',
  `value` int(0) NOT NULL COMMENT '金币数值',
  `status` int(0) NOT NULL COMMENT '金币状态（例如1为已获得，2为已使用）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `coin_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for demo_city_code
-- ----------------------------
DROP TABLE IF EXISTS `demo_city_code`;
CREATE TABLE `demo_city_code`  (
  `id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '城市ID',
  `pid` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城市父ID',
  `deep` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '级别',
  `name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城市名称',
  `pinyin_prefix` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城市拼音头',
  `pinyin` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城市拼音',
  `ext_id` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '完整ID',
  `ext_name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城市全称',
  `weathercode` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '天气预报的编码',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id，name,code`(`id`, `name`, `weathercode`) USING BTREE COMMENT '这三个字段并列一起，必须是唯一的'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '省市区县和天气预报编码' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for demo_data_auth
-- ----------------------------
DROP TABLE IF EXISTS `demo_data_auth`;
CREATE TABLE `demo_data_auth`  (
  `id` int unsigned NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '标题',
  `created_by` int unsigned COMMENT '创建人',
  `updated_by` int unsigned COMMENT '修改人',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime(0) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '数据权限测试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for demo_gen
-- ----------------------------
DROP TABLE IF EXISTS `demo_gen`;
CREATE TABLE `demo_gen`  (
  `id` int unsigned NOT NULL,
  `demo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `demo_age` int unsigned NOT NULL COMMENT '年龄',
  `classes` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '班级',
  `demo_born` datetime(0) DEFAULT NULL COMMENT '出生年月',
  `demo_gender` tinyint unsigned NOT NULL COMMENT '性别',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '修改日期',
  `deleted_at` datetime(0) DEFAULT NULL COMMENT '删除日期',
  `created_by` bigint unsigned NOT NULL COMMENT '创建人',
  `updated_by` bigint unsigned NOT NULL COMMENT '修改人',
  `demo_status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '状态',
  `demo_cate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类',
  `demo_thumb` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '头像',
  `demo_photo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '相册',
  `demo_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '个人描述',
  `demo_file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '相关附件',
  `classes_two` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '班级二',
  `cate_trees` int unsigned NOT NULL COMMENT '树型单选',
  `cate_trees_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '树形多选',
  `options` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '其他选项',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for demo_gen_class
-- ----------------------------
DROP TABLE IF EXISTS `demo_gen_class`;
CREATE TABLE `demo_gen_class`  (
  `id` int unsigned NOT NULL COMMENT '分类id',
  `class_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成关联测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for demo_gen_other
-- ----------------------------
DROP TABLE IF EXISTS `demo_gen_other`;
CREATE TABLE `demo_gen_other`  (
  `id` int unsigned NOT NULL COMMENT 'ID',
  `info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '内容',
  `img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '单图',
  `imgs` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '多图',
  `file` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '单文件',
  `files` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '多文件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '特殊字段测试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for demo_gen_tree
-- ----------------------------
DROP TABLE IF EXISTS `demo_gen_tree`;
CREATE TABLE `demo_gen_tree`  (
  `id` int unsigned NOT NULL,
  `parent_id` int unsigned NOT NULL COMMENT '父级ID',
  `demo_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `demo_age` int unsigned NOT NULL COMMENT '年龄',
  `classes` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '班级',
  `demo_born` datetime(0) DEFAULT NULL COMMENT '出生年月',
  `demo_gender` tinyint unsigned NOT NULL COMMENT '性别',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '修改日期',
  `deleted_at` datetime(0) DEFAULT NULL COMMENT '删除日期',
  `created_by` bigint unsigned NOT NULL COMMENT '创建人',
  `updated_by` bigint unsigned NOT NULL COMMENT '修改人',
  `demo_status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '状态',
  `demo_cate` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成树形结构测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for demo_snow_id
-- ----------------------------
DROP TABLE IF EXISTS `demo_snow_id`;
CREATE TABLE `demo_snow_id`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓名',
  `age` int unsigned NOT NULL COMMENT '年龄',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '雪花ID测试' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for image_backups
-- ----------------------------
DROP TABLE IF EXISTS `image_backups`;
CREATE TABLE `image_backups`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片的半路径 方便切换域名的时候拼接',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片在阿里云 OSS 上的 URL',
  `created_at` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for images_backup
-- ----------------------------
DROP TABLE IF EXISTS `images_backup`;
CREATE TABLE `images_backup`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 58 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for lottery_records
-- ----------------------------
DROP TABLE IF EXISTS `lottery_records`;
CREATE TABLE `lottery_records`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `created_at` timestamp(0) DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp(0) DEFAULT NULL COMMENT '删除时间',
  `user_id` int(0) NOT NULL COMMENT '用户ID，关联用户表',
  `prize_id` bigint unsigned COMMENT '奖品ID，关联奖品表',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `prize_id`(`prize_id`) USING BTREE,
  CONSTRAINT `lottery_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `lottery_records_ibfk_2` FOREIGN KEY (`prize_id`) REFERENCES `prizes` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_evaluates
-- ----------------------------
DROP TABLE IF EXISTS `order_evaluates`;
CREATE TABLE `order_evaluates`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_del` tinyint(0) DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_history_statuses
-- ----------------------------
DROP TABLE IF EXISTS `order_history_statuses`;
CREATE TABLE `order_history_statuses`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '状态变更记录ID，自增主键',
  `order_id` int(0) NOT NULL COMMENT '订单ID',
  `status` int(0) NOT NULL COMMENT '订单状态',
  `created_at` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '状态变更时间，默认为当前时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单状态变更记录表，用于记录订单状态的历史变更信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_refunds
-- ----------------------------
DROP TABLE IF EXISTS `order_refunds`;
CREATE TABLE `order_refunds`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `order_id` int(0) DEFAULT NULL,
  `runner_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_refund` int(0) DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for order_types
-- ----------------------------
DROP TABLE IF EXISTS `order_types`;
CREATE TABLE `order_types`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_del` tinyint(0) DEFAULT 1,
  `created_at` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '订单表',
  `userid` int(0) DEFAULT NULL COMMENT '用户id',
  `order_num` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单编号',
  `type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单类型 对应order_type表的id',
  `runner_money` int(0) DEFAULT NULL COMMENT '跑通佣金',
  `about_money` int(0) DEFAULT NULL COMMENT '大概佣金',
  `weight` float(5, 0) DEFAULT NULL COMMENT '重量',
  `is_confirm` tinyint(1) DEFAULT 0 COMMENT '发单人是否已确认最后价格',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单描述',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `img_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图片 目前单张图 后面再优化',
  `receiving_code` int(0) DEFAULT NULL COMMENT '收货码',
  `require_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单规定时间完成',
  `wait_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单自动取消等待时间',
  `accept_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '接单时间',
  `end_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '订单结束时间',
  `status` tinyint(0) DEFAULT NULL COMMENT '订单状态：等待阶段 0 ，取货 1，送货 2，评价 3，结束 4，取消5  待支付6 ',
  `school_id` int(0) DEFAULT NULL COMMENT '学校id',
  `is_end` tinyint(0) DEFAULT 0 COMMENT '是否已经结束',
  `is_pay` tinyint(0) DEFAULT 0 COMMENT '是否已经支付',
  `receiving_id` tinyint(0) DEFAULT NULL COMMENT '收货地址id',
  `pick_address_id` tinyint(0) DEFAULT NULL COMMENT '取货地址id',
  `status_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '状态文案',
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系方式',
  `is_del` tinyint(1) DEFAULT 0 COMMENT '是否删除订单',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_is_end_status_index`(`userid`, `is_end`, `status`) USING BTREE COMMENT 'userid和is_end和status的联合索引'
) ENGINE = InnoDB AUTO_INCREMENT = 109 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prize_records
-- ----------------------------
DROP TABLE IF EXISTS `prize_records`;
CREATE TABLE `prize_records`  (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `created_at` timestamp(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `user_id` int(0) NOT NULL COMMENT '用户ID，关联用户表',
  `prize_id` bigint unsigned COMMENT '奖品ID，关联奖品表',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '奖品类型（例如优惠券、金币等）',
  `value` int(0) NOT NULL COMMENT '奖品数值',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '奖品状态（如未使用、已使用）',
  `usage_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '使用描述（如消费用途说明）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `prize_id`(`prize_id`) USING BTREE,
  CONSTRAINT `prize_records_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `prize_records_ibfk_2` FOREIGN KEY (`prize_id`) REFERENCES `prizes` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for prizes
-- ----------------------------
DROP TABLE IF EXISTS `prizes`;
CREATE TABLE `prizes`  (
  `id` bigint unsigned NOT NULL COMMENT '主键ID',
  `created_at` timestamp(0) DEFAULT NULL COMMENT '创建时间',
  `updated_at` timestamp(0) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` timestamp(0) DEFAULT NULL COMMENT '删除时间',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '奖品类型（例如优惠券、金币、红包等）',
  `value` int(0) NOT NULL COMMENT '奖品数值（如积分值或红包金额）',
  `base_probability` double NOT NULL COMMENT '基础中奖概率',
  `is_grand` tinyint(1) NOT NULL COMMENT '是否为大奖（true为大奖，false为普通奖品）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reviews
-- ----------------------------
DROP TABLE IF EXISTS `reviews`;
CREATE TABLE `reviews`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `order_id` int(0) NOT NULL COMMENT '订单id',
  `runner_id` int(0) NOT NULL COMMENT '骑手id',
  `userid` int(0) NOT NULL COMMENT '用户id',
  `score` tinyint(0) NOT NULL COMMENT '评分（1-5）',
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '评论内容（可为空）',
  `created_at` datetime(0) DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for runner_get_cashes
-- ----------------------------
DROP TABLE IF EXISTS `runner_get_cashes`;
CREATE TABLE `runner_get_cashes`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `userid` int(0) DEFAULT NULL,
  `money` float DEFAULT NULL,
  `balance` float DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_suceess` tinyint(0) DEFAULT 0,
  `created_at` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for runner_verify_records
-- ----------------------------
DROP TABLE IF EXISTS `runner_verify_records`;
CREATE TABLE `runner_verify_records`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '跑手审核记录表',
  `runner_id` int(0) NOT NULL DEFAULT 0 COMMENT '跑手id',
  `admin_id` int(0) NOT NULL DEFAULT 0 COMMENT '管理员id',
  `is_confirm` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否通过 1通过 0待审核 2拒绝',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '拒绝原因 非必填',
  `created_at` datetime(0) DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for runners
-- ----------------------------
DROP TABLE IF EXISTS `runners`;
CREATE TABLE `runners`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '跑手表',
  `userid` int(0) DEFAULT NULL COMMENT '用户id',
  `school_id` int(0) NOT NULL DEFAULT 0 COMMENT '关联的学校id 在认证跑手的时候同步user表的schoolid过来',
  `money` float(11, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金',
  `score` int(0) DEFAULT NULL COMMENT '信誉分 >50才可以成为跑手',
  `st_card_front_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生证正面照片',
  `st_card_back_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '学生证反面照片',
  `is_confirm` tinyint(1) DEFAULT 0 COMMENT '是否审核通过 1通过 只有1才能接单 2拒绝 0待审核',
  `is_ban` tinyint(1) DEFAULT 0 COMMENT '是否被封禁 1是 0否',
  `is_del` tinyint(1) DEFAULT 0 COMMENT '是否删除 0：未删除 1：已删除',
  `created_at` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for schools
-- ----------------------------
DROP TABLE IF EXISTS `schools`;
CREATE TABLE `schools`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `schoolname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `code` int(0) DEFAULT NULL,
  `show` tinyint(0) DEFAULT 1,
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8661 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_auth_rule`;
CREATE TABLE `sys_auth_rule`  (
  `id` int unsigned NOT NULL,
  `pid` int unsigned NOT NULL COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `menu_type` tinyint unsigned NOT NULL COMMENT '类型 0目录 1菜单 2按钮',
  `weigh` int(0) NOT NULL DEFAULT 0 COMMENT '权重',
  `is_hide` tinyint unsigned NOT NULL COMMENT '显示状态',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '组件路径',
  `is_link` tinyint unsigned NOT NULL COMMENT '是否外链 1是 0否',
  `module_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所属模块',
  `model_id` int unsigned NOT NULL COMMENT '模型ID',
  `is_iframe` tinyint unsigned NOT NULL COMMENT '是否内嵌iframe',
  `is_cached` tinyint unsigned NOT NULL COMMENT '是否缓存',
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '路由重定向地址',
  `is_affix` tinyint unsigned NOT NULL COMMENT '是否固定',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '链接地址',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 187 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int unsigned NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` tinyint(1) DEFAULT 0 COMMENT '系统内置（Y是 N否）',
  `create_by` int unsigned COMMENT '创建者',
  `update_by` int unsigned COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`config_id`) USING BTREE,
  UNIQUE INDEX `uni_config_key`(`config_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` tinyint unsigned COMMENT '部门状态（0正常 1停用）',
  `created_by` bigint unsigned COMMENT '创建人',
  `updated_by` bigint(0) DEFAULT NULL COMMENT '修改人',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime(0) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` tinyint(1) DEFAULT 0 COMMENT '是否默认（1是 0否）',
  `status` tinyint(1) DEFAULT 0 COMMENT '状态（1正常 0停用）',
  `create_by` bigint unsigned COMMENT '创建者',
  `update_by` bigint unsigned COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint unsigned NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` tinyint unsigned COMMENT '状态（0正常 1停用）',
  `create_by` int unsigned COMMENT '创建者',
  `update_by` int unsigned COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建日期',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint unsigned NOT NULL COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_params` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` tinyint(0) DEFAULT 1 COMMENT '计划执行策略（1多次执行 2执行一次）',
  `concurrent` tinyint(0) DEFAULT 1 COMMENT '是否并发执行（0允许 1禁止）',
  `status` tinyint(0) DEFAULT 0 COMMENT '状态（0正常 1暂停）',
  `created_by` bigint unsigned COMMENT '创建者',
  `updated_by` bigint unsigned COMMENT '更新者',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE INDEX `invoke_target`(`invoke_target`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `id` bigint unsigned NOT NULL COMMENT '主键',
  `target_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '方法名',
  `created_at` datetime(0) DEFAULT NULL COMMENT '执行日期',
  `result` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '执行结果',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 305 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` tinyint(0) DEFAULT 0 COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) DEFAULT NULL COMMENT '登录时间',
  `module` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录模块',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '标题',
  `type` bigint(0) NOT NULL COMMENT '类型',
  `tag` int(0) DEFAULT NULL COMMENT '标签',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '内容',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '备注',
  `sort` int(0) NOT NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) DEFAULT 1 COMMENT '状态',
  `created_by` bigint(0) DEFAULT NULL COMMENT '发送人',
  `updated_by` bigint(0) DEFAULT 0 COMMENT '修改人',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) DEFAULT NULL COMMENT '删除时间',
  `receiver` json COMMENT '接收者（私信）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '通知公告' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_read`;
CREATE TABLE `sys_notice_read`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `notice_id` bigint(0) NOT NULL COMMENT '信息id',
  `user_id` bigint(0) NOT NULL COMMENT '用户id',
  `clicks` int(0) DEFAULT NULL COMMENT '点击次数',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `created_at` datetime(0) DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `notice_id`(`notice_id`, `user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '已读记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint unsigned NOT NULL COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '请求参数',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '错误消息',
  `oper_time` datetime(0) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 233 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint unsigned NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` tinyint unsigned NOT NULL COMMENT '状态（0正常 1停用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `created_by` bigint unsigned NOT NULL COMMENT '创建人',
  `updated_by` bigint unsigned NOT NULL COMMENT '修改人',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '修改时间',
  `deleted_at` datetime(0) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int unsigned NOT NULL,
  `pid` int unsigned NOT NULL COMMENT '父级ID',
  `status` tinyint unsigned NOT NULL COMMENT '状态;0:禁用;1:正常',
  `list_order` int unsigned NOT NULL COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `data_scope` tinyint unsigned NOT NULL COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `created_by` bigint unsigned NOT NULL COMMENT '添加人',
  `effectiveTime` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '角色有效日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_scope
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_scope`;
CREATE TABLE `sys_role_scope`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `role_id` bigint unsigned NOT NULL COMMENT '角色id',
  `menu_id` int(0) NOT NULL COMMENT 'api接口id',
  `data_scope` int(0) NOT NULL COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `dept_ids` json COMMENT '扩展数据',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色数据权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint unsigned NOT NULL,
  `user_name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `birthday` int(0) NOT NULL DEFAULT 0 COMMENT '生日',
  `user_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_salt` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '加密盐',
  `user_status` tinyint unsigned NOT NULL COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `sex` tinyint(0) NOT NULL DEFAULT 0 COMMENT '性别;0:保密,1:男,2:女',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `dept_id` bigint unsigned NOT NULL COMMENT '部门id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `is_admin` tinyint(0) NOT NULL DEFAULT 1 COMMENT '是否后台管理员 1 是  0   否',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系地址',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT ' 描述信息',
  `last_login_ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` datetime(0) DEFAULT NULL COMMENT '最后登录时间',
  `created_at` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) DEFAULT NULL COMMENT '删除时间',
  `open_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信open id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_login`(`user_name`, `deleted_at`) USING BTREE,
  UNIQUE INDEX `mobile`(`mobile`, `deleted_at`) USING BTREE,
  INDEX `user_nickname`(`user_nickname`) USING BTREE,
  INDEX `open_id`(`open_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `id` bigint unsigned NOT NULL,
  `uuid` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户标识',
  `token` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '' COMMENT '用户token',
  `create_time` datetime(0) DEFAULT NULL COMMENT '登录时间',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `ip` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录ip',
  `explorer` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '浏览器',
  `os` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作系统',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_token`(`token`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户在线状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tmp_switches
-- ----------------------------
DROP TABLE IF EXISTS `tmp_switches`;
CREATE TABLE `tmp_switches`  (
  `is_need_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否需要支付 1是 0否'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tools_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `tools_gen_table`;
CREATE TABLE `tools_gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '表描述',
  `class_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `options` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '其它生成选项',
  `create_time` datetime(0) DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) DEFAULT NULL COMMENT '更新时间',
  `remark` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci COMMENT '备注',
  `overwrite` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否覆盖原有文件',
  `sort_column` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL COMMENT '排序字段名',
  `sort_type` varchar(4) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'asc' COMMENT '排序方式 (asc顺序 desc倒序)',
  `show_detail` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否有查看详情功能',
  `excel_port` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否有导出excel功能',
  `use_snow_id` bit(1) NOT NULL DEFAULT b'0' COMMENT '主键是否雪花ID',
  `use_virtual` bit(1) NOT NULL DEFAULT b'0' COMMENT '树表是否使用虚拟表',
  `excel_imp` bit(1) NOT NULL DEFAULT b'0' COMMENT '是否导入excel',
  `overwrite_info` json COMMENT '生成覆盖的文件',
  `menu_pid` int unsigned NOT NULL COMMENT '父级菜单ID',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tools_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `tools_gen_table_column`;
CREATE TABLE `tools_gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint(0) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `go_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Go类型',
  `ts_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'TS类型',
  `go_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Go字段名',
  `html_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'html字段名',
  `is_pk` bit(1) DEFAULT b'0' COMMENT '是否主键（1是）',
  `is_increment` bit(1) DEFAULT b'0' COMMENT '是否自增（1是）',
  `is_required` bit(1) DEFAULT b'0' COMMENT '是否必填（1是）',
  `is_edit` bit(1) DEFAULT b'0' COMMENT '是否编辑字段（1是）',
  `is_list` bit(1) DEFAULT b'1' COMMENT '是否列表字段（1是）',
  `is_detail` bit(1) DEFAULT b'1' COMMENT '是否详情字段',
  `is_query` bit(1) DEFAULT b'0' COMMENT '是否查询字段（1是）',
  `sort_order_edit` int(0) DEFAULT 999 COMMENT '插入编辑显示顺序',
  `sort_order_list` int(0) DEFAULT 999 COMMENT '列表显示顺序',
  `sort_order_detail` int(0) DEFAULT 999 COMMENT '详情显示顺序',
  `sort_order_query` int(0) DEFAULT 999 COMMENT '查询显示顺序',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `link_table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表名',
  `link_table_class` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表类名',
  `link_table_module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表模块名',
  `link_table_business_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表业务名',
  `link_table_package` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表包名',
  `link_label_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表键名',
  `link_label_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联表字段值',
  `col_span` int(0) DEFAULT 12 COMMENT '详情页占列数',
  `row_span` int(0) DEFAULT 1 COMMENT '详情页占行数',
  `is_row_start` bit(1) DEFAULT b'0' COMMENT '详情页为行首',
  `min_width` int(0) DEFAULT 100 COMMENT '表格最小宽度',
  `is_fixed` bit(1) DEFAULT b'0' COMMENT '是否表格列左固定',
  `is_overflow_tooltip` bit(1) DEFAULT b'0' COMMENT '是否过长自动隐藏',
  `is_cascade` bit(1) DEFAULT b'0' COMMENT '是否级联查询',
  `parent_column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '上级字段名',
  `cascade_column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '级联查询字段',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_wallet_records
-- ----------------------------
DROP TABLE IF EXISTS `user_wallet_records`;
CREATE TABLE `user_wallet_records`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '用户钱包记录表',
  `user_id` int(0) NOT NULL DEFAULT 0 COMMENT '用户id',
  `money` float NOT NULL DEFAULT 0 COMMENT '金额',
  `balance` float NOT NULL COMMENT '余额',
  `created_at` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `user_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否注册跑手，0表示否，1表示是',
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信授权登录获取的唯一标识',
  `unionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信多平台唯一标识，用于在不同微信平台间识别同一用户',
  `gender` tinyint(1) NOT NULL DEFAULT 1 COMMENT '性别，1表示男，2表示女，0表示未知',
  `country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `avatar_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像的URL地址',
  `is_ban` tinyint(0) NOT NULL DEFAULT 0 COMMENT '是否被封禁，0表示未被封禁，1表示被封禁',
  `score` int(0) NOT NULL DEFAULT 0 COMMENT '用户积分',
  `school_id` int(0) NOT NULL DEFAULT 0 COMMENT '学校ID',
  `is_first` int(0) NOT NULL DEFAULT 0 COMMENT '是否首次登录',
  `pay_qr_code_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付二维码的存储路径',
  `wallet` decimal(8, 0) NOT NULL DEFAULT 0 COMMENT '钱包余额',
  `diamonds` int(0) NOT NULL DEFAULT 0 COMMENT '抽奖总金币',
  `balance` decimal(8, 0) NOT NULL DEFAULT 0 COMMENT '钱包余额',
  `total_lottery_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '抽奖总次数',
  `created_at` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `deleted_at` datetime(0) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'C端用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for withdraw_records
-- ----------------------------
DROP TABLE IF EXISTS `withdraw_records`;
CREATE TABLE `withdraw_records`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '提现申请记录ID',
  `userid` int(0) DEFAULT NULL COMMENT '用户ID',
  `money` float DEFAULT NULL COMMENT '提现金额',
  `balance` float DEFAULT NULL COMMENT '当前余额',
  `status` int(0) DEFAULT NULL COMMENT '提现状态：1-待审核  2-已到账 3-审核失败  ',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '提现失败原因',
  `submit_time` datetime(0) DEFAULT NULL COMMENT '提交审核时间',
  `arrive_time` datetime(0) DEFAULT NULL COMMENT '到账时间',
  `created_at` timestamp(0) DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提现记录' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
