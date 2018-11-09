/*
 Navicat Premium Data Transfer

 Source Server         : DCloud_ali
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : 123.56.154.229:3366
 Source Schema         : dvd

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 09/11/2018 15:50:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dvd_friend
-- ----------------------------
DROP TABLE IF EXISTS `dvd_friend`;
CREATE TABLE `dvd_friend`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `master_id` bigint(20) UNSIGNED NOT NULL,
  `friend_id` bigint(20) UNSIGNED NOT NULL,
  `class` tinyint(3) NOT NULL DEFAULT 1 COMMENT '好友分类: 1:供应商; 2 :采购商（厨师）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dvd_friend
-- ----------------------------
INSERT INTO `dvd_friend` VALUES (1, 3, 1, 1);
INSERT INTO `dvd_friend` VALUES (2, 1, 3, 2);
INSERT INTO `dvd_friend` VALUES (3, 4, 1, 1);
INSERT INTO `dvd_friend` VALUES (4, 1, 4, 2);
INSERT INTO `dvd_friend` VALUES (5, 1, 5, 1);
INSERT INTO `dvd_friend` VALUES (6, 5, 1, 2);
INSERT INTO `dvd_friend` VALUES (7, 1, 8, 1);
INSERT INTO `dvd_friend` VALUES (8, 8, 1, 2);

-- ----------------------------
-- Table structure for dvd_material
-- ----------------------------
DROP TABLE IF EXISTS `dvd_material`;
CREATE TABLE `dvd_material`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `owner_id` bigint(20) UNSIGNED NOT NULL COMMENT '所属用户ID',
  `type_id` bigint(20) UNSIGNED NOT NULL COMMENT '类型ID',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '食材名称',
  `quickcode` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '食材助记码',
  `spec` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规格说明（备注）：16袋/件',
  `price` float(11, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '参考价格',
  `pricefloat` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '价格较上月浮动状态： 0 未变，1 下降 2 上浮',
  `unit` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单位',
  `status` smallint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态： 0 上架，1 下架 ',
  `update_time` int(11) UNSIGNED NOT NULL COMMENT '更新时间',
  `create_time` int(11) UNSIGNED NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 351 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '食材表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dvd_material
-- ----------------------------
INSERT INTO `dvd_material` VALUES (1, 1, 1, '豆角', 'DJ', '', 3.20, 0, '斤', 0, 1531754869, 1531754869);
INSERT INTO `dvd_material` VALUES (2, 1, 1, '西兰花', 'XLH', '', 4.60, 0, '斤', 0, 1531754962, 1531754962);
INSERT INTO `dvd_material` VALUES (3, 1, 1, '小葱', 'XC', '', 10.00, 0, '斤', 0, 1531755011, 1531755011);
INSERT INTO `dvd_material` VALUES (4, 1, 1, '苦瓜', 'KG', '', 3.50, 0, '斤', 0, 1531755042, 1531755042);
INSERT INTO `dvd_material` VALUES (5, 1, 1, '玉米', 'YM', '', 4.00, 0, '斤', 0, 1531755066, 1531755066);
INSERT INTO `dvd_material` VALUES (6, 1, 1, '黄瓜', 'HG', '', 4.50, 0, '斤', 0, 1531755092, 1531755092);
INSERT INTO `dvd_material` VALUES (7, 1, 2, '猪肉', 'ZR', '', 12.00, 0, '斤', 0, 1531755123, 1531755123);
INSERT INTO `dvd_material` VALUES (8, 1, 2, '牛肉', 'NR', '', 45.00, 0, '斤', 0, 1531755145, 1531755145);
INSERT INTO `dvd_material` VALUES (9, 1, 3, '大米', 'DM', '', 3.50, 0, '斤', 0, 1531755168, 1531755168);
INSERT INTO `dvd_material` VALUES (10, 1, 3, '白面', 'BM', '', 2.50, 0, '斤', 0, 1531755188, 1531755188);
INSERT INTO `dvd_material` VALUES (11, 1, 4, '花椒', 'HJ', '', 30.00, 0, '斤', 0, 1531755220, 1531755220);
INSERT INTO `dvd_material` VALUES (12, 1, 2, '测试菜', 'CSC', '', 4.00, 0, '斤', 0, 1531800761, 1531800761);
INSERT INTO `dvd_material` VALUES (13, 1, 5, '人参', 'RS', '', 1200.00, 0, '斤', 0, 1532144495, 1531800761);
INSERT INTO `dvd_material` VALUES (14, 1, 5, '十三香', 'SSX', '', 8.00, 0, '斤', 0, 1532144516, 1532144516);
INSERT INTO `dvd_material` VALUES (15, 8, 1, '红皮小土豆', 'HPXTD', '', 2.30, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (16, 8, 1, '去皮小土豆', 'QPXTD', '', 2.80, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (17, 8, 1, '新大土豆', 'XDTD', '', 1.60, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (18, 8, 1, '白萝卜', 'BLB', '', 1.20, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (19, 8, 1, '小唐菜（上海青）', 'XTCSHQ', '', 2.20, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (20, 8, 1, '去头西兰花', 'QPXLH', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (21, 8, 1, '（去杆）茼蒿菜尖', 'QGTHCJ', '', 6.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (22, 8, 1, '意大利生菜', 'YDLSC', '', 3.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (23, 8, 1, '西生菜', 'XSC', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (24, 8, 1, '紫叶生菜', 'ZYSC', '', 12.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (25, 8, 1, '广菜心', 'GCX', '', 4.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (26, 8, 1, '茴香头', 'HXT', '', 11.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (27, 8, 1, '黄瓜', 'HG', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (28, 8, 5, '鲜仔姜', 'XZJ', '', 7.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (29, 8, 5, '南姜', 'NJ', '', 9.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (30, 8, 5, '肉姜', 'RJ', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (31, 8, 5, '沙姜', 'SJ', '', 13.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (32, 8, 1, '嫩豆腐', 'NDF', '', 1.40, 0, '个', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (33, 8, 1, '老豆腐', 'LDF', '', 1.50, 0, '个', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (34, 8, 1, '青二荆条', 'QEJT', '', 4.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (35, 8, 1, '大青椒', 'DQJ', '', 2.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (36, 8, 1, '大红椒', 'DHJ', '', 7.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (37, 8, 1, '红小米椒', 'HXML', '', 10.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (38, 8, 1, '青小米椒', 'QXML', '', 7.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (39, 8, 1, '红美人', 'HMR', '', 9.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (40, 8, 1, '青美人', 'QMR', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (41, 8, 1, '杏鲍菇', 'XBG', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (42, 8, 1, '（大）香菇', 'DXG', '', 7.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (43, 8, 1, '藕', 'O', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (44, 8, 1, '干香茅', 'GXM', '', 7.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (45, 8, 1, '小葱', 'XC', '', 3.30, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (46, 8, 1, '大京葱', 'DJC', '', 3.30, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (47, 8, 1, '发香', 'FX', '', 10.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (48, 8, 1, '广东圣瓜', 'GDSG', '', 8.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (49, 8, 1, '冬瓜', 'DG', '', 1.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (50, 8, 1, '乳瓜', 'YG', '', 7.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (51, 8, 1, '老南瓜', 'LNG', '', 1.70, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (52, 8, 1, '金瓜', 'JG', '', 3.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (53, 8, 1, '空心菜', 'KXC', '', 0.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (54, 8, 1, '西芹', 'XQ', '', 3.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (55, 8, 1, '芹菜', 'QC', '', 2.80, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (56, 8, 1, '广胡', 'GH', '', 2.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (57, 8, 1, '香菜', 'XC', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (58, 8, 1, '泰国香菜', 'TGXC', '', 11.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (59, 8, 1, '河粉', 'HF', '', 2.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (60, 8, 1, '油麦菜', 'YMC', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (61, 8, 1, '西红柿', 'XHS', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (62, 8, 1, '苦菊', 'KJ', '', 6.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (63, 8, 1, '银芽', 'YY', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (64, 8, 1, '广香芋', 'GXY', '', 8.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (65, 8, 1, '去皮马蹄', 'QPMT', '', 14.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (66, 8, 1, '精品豆芽', 'JPDY', '', 1.50, 0, '把', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (67, 8, 1, '韭黄', 'JH', '', 7.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (68, 8, 1, '小韭菜', 'XJC', '', 3.20, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (69, 8, 1, '苦瓜', 'KG', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (70, 8, 1, '毛芋儿', 'MYE', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (71, 8, 1, '去皮芋儿', 'QPYE', '', 4.20, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (72, 8, 1, '木耳', 'ME', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (73, 8, 1, '去皮青笋', 'QPQS', '', 3.80, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (74, 8, 1, '小白菜', 'XBC', '', 2.80, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (75, 8, 1, '大白菜', 'DBC', '', 1.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (76, 8, 1, '洋葱', 'YC', '', 1.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (77, 8, 1, '苋菜', 'XC', '', 0.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (78, 8, 1, '豆干', 'DG', '', 5.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (79, 8, 1, '（细绿）豇豆', 'XLJD', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (80, 8, 3, '肺片', 'FP', '', 12.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (81, 8, 4, '鸡蛋面', 'JDM', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (82, 8, 2, '乳鸽', 'RG', '', 15.50, 0, '只', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (83, 8, 1, '蒜苗', 'SM', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (84, 8, 2, '鸡脚', 'JJ', '', 14.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (85, 8, 1, '干葱头', 'GCT', '', 5.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (86, 8, 1, '墨茄子（大）', 'MQZD', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (87, 8, 2, '酱鸭舌', 'JYS', '', 90.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (88, 8, 1, '魔芋', 'MY', '', 1.20, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (89, 8, 2, '竹丝鸡', 'ZSJ', '', 14.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (90, 8, 1, '有机豆', 'YJD', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (91, 8, 1, '鲜虫草花', 'XCCH', '', 12.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (92, 8, 2, '鲢鱼', 'LY', '杀好', 9.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (93, 8, 2, '光鸭', 'GY', '', 7.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (94, 8, 2, '三黄鸡', 'SHJ', '', 10.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (95, 8, 2, '去骨鸡腿肉', 'QGJTR', '', 15.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (96, 8, 2, '盐蛋', 'YD', '', 1.60, 0, '个', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (97, 8, 2, '鸡蛋', 'JD', '', 5.80, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (98, 8, 2, '黄油土鸡', 'HYTJ', '', 22.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (99, 8, 2, '土公鸡', 'TGJ', '', 13.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (100, 8, 3, '冻鸡油', 'DJY', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (101, 8, 1, '大苑菜', 'DYC', '', 3.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (102, 8, 1, '大山药', 'DSY', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (103, 8, 1, '花菜', 'HC', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (104, 8, 1, '带丝', 'DS', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (105, 8, 1, '玉米棒', 'YMB', '', 4.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (106, 8, 1, '鲜玉米粒', 'XYML', '', 7.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (107, 8, 1, '紫苏叶', 'ZSY', '', 8.00, 0, '盒', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (108, 8, 1, '紫甘蓝', 'ZGL', '', 3.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (109, 8, 1, '小菊花', 'XJH', '', 6.00, 0, '扎', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (110, 8, 1, '心灵美', 'XLM', '', 4.20, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (111, 8, 1, '菠菜', 'BC', '', 4.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (112, 8, 1, '鲜青豆粒', 'XQDL', '', 8.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (113, 8, 3, '毛肚', 'MD', '', 34.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (114, 8, 3, '黄喉', 'HH', '', 32.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (115, 8, 5, '泡豇豆', 'PJD', '', 4.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (116, 8, 5, '水豆豉', 'SDS', '', 4.80, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (117, 8, 1, '干水芥兰', 'GSJL', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (118, 8, 2, '光头皮蛋', 'GTPD', '', 1.70, 0, '个', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (119, 8, 1, '折耳根', 'ZEG', '', 5.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (120, 8, 1, '折耳叶', 'ZEY', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (121, 8, 2, '草鱼', 'CY', '杀好', 11.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (122, 8, 2, '烟熏竹鸡', 'YXZJ', '', 7.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (123, 8, 1, '雪豆', 'XD', '', 8.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (124, 8, 1, '薄荷叶', 'BHY', '', 10.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (125, 8, 1, '莲白', 'LB', '', 1.30, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (126, 8, 1, '去皮白果', 'QPBG', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (127, 8, 1, '大头菜', 'DTC', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (128, 8, 5, '泡姜', 'PJ', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (129, 8, 5, '泡红椒', 'PHJ', '', 4.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (130, 8, 5, '泡萝卜', 'PLB', '', 2.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (131, 8, 1, '红彩椒', 'HCJ', '', 8.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (132, 8, 1, '三月瓜', 'SYG', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (133, 8, 1, '红苕', 'HS', '', 2.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (134, 8, 1, '牛心白', 'NXB', '', 2.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (135, 8, 1, '鲜花椒', 'XHJ', '', 12.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (136, 8, 1, '豆芽', 'DY', '', 1.60, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (137, 8, 1, '芦笋', 'LS', '', 24.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (138, 8, 1, '凤尾', 'FW', '', 2.80, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (139, 8, 2, '野鸭子（水鸭）', 'YYZSY', '', 17.00, 0, '只', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (140, 8, 2, '农家土鸭', 'NJTY', '', 11.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (141, 8, 4, '挂面（手工面）', 'GMSGM', '2斤', 7.00, 0, '把', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (142, 8, 1, '带皮青笋', 'DPQS', '', 2.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (143, 8, 1, '大芥兰头', 'DJLT', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (144, 8, 1, '海白菜', 'HBC', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (145, 8, 1, '常青藤', 'CQT', '', 18.00, 0, '盆', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (146, 8, 1, '凉瓜', 'LG', '', 9.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (147, 8, 1, '平菇', 'PG', '', 5.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (148, 8, 1, '蒜台', 'ST', '', 4.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (149, 8, 1, '四季豆', 'SJD', '', 4.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (150, 8, 1, '花生', 'HS', '', 5.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (151, 8, 1, '毛豆', 'MD', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (152, 8, 1, '苕尖', 'SJ', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (153, 8, 1, '紫苕', 'ZS', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (154, 8, 1, '黄彩椒', 'HCJ', '', 13.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (155, 8, 1, '豆花', 'DH', '', 1.50, 0, '盒', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (156, 8, 1, '巴西叶', 'BXY', '', 5.00, 0, '把', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (157, 8, 2, '鲜鸡架', 'XJJ', '', 4.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (158, 8, 1, '香春苗', 'XCM', '', 5.00, 0, '盒', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (159, 8, 2, '烫皮兔', 'TPT', '', 18.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (160, 8, 1, '小芥兰', 'XJL', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (161, 8, 1, '干荷叶', 'GHY', '', 15.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (162, 8, 1, '白凉粉', 'BLF', '', 1.40, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (163, 8, 2, '美国大凤爪', 'MGDFZ', '', 15.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (164, 8, 2, '去皮兔', 'QPT', '', 14.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (165, 8, 4, '馒头', 'MT', '', 0.70, 0, '个', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (166, 8, 1, '无筋豆', 'WJD', '', 4.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (167, 8, 2, '去骨鸭掌', 'QGYZ', '', 21.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (168, 8, 1, '青南瓜', 'QNG', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (169, 8, 1, '铁杆山药', 'TGSY', '', 7.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (170, 8, 1, '油炸豆腐', 'YZDF', '', 8.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (171, 8, 2, '兔柳', 'TL', '', 235.00, 0, '板', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (172, 8, 1, '巴西掌中宝', 'BXZZB', '4斤/袋', 108.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (173, 8, 2, '鸭掌（带骨）', 'YZDG', '1件24斤', 330.00, 0, '件', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (174, 8, 2, '鸡腿', 'JT', '120个/件', 208.00, 0, '件', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (175, 8, 2, '冻鸡架', 'DJJ', '', 33.00, 0, '件', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (176, 8, 2, '美国大凤爪（特大）', 'MGDFZTD', '20斤', 340.00, 0, '件', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (177, 8, 2, '蟹柳', 'XL', '5斤装', 25.00, 0, '包', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (178, 8, 2, '奥舌', 'AS', '', 19.50, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (179, 8, 2, '鸡中翅', 'JZC', '', 26.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (180, 8, 1, '银针菇', 'YZG', '', 2.50, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (181, 8, 1, '娃娃菜', 'WWC', '', 3.80, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (182, 8, 4, '窝窝头', 'WWT', '', 3.50, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (183, 8, 1, '鲜大百合', 'XDBH', '', 9.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (184, 8, 2, '蛋黄', 'DH', '', 25.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (185, 8, 4, '面包', 'MB', '', 5.50, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (186, 8, 4, '芝士片', 'ZSP', '', 17.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (187, 8, 4, '土豆粉', 'TDF', '', 2.20, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (188, 8, 3, '培根', 'PG', '', 30.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (189, 8, 4, '红苕芡粉', 'HSQF', '', 7.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (190, 8, 5, '泡酸菜', 'PSC', '', 7.50, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (191, 8, 5, '韩国泡菜', 'HGPC', '', 30.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (192, 8, 4, '乌冬面', 'WDM', '30袋/件', 2.30, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (193, 8, 4, '广东奶油馒头', 'GDNYMT', '', 3.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (194, 8, 5, '芽菜', 'YC', '', 4.80, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (195, 8, 6, '兰花', 'LH', '', 8.00, 0, '把', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (196, 8, 3, '美好火腿肠', 'MHHTC', '260g', 5.80, 0, '根', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (197, 8, 1, '松针', 'SZ', '', 9.00, 0, '把', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (198, 8, 6, '康乃馨', 'KNX', '', 12.00, 0, '扎', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (199, 8, 6, '情人草', 'QRC', '', 6.00, 0, '把', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (200, 8, 6, '铜钱草', 'TQC', '', 15.00, 0, '盒', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (201, 8, 4, '年糕片', 'NGP', '', 6.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (202, 8, 4, '水晶锅巴', 'SJGB', '', 3.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (203, 8, 2, '鸡脯肉', 'JPR', '', 14.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (204, 8, 1, '有机花菜', 'YJHC', '', 4.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (205, 8, 1, '红皮萝卜', 'HPLB', '', 2.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (206, 8, 1, '樱桃萝卜', 'YTLB', '', 8.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (207, 8, 5, '潮州咸菜', 'CZXC', '', 3.50, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (208, 8, 1, '蘑菇', 'MG', '', 9.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (209, 8, 1, '地牯牛', 'DGN', '', 17.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (210, 8, 4, '玉米淀粉', 'YMDF', '', 7.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (211, 8, 5, '藿香', 'HX', '', 13.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (212, 8, 1, '荷兰豆', 'HLD', '', 14.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (213, 8, 1, '茶树菇', 'CSG', '', 9.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (214, 8, 2, '樟茶鸭', 'ZCY', '', 13.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (215, 8, 5, '泡灯笼椒', 'PDLJ', '', 6.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (216, 8, 1, '蜜豆', 'MD', '', 12.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (217, 8, 1, '干冬笋', 'GDS', '', 160.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (218, 8, 1, '红白姜芽', 'HBJY', '', 12.00, 0, '瓶', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (219, 8, 2, '鹅掌筋', 'EZJ', '', 35.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (220, 8, 2, '冻鸭', 'DY', '', 7.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (221, 8, 2, '鸭血', 'YX', '', 2.00, 0, '盒', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (222, 8, 1, '淡菜', 'DC', '', 48.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (223, 8, 4, '红苕粉', 'HSF', '', 6.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (224, 8, 4, '春卷皮', 'CJP', '', 7.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (225, 8, 4, '抄手皮', 'CSP', '', 3.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (226, 8, 1, '干贡菜', 'GGC', '', 35.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (227, 8, 1, '伞尾叶', 'SWY', '', 1.30, 0, '支', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (228, 8, 5, '泡红小米椒', 'PHXML', '', 7.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (229, 8, 1, '白玉菇', 'BYG', '', 3.30, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (230, 8, 1, '蟹味菇', 'XWG', '', 3.30, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (231, 8, 6, '红玫瑰', 'HMG', '', 2.00, 0, '支', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (232, 8, 1, '郡把', 'JB', '', 16.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (233, 8, 1, '鲜豆筋', 'XDJ', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (234, 8, 2, '去骨黑鸡爪', 'QGHJZ', '', 25.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (235, 8, 2, '鸭郡干', 'YJG', '', 20.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (236, 8, 1, '酒鬼蚕豆', 'JGCD', '', 13.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (237, 8, 1, '干豆筋', 'GDJ', '', 15.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (238, 8, 1, '秀珍菇', 'XZG', '', 7.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (239, 8, 1, '腰果', 'YG', '', 50.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (240, 8, 3, '（享口福）荷叶饼', 'XKFHYB', '16袋/件', 65.00, 0, '件', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (241, 8, 1, '干盐白菜', 'GYBC', '', 13.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (242, 8, 1, '鲜胡豆', 'XHD', '', 8.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (243, 8, 2, '鲜鸡心', 'XJX', '', 8.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (244, 8, 1, '迷迭香', 'MDX', '改为袋', 6.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (245, 8, 4, '凉面', 'LM', '', 3.80, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (246, 8, 4, '龙须面', 'LXM', '2斤/把', 8.50, 0, '把', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (247, 8, 1, '韭菜花', 'JCH', '', 7.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (248, 8, 1, '火嵌', 'HQ', '', 15.00, 0, '把', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (249, 8, 1, '本地大葱', 'BDDC', '', 4.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (250, 8, 6, '绣球花', 'XQH', '', 25.00, 0, '支', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (251, 8, 2, '鲜鸭舌', 'XYS', '无碱', 33.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (252, 8, 1, '耙豌豆', 'BWD', '', 2.80, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (253, 8, 2, '雪花鸡柳', 'XHJL', '2斤/袋', 60.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (254, 8, 1, '本地胡萝卜', 'BDHLB', '', 2.80, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (255, 8, 4, '放心油条', 'FXYT', '1斤/袋', 12.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (256, 8, 5, '黄豆豉', 'HDC', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (257, 8, 2, '金太阳蛋黄', 'JTYDH', '', 25.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (258, 8, 1, '杭椒', 'HJ', '', 4.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (259, 8, 4, '精装春卷皮', 'JZCJP', '', 17.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (260, 8, 1, '包心芥胆', 'BXJD', '', 10.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (261, 8, 1, '（丽浦）冰糖香芋', 'LPBTXY', '', 10.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (262, 8, 2, '烟熏鸡脯肉', 'YXJPR', '', 30.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (263, 8, 2, '鹌鹑', 'AC', '', 3.80, 0, '只', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (264, 8, 1, '鲜桃仁', 'XTR', '', 35.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (265, 8, 5, '带壳干花生', 'DKGHS', '', 7.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (266, 8, 1, '龙椒', 'LJ', '', 4.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (267, 8, 2, '脆松柳', 'CSL', '', 2.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (268, 8, 4, '砣砣豆豉', 'TTDC', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (269, 8, 3, '冻（精）猪排', 'DJZP', '20斤', 310.00, 0, '件', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (270, 8, 4, '花卷', 'HJ', '', 0.70, 0, '个', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (271, 8, 5, '菠萝罐头', 'BLGT', '', 15.00, 0, '听', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (272, 8, 1, '鲜天麻', 'XTM', '', 15.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (273, 8, 1, '鲜苦笋', 'XKS', '', 15.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (274, 8, 1, '豆苗', 'DM', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (275, 8, 3, '猪血', 'ZX', '1斤/', 1.30, 0, '块', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (276, 8, 1, '泰椒', 'TJ', '', 8.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (277, 8, 3, '绿进松板肉', 'LJSBR', '', 20.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (278, 8, 3, '五花老腊肉', 'WHLLR', '', 23.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (279, 8, 3, '腊肠', 'LC', '', 32.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (280, 8, 4, '冻水饺', 'DSJ', '5斤/袋', 26.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (281, 8, 5, '冻核桃仁', 'DHTR', '', 15.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (282, 8, 5, '环保碳', 'HBT', '40斤/件', 105.00, 0, '件', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (283, 8, 4, '粉葛', 'FG', '', 10.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (284, 8, 6, '白玉兰', 'BYL', '', 22.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (285, 8, 1, '龙须菜', 'LXC', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (286, 8, 1, '千页豆腐', 'GYDF', '', 6.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (287, 8, 3, '腌拱嘴', 'YGZ', '', 28.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (288, 8, 6, '钻石玫瑰', 'ZSMG', '', 11.00, 0, '扎', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (289, 8, 6, '石竹梅', 'SZM', '', 7.00, 0, '扎', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (290, 8, 1, '农家胆水豆腐', 'NJDSDF', '', 3.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (291, 8, 4, '沙葛', 'SG', '', 2.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (292, 8, 5, '蒜米', 'SM', '5斤/袋', 17.50, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (293, 8, 2, '黄壳鸡蛋', 'HKJD', '', 5.80, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (294, 8, 1, '冻豌豆', 'DWD', '', 5.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (295, 8, 6, '跳舞兰', 'TWL', '', 37.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (296, 8, 2, '冻鸭肠', 'DYC', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (297, 8, 1, '白灵菇', 'BLG', '', 17.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (298, 8, 3, '皇上皇腊肉', 'HSHLR', '', 35.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (299, 8, 3, '皇上黄腊肠', 'HSHLC', '', 23.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (300, 8, 1, '秋葵', 'QK', '', 7.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (301, 8, 1, '日本豆腐', 'RBDF', '', 1.00, 0, '块', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (302, 8, 1, '干竹孙', 'GZS', '', 165.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (303, 8, 2, '去皮鹌鹑蛋', 'QPACD', '', 13.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (304, 8, 1, '鸡腿菇', 'JTG', '', 11.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (305, 8, 1, '千张', 'QZ', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (306, 8, 2, '鲜鹅肠', 'XEC', '', 10.50, 0, '根', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (307, 8, 1, '手指萝卜', 'SZLB', '', 11.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (308, 8, 1, '黄瓜花', 'HGH', '', 20.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (309, 8, 1, '干萝卜干', 'GLBH', '', 8.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (310, 8, 1, '干火葱头', 'GHCT', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (311, 8, 1, '大头菜粒', 'DTCL', '', 3.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (312, 8, 1, '冰草', 'BC', '', 14.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (313, 8, 1, '外地丝瓜', 'WDSG', '', 6.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (314, 8, 1, '三色堇', 'SSJ', '', 22.00, 0, '盒', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (315, 8, 2, '沈师傅鸡蛋干', 'SSFJDG', '', 3.80, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (316, 8, 1, '酸膜叶', 'SMY', '', 22.00, 0, '盒', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (317, 8, 1, '佛手瓜', 'FSG', '沈师傅', 2.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (318, 8, 4, '越南春卷皮', 'YNCJP', '', 18.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (319, 8, 1, '满天星', 'MTX', '', 8.00, 0, '扎', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (320, 8, 1, '扬子叶', 'YZY', '', 8.00, 0, '扎', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (321, 8, 4, '大年糕', 'DNG', '2.5斤', 16.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (322, 8, 2, '烟熏鸭脯', 'YXYP', '', 10.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (323, 8, 2, '土麻鸭', 'TMY', '', 18.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (324, 8, 2, '大鲜鹅掌', 'DXEZ', '', 30.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (325, 8, 5, '冰鲜板栗', 'BXBL', '10斤', 95.00, 0, '件', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (326, 8, 2, '鲜精鸡腿', 'XJJT', '', 20.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (327, 8, 1, '凉拌萝卜干', 'LBLBG', '', 8.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (328, 8, 4, '大白面锅贴', 'DBMGT', '', 2.00, 0, '个', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (329, 8, 2, '鳝鱼片', 'SYP', '', 38.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (330, 8, 2, '带骨鸡脚', 'DGJJ', '大', 14.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (331, 8, 2, '黄油老母鸡', 'HYLMJ', '', 20.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (332, 8, 1, '青油菜', 'QYC', '', 4.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (333, 8, 1, '冬汉菜', 'DHC', '', 3.50, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (334, 8, 1, '荷兰芹', 'HLQ', '', 12.00, 0, '扎', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (335, 8, 1, '豌豆尖', 'WDJ', '', 5.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (336, 8, 6, '大黄菊花', 'DHJH', '', 3.00, 0, '朵', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (337, 8, 6, '鲜百合', 'XBH', '', 10.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (338, 8, 6, '香薰草', 'XXC', '', 8.00, 0, '扎', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (339, 8, 6, '勿忘我', 'WWW', '', 7.00, 0, '扎', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (340, 8, 6, '水晶草', 'SJC', '', 7.00, 0, '扎', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (341, 8, 1, '小紫薯', 'XZS', '', 8.00, 0, '斤', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (342, 8, 4, '小白面锅贴', 'XBMGT', '', 0.60, 0, '个', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (343, 8, 1, '紫罗兰', 'ZLL', '', 13.00, 0, '袋', 0, 1532202958, 1532202958);
INSERT INTO `dvd_material` VALUES (344, 1, 3, 'ce', 'CE', 'gg', 3.00, 0, '斤', 0, 1532253990, 1532253990);
INSERT INTO `dvd_material` VALUES (345, 1, 5, '其他的', 'QTD', 'df', 3.00, 0, '斤', 0, 1532266038, 0);
INSERT INTO `dvd_material` VALUES (346, 1, 5, '其食材', 'QSC', '得到', 4.00, 0, '斤', 0, 1532266022, 0);
INSERT INTO `dvd_material` VALUES (348, 1, 5, '有人', 'YR', '歌赋i', 4.00, 0, '斤', 0, 1532266099, 1532266099);
INSERT INTO `dvd_material` VALUES (349, 1, 6, '再来', 'ZL', 'gui', 2.00, 0, '斤', 0, 1532267594, 1532267594);

-- ----------------------------
-- Table structure for dvd_material_type
-- ----------------------------
DROP TABLE IF EXISTS `dvd_material_type`;
CREATE TABLE `dvd_material_type`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '菜类ID',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dvd_material_type
-- ----------------------------
INSERT INTO `dvd_material_type` VALUES (1, '蔬菜瓜果');
INSERT INTO `dvd_material_type` VALUES (2, '家禽鱼蛋');
INSERT INTO `dvd_material_type` VALUES (3, '鲜肉冻肉');
INSERT INTO `dvd_material_type` VALUES (4, '米面粮油');
INSERT INTO `dvd_material_type` VALUES (5, '调味用品');
INSERT INTO `dvd_material_type` VALUES (6, '其他食材');

-- ----------------------------
-- Table structure for dvd_message
-- ----------------------------
DROP TABLE IF EXISTS `dvd_message`;
CREATE TABLE `dvd_message`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sender_id` bigint(20) NOT NULL,
  `receiver_id` bigint(20) NOT NULL,
  `topic` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '消息类型，1，加好友请求消息',
  `status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '状态，未读：0，请求：1，接受：2，拒绝：3，删除，4，',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for dvd_order
-- ----------------------------
DROP TABLE IF EXISTS `dvd_order`;
CREATE TABLE `dvd_order`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单序列号',
  `creater_id` bigint(20) UNSIGNED NOT NULL COMMENT '订单创建者id',
  `cname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建者姓名',
  `supplier_id` bigint(20) UNSIGNED NOT NULL COMMENT '供应商id',
  `sname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '供应商姓名',
  `delivery_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '预约配送时间',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态;0:未下单,1:已下单,3:已取消,4:已收单',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dvd_order
-- ----------------------------
INSERT INTO `dvd_order` VALUES (3, 'SN00001T1531755603', 3, 'maria 游溶', 1, '张民 张民', 1531785600, 0, 1531755603, 1531755603);
INSERT INTO `dvd_order` VALUES (4, 'SN00001T1531800660', 4, '光军 测试', 1, '张民 张民', 1531785600, 0, 1531800660, 1531800660);
INSERT INTO `dvd_order` VALUES (5, 'SN00001T1531825191', 4, '光军 测试', 1, '张民 real', 1531785600, 0, 1531825191, 1531825191);
INSERT INTO `dvd_order` VALUES (6, 'SN00001T1531989893', 3, 'maria 游溶', 1, '张民 real', 1532044800, 0, 1531989893, 1531989893);
INSERT INTO `dvd_order` VALUES (7, 'SN00001T1532274599', 1, '张民 real', 5, '张小二 张大厨', 1532217600, 0, 1532274599, 1532274599);
INSERT INTO `dvd_order` VALUES (8, 'SN00001T1532617558', 1, '测试 张民', 8, '逍遥，天天蔬菜猪肉配送 徐世富', 1532563200, 0, 1532617558, 1532617558);

-- ----------------------------
-- Table structure for dvd_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `dvd_order_detail`;
CREATE TABLE `dvd_order_detail`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL COMMENT '订单id',
  `operator_id` bigint(20) UNSIGNED NOT NULL COMMENT '记录创建者id',
  `material_id` bigint(20) UNSIGNED NOT NULL COMMENT '食材id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '食材名称',
  `amount` double(20, 2) UNSIGNED NOT NULL COMMENT '数量',
  `price` double(11, 0) UNSIGNED NOT NULL DEFAULT 0 COMMENT '参考价格',
  `unit` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dvd_order_detail
-- ----------------------------
INSERT INTO `dvd_order_detail` VALUES (60, 3, 1, 2, '西兰花', 2.00, 5, '元/斤', 1531815001);
INSERT INTO `dvd_order_detail` VALUES (61, 3, 1, 4, '苦瓜', 1.50, 3, '元/斤', 1531815001);
INSERT INTO `dvd_order_detail` VALUES (62, 4, 1, 3, '小葱', 1.10, 10, '元/斤', 1531801207);
INSERT INTO `dvd_order_detail` VALUES (63, 4, 1, 4, '苦瓜', 1.10, 3, '元/斤', 1531801207);
INSERT INTO `dvd_order_detail` VALUES (64, 4, 1, 6, '黄瓜', 1.10, 4, '元/斤', 1531801207);
INSERT INTO `dvd_order_detail` VALUES (65, 4, 1, 8, '牛肉', 1.10, 45, '元/斤', 1531801207);
INSERT INTO `dvd_order_detail` VALUES (66, 4, 1, 2, '西兰花', 1.00, 5, '元/斤', 1531801207);
INSERT INTO `dvd_order_detail` VALUES (67, 4, 1, 1, '豆角', 1.00, 3, '元/斤', 1531801207);
INSERT INTO `dvd_order_detail` VALUES (69, 4, 1, 5, '玉米', 1.00, 4, '元/斤', 1531801207);
INSERT INTO `dvd_order_detail` VALUES (73, 4, 1, 10, '白面', 1.00, 2, '元/斤', 1531801207);
INSERT INTO `dvd_order_detail` VALUES (74, 4, 1, 9, '大米', 1.00, 3, '元/斤', 1531801207);
INSERT INTO `dvd_order_detail` VALUES (75, 4, 1, 11, '花椒', 1.00, 30, '元/斤', 1531801207);
INSERT INTO `dvd_order_detail` VALUES (76, 3, 1, 5, '玉米', 4.40, 4, '元/斤', 1531815001);
INSERT INTO `dvd_order_detail` VALUES (77, 3, 1, 6, '黄瓜', 1.00, 4, '元/斤', 1531815008);
INSERT INTO `dvd_order_detail` VALUES (78, 6, 1, 3, '小葱', 1.00, 10, '元/斤', 1531991425);
INSERT INTO `dvd_order_detail` VALUES (79, 6, 1, 5, '玉米', 1.10, 4, '元/斤', 1531991425);
INSERT INTO `dvd_order_detail` VALUES (80, 6, 1, 10, '白面', 1.50, 2, '元/斤', 1531991425);
INSERT INTO `dvd_order_detail` VALUES (81, 6, 1, 13, '自定义', 1.50, 12, '元/斤', 1531991425);
INSERT INTO `dvd_order_detail` VALUES (82, 7, 1, 14, '十三香', 1.00, 8, '斤', 1532278880);
INSERT INTO `dvd_order_detail` VALUES (83, 8, 1, 23, '西生菜', 1.00, 5, '斤', 1532617619);

-- ----------------------------
-- Table structure for dvd_role
-- ----------------------------
DROP TABLE IF EXISTS `dvd_role`;
CREATE TABLE `dvd_role`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dvd_role
-- ----------------------------
INSERT INTO `dvd_role` VALUES (1, '供应商');
INSERT INTO `dvd_role` VALUES (2, '采购员');
INSERT INTO `dvd_role` VALUES (3, '厨师');

-- ----------------------------
-- Table structure for dvd_user
-- ----------------------------
DROP TABLE IF EXISTS `dvd_user`;
CREATE TABLE `dvd_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户角色',
  `wxopenid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信用户唯一标识符',
  `wxsessionkey` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会话密钥',
  `wxunionid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '同一个开发者的微信用户唯一标识符',
  `mobile` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户手机号',
  `pass` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '登录密码',
  `realname` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户姓名',
  `nickname` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `gender` tinyint(2) NOT NULL DEFAULT 0 COMMENT '性别;0:保密,1:男,2:女',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `token` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'jwt token',
  `activation_key` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '激活码',
  `last_login_ip` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` int(11) NOT NULL DEFAULT 0 COMMENT '最后登录时间',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of dvd_user
-- ----------------------------
INSERT INTO `dvd_user` VALUES (1, 2, 'op5wc0WwfBK0GOcuOGPBe0LAM2tw', 'RKkstTrqCbH50KB/VjnXCw==', '', '13608064375', '', '张民', '张民', 'https://wx.qlogo.cn/mmopen/vi_32/gpIkfZf7gwUbwpCvp32bqKuX2kibiaMy7eTXPG6cmNicBFLUKA7wP7T4xTETOf3tJWfHyYjZKGRKpjIQG6xibx0MYQ/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1NDA5MDk2MDksIm9wZW5pZCI6Im9wNXdjMFd3ZkJLMEdPY3VPR1BCZTBMQU0ydHciLCJzZXNzaW9ua2V5IjoiUktrc3RUcnFDYkg1MEtCL1ZqblhDdz09IiwidW5pb25pZCI6IiJ9.xkvz75R4pvHopuVKZ3sWEhD-krQj8YAinB74Zyn7ufg', '', '', 0, 1531734523);
INSERT INTO `dvd_user` VALUES (2, 1, '', '', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzE3NDg0MzAsIm9wZW5pZCI6IiIsInNlc3Npb25rZXkiOiIiLCJ1bmlvbmlkIjoiIn0.IsMdTseGb2_qX4QUELSeC92dVgot4k2FeJ0th-wlVSA', '', '', 0, 1531740840);
INSERT INTO `dvd_user` VALUES (3, 2, 'op5wc0S3oyUf37am9T_TSv4qsJEM', 'tmTO4hD3DsABtJlW1XNH4w==', '', '13608064875', '', '游溶', 'maria', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzE3NjI2OTYsIm9wZW5pZCI6Im9wNXdjMFMzb3lVZjM3YW05VF9UU3Y0cXNKRU0iLCJzZXNzaW9ua2V5IjoidG1UTzRoRDNEc0FCdEpsVzFYTkg0dz09IiwidW5pb25pZCI6IiJ9.roIzcdtCs6lzTYyoq9VSjyNhq8g08c-CAqbjQiQvzlM', '', '', 0, 1531755496);
INSERT INTO `dvd_user` VALUES (4, 2, 'op5wc0TBPSO0qr3Wq14bXFBBa7Fs', 'Wq+ANXc6yTAKAzAz+qT8ig==', '', '12345678 ', '', '测试', '光军', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKWTUPtveR7YpI1R9ichjBzro8zCHA2fZxjUBfTontCfKoU9zFZyuuCkTJWNNg5dOhDgungfo1DjUA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzE4MDYwNDMsIm9wZW5pZCI6Im9wNXdjMFRCUFNPMHFyM1dxMTRiWEZCQmE3RnMiLCJzZXNzaW9ua2V5IjoiV3ErQU5YYzZ5VEFLQXpBeitxVDhpZz09IiwidW5pb25pZCI6IiJ9.njkNkNJinrV2Ynq-ZklfZzCw157YrwuKnWCiuGzEkpE', '', '', 0, 1531798843);
INSERT INTO `dvd_user` VALUES (5, 3, 'op5wc0boLkcFny4mww6R2L6a3Ujk', 'a1K3yQgT1leoKOTCrgymeQ==', '', '13036676007', '', '张大厨', '张小二', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzIyODExNjYsIm9wZW5pZCI6Im9wNXdjMGJvTGtjRm55NG13dzZSMkw2YTNVamsiLCJzZXNzaW9ua2V5IjoiYTFLM3lRZ1QxbGVvS09UQ3JneW1lUT09IiwidW5pb25pZCI6IiJ9.KH38wMEsKeA71wHlpXzMTPZW9vmLsQv608gtvY-OEj8', '', '', 0, 1531991152);
INSERT INTO `dvd_user` VALUES (6, 1, 'op5wc0W4N1f97yddRjh_cHMzH7eo', 'lRmpxnf443KT2qoEIsX7zA==', '', '', '', '', '柴进', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLphic9JU7tzyxqBHMSCzDxYFJOekQibxY9drQOsamnDYquAowkt4vmUF8V9rXZJMEHcso8M4ibwICow/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzIwMDM2NDgsIm9wZW5pZCI6Im9wNXdjMFc0TjFmOTd5ZGRSamhfY0hNekg3ZW8iLCJzZXNzaW9ua2V5IjoibFJtcHhuZjQ0M0tUMnFvRUlzWDd6QT09IiwidW5pb25pZCI6IiJ9.U0BkXqJHb1ZIf647WxDjc8FC5e932Bh1jn7FwAuJbD0', '', '', 0, 1531996448);
INSERT INTO `dvd_user` VALUES (7, 1, 'op5wc0bqE6Svvs99OHhIgPF64lcY', 'qgXiI9y9UMZVKjQk/PnxBQ==', '', '', '', '', '秦明', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLULwpeayBN3mLBrYp4hofz8GX0b4Krnefuum85W9ia81ibRmBQxwVmp1nFSMdUX9fRfricaSQO4zBMg/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzIzOTkyMzQsIm9wZW5pZCI6Im9wNXdjMGJxRTZTdnZzOTlPSGhJZ1BGNjRsY1kiLCJzZXNzaW9ua2V5IjoicWdYaUk5eTlVTVpWS2pRay9QbnhCUT09IiwidW5pb25pZCI6IiJ9.5VSdr2SNDlw3UCX-WC9WRq27No67IA-Q5iahsBxRLfA', '', '', 0, 1532056952);
INSERT INTO `dvd_user` VALUES (8, 1, 'op5wc0XFCbhBCkSk3eCNGtPaPMSE', 'u5NzXOV6AJOzW1Rx1HDf+g==', '', '13348834708', '', '徐世富', '逍遥，天天蔬菜猪肉配送', 'https://wx.qlogo.cn/mmopen/vi_32/50icX6LdribQLf2OyyxPDlH9OjI4POGFib36sCSJtV9x6WOWAqcH41SmyhwW6vr26zcjMc9zoicr9EyuRicp6BKNosA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzUyMjYxNzMsIm9wZW5pZCI6Im9wNXdjMFhGQ2JoQkNrU2szZUNOR3RQYVBNU0UiLCJzZXNzaW9ua2V5IjoidTVOelhPVjZBSk96VzFSeDFIRGYrZz09IiwidW5pb25pZCI6IiJ9.lGj92Nc0cAKEBSituEXh0Qa1dwneNWi12gAq-sEAllA', '', '', 0, 1532159210);
INSERT INTO `dvd_user` VALUES (9, 1, 'op5wc0bgEoBBHnENemAx3yAPsgRs', 'Irgb2c0UW26ZrzKe0w/OUw==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzIxNjY4MjcsIm9wZW5pZCI6Im9wNXdjMGJnRW9CQkhuRU5lbUF4M3lBUHNnUnMiLCJzZXNzaW9ua2V5IjoiSXJnYjJjMFVXMjZacnpLZTB3L09Vdz09IiwidW5pb25pZCI6IiJ9.fyEvL4Cop0NivDBvIHNYuvYHngK4xGsH6k8bMiQbcto', '', '', 0, 1532159627);
INSERT INTO `dvd_user` VALUES (10, 3, 'op5wc0SUvDgmuMqxhIHf3GOYVumI', '2bnwbJM+w+pwuJ6V6eNLzQ==', '', '', '', '', 'A骑士果业', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eouib1n6IU6KLPcM6w2KN7vkYwHFaeA3icML1fYia1iaGIIPHllryQX2gaFiasImibibjT8O9gwqJqwxfic7A/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzUxMjk0NTcsIm9wZW5pZCI6Im9wNXdjMFNVdkRnbXVNcXhoSUhmM0dPWVZ1bUkiLCJzZXNzaW9ua2V5IjoiMmJud2JKTSt3K3B3dUo2VjZlTkx6UT09IiwidW5pb25pZCI6IiJ9.qnrkmU7x_0NoWngHTK2Ip14qAEmJku8nNYfx7l5BM7M', '', '', 0, 1532159891);
INSERT INTO `dvd_user` VALUES (11, 1, 'op5wc0UCGUWCVEQhwSa4n_Kf0mTU', 'tGGBSLAVQwJQqJp8jpx1uQ==', '', '', '', '', '向永元', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIwiafkFib5SnicZjxFlgpP4OMicB9HuZ9wsBJDm5v6yBGiaTsn4pXMtuYiaeibZ40shbFUnPAAA1aIq2xkQ/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzIxNjc2NzgsIm9wZW5pZCI6Im9wNXdjMFVDR1VXQ1ZFUWh3U2E0bl9LZjBtVFUiLCJzZXNzaW9ua2V5IjoidEdHQlNMQVZRd0pRcUpwOGpweDF1UT09IiwidW5pb25pZCI6IiJ9.tqSHRljOkF3b2cbBptlQB6m3dB3aqCRQNO1HVUXx2Fo', '', '', 0, 1532160478);
INSERT INTO `dvd_user` VALUES (12, 1, 'op5wc0bL2DJULH7tIHbEYPGWeHyI', 'r6MucFVASVSgjMbhxPdPww==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzIxNzIwOTUsIm9wZW5pZCI6Im9wNXdjMGJMMkRKVUxIN3RJSGJFWVBHV2VIeUkiLCJzZXNzaW9ua2V5IjoicjZNdWNGVkFTVlNnak1iaHhQZFB3dz09IiwidW5pb25pZCI6IiJ9.w33SIQIsq02OqDI5YQvvY0ijZVNtPySHiWJz-qDQ1Qw', '', '', 0, 1532164895);
INSERT INTO `dvd_user` VALUES (13, 1, 'op5wc0fgn6G9eLcpprNOFfzVGHWI', '9QVZ7dyCgK0ksGj/5wbKbw==', '', '', '', '', '习惯寂寞看风景', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83ep4R5cZRibiaNOkCgBRtwgLUtGKpdTPN2iaUxY3iab34a8SAIbs6qQjXcPGXTjsjuB1GVvDibMwmSDRxLg/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzIxOTUxNTIsIm9wZW5pZCI6Im9wNXdjMGZnbjZHOWVMY3Bwck5PRmZ6VkdIV0kiLCJzZXNzaW9ua2V5IjoiOVFWWjdkeUNnSzBrc0dqLzV3Yktidz09IiwidW5pb25pZCI6IiJ9.fYNxPZ4qGw19Z7Y0poyMXA-2vef4cEQJfEccFH1C0Fc', '', '', 0, 1532187952);
INSERT INTO `dvd_user` VALUES (14, 1, 'op5wc0Ub2D_YcRuN8Nxx5B8jFuns', 'etBNbXRed22yXj5JzwWiKg==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzIyNjg0NzIsIm9wZW5pZCI6Im9wNXdjMFViMkRfWWNSdU44Tnh4NUI4akZ1bnMiLCJzZXNzaW9ua2V5IjoiZXRCTmJYUmVkMjJ5WGo1Snp3V2lLZz09IiwidW5pb25pZCI6IiJ9.WLygyi28ZRUnk4CjdOmy5b-zrP3maiKUFyFTa6CvwJM', '', '', 0, 1532261272);
INSERT INTO `dvd_user` VALUES (15, 1, 'op5wc0YfvyhsWISkOLhxdILVcLUg', 'CbwpYLQM0vu9w+3pGFgOYw==', '', '', '', '', '清寂', 'https://wx.qlogo.cn/mmopen/vi_32/q9NibsiaUwicRwBZFibrUibdom5NwlVPPHKic5wbSwwiaicAFicL6YAQSE5vibNVgTFWcJUT9KOVAXQ1sgQwOgILwIkoZHKw/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzI0MzQ1MDQsIm9wZW5pZCI6Im9wNXdjMFlmdnloc1dJU2tPTGh4ZElMVmNMVWciLCJzZXNzaW9ua2V5IjoiQ2J3cFlMUU0wdnU5dyszcEdGZ09Zdz09IiwidW5pb25pZCI6IiJ9.9AlqYy_J4oos594DAhTqcSUSXgLfNGqIw_flx1T7mzE', '', '', 0, 1532427304);
INSERT INTO `dvd_user` VALUES (16, 1, 'op5wc0Rgp007v3M3w6CmX0O0FiO0', 'Jp83SFPL4svGgxhyoxfx7w==', '', '', '', '', '小卡卡', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLKfHPtPjDFzw1Z02PSGX3KB0dQyklInYicxdic6BgC7xoAPicVvZUawtpD2xlASuw9WXL89ibaiarpLvw/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzI1MjMzNTcsIm9wZW5pZCI6Im9wNXdjMFJncDAwN3YzTTN3NkNtWDBPMEZpTzAiLCJzZXNzaW9ua2V5IjoiSnA4M1NGUEw0c3ZHZ3hoeW94Zng3dz09IiwidW5pb25pZCI6IiJ9.isXxbZdli1csaiKb8jRzo5nZ_NKADmAUiL_Z3DJXGgE', '', '', 0, 1532516157);
INSERT INTO `dvd_user` VALUES (17, 1, 'op5wc0WPWEjnxjMN1ZSiyZzeP__A', '7NNtha+a7MM52Jn5Ja9DRA==', '', '15725635551', '', '齐林', '白茶清事', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJn5OTxic4OLKdG7NAaj4rcxxAciaAO8yxL8rX5DUTDFTQFHoLouEQ3oicrSibNXsiaiaL5CbWtetwQYibicA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzI1Mzk0MzksIm9wZW5pZCI6Im9wNXdjMFdQV0VqbnhqTU4xWlNpeVp6ZVBfX0EiLCJzZXNzaW9ua2V5IjoiN05OdGhhK2E3TU01MkpuNUphOURSQT09IiwidW5pb25pZCI6IiJ9.PzC5l0t0h0F82_RxYlQCpQ94QA18PUeTGtKBVk1gSzY', '', '', 0, 1532532239);
INSERT INTO `dvd_user` VALUES (18, 1, 'op5wc0bEPqC6VSjs93dRRpADXWnM', 'bFr/afael5fTL0qo/4grEg==', '', '', '', '', '엽은림(Mr.叶)', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJv6WH0y7HrfdqXUYgk7xgyhDcM8QjxdnTwEShFzw58kF7SdWMqfiajqMiaOLDVwHUicicp5fia5CHiaWWw/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzI1NDIyODEsIm9wZW5pZCI6Im9wNXdjMGJFUHFDNlZTanM5M2RSUnBBRFhXbk0iLCJzZXNzaW9ua2V5IjoiYkZyL2FmYWVsNWZUTDBxby80Z3JFZz09IiwidW5pb25pZCI6IiJ9.OHMWJT1SsvgZPcyXhUTlwaKWzzVh6mDJpjQw8O9YzNs', '', '', 0, 1532535081);
INSERT INTO `dvd_user` VALUES (19, 2, 'op5wc0ZmYuVX9rV3NFt0D5n6xYQ4', '5Qc/41GCNyjhvP8DWo4KJg==', '', '', '', '', '可乐加冰', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKs0qiclIdtFmrFQ8N7dgSqhcwuR8iaVWkicQKe7LK9dN5ibePV7n5McqMct5es5CgG1fVW7zHWARBMyg/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzI2NzM3NDUsIm9wZW5pZCI6Im9wNXdjMFptWXVWWDlyVjNORnQwRDVuNnhZUTQiLCJzZXNzaW9ua2V5IjoiNVFjLzQxR0NOeWpodlA4RFdvNEtKZz09IiwidW5pb25pZCI6IiJ9.4q-d14P4nsBbBzNNrbEuubkUDpYmOpBj9SKfUFzYOhM', '', '', 0, 1532666545);
INSERT INTO `dvd_user` VALUES (20, 1, 'op5wc0S1hXDeHNPpkPAK-6CBV56Q', '2uz/JW1Rq6WBBJsE5YPvCQ==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzU1NDk0MjQsIm9wZW5pZCI6Im9wNXdjMFMxaFhEZUhOUHBrUEFLLTZDQlY1NlEiLCJzZXNzaW9ua2V5IjoiMnV6L0pXMVJxNldCQkpzRTVZUHZDUT09IiwidW5pb25pZCI6IiJ9.3HRyuGfPLKcnQ-yjbM76xMn8KyGvoaE_gzIXU4KY8lQ', '', '', 0, 1532872609);
INSERT INTO `dvd_user` VALUES (21, 2, 'op5wc0cT0SEdHQo0IOiazOXV9FwE', 'LVrn4pVqrZyIYcuX8TyC7w==', '', '', '', '', '雪域同城工作室  洛桑', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLxJgEJhfSxOe2udoUibb6orlb8M28G4eFURCwTd9Hab29hz9n0TqlUia20ZF7ooy4Wia04ibHFleltxQ/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1NDAxMjQxOTUsIm9wZW5pZCI6Im9wNXdjMGNUMFNFZEhRbzBJT2lhek9YVjlGd0UiLCJzZXNzaW9ua2V5IjoiTFZybjRwVnFyWnlJWWN1WDhUeUM3dz09IiwidW5pb25pZCI6IiJ9.ostyWrqsrISELHbW4EpI0myej2bW_cJHsJVL14IQySk', '', '', 0, 1533181454);
INSERT INTO `dvd_user` VALUES (22, 3, 'op5wc0e4Mtw2kx4TqP6JTsTlwlH0', 'hwzyOMX4fLc1xXbrc22o/A==', '', '', '', '', '伍建茹', 'https://wx.qlogo.cn/mmopen/vi_32/JlibwXNa9hkDp1RcDGiaed7EDOMo1nywqcvtGY5qZyjoNQPcRdawP9ZM4MDic3wK433N5FTN5eSn9rqYnnTkFaAuw/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzM0ODkzMTAsIm9wZW5pZCI6Im9wNXdjMGU0TXR3Mmt4NFRxUDZKVHNUbHdsSDAiLCJzZXNzaW9ua2V5IjoiaHd6eU9NWDRmTGMxeFhicmMyMm8vQT09IiwidW5pb25pZCI6IiJ9.el4Ze2oX1w5P4qdelK7_D6bMr5M_6bxcpSy0SiGDxBg', '', '', 0, 1533482110);
INSERT INTO `dvd_user` VALUES (23, 1, 'op5wc0RE6BAcn36ZEVmHKnjvXsD4', '0m+3MrpfksfsOMHR2ivMNA==', '', '', '', '', '一一', 'https://wx.qlogo.cn/mmopen/vi_32/dfCNawTBe8Efy7bWvGDicmYTW5okPVET3mqMjiar2OCgXlqJZAz0tXnWSWhpltPekLSfUqVsJht27ibtibmwG7u7NQ/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzM3MzYxNDcsIm9wZW5pZCI6Im9wNXdjMFJFNkJBY24zNlpFVm1IS25qdlhzRDQiLCJzZXNzaW9ua2V5IjoiMG0rM01ycGZrc2ZzT01IUjJpdk1OQT09IiwidW5pb25pZCI6IiJ9.yM741te0CLmnqkGKRoH5tPkjKeocbTNaBREjsDTo61Q', '', '', 0, 1533728947);
INSERT INTO `dvd_user` VALUES (24, 2, 'op5wc0ZzxTn2slWn9GPIRtIBBj6g', 'SPADPme5IZT16mfdnPk6ew==', '', '13889090960', '', '王世羽', '云淡风轻', 'https://wx.qlogo.cn/mmopen/vi_32/rtTbRibS38XHDLxLwnORSHVx2vn39c9DomxQsgXEfgI5j6MblRnGUiaXE70FIWFKTBOobo7PvSehwcekCqt52jkw/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzQ2NTE5NTUsIm9wZW5pZCI6Im9wNXdjMFp6eFRuMnNsV245R1BJUnRJQkJqNmciLCJzZXNzaW9ua2V5IjoiU1BBRFBtZTVJWlQxNm1mZG5QazZldz09IiwidW5pb25pZCI6IiJ9.s8o1yiKJam8X_1VoOW7TZNtuTjYA-S4t289lgsOsHyw', '', '', 0, 1533879856);
INSERT INTO `dvd_user` VALUES (25, 2, 'op5wc0c1kEh3YyEb5Zcv1n6E5U8E', 'skrC/ya6YJb8yL8SPU5Z3w==', '', '13798762969', '', '陈家杰', 'u0', 'https://wx.qlogo.cn/mmopen/vi_32/Gwxyib0z1O5rDujTNZ6e0RQjgkibWFN9bZ1KuMn90f6pNGcpWf3vweYMAdNlFwogZibWuSZOMNsDic4uicZ3790ILYA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzM4OTE3NTksIm9wZW5pZCI6Im9wNXdjMGMxa0VoM1l5RWI1WmN2MW42RTVVOEUiLCJzZXNzaW9ua2V5Ijoic2tyQy95YTZZSmI4eUw4U1BVNVozdz09IiwidW5pb25pZCI6IiJ9.HJ8xbtJ2cC8uozaSLFhs-udQp9dVALGyPQUrVMWz-Cc', '', '', 0, 1533884559);
INSERT INTO `dvd_user` VALUES (26, 2, 'op5wc0a4tOYV-ZUTNdbB4ygocv2g', '1UHwnQyPgPiTbtSdDxEaDA==', '', '', '', '', '清风', 'https://wx.qlogo.cn/mmopen/vi_32/GyricCljickj8m1SoMh9CC2a58nvqHNniamx6T8aRLYkpHG5BH7CJeCLWibv9Xs48cqAm1bWqDDYnXMChDx53tvbrA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzM5NTcwMTUsIm9wZW5pZCI6Im9wNXdjMGE0dE9ZVi1aVVROZGJCNHlnb2N2MmciLCJzZXNzaW9ua2V5IjoiMVVId25ReVBnUGlUYnRTZER4RWFEQT09IiwidW5pb25pZCI6IiJ9.CcgrRPxhS5rqdP4pXKoKm1A2PlbY1hSOsRUgK-erYYE', '', '', 0, 1533949816);
INSERT INTO `dvd_user` VALUES (27, 1, 'op5wc0YA_x_sw4B0cFMJ0jMloIZE', 'Fws55QH64ZwB7heVGJrsqQ==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzM5NzE3NzUsIm9wZW5pZCI6Im9wNXdjMFlBX3hfc3c0QjBjRk1KMGpNbG9JWkUiLCJzZXNzaW9ua2V5IjoiRndzNTVRSDY0WndCN2hlVkdKcnNxUT09IiwidW5pb25pZCI6IiJ9.qfdu9t82xVI-DcaZ_7HuP45E1aEAcg1YAa1xT_gqtcQ', '', '', 0, 1533964575);
INSERT INTO `dvd_user` VALUES (28, 1, 'op5wc0UHIOnGplzeqi8AFePkvgJ0', 'fba3RugkGAQYzv32h1qRcA==', '', '15898582040', '', '刘强', '强*^o^*', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTLDJHamLgTsrxdHR9VKtQ1g62C4PKNVlRGBsmh9LA5yq7ftrKLXonxMbTe295NxCl980sMIcFXvJA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzQyMzI1MTMsIm9wZW5pZCI6Im9wNXdjMFVISU9uR3BsemVxaThBRmVQa3ZnSjAiLCJzZXNzaW9ua2V5IjoiZmJhM1J1Z2tHQVFZenYzMmgxcVJjQT09IiwidW5pb25pZCI6IiJ9.jA_epzrsxnC7W71f-FRdFwa1dxxqOd-2UgsoJsvXIPs', '', '', 0, 1534225313);
INSERT INTO `dvd_user` VALUES (29, 3, 'op5wc0ZgD0I3IIZSHvC-O_DqcCn0', '6rsb+8JNdt8dzpTn2/Pkzw==', '', '', '', '', 'Ai 诺子', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIuibX1Gh7yicwL3iafA2DicgFLeXv2dxaiaOAiczjMuPwLiaj2ChmzLSXQ71GQBvuJLzeClMUEm317OsZeQ/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzUwNDkzNjgsIm9wZW5pZCI6Im9wNXdjMFpnRDBJM0lJWlNIdkMtT19EcWNDbjAiLCJzZXNzaW9ua2V5IjoiNnJzYis4Sk5kdDhkenBUbjIvUGt6dz09IiwidW5pb25pZCI6IiJ9.WLREx0ejO1eKwmrnzdZCSqlKjRGEr4ktYZpVIy2tDKI', '', '', 0, 1534342808);
INSERT INTO `dvd_user` VALUES (30, 1, 'op5wc0XWFIquzWNj4EbJUAFzeqBE', '2k42Kr43DVqQDVuxKK6tyA==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzQ1MjIxMjgsIm9wZW5pZCI6Im9wNXdjMFhXRklxdXpXTmo0RWJKVUFGemVxQkUiLCJzZXNzaW9ua2V5IjoiMms0MktyNDNEVnFRRFZ1eEtLNnR5QT09IiwidW5pb25pZCI6IiJ9.NkTJ-VZsXFY374JU0Re2_7ey_n7APSqnvx9npW2GzP8', '', '', 0, 1534514928);
INSERT INTO `dvd_user` VALUES (31, 1, 'op5wc0f3mDZ-29b40V5ykjXJZECE', 'A5BIzi/hcT2A/RQp2efILA==', '', '', '', '', '金河魏大宝', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIxiblEKnd1xccPJ7j0B8pibRVbX8OiaAptm14FmqJRCuQ1OUxuaPLicBvAsuv57Hwr8pK3sjN5F1pcDg/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzQ3NTQ4MzksIm9wZW5pZCI6Im9wNXdjMGYzbURaLTI5YjQwVjV5a2pYSlpFQ0UiLCJzZXNzaW9ua2V5IjoiQTVCSXppL2hjVDJBL1JRcDJlZklMQT09IiwidW5pb25pZCI6IiJ9.1RpnDit1Yr49-zi5DBUdlnraEt40wQ2wikNbnPFJxg4', '', '', 0, 1534747639);
INSERT INTO `dvd_user` VALUES (32, 2, 'op5wc0XJzrTPngGz6NUqvP3UN1JQ', 'e6nVNc2X0eyOP7WH31XmoA==', '', '', '', '', '半世烟尘か半世迷离', 'https://wx.qlogo.cn/mmopen/vi_32/yucTgVBiajjQNnVyjy4cbV6FiaZGrYRGZiaQlRiawuHY65COZpmh5ax8Lb2hGiauyUggprAEiakKD4dajy6HzSvG6MAg/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzU1NTMyMTQsIm9wZW5pZCI6Im9wNXdjMFhKenJUUG5nR3o2TlVxdlAzVU4xSlEiLCJzZXNzaW9ua2V5IjoiZTZuVk5jMlgwZXlPUDdXSDMxWG1vQT09IiwidW5pb25pZCI6IiJ9.7T8rBwy5o-DYyC5vUimdj4IlJv0bY2DK_vtGPfIOpHo', '', '', 0, 1534822620);
INSERT INTO `dvd_user` VALUES (33, 1, 'op5wc0XoAOvFEwwB3kX4RmVWtPvs', 'pF7gufPB8e4tfY61MMRsCg==', '', '', '', '', '左 兟 苼', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83eq2sEocnS4WgayYhx68IJP0eSeOicGsZazaJcKMoqHtibUicckYfqxibw8pAkyziaNT7yaW43jniaf2RKdQ/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzQ5MTkzMTIsIm9wZW5pZCI6Im9wNXdjMFhvQU92RkV3d0Iza1g0Um1WV3RQdnMiLCJzZXNzaW9ua2V5IjoicEY3Z3VmUEI4ZTR0Zlk2MU1NUnNDZz09IiwidW5pb25pZCI6IiJ9.-c3Rjf-WhOafjG_P6b8qVYMXw3ZYNGrJb9ZnRh-EmL8', '', '', 0, 1534912112);
INSERT INTO `dvd_user` VALUES (34, 2, 'op5wc0dlowoleKFdnmQxpa4i6uL0', 'X3DQFplsaImqbQMaYV6jWw==', '', '', '', '', '希泰（果语农场）', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI1SNxGk4liacI0ibKpibck2u9pxlIiash7JdRciaJonTJsh9Ntnuk4ibicMbKkAOuKS74L9ujReNs0DQ9ZQ/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzUxMTI0NDcsIm9wZW5pZCI6Im9wNXdjMGRsb3dvbGVLRmRubVF4cGE0aTZ1TDAiLCJzZXNzaW9ua2V5IjoiWDNEUUZwbHNhSW1xYlFNYVlWNmpXdz09IiwidW5pb25pZCI6IiJ9.fFu-IeZ1Mt7m-wMg3ulkbfcf3U0-xoS3BuD7zRx7cqs', '', '', 0, 1535105247);
INSERT INTO `dvd_user` VALUES (35, 1, 'op5wc0QoRbRM590BYuLKe87z-NCE', 'J4epfcBZxRAEzeFnjUKyig==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzUxOTk4ODIsIm9wZW5pZCI6Im9wNXdjMFFvUmJSTTU5MEJZdUxLZTg3ei1OQ0UiLCJzZXNzaW9ua2V5IjoiSjRlcGZjQlp4UkFFemVGbmpVS3lpZz09IiwidW5pb25pZCI6IiJ9.G_xYbCqMrJc2j9bwzPrv3rl2TyO6furOuuWF85tFuig', '', '', 0, 1535192683);
INSERT INTO `dvd_user` VALUES (36, 2, 'op5wc0WurBSq2baTxTQH7lRvfxMo', '88Mg/p7ljr5MFbg0mjGOGg==', '', '17702316259', '', '先', 'z', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ4arSJMiaicqqvVLm1qaaQbP0xJnoEsicdhQZvYQjApIePdlGic77CDaIbrtzVpYo3TAm16QmSpEibwEA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzYxMzU5ODQsIm9wZW5pZCI6Im9wNXdjMFd1ckJTcTJiYVR4VFFIN2xSdmZ4TW8iLCJzZXNzaW9ua2V5IjoiODhNZy9wN2xqcjVNRmJnMG1qR09HZz09IiwidW5pb25pZCI6IiJ9.uL4LXrp18j3j8tFq3P84fsWrbsZqt2kMKiwAloKf-Q8', '', '', 0, 1535388528);
INSERT INTO `dvd_user` VALUES (37, 1, 'op5wc0ZUHY8fntF2Zq5c-T36mk9w', 'MPeS8CVrMKMiselxOCC4WA==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzU2MDc4OTcsIm9wZW5pZCI6Im9wNXdjMFpVSFk4Zm50RjJacTVjLVQzNm1rOXciLCJzZXNzaW9ua2V5IjoiTVBlUzhDVnJNS01pc2VseE9DQzRXQT09IiwidW5pb25pZCI6IiJ9.lB3aVmPeFiFI27iuatWlWhTvzk83H6PRg_A26VxlgCE', '', '', 0, 1535600700);
INSERT INTO `dvd_user` VALUES (38, 1, 'op5wc0f9KJiADzAKC5KnzsFAUMh0', 'TF2FXqLFyqkLIHPNIFWDgg==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzU4MTU4NDMsIm9wZW5pZCI6Im9wNXdjMGY5S0ppQUR6QUtDNUtuenNGQVVNaDAiLCJzZXNzaW9ua2V5IjoiVEYyRlhxTEZ5cWtMSUhQTklGV0RnZz09IiwidW5pb25pZCI6IiJ9.UQqrNQJyB9OWqNp4zejomfKQ0REL5ga58AXoxDXi410', '', '', 0, 1535808643);
INSERT INTO `dvd_user` VALUES (39, 1, 'op5wc0cCOKY-3q8wpmfRjZqizMm0', 'Uw7u8MhZ/7bq2u+MuCJfZQ==', '', '', '', '', '马小马', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJdpP1nBrLF2f7w22FGFcH90kUHFP2CoyRyqcBWXHB98bVXdicpL6JUPS61EtrBhjkZWMq09mN9d6g/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzYxNDkwNDcsIm9wZW5pZCI6Im9wNXdjMGNDT0tZLTNxOHdwbWZSalpxaXpNbTAiLCJzZXNzaW9ua2V5IjoiVXc3dThNaFovN2JxMnUrTXVDSmZaUT09IiwidW5pb25pZCI6IiJ9.6l_jedLRdRrhAc0Ig0z99vtpmLL-EPhbk0ZiB4YPcwQ', '', '', 0, 1536141847);
INSERT INTO `dvd_user` VALUES (40, 1, 'op5wc0UJXgkOVyjl0P6wZvvmLslE', 'gdI2XCtxrm5XfMXE6jmqqQ==', '', '', '', '', '.', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83epcWeEsu7iaYCjvjokwlLv3K9O9pLY6eukcEic0knibDyfjcbGt6PD0K07OhCPhZoZEmhlawR5aX8CMA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzY4MDk3ODIsIm9wZW5pZCI6Im9wNXdjMFVKWGdrT1Z5amwwUDZ3WnZ2bUxzbEUiLCJzZXNzaW9ua2V5IjoiZ2RJMlhDdHhybTVYZk1YRTZqbXFxUT09IiwidW5pb25pZCI6IiJ9.3DiFvyHbgb754CZx7MgLIE-P6Ahfx8fYi4JE3I3mjpI', '', '', 0, 1536802582);
INSERT INTO `dvd_user` VALUES (41, 1, 'op5wc0Th21x00aGsUXkpfi9APQI8', 'X3h/dDDamRryOA4go+2MSQ==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzcwNzA3MTAsIm9wZW5pZCI6Im9wNXdjMFRoMjF4MDBhR3NVWGtwZmk5QVBRSTgiLCJzZXNzaW9ua2V5IjoiWDNoL2RERGFtUnJ5T0E0Z28rMk1TUT09IiwidW5pb25pZCI6IiJ9.V_zEXihmNwUkksSC_hBmIOAF1-h6FNmEZZOqE_M-opo', '', '', 0, 1537063510);
INSERT INTO `dvd_user` VALUES (42, 1, 'op5wc0cFLgJHmSfBdzyUfNX6wXC0', 'KmnJOTV0EddtT9ngWBcntw==', '', '15289104701', '', '小英', '雨过天晴', 'https://wx.qlogo.cn/mmopen/vi_32/VPZJT5BtrnY670UPNhvgbQrxjXn9hicLv7ujcedJrGahgh58IDD62SKml1oZIqIVfxMwB7KJP3wdWsC5KIaJ8ug/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1Mzc3OTU3MTIsIm9wZW5pZCI6Im9wNXdjMGNGTGdKSG1TZkJkenlVZk5YNndYQzAiLCJzZXNzaW9ua2V5IjoiS21uSk9UVjBFZGR0VDluZ1dCY250dz09IiwidW5pb25pZCI6IiJ9.K8GjSPa0IZMlubjU_P2q3T9oRh1Dv4fRToemWqYCsKY', '', '', 0, 1537076402);
INSERT INTO `dvd_user` VALUES (43, 3, 'op5wc0TlVox0_kg1AIdAWNmr5dew', 'a6z8SfCT+OHUqbhQpjMJrg==', '', '', '', '', '漫步人生', 'https://wx.qlogo.cn/mmopen/vi_32/lPverGh6Wicaxm9ibJ8rYA6hrlZXtLory9KGR3JsTLuzfkFlvyrlkmIhyuQS61jI9QUkxYBlvDOAQx26ULtxuniaw/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzcwODQwOTksIm9wZW5pZCI6Im9wNXdjMFRsVm94MF9rZzFBSWRBV05tcjVkZXciLCJzZXNzaW9ua2V5IjoiYTZ6OFNmQ1QrT0hVcWJoUXBqTUpyZz09IiwidW5pb25pZCI6IiJ9.NFWvQbGoG3HlR6eLX2B-oMvoO-05TZxATmx3zJV8rFg', '', '', 0, 1537076899);
INSERT INTO `dvd_user` VALUES (44, 1, 'op5wc0f4O6erfdg5CHt97Ni_OXaQ', '8zgmrXdSacm8+tcBlSQytA==', '', '', '', '', '虢', 'https://wx.qlogo.cn/mmopen/vi_32/DYAIOgq83erQ0BribYI6XF7IX5loATaapHpQ18UaickvIHTWrRBUr4jx24tGX8Ze6XXjqmCnzvURkTDve3q5E3xA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzcyNjE2MzQsIm9wZW5pZCI6Im9wNXdjMGY0TzZlcmZkZzVDSHQ5N05pX09YYVEiLCJzZXNzaW9ua2V5IjoiOHpnbXJYZFNhY204K3RjQmxTUXl0QT09IiwidW5pb25pZCI6IiJ9.GMuWfXAFsmT3ZsqeovZGbxh8Rtr93CCz70O2qm2YKJY', '', '', 0, 1537254434);
INSERT INTO `dvd_user` VALUES (45, 2, 'op5wc0UtqTAeKNW36ki1iQ2dzQr8', 'OS6puZp5pAf633irSKC4gg==', '', '', '', '', '幸运草', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTK1RxepMcdsAkibQUJbibMYHP8sZwlwkOYzd3kQUn0CIDCleDa1lZ4n1ZjBNVRZBZQNRdodgyBz1nwA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzcyODI2MDcsIm9wZW5pZCI6Im9wNXdjMFV0cVRBZUtOVzM2a2kxaVEyZHpRcjgiLCJzZXNzaW9ua2V5IjoiT1M2cHVacDVwQWY2MzNpclNLQzRnZz09IiwidW5pb25pZCI6IiJ9.ZgGypCMPvpCv4CNbCSj0nMrLcCdcs-Cl51DsgxZHu4w', '', '', 0, 1537275407);
INSERT INTO `dvd_user` VALUES (46, 3, 'op5wc0QX3TLu7Pi0TFhJtg1KCvdo', 'leevH2jdPnTpTjKRUqBT1A==', '', '', '', '', '敬生豪', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIwEbNrsX8XyvzAiajOCT5op3l3d8IkYLMicLDsC7xMibpx8cNVOKwUZy7FpkUrotA8AcGju7IGoehXg/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzczMzI4MzcsIm9wZW5pZCI6Im9wNXdjMFFYM1RMdTdQaTBURmhKdGcxS0N2ZG8iLCJzZXNzaW9ua2V5IjoibGVldkgyamRQblRwVGpLUlVxQlQxQT09IiwidW5pb25pZCI6IiJ9.yYawX9DB-6yix9zD3BcvwjO31be-9wQoQGZIiNhJJeU', '', '', 0, 1537325637);
INSERT INTO `dvd_user` VALUES (47, 1, 'op5wc0QaQoCp7S6a2TfD4NB3iKqw', 'DjDJmZzjnsVozB7kVtu/lQ==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1Mzc3NDI4ODEsIm9wZW5pZCI6Im9wNXdjMFFhUW9DcDdTNmEyVGZENE5CM2lLcXciLCJzZXNzaW9ua2V5IjoiRGpESm1aempuc1ZvekI3a1Z0dS9sUT09IiwidW5pb25pZCI6IiJ9.6JU1LBk7FLPSvfhY3iTp2A1odZgvASW7A3161Io3PxA', '', '', 0, 1537735681);
INSERT INTO `dvd_user` VALUES (48, 1, 'op5wc0Sz--v7Vc_eRpcpILWaSVI8', 'JUvC+a75AF9Kkz5azXBUDA==', '', '18726787668', '', '武丹丹', '武丹丹', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKqAhKaiceLgk9ZGYXyic5gJ0O4XniaJBvQtOdeI3G3iaI08ibzROwNaF7FupyGcjP7QYFE3zasoXEW7fw/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzgyNjkxMTYsIm9wZW5pZCI6Im9wNXdjMFN6LS12N1ZjX2VScGNwSUxXYVNWSTgiLCJzZXNzaW9ua2V5IjoiSlV2QythNzVBRjlLa3o1YXpYQlVEQT09IiwidW5pb25pZCI6IiJ9.JGZ8_LDxvWXjx4QkvbgoouqHOruZXwLHrpGXDWA9Iyg', '', '', 0, 1538261916);
INSERT INTO `dvd_user` VALUES (49, 2, 'op5wc0cUTRnOuH1VPy6zwE-rRUwk', 'rNY/3Hu3ppszNz2q8n4ujQ==', '', '', '', '', '张学泉', 'https://wx.qlogo.cn/mmopen/vi_32/pvfmKQoWkC3go9AfbQZZ1SS5HOW4DcEHQyldGficqvOm8F0ksJlD8bz3xiaF6Aib3xW7jh94YN6b4CbBfibE3ibdBPg/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1Mzg4MjU5NzQsIm9wZW5pZCI6Im9wNXdjMGNVVFJuT3VIMVZQeTZ6d0UtclJVd2siLCJzZXNzaW9ua2V5Ijoick5ZLzNIdTNwcHN6TnoycThuNHVqUT09IiwidW5pb25pZCI6IiJ9.QqK_MBgdzkhcNe1hn_7nHR3k12cZViCvD-OMmVfE7KA', '', '', 0, 1538818774);
INSERT INTO `dvd_user` VALUES (50, 1, 'op5wc0aVWoo2J9yhU66p9pHz67nw', 'VMaYj0SbBWrpBCij64KhBQ==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1NDA4MDQ4NjksIm9wZW5pZCI6Im9wNXdjMGFWV29vMko5eWhVNjZwOXBIejY3bnciLCJzZXNzaW9ua2V5IjoiVk1hWWowU2JCV3JwQkNpajY0S2hCUT09IiwidW5pb25pZCI6IiJ9.cUPUBcsIPmHTKEtjfUo68XdqfPJHwarsGqvKooHt7FM', '', '', 0, 1538996966);
INSERT INTO `dvd_user` VALUES (51, 3, 'op5wc0SbH6NPj-t4FZSIiD1Pz8RU', '06n5Jl8Ayisd4yVxLx5yUQ==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzkxODcxODcsIm9wZW5pZCI6Im9wNXdjMFNiSDZOUGotdDRGWlNJaUQxUHo4UlUiLCJzZXNzaW9ua2V5IjoiMDZuNUpsOEF5aXNkNHlWeEx4NXlVUT09IiwidW5pb25pZCI6IiJ9.D13iqKOL5n4aX6xbsGE3kxj1ZlTqEZpfymi8rC3hfF8', '', '', 0, 1539179987);
INSERT INTO `dvd_user` VALUES (52, 2, 'op5wc0TDNf-PaRlmgjJ9mzgc0rRk', 'oh+GTyb5RYndU2e5GYJLng==', '', '', '', '', '@子熙', 'https://wx.qlogo.cn/mmopen/vi_32/PvoKibIA7vibDEELetsKVAHlv8YBAnXkic0IMZOEIcfnnkSic8yWnFUenxHhGRys4euicf5hIicgbGH3Xw5VJU7sECgA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1MzkzMTU5ODcsIm9wZW5pZCI6Im9wNXdjMFRETmYtUGFSbG1nako5bXpnYzByUmsiLCJzZXNzaW9ua2V5Ijoib2grR1R5YjVSWW5kVTJlNUdZSkxuZz09IiwidW5pb25pZCI6IiJ9.3UXr3edvABH_3E2aLF8NJCDve6PWyxU3FIorxfhxBeY', '', '', 0, 1539308788);
INSERT INTO `dvd_user` VALUES (53, 2, 'op5wc0TOPNXZZbjRavMuGTVKbHew', 'JpuEtvfHDc+LWhBwW6aMvQ==', '', '', '', '', '山重水复迷无路', 'https://wx.qlogo.cn/mmopen/vi_32/1KHMxFRdH85LQt0Sj77KNFnv8JIHdsMEYNJ5kNRuUDibCQfwkteEFsIoVibiaiapiaudFCOMliaRSywrC9PnpR0rR2hw/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1Mzk2NDkzMDQsIm9wZW5pZCI6Im9wNXdjMFRPUE5YWlpialJhdk11R1RWS2JIZXciLCJzZXNzaW9ua2V5IjoiSnB1RXR2ZkhEYytMV2hCd1c2YU12UT09IiwidW5pb25pZCI6IiJ9.vXoaddftUa08rooKH0M7grZA6oVsl2ilWXoPoXE6-P8', '', '', 0, 1539642104);
INSERT INTO `dvd_user` VALUES (54, 2, 'op5wc0aIh05DiI7Di4iQYkdfH9Kg', 'JOwCXMoVn/FbgbRJgNTVCA==', '', '', '', '', '艾丶', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKICicDV8ribbQ8KVHbZnLLRxsiaNIdzXtNabJCfuTXIE22usFkj2hzpsXxbcyfBX1RHPTejlibC48oMA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1Mzk3Nzg0MDAsIm9wZW5pZCI6Im9wNXdjMGFJaDA1RGlJN0RpNGlRWWtkZkg5S2ciLCJzZXNzaW9ua2V5IjoiSk93Q1hNb1ZuL0ZiZ2JSSmdOVFZDQT09IiwidW5pb25pZCI6IiJ9.17HlEQBR8IYFrjpkep5JXYqnB3aH-nTtUPVdEwApJmI', '', '', 0, 1539771200);
INSERT INTO `dvd_user` VALUES (55, 1, 'op5wc0R3TTRehsToI2_qTXcOsW6U', '/ityV8nfwcAZenOjKk3CrA==', '', '', '', '', '如意', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKNVmuUo4JmXexib5wqothezJJBTiaQQEYLYxV8kSic8lx5mVWu9xIYM7qCXttBiaF0zvBXQ5vvYSK8Ew/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1NDA2MDM1ODcsIm9wZW5pZCI6Im9wNXdjMFIzVFRSZWhzVG9JMl9xVFhjT3NXNlUiLCJzZXNzaW9ua2V5IjoiL2l0eVY4bmZ3Y0FaZW5PaktrM0NyQT09IiwidW5pb25pZCI6IiJ9.l1y5oxnKbC3UubP0UdZo4oB6oRP51tMqW9NdMTaI5ok', '', '', 0, 1540596387);
INSERT INTO `dvd_user` VALUES (56, 1, 'op5wc0ZgkgU87Tgt-If4QHlm2T7k', 'yRNLdwMIazAnn7mHG57zOg==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1NDExMzM1NjAsIm9wZW5pZCI6Im9wNXdjMFpna2dVODdUZ3QtSWY0UUhsbTJUN2siLCJzZXNzaW9ua2V5IjoieVJOTGR3TUlhekFubjdtSEc1N3pPZz09IiwidW5pb25pZCI6IiJ9.cXSJLTp8Tw8M-d2AGkVvpv03vFWjlBs-5_R_9FnAb2E', '', '', 0, 1540684450);
INSERT INTO `dvd_user` VALUES (57, 1, 'op5wc0UBHXmJjHPD2dZOLbxv2Bvs', 'zoOZ5qIwUACrJ55slxsViA==', '', '', '', '', '', '', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1NDE0MDc2NjYsIm9wZW5pZCI6Im9wNXdjMFVCSFhtSmpIUEQyZFpPTGJ4djJCdnMiLCJzZXNzaW9ua2V5Ijoiem9PWjVxSXdVQUNySjU1c2x4c1ZpQT09IiwidW5pb25pZCI6IiJ9.G3hl8iE2-97nuqTN7cWSl8w8CYDEcQyPh-xG7IDGO7o', '', '', 0, 1541400466);
INSERT INTO `dvd_user` VALUES (58, 3, 'op5wc0TbLSOoGOQo5fBhhumU5hmQ', 'C18xMxEequjUIkdIIkttQw==', '', '18663413933', '', '迟晓宇', '898烧烤', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJpzm5C5QcVePomDvxpdDMOCR5mLaeIgbKgkzAvqK9dh03huT3Gf8Zc01sJeG2urSKI3icriaPCRichQ/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1NDE2ODMzOTIsIm9wZW5pZCI6Im9wNXdjMFRiTFNPb0dPUW81ZkJoaHVtVTVobVEiLCJzZXNzaW9ua2V5IjoiQzE4eE14RWVxdWpVSWtkSUlrdHRRdz09IiwidW5pb25pZCI6IiJ9.kPXXWDWMHiHmHYPinXEUGdwHaE2MsaraG4qVABtXPXY', '', '', 0, 1541676192);
INSERT INTO `dvd_user` VALUES (59, 3, 'op5wc0V8WL3dn60M0fdcOl0fxXYo', 'jULtAjEzSXO0zkHwMBKvNQ==', '', '', '', '', '898烧烤火锅', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTICMoOoCiahWJEl9hxAoOkLAcK6FX5oYmr4S2ZnNzsjtjUUic8JJaZyHHdGIQYsoqsicBicgeNXFibcaxA/132', 0, 0, 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzYXQiOjE1NDE3MDMwNTYsIm9wZW5pZCI6Im9wNXdjMFY4V0wzZG42ME0wZmRjT2wwZnhYWW8iLCJzZXNzaW9ua2V5IjoialVMdEFqRXpTWE8wemtId01CS3ZOUT09IiwidW5pb25pZCI6IiJ9.585iOO_Q3LJS-SCHUqW-53gFmAJaoZUrw7YsqpmA8Hk', '', '', 0, 1541695856);

SET FOREIGN_KEY_CHECKS = 1;
