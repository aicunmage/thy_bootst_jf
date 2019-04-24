/*
Navicat MySQL Data Transfer

Source Server         : 阿里云-运维架构
Source Server Version : 50616
Source Host           : rm-uf629uq3w78tbz72vno.mysql.rds.aliyuncs.com:3306
Source Database       : visualops

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2019-04-24 17:49:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dbs
-- ----------------------------
DROP TABLE IF EXISTS `dbs`;
CREATE TABLE `dbs` (
  `guid` varchar(255) NOT NULL,
  `databaseid` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `regionid` varchar(255) DEFAULT NULL,
  `zoneid` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `networktype` varchar(255) DEFAULT NULL,
  `engine` varchar(255) DEFAULT NULL,
  `engineVersion` varchar(255) DEFAULT NULL,
  `expiretime` datetime DEFAULT NULL,
  `dbtype` varchar(255) DEFAULT NULL,
  `dbclass` varchar(255) DEFAULT NULL,
  `lockmode` varchar(255) DEFAULT NULL,
  `lockreason` varchar(255) DEFAULT NULL,
  `masterinstanceid` varchar(255) DEFAULT NULL,
  `md5` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `dbmodel_databaseid` (`databaseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dbs
-- ----------------------------
INSERT INTO `dbs` VALUES ('99225ae2-4ec1-11e9-aaef-0a58ac14040b', 'rm-uf6r50yo146g199hy', 'Running', '2018-08-29 02:58:29', 'cn-shanghai', 'cn-shanghai-b', 'IM_DB', 'VPC', 'MySQL', '5.7', null, 'Primary', 'rds.mysql.t1.small', 'Unlock', '', null, '9264967a8285671d8d9f83c09aa3e7c0');
INSERT INTO `dbs` VALUES ('992320d0-4ec1-11e9-adae-0a58ac14040b', 'rr-uf6wu3bw6755ouhno', 'Running', '2018-06-26 04:52:01', 'cn-shanghai', 'cn-shanghai-b', 'rmis_db_readonly-2', 'VPC', 'MySQL', '5.6', null, 'Readonly', 'rds.mysql.s3.large', 'Unlock', '', 'rm-uf60965662rf7p9lw', 'aa4a3e5ccf125dc422bba071381cf06e');
INSERT INTO `dbs` VALUES ('9923dad4-4ec1-11e9-b300-0a58ac14040b', 'rm-uf629uq3w78tbz72v', 'Running', '2018-04-04 06:14:49', 'cn-shanghai', 'cn-shanghai-b', 'TB_db', 'VPC', 'MySQL', '5.6', '2019-05-04 16:00:00', 'Primary', 'rds.mysql.s2.large', 'Unlock', '', null, '4f2e0874530cf5343a9b9393932c9079');
INSERT INTO `dbs` VALUES ('99248892-4ec1-11e9-a992-0a58ac14040b', 'rm-uf6f8wg7ts87ydf16', 'Running', '2018-03-14 06:16:02', 'cn-shanghai', 'cn-shanghai-b', 'dcm_history_db', 'VPC', 'MySQL', '5.6', '2019-05-14 16:00:00', 'Primary', 'rds.mysql.s1.small', 'Unlock', '', null, 'aaefa2e9aa90ecc7a3b91f562921ef1d');
INSERT INTO `dbs` VALUES ('992531ee-4ec1-11e9-863e-0a58ac14040b', 'rm-uf6hu986w8jj5j6o6', 'Running', '2018-01-22 02:48:33', 'cn-shanghai', 'cn-shanghai-b', 'dcm_db', 'VPC', 'MySQL', '5.6', '2019-05-22 16:00:00', 'Primary', 'rds.mysql.s2.large', 'Unlock', '', null, 'f7b44128b0ae0a4187d9bd3033cb0eb0');
INSERT INTO `dbs` VALUES ('9925e84a-4ec1-11e9-8045-0a58ac14040b', 'rm-uf60965662rf7p9lw', 'Running', '2017-11-13 02:43:11', 'cn-shanghai', 'cn-shanghai-b', 'rmis_db', 'VPC', 'MySQL', '5.6', '2019-05-13 16:00:00', 'Primary', 'rds.mysql.s2.large', 'Unlock', '', null, '74b390270e40fbbcb2030547561d0943');

-- ----------------------------
-- Table structure for loadbalancers
-- ----------------------------
DROP TABLE IF EXISTS `loadbalancers`;
CREATE TABLE `loadbalancers` (
  `guid` varchar(255) NOT NULL,
  `loadbalancerid` varchar(255) NOT NULL,
  `loadbalancername` varchar(255) NOT NULL,
  `privateip` varchar(255) DEFAULT NULL,
  `publicip` varchar(255) DEFAULT NULL,
  `regionid` varchar(255) DEFAULT NULL,
  `masterzoneid` varchar(255) DEFAULT NULL,
  `slavezoneid` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `md5` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `lbmodel_loadbalancerid` (`loadbalancerid`),
  KEY `lbmodel_loadbalancername` (`loadbalancername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of loadbalancers
-- ----------------------------
INSERT INTO `loadbalancers` VALUES ('0273ddc0-5424-11e9-9947-0a58ac14072d', 'lb-uf6dtmfr50bmghf18n6uw', 'lb-demo2', '172.19.143.88', null, 'cn-shanghai', 'cn-shanghai-d', 'cn-shanghai-e', 'invalid', '2019-04-01 10:11:00', '674858f2fad1aa3c2848e6cfc0b43566');
INSERT INTO `loadbalancers` VALUES ('19b1c890-5f5e-11e9-a99c-0a58ac14072d', 'lb-uf6v9zpd1otjyfur3x6gp', 'ad90544d25f5c11e9bf6600163e04a02', null, '47.101.75.119', 'cn-shanghai', 'cn-shanghai-d', 'cn-shanghai-e', 'invalid', '2019-04-15 17:00:00', '9cf24757d3fd72927f5714cddab57c5c');
INSERT INTO `loadbalancers` VALUES ('1ed2b9c8-60e0-11e9-a234-0a58ac14072d', 'lb-uf6o2p3su3ehwamk9320d', 'ad6cf020460df11e996dd00163e1a020', null, '47.102.51.148', 'cn-shanghai', 'cn-shanghai-e', 'cn-shanghai-f', 'invalid', '2019-04-17 15:10:00', '3b2242ded4e88e34b50a4095fbea1669');
INSERT INTO `loadbalancers` VALUES ('22131ce2-4ed5-11e9-b9c4-0a58ac14040b', 'lb-uf6xf5q231fhmp4flq71l', 'a5e0b25cc4ed411e9bf6600163e04a02', '172.19.149.86', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-c', 'invalid', '2019-03-25 16:02:00', '2f5c275d0e9b53677e28cfa7ccd95d28');
INSERT INTO `loadbalancers` VALUES ('364f88e8-5421-11e9-850f-0a58ac14072d', 'lb-uf60wwxfwzegyqov15gx6', 'lb-demo1', '172.19.143.87', null, 'cn-shanghai', 'cn-shanghai-d', 'cn-shanghai-e', 'invalid', '2019-04-01 09:51:00', '602deeb735442041242f13bdf857d840');
INSERT INTO `loadbalancers` VALUES ('4d1c985c-65a9-11e9-9722-0a58ac14072d', 'lb-uf6ugiw24gzb8miu2v7ap', 'ack-lb-zipkin-sc', '172.19.120.79', null, 'cn-shanghai', 'cn-shanghai-e', 'cn-shanghai-d', 'invalid', '2019-04-23 17:19:00', 'd9755c08737cbd907d5ff3afc5ef5895');
INSERT INTO `loadbalancers` VALUES ('511c4558-60e4-11e9-a201-0a58ac14072d', 'lb-uf6124gfm9888gv9ehh5s', 'ack-lb-springcloud-sc', '172.19.217.115', null, 'cn-shanghai', 'cn-shanghai-a', 'cn-shanghai-b', 'active', '2019-04-17 15:32:00', 'a7de21392d7086a47c5df7f64e9bbc0b');
INSERT INTO `loadbalancers` VALUES ('84c46eb6-60e1-11e9-bae9-0a58ac14072d', 'lb-uf6ed69gysdfl8mhdfkdy', 'ack-lb-eureka-sc', '172.19.120.78', null, 'cn-shanghai', 'cn-shanghai-e', 'cn-shanghai-d', 'invalid', '2019-04-17 15:14:00', 'bb5d4665e1d886e877e4efae95ef904f');
INSERT INTO `loadbalancers` VALUES ('8e4dc21a-4ec1-11e9-8acf-0a58ac14040b', 'lb-uf6n1mvdkh07suai05mh8', 'k8s-lb-marker-fms-prod', '172.19.149.81', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-a', 'active', '2019-03-25 11:02:00', 'c435b42948b73fc2f38f9ad5328c398f');
INSERT INTO `loadbalancers` VALUES ('8e4e789a-4ec1-11e9-a319-0a58ac14040b', 'lb-uf6wx2x5tkboyfxa0angb', 'k8s-lb-visualops-ops', '172.19.143.86', null, 'cn-shanghai', 'cn-shanghai-d', 'cn-shanghai-e', 'active', '2019-03-22 16:56:00', '002c2aa7c45ab6295da4048d714e5e21');
INSERT INTO `loadbalancers` VALUES ('8e4f221e-4ec1-11e9-8a32-0a58ac14040b', 'lb-uf6bzcny0wbfvki4ikesr', 'k8s-lb-marker-prod', '172.19.217.114', null, 'cn-shanghai', 'cn-shanghai-a', 'cn-shanghai-b', 'invalid', '2019-03-22 09:45:00', '48cf4f86343c7903ebf846056f49327e');
INSERT INTO `loadbalancers` VALUES ('8e4fbd6e-4ec1-11e9-9d1b-0a58ac14040b', 'lb-uf6sfgio19uc244hxnmv4', 'k8s-lb-marker-test', '172.19.22.127', null, 'cn-shanghai', 'cn-shanghai-c', 'cn-shanghai-b', 'active', '2019-03-21 09:10:00', '99158b59c9aeda04cd775e1de7a2d436');
INSERT INTO `loadbalancers` VALUES ('8e505824-4ec1-11e9-a77c-0a58ac14040b', 'lb-uf6sp83k64h14dyh9df10', 'ac24a98a5417211e9a120627e51d37d6', null, '47.101.79.62', 'cn-shanghai', 'cn-shanghai-d', 'cn-shanghai-e', 'active', '2019-03-08 15:21:00', 'fdcc57905763478d15ace21a039e9d9c');
INSERT INTO `loadbalancers` VALUES ('8e50f60c-4ec1-11e9-8d9f-0a58ac14040b', 'lb-uf68nt0jg4krdgyn9358f', 'acs-slb-c5bc193d27cf2402183a293fd00666a4f', '172.19.143.82', null, 'cn-shanghai', 'cn-shanghai-a', 'cn-shanghai-b', 'active', '2019-03-08 15:20:00', 'e198a97cd1a1d87777cb61736983bf08');
INSERT INTO `loadbalancers` VALUES ('8e51935e-4ec1-11e9-a230-0a58ac14040b', 'lb-uf6sz2075oajrsvd0a2qj', 'k8s-lb-tb-fv-qc-test', '172.19.120.76', null, 'cn-shanghai', 'cn-shanghai-e', 'cn-shanghai-d', 'active', '2019-03-05 17:22:00', 'caf285e7bb27af16c27ad23338281f11');
INSERT INTO `loadbalancers` VALUES ('8e522b58-4ec1-11e9-aa14-0a58ac14040b', 'lb-uf6p85zgoz47jx97wfnnh', 'k8s-lb-rmis-tb-test', '172.19.149.80', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-a', 'active', '2019-03-05 16:24:00', 'aed9526afca419f30e6cb1133f1280ce');
INSERT INTO `loadbalancers` VALUES ('8e52bfa2-4ec1-11e9-8bdd-0a58ac14040b', 'lb-uf6drya9akijektqk7fj7', 'k8s-lb-fv-tb-test', '172.19.120.75', null, 'cn-shanghai', 'cn-shanghai-e', 'cn-shanghai-d', 'active', '2019-03-05 15:32:00', 'd2b53678853b20efa8eb0c551eddd085');
INSERT INTO `loadbalancers` VALUES ('8e535500-4ec1-11e9-9e64-0a58ac14040b', 'lb-uf6u7k950660qkyt6tosh', 'ad9fba49a3f1011e999cc00163e04a02', null, '47.102.62.176', 'cn-shanghai', 'cn-shanghai-e', 'cn-shanghai-f', 'invalid', '2019-03-05 14:35:00', 'd449d506383140cc017d86930ae2b497');
INSERT INTO `loadbalancers` VALUES ('8e53e770-4ec1-11e9-bb3f-0a58ac14040b', 'lb-uf6v49i77q360ka5r24mx', 'k8s-lb-fms-tb-test', '172.19.120.74', null, 'cn-shanghai', 'cn-shanghai-e', 'cn-shanghai-d', 'active', '2019-03-05 10:18:00', 'f970f41daeb81167a3904e7a9a173ee7');
INSERT INTO `loadbalancers` VALUES ('8e547cf0-4ec1-11e9-ab6b-0a58ac14040b', 'lb-uf6oha4uam6wns1w8qnlj', 'k8s-lb-tb-fv-qc-prod', '172.19.149.77', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-c', 'active', '2019-02-21 16:42:00', '3ba81a9a62c9b9ceca2ae4053d9e0d36');
INSERT INTO `loadbalancers` VALUES ('8e550d94-4ec1-11e9-a0d2-0a58ac14040b', 'lb-uf6h3rbvxkee2n3bahqad', 'k8s-lb-tb-fv-prod', '172.19.149.76', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-c', 'active', '2019-02-21 16:35:00', '86aef2a3b89d6de57a7d607b0ad278a2');
INSERT INTO `loadbalancers` VALUES ('8e55a758-4ec1-11e9-9bed-0a58ac14040b', 'lb-uf6xkh4b9uh7f82nhwnnd', 'k8s-lb-rmis_tb_prod', '172.19.149.75', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-c', 'active', '2019-02-21 15:50:00', 'a2576975276af5e85d192c3ede25dde0');
INSERT INTO `loadbalancers` VALUES ('8e563de6-4ec1-11e9-b3fd-0a58ac14040b', 'lb-uf60gcxixxv5sgkei0dbm', 'k8s-lb-zjk-dpm', '172.19.149.74', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-12-29 16:27:00', '79584d430e80f97b2d731d90d4294284');
INSERT INTO `loadbalancers` VALUES ('8e56d3cc-4ec1-11e9-9c0c-0a58ac14040b', 'lb-uf6nejoplq7zmkp8gr257', 'k8s-lb-crm-dpm', '172.19.149.73', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-12-28 10:36:00', '5161e681ad65ccee7f7518bdfed44532');
INSERT INTO `loadbalancers` VALUES ('8e577f48-4ec1-11e9-aad2-0a58ac14040b', 'lb-uf6e9dm24ha06d64my8ei', 'k8s-lb-ai-prod', '172.19.149.68', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-12-27 18:11:00', '34d03bf5d04a262c05f3d81486beb14e');
INSERT INTO `loadbalancers` VALUES ('8e581964-4ec1-11e9-b834-0a58ac14040b', 'lb-uf6eph9loi3y0jmzrh8mj', 'ad3574bcf074c11e993e700163e1a01f', '172.19.149.67', null, 'cn-shanghai', 'cn-shanghai-c', 'cn-shanghai-b', 'invalid', '2018-12-24 15:23:00', 'e10f95edb64bc32ce310cb65e8a9addb');
INSERT INTO `loadbalancers` VALUES ('8e58b302-4ec1-11e9-88ab-0a58ac14040b', 'lb-uf660v6tvhmay82umoszh', 'k8s-lb-clientinstall-prod', '172.19.149.65', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-12-18 17:38:00', '75b0f3f797b84ef1fe065db004a251b4');
INSERT INTO `loadbalancers` VALUES ('8e594834-4ec1-11e9-be05-0a58ac14040b', 'lb-uf6h0f0w8os7l7sj0bp8q', 'k8s-lb-ts-prod', '172.19.149.64', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-12-03 15:23:00', '3ffbea62f1373674d794524eb20a6845');
INSERT INTO `loadbalancers` VALUES ('8e59db86-4ec1-11e9-b0ce-0a58ac14040b', 'lb-uf6uj3uquh780n0h70vq1', 'k8s-lb-ai-test', '172.19.149.62', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-11-30 16:22:00', '117e4f919c124b55b7c8b1f697f10f9e');
INSERT INTO `loadbalancers` VALUES ('8e5a6c6e-4ec1-11e9-9ca7-0a58ac14040b', 'lb-uf6jwrrrubc183mh6e9h1', 'k8s-lb-jenkins-devops', '172.19.149.61', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-11-20 17:38:00', 'f7bae75d3b8a28a11f5a5bebbcece652');
INSERT INTO `loadbalancers` VALUES ('8e5b00be-4ec1-11e9-b116-0a58ac14040b', 'lb-uf6hj91roy58spmff67la', 'k8s-lb-ingress-vpc', '172.19.149.50', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-10-18 11:05:00', 'f9a944689d99bb5649d05f35163a8577');
INSERT INTO `loadbalancers` VALUES ('8e5b98e8-4ec1-11e9-8408-0a58ac14040b', 'lb-uf6h9q50xsxvt5g1a8gck', 'k8s-lb-zuul-prod', '172.19.149.48', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-10-10 15:34:00', '7d80b0bba4685e4cd914ba14728d01cb');
INSERT INTO `loadbalancers` VALUES ('8e5c2b86-4ec1-11e9-a909-0a58ac14040b', 'lb-uf6k9f92fqq0r9n87538m', 'lb-im-file', '172.19.149.36', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-c', 'active', '2018-09-20 16:48:00', 'c2e75a4d4c0e52fbe8d7c06e335046e4');
INSERT INTO `loadbalancers` VALUES ('8e5cca64-4ec1-11e9-8041-0a58ac14040b', 'lb-uf6mb1u3i2uqzj3zawp10', 'k8s-lb-zuulroute-test', '172.19.149.35', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-09-20 14:05:00', '388745a0016a7a3f22abf412aa2bd3fd');
INSERT INTO `loadbalancers` VALUES ('8e5db488-4ec1-11e9-b732-0a58ac14040b', 'lb-uf61idksufqat783o21ca', 'lb-im', '172.19.149.33', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-c', 'active', '2018-09-19 17:29:00', 'ab7955410212b5aa0e5888cc10ea5758');
INSERT INTO `loadbalancers` VALUES ('8e5e5558-4ec1-11e9-9fc0-0a58ac14040b', 'lb-uf6b3y8opso3fkhzuj1w3', 'k8s-lb-grafana', '172.19.149.32', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-09-12 16:39:00', '9a4dc9642b0c7f2e73b1b7ae237bdf98');
INSERT INTO `loadbalancers` VALUES ('8e5eedf4-4ec1-11e9-9724-0a58ac14040b', 'lb-uf6c2ufral5u9nc0516ds', 'k8s-lb-fv-prod', '172.19.149.30', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-08-31 11:33:00', '9b35d0b7bb6e35f21f0f8899eeb9ced2');
INSERT INTO `loadbalancers` VALUES ('8e5f7d9c-4ec1-11e9-87cf-0a58ac14040b', 'lb-uf6i09kmdqu4mw4hl1f9t', 'k8s-lb-rmis-prod', '172.19.149.29', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-08-31 11:33:00', '38e0dc2e1a00df963956ef04b4d78ba9');
INSERT INTO `loadbalancers` VALUES ('8e601052-4ec1-11e9-92a3-0a58ac14040b', 'lb-uf64aqlrfphyb4e0q9ku3', 'k8s-lb-wv-prod', '172.19.149.26', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-08-21 11:10:00', 'e42b25c54abfd6ebae4a194d8277146f');
INSERT INTO `loadbalancers` VALUES ('8e60aa98-4ec1-11e9-9113-0a58ac14040b', 'lb-uf6ndiy560qi3ubqzuszo', 'k8s-lb-nginx-test', null, '106.15.25.12', 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-08-02 17:27:00', 'd6a7e58bd70e98a66dec169cace583e8');
INSERT INTO `loadbalancers` VALUES ('8e6145cc-4ec1-11e9-a720-0a58ac14040b', 'lb-uf6cjjyq5xxrbevm0baqe', 'k8s-lb-fms-prod', '172.19.149.2', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-05-21 11:35:00', '6b0cb5f7b03b1acae81bdb2f090af821');
INSERT INTO `loadbalancers` VALUES ('8e61d83a-4ec1-11e9-8edd-0a58ac14040b', 'lb-uf6oqab8uae6mtu81mxy1', 'k8s-lb-dcm-prod', '172.19.149.1', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-05-21 10:27:00', '18f08179a325f9656c80837572c59473');
INSERT INTO `loadbalancers` VALUES ('8e626dde-4ec1-11e9-9ecb-0a58ac14040b', 'lb-uf69wro277rd74upp16mr', 'k8s-lb-dcm-annotation', '172.19.148.254', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-05-16 14:48:00', '1ae0b5d3209776d0c86164c241efc40f');
INSERT INTO `loadbalancers` VALUES ('8e630730-4ec1-11e9-8978-0a58ac14040b', 'lb-uf6n5vxc3thfit4j3qxlb', 'k8s-lb-fms-history', null, '106.15.26.13', 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-05-14 11:30:00', 'fbe228530829778529923bcbfe234fe8');
INSERT INTO `loadbalancers` VALUES ('8e6398c2-4ec1-11e9-9a08-0a58ac14040b', 'lb-uf61q2xcnwfywjv5mpbs7', 'k8s-lb-dcm-history', '172.19.148.245', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-a', 'active', '2018-05-02 11:13:00', 'cbf8da8a21bc11422db2e8da7236b6dd');
INSERT INTO `loadbalancers` VALUES ('8e642e64-4ec1-11e9-b8e7-0a58ac14040b', 'lb-uf6qwbhb9cfbittqsm7b8', 'K8sWorkerSlbInternet', null, '106.15.161.194', 'cn-shanghai', 'cn-shanghai-a', 'cn-shanghai-b', 'active', '2018-04-20 14:05:00', 'a684967113ae591d43cd86458fc4575e');
INSERT INTO `loadbalancers` VALUES ('8e64be4c-4ec1-11e9-8806-0a58ac14040b', 'lb-uf6ex85l3oa5gwayl1zvi', 'K8sMasterSlbInternet', null, '139.224.38.57', 'cn-shanghai', 'cn-shanghai-a', 'cn-shanghai-b', 'active', '2018-04-20 13:58:00', '3f35889d51210b4068dcb30825a757a8');
INSERT INTO `loadbalancers` VALUES ('8e654f5e-4ec1-11e9-a3c9-0a58ac14040b', 'lb-uf6e2e06dr6vprqvsj0gf', 'K8sMasterSlb内网', '172.19.148.237', null, 'cn-shanghai', 'cn-shanghai-a', 'cn-shanghai-b', 'active', '2018-04-20 13:58:00', 'e101341f91b9df8952c27d1af3e07d1e');
INSERT INTO `loadbalancers` VALUES ('8e65e040-4ec1-11e9-984e-0a58ac14040b', 'lb-uf67qjdb7j476rknfsob1', 'k8s-lb-aiproxy', '172.19.148.212', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2018-01-09 16:07:00', 'e95d07a1972dd5ad84318b20c659efdf');
INSERT INTO `loadbalancers` VALUES ('8e6670be-4ec1-11e9-9e20-0a58ac14040b', 'lb-uf62mqks78a13ac3hppji', 'dr_lb', '172.19.148.206', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2017-12-18 14:31:00', 'b82ff483559141b0a67cb06484fa9102');
INSERT INTO `loadbalancers` VALUES ('8e670354-4ec1-11e9-9fc9-0a58ac14040b', 'lb-uf6ghqcjkw1ikeg8tamx4', 'uv_lb', '172.19.148.199', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2017-11-16 16:39:00', 'e2b323ad017831dcf63f60744d98d2d5');
INSERT INTO `loadbalancers` VALUES ('8e67961a-4ec1-11e9-a9e4-0a58ac14040b', 'lb-uf65e2zigl8rgseve04jb', 'svc_lb', null, '106.15.26.39', 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'active', '2017-11-13 11:00:00', '7fd7adb58c510adc4933ebb404fdb398');
INSERT INTO `loadbalancers` VALUES ('8e682f40-4ec1-11e9-aac4-0a58ac14040b', 'lb-uf6ahkubbcud4jeitjzsm', 'arc_lb', '172.19.148.198', null, 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-d', 'invalid', '2017-11-13 10:59:00', 'b16bbb4d41c7d49ad00d40ed4af40b05');
INSERT INTO `loadbalancers` VALUES ('8f46991e-5fef-11e9-89e3-0a58ac14072d', 'lb-uf6pylho711f4wxy8g9s2', 'ae209384b5fee11e9bf6600163e04a02', null, '47.102.14.150', 'cn-shanghai', 'cn-shanghai-e', 'cn-shanghai-d', 'invalid', '2019-04-16 10:25:00', '4019da1c26ca625460e5e911e4acebea');
INSERT INTO `loadbalancers` VALUES ('907c1258-5fe8-11e9-a2d4-0a58ac14072d', 'lb-uf6mucbq9igbp3djo5oac', 'a9a4a89a95fe711e9bf6600163e04a02', null, '47.101.75.254', 'cn-shanghai', 'cn-shanghai-d', 'cn-shanghai-e', 'invalid', '2019-04-16 09:33:00', '37afec2191b6c03cc689206fcd432247');
INSERT INTO `loadbalancers` VALUES ('c0905bd8-64aa-11e9-815c-0a58ac14072d', 'lb-uf6c59xm0tgcp4rpk116o', 'a654985f664a911e9a120627e51d37d6', null, '47.101.4.52', 'cn-shanghai', 'cn-shanghai-b', 'cn-shanghai-c', 'invalid', '2019-04-22 10:50:00', 'b372dac3ddba5dd8acf772ba5c8c752f');
INSERT INTO `loadbalancers` VALUES ('c2ba46be-5fec-11e9-b184-0a58ac14072d', 'lb-uf6xawlwcisw146smvfvk', 'ack-lb-eureka', '172.19.77.86', null, 'cn-shanghai', 'cn-shanghai-f', 'cn-shanghai-e', 'active', '2019-04-16 10:03:00', '69a57548acdbad993b4645d1019eafd5');
INSERT INTO `loadbalancers` VALUES ('c5330bd0-6175-11e9-aa1c-0a58ac14072d', 'lb-uf6iopxfjtv1nvor2xxsm', 'a8e36460c617511e996dd00163e1a020', null, '139.224.172.170', 'cn-shanghai', 'cn-shanghai-c', 'cn-shanghai-b', 'invalid', '2019-04-18 09:01:00', 'e8bc4faa28a5749a1c7ff277d4d90881');
INSERT INTO `loadbalancers` VALUES ('eb111880-60e2-11e9-84fa-0a58ac14072d', 'lb-uf6r5ql00j0rgw2myozum', 'ac12fd39f60e211e996dd00163e1a020', null, '47.102.11.0', 'cn-shanghai', 'cn-shanghai-e', 'cn-shanghai-d', 'invalid', '2019-04-17 15:31:00', '2e421e54cd16c0c94b3f57aa041fc234');
INSERT INTO `loadbalancers` VALUES ('f57ba350-5ff0-11e9-be85-0a58ac14072d', 'lb-uf6rl8d1y1awd85lyw5kf', 'ack-lb-zuul', '172.19.120.77', null, 'cn-shanghai', 'cn-shanghai-e', 'cn-shanghai-d', 'active', '2019-04-16 10:37:00', '2c199b880665c055b6149b82da56ea4d');

-- ----------------------------
-- Table structure for pods
-- ----------------------------
DROP TABLE IF EXISTS `pods`;
CREATE TABLE `pods` (
  `guid` varchar(255) NOT NULL,
  `podid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `clustername` varchar(255) DEFAULT NULL,
  `namespace` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `podip` varchar(255) DEFAULT NULL,
  `hostip` varchar(255) DEFAULT NULL,
  `phase` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `deletetime` datetime DEFAULT NULL,
  `md5` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `podmodel_podid` (`podid`),
  KEY `podmodel_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pods
-- ----------------------------
INSERT INTO `pods` VALUES ('0217e814-60e5-11e9-a2e0-0a58ac14072d', 'a899aa30-60e4-11e9-bf66-00163e04a02f', 'fms-sc-product-deploy-6b58d8f9b4-8b7cl', null, 'product', 'invalid', '172.20.16.251', '172.19.149.72', 'Running', null, '2019-04-17 07:44:40', '2019-04-17 07:44:40', null, '319b0b60332e72b2888366855551f5d7');
INSERT INTO `pods` VALUES ('0219189e-60e5-11e9-972f-0a58ac14072d', 'de520c89-60e4-11e9-bf66-00163e04a02f', 'fms-sc-product-deploy-6b58d8f9b4-fk4ct', null, 'product', 'invalid', '172.20.21.37', '172.19.148.193', 'Running', null, '2019-04-17 07:46:11', '2019-04-17 07:46:11', null, 'f24ad524954deb157efe86596865cde2');
INSERT INTO `pods` VALUES ('021a235a-60e5-11e9-afdb-0a58ac14072d', 'de540f03-60e4-11e9-bf66-00163e04a02f', 'fms-sc-product-deploy-6b58d8f9b4-l4622', null, 'product', 'invalid', '172.20.5.135', '172.19.148.227', 'Running', null, '2019-04-17 07:46:11', '2019-04-17 07:46:11', null, '8cd675f27b0ee27d87febac1561c0008');
INSERT INTO `pods` VALUES ('021acab4-60e5-11e9-b1da-0a58ac14072d', 'a897b409-60e4-11e9-bf66-00163e04a02f', 'fms-sc-product-deploy-6b58d8f9b4-mpr98', null, 'product', 'invalid', '172.20.19.17', '172.19.149.93', 'Running', null, '2019-04-17 07:44:40', '2019-04-17 07:44:40', null, '30c4f864f2ce665c60292216a0faedd0');
INSERT INTO `pods` VALUES ('0583c1a2-65f2-11e9-b1a2-0a58ac14072d', 'd33945cc-65f1-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-2f5kf', null, 'product', 'invalid', '172.20.29.45', '172.19.149.102', 'Running', null, '2019-04-23 18:01:31', '2019-04-23 18:01:31', '2019-04-23 18:13:02', 'f883e94247fb963791d58734cbbcb6da');
INSERT INTO `pods` VALUES ('058476d2-65f2-11e9-b27f-0a58ac14072d', 'd33a9254-65f1-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-fr2gg', null, 'product', 'invalid', '172.20.16.77', '172.19.149.72', 'Running', null, '2019-04-23 18:01:31', '2019-04-23 18:01:31', '2019-04-23 18:08:01', '9c76e2e7ea5603e2f71a6d61d3351d5d');
INSERT INTO `pods` VALUES ('0904bc64-65e4-11e9-a398-0a58ac14072d', 'febf7c27-65e3-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-fjt76', null, 'product', 'invalid', '172.20.29.40', '172.19.149.102', 'Running', null, '2019-04-23 16:22:31', '2019-04-23 16:22:31', null, '13aa85ea1494a15088e5025b5bbb9f60');
INSERT INTO `pods` VALUES ('0a99b2f4-56a8-11e9-a3e5-0a58ac14072d', '83a5bbd5-56a7-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-wlh9r', null, 'product', 'invalid', '172.20.6.228', '172.19.148.225', 'Running', null, '2019-04-04 07:01:47', '2019-04-04 07:01:48', null, 'c28f7e3c138778af744cdd63e203b38b');
INSERT INTO `pods` VALUES ('0d4f1a5c-64a3-11e9-93f0-0a58ac14072d', '9d3a589f-64a2-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-wz7st', null, 'product', 'invalid', '172.20.16.26', '172.19.149.72', 'Running', null, '2019-04-22 02:01:59', '2019-04-22 02:01:59', null, '53a18e02323b2cda96bd8cfea1504d6f');
INSERT INTO `pods` VALUES ('0e4996ae-569a-11e9-9f9d-0a58ac14072d', 'e4fc0126-5699-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-5kcnb', null, 'product', 'invalid', '172.20.6.226', '172.19.148.225', 'Running', null, '2019-04-04 05:24:18', '2019-04-04 05:24:18', '2019-04-04 05:30:48', 'ba36f61c79e74270e99f685684d67fb0');
INSERT INTO `pods` VALUES ('101d422c-5693-11e9-8bd7-0a58ac14072d', 'a1797ea2-5692-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-9np4k', null, 'product', 'invalid', '172.20.6.224', '172.19.148.225', 'Running', null, '2019-04-04 04:32:18', '2019-04-04 04:32:18', null, '48ea7741cfd3596b1c78bfe11de45069');
INSERT INTO `pods` VALUES ('12abdc2c-5997-11e9-9443-0a58ac14072d', 'e32a5079-5996-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-2xz27', null, 'product', 'invalid', '172.20.6.234', '172.19.148.225', 'Running', null, '2019-04-08 00:40:20', '2019-04-08 00:40:20', null, 'a409791fa82c8b7e39681567b8d1d198');
INSERT INTO `pods` VALUES ('12acc776-5997-11e9-9d47-0a58ac14072d', 'e32cae81-5996-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-7rhsg', null, 'product', 'invalid', '172.20.7.61', '172.19.149.6', 'Running', null, '2019-04-08 00:40:20', '2019-04-08 00:40:20', null, '3febcdc0dbe0ffd6db40221cfdeec84f');
INSERT INTO `pods` VALUES ('19f40bc6-64d6-11e9-9200-0a58ac14072d', 'e230e06c-64d5-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-bfnxk', null, 'product', 'invalid', '172.20.28.3', '172.19.149.101', 'Running', null, '2019-04-22 08:08:59', '2019-04-22 08:08:58', null, '27479fce66ad26ef4350d9b6ad166702');
INSERT INTO `pods` VALUES ('1b7633a6-59d8-11e9-a1af-0a58ac14072d', 'fcdaa20d-59d7-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-2skpn', null, 'product', 'invalid', '172.20.7.64', '172.19.149.6', 'Running', null, '2019-04-08 08:26:20', '2019-04-08 08:26:20', null, '003e714881802cd94e1ad12585fdede0');
INSERT INTO `pods` VALUES ('1b7778c8-59d8-11e9-bb32-0a58ac14072d', '7f93c93c-59d7-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-f4hzc', null, 'product', 'invalid', '172.20.19.15', '172.19.149.93', 'Running', null, '2019-04-08 08:22:50', '2019-04-08 08:22:50', null, 'dfc5a1d924f4393c30ffb06d3b192f0d');
INSERT INTO `pods` VALUES ('1b781d58-59d8-11e9-9a49-0a58ac14072d', '7f92326b-59d7-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-x6z76', null, 'product', 'invalid', '172.20.6.241', '172.19.148.225', 'Running', null, '2019-04-08 08:22:50', '2019-04-08 08:22:50', null, '8654b13604e6c0ed903049b02da0f962');
INSERT INTO `pods` VALUES ('1bfccd94-4f09-11e9-bf56-0a58ac14072d', 'df0a0286-4f08-11e9-bf66-00163e04a02f', 'marker-test-deploy-56ff8544b7-m8ssq', null, 'test', 'invalid', '172.20.15.11', '172.19.149.90', 'Running', null, '2019-03-25 14:18:33', '2019-03-25 14:18:33', null, 'cbe785ca76f525581d21097174aee963');
INSERT INTO `pods` VALUES ('1c17df92-53c2-11e9-a791-0a58ac14072d', '06ce09da-53c2-11e9-bf66-00163e04a02f', 'ts-product-deploy-5895495949-mz6js', null, 'product', 'invalid', '172.20.6.211', '172.19.148.225', 'Running', null, '2019-03-31 14:34:01', '2019-03-31 14:34:01', null, 'fe798e818dbfbf331d5eaf07bdac26fb');
INSERT INTO `pods` VALUES ('1cec906e-60e0-11e9-8e6f-0a58ac14072d', 'd6e1327d-60df-11e9-bf66-00163e04a02f', 'ack-springcloud-eureka-sc-ack-springcloud-eureka-0-5854445gx5wn', null, 'product', 'invalid', '172.20.21.36', '172.19.148.193', 'Running', null, '2019-04-17 07:10:11', '2019-04-17 07:10:11', null, '0f29490c48ebe5c6d026f3c4ee9f30c0');
INSERT INTO `pods` VALUES ('1ced3eca-60e0-11e9-83f6-0a58ac14072d', 'd6e0b49d-60df-11e9-bf66-00163e04a02f', 'ack-springcloud-eureka-sc-ack-springcloud-eureka-1-58794f6kv9pr', null, 'product', 'invalid', '172.20.7.74', '172.19.149.6', 'Running', null, '2019-04-17 07:10:11', '2019-04-17 07:10:11', null, '43e0d84421006b1f73921b943e8c73ea');
INSERT INTO `pods` VALUES ('1df73b94-4f02-11e9-b6c7-0a58ac14072d', 'f87db0f1-4f01-11e9-bf66-00163e04a02f', 'marker-test-test-deploy-ddbcd57f4-7k6t9', null, 'test', 'invalid', '172.20.15.7', '172.19.149.90', 'Running', null, '2019-03-25 13:29:09', '2019-03-25 13:29:09', null, '56d9c2cea989c52c60803a450cc9c77b');
INSERT INTO `pods` VALUES ('1df7eee4-4f02-11e9-b33f-0a58ac14072d', 'f87b6e02-4f01-11e9-bf66-00163e04a02f', 'marker-test-test-deploy-ddbcd57f4-ck6nl', null, 'test', 'invalid', '172.20.15.6', '172.19.149.90', 'Running', null, '2019-03-25 13:29:09', '2019-03-25 13:29:09', null, '499fd70e83970d67d14fb8bc97b86a4c');
INSERT INTO `pods` VALUES ('20599dca-65ed-11e9-adc6-0a58ac14072d', '83dc604d-65ec-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-mqcqp', null, 'product', 'invalid', '172.20.29.42', '172.19.149.102', 'Running', null, '2019-04-23 17:23:31', '2019-04-23 17:23:31', '2019-04-23 17:33:00', 'a8dfacc1bf17d29f1e29ccc9d37f6a50');
INSERT INTO `pods` VALUES ('217f22ba-5239-11e9-b534-0a58ac14072d', '98a90550-5238-11e9-bf66-00163e04a02f', 'ts-product-deploy-668dbb989-f4tpt', null, 'product', 'invalid', '172.20.6.207', '172.19.148.225', 'Running', null, '2019-03-29 15:37:44', '2019-03-29 15:37:44', null, '0eeee8d3e40ef07df1a827d4a599b721');
INSERT INTO `pods` VALUES ('21822586-5239-11e9-9d82-0a58ac14072d', '92335780-5238-11e9-bf66-00163e04a02f', 'ts-product-deploy-668dbb989-hd7lw', null, 'product', 'invalid', '172.20.16.237', '172.19.149.72', 'Running', null, '2019-03-29 15:37:33', '2019-03-29 15:37:33', null, '9276f959b92bb69983ddf04f5545915e');
INSERT INTO `pods` VALUES ('248f1ad2-5c06-11e9-afc1-0a58ac14072d', '991d8eed-5c05-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-2p5tt', null, 'product', 'invalid', '172.20.6.247', '172.19.148.225', 'Running', null, '2019-04-11 02:57:52', '2019-04-11 02:57:52', null, '16585d1e305ad4f02b1eadd96550f924');
INSERT INTO `pods` VALUES ('27ab4d26-5f1f-11e9-afab-0a58ac14072d', 'e1ce89ad-5f1e-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-2gsdw', null, 'product', 'invalid', '172.20.21.7', '172.19.148.193', 'Running', null, '2019-04-15 01:36:25', '2019-04-15 01:36:25', null, '9839678bd0b6f55d2b7ff4d8b07be20b');
INSERT INTO `pods` VALUES ('2978c7dc-5f18-11e9-9f63-0a58ac14072d', 'e546c688-5f17-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-rq6gr', null, 'product', 'invalid', '172.20.21.3', '172.19.148.193', 'Running', null, '2019-04-15 00:46:24', '2019-04-15 00:46:24', null, '752ed9d38155aebe384f13228e0a28ad');
INSERT INTO `pods` VALUES ('2afbb04c-568e-11e9-b646-0a58ac14072d', 'bdcf21d8-568d-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-lvjz5', null, 'product', 'invalid', '172.20.6.221', '172.19.148.225', 'Running', null, '2019-04-04 03:57:18', '2019-04-04 03:57:18', null, 'b1345471eb7bb1fecb2916aa3d16e70d');
INSERT INTO `pods` VALUES ('2bbef724-5999-11e9-b690-0a58ac14072d', '90d2bfec-5998-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-fs662', null, 'product', 'invalid', '172.20.6.235', '172.19.148.225', 'Running', null, '2019-04-08 00:52:21', '2019-04-08 00:52:21', null, '090a83c4d7442170f652383ebbce3986');
INSERT INTO `pods` VALUES ('2bbff068-5999-11e9-9223-0a58ac14072d', '90d523df-5998-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-xkjp5', null, 'product', 'invalid', '172.20.7.62', '172.19.149.6', 'Running', null, '2019-04-08 00:52:21', '2019-04-08 00:52:21', null, '134b9eefa38b311c1e14195df75ea135');
INSERT INTO `pods` VALUES ('2c9933d0-58d1-11e9-8b95-0a58ac14072d', '12c13b93-58d1-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-mjc6v', null, 'product', 'invalid', '172.20.6.233', '172.19.148.225', 'Running', null, '2019-04-07 01:04:19', '2019-04-07 01:04:19', null, '899da9621e6c7bd36958828b20bc5788');
INSERT INTO `pods` VALUES ('312326c0-5375-11e9-99e7-0a58ac14072d', 'ffaf1484-5374-11e9-bf66-00163e04a02f', 'ts-product-deploy-6bc7c79d46-lzmsj', null, 'product', 'invalid', '172.20.6.209', '172.19.148.225', 'Running', null, '2019-03-31 05:22:38', '2019-03-31 05:22:38', null, 'c262b09c01cce5ea08b19eba40bf036d');
INSERT INTO `pods` VALUES ('31252ae6-5375-11e9-a719-0a58ac14072d', '119931fd-5375-11e9-bf66-00163e04a02f', 'ts-product-deploy-6bc7c79d46-scmdg', null, 'product', 'invalid', '172.20.16.239', '172.19.149.72', 'Running', null, '2019-03-31 05:23:08', '2019-03-31 05:23:08', null, '1925ae3ae803bbdf393d51970582fea4');
INSERT INTO `pods` VALUES ('34369d02-60e9-11e9-b71b-0a58ac14072d', 'ef6fd4a3-60e8-11e9-bf66-00163e04a02f', 'archive-sc-product-deploy-68b76687f5-7cx7h', null, 'product', 'invalid', '172.20.19.18', '172.19.149.93', 'Running', null, '2019-04-17 08:15:17', '2019-04-17 08:15:17', null, '7d482b04e900148ed17d787dad7bec40');
INSERT INTO `pods` VALUES ('343756a2-60e9-11e9-8331-0a58ac14072d', 'ef6e4d9d-60e8-11e9-bf66-00163e04a02f', 'archive-sc-product-deploy-68b76687f5-b9l84', null, 'product', 'invalid', '172.20.16.252', '172.19.149.72', 'Running', null, '2019-04-17 08:15:17', '2019-04-17 08:15:17', null, '43fc2bf913cd35215fe2686785e43780');
INSERT INTO `pods` VALUES ('373d4f78-541a-11e9-974b-0a58ac14072d', 'ee15c55c-5419-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-526t5', null, 'product', 'invalid', '172.20.16.242', '172.19.149.72', 'Running', null, '2019-04-01 01:03:15', '2019-04-01 01:03:15', null, '83c89dd84916047fe04685605b2b6079');
INSERT INTO `pods` VALUES ('3b28a750-65e8-11e9-89d6-0a58ac14072d', 'a0072f89-65e7-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-bknjc', null, 'product', 'invalid', '172.20.29.41', '172.19.149.102', 'Running', null, '2019-04-23 16:48:30', '2019-04-23 16:48:30', null, '7a24331d70e7ca56aa07c540f1eaa588');
INSERT INTO `pods` VALUES ('3ceed994-65e1-11e9-802a-0a58ac14072d', 'eb4a042d-65e0-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-bhs8z', null, 'product', 'invalid', '172.20.29.38', '172.19.149.102', 'Running', null, '2019-04-23 16:00:30', '2019-04-23 16:00:30', null, '9242f458ab452bce9cc04f9e6dae1997');
INSERT INTO `pods` VALUES ('3f6c6f0a-5cc9-11e9-a70f-0a58ac14072d', '098fa298-5cc9-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-5trzz', null, 'product', 'invalid', '172.20.6.249', '172.19.148.225', 'Running', null, '2019-04-12 02:16:53', '2019-04-12 02:16:53', null, '18917e55de1df18ae3fb399e51e26491');
INSERT INTO `pods` VALUES ('41366ca4-64a0-11e9-a5ec-0a58ac14072d', 'e3e735d0-649f-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-4zz7g', null, 'product', 'invalid', '172.20.16.25', '172.19.149.72', 'Running', null, '2019-04-22 01:42:29', '2019-04-22 01:42:29', null, 'cfc1e45f1cec4100a2f55342e699a7cf');
INSERT INTO `pods` VALUES ('41cc93b8-6568-11e9-8115-0a58ac14072d', 'baf472df-6567-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-6l62r', null, 'product', 'invalid', '172.20.19.62', '172.19.149.93', 'Running', null, '2019-04-23 01:33:00', '2019-04-23 01:33:00', null, '45460e0c4e25409e69644080ee840665');
INSERT INTO `pods` VALUES ('41cd8e62-6568-11e9-818b-0a58ac14072d', 'baf2da24-6567-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-8kr5q', null, 'product', 'invalid', '172.20.16.51', '172.19.149.72', 'Running', null, '2019-04-23 01:33:00', '2019-04-23 01:33:00', null, 'f037448966e1239df880ecc3e1976226');
INSERT INTO `pods` VALUES ('42f71fe6-6499-11e9-b09f-0a58ac14072d', 'c3d1af47-6498-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-w469r', null, 'product', 'invalid', '172.20.16.20', '172.19.149.72', 'Running', null, '2019-04-22 00:51:29', '2019-04-22 00:51:29', null, '1b911f1976f3ee5ec5f564e4e0bddb71');
INSERT INTO `pods` VALUES ('42fadc78-59a2-11e9-a989-0a58ac14072d', 'a541e498-59a1-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-lnv92', null, 'product', 'invalid', '172.20.6.237', '172.19.148.225', 'Running', null, '2019-04-08 01:57:20', '2019-04-08 01:57:20', null, 'f7328c4b94ad04c12d2e67b5b9481a00');
INSERT INTO `pods` VALUES ('446199a8-63ca-11e9-ba57-0a58ac14072d', 'a91f60a5-63c9-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-gmx2c', null, 'product', 'invalid', '172.20.16.18', '172.19.149.72', 'Running', null, '2019-04-21 00:08:58', '2019-04-21 00:08:58', null, '8ac2903fe180a28441edfa40910931fb');
INSERT INTO `pods` VALUES ('46d871a2-567b-11e9-8676-0a58ac14072d', 'bd992d5b-567a-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-qkxjx', null, 'product', 'invalid', '172.20.6.217', '172.19.148.225', 'Running', null, '2019-04-04 01:41:17', '2019-04-04 01:41:17', null, 'a1baa1369a36116c8fb0b039e83dcf1a');
INSERT INTO `pods` VALUES ('4d5869ec-60eb-11e9-a4db-0a58ac14072d', '9d0ead53-60ea-11e9-bf66-00163e04a02f', 'archive-sc-product-deploy-68b76687f5-265l8', null, 'product', 'invalid', '172.20.5.136', '172.19.148.227', 'Running', null, '2019-04-17 08:27:18', '2019-04-17 08:27:18', null, '4700df55fd944fb051e48947eba66084');
INSERT INTO `pods` VALUES ('4d598902-60eb-11e9-a477-0a58ac14072d', '9d09d3b3-60ea-11e9-bf66-00163e04a02f', 'archive-sc-product-deploy-68b76687f5-nqn85', null, 'product', 'invalid', '172.20.19.19', '172.19.149.93', 'Running', null, '2019-04-17 08:27:18', '2019-04-17 08:27:18', null, '90a957db3c0809193c2750abc25bb243');
INSERT INTO `pods` VALUES ('50b96cde-65f8-11e9-bc6a-0a58ac14072d', 'f8acbef8-65f7-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-2w99m', null, 'product', 'invalid', '172.20.29.47', '172.19.149.102', 'Running', null, '2019-04-23 18:45:31', '2019-04-23 18:45:31', null, 'ae89f4c5a4adfd1b2d2da8a99a717a02');
INSERT INTO `pods` VALUES ('57fb3c70-6251-11e9-9691-0a58ac14072d', 'c927d7d6-6250-11e9-bf66-00163e04a02f', 'tb-fv-qc-product-deploy-746d95b8f-7q2bc', null, 'product', 'valid', '172.20.21.52', '172.19.148.193', 'Running', null, '2019-04-19 03:11:12', '2019-04-19 03:11:12', null, 'db5f7d7bb359afda282c857973b265a9');
INSERT INTO `pods` VALUES ('57fbf2c2-6251-11e9-ae33-0a58ac14072d', 'c92124df-6250-11e9-bf66-00163e04a02f', 'tb-fv-qc-product-deploy-746d95b8f-nc7dt', null, 'product', 'valid', '172.20.19.42', '172.19.149.93', 'Running', null, '2019-04-19 03:11:12', '2019-04-19 03:11:12', null, 'a71a2b7ca883cc73e43de1b7d33a0e1c');
INSERT INTO `pods` VALUES ('5b93428c-5f1c-11e9-8002-0a58ac14072d', 'aae6af08-5f1b-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-z8mqs', null, 'product', 'invalid', '172.20.21.4', '172.19.148.193', 'Running', null, '2019-04-15 01:13:24', '2019-04-15 01:13:24', null, '25f4ad00b70ae25682924527096fcbcc');
INSERT INTO `pods` VALUES ('613d6f3a-5684-11e9-9fe2-0a58ac14072d', 'ae637e95-5683-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-2cp95', null, 'product', 'invalid', '172.20.7.59', '172.19.149.6', 'Running', null, '2019-04-04 02:45:17', '2019-04-04 02:45:17', null, '220b81089fc24fd98aa3466e52a22454');
INSERT INTO `pods` VALUES ('613f979c-5684-11e9-a942-0a58ac14072d', '3d9ca5d2-5684-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-9w8pl', null, 'product', 'invalid', '172.20.19.10', '172.19.149.93', 'Running', null, '2019-04-04 02:49:18', '2019-04-04 02:49:18', null, '3fb420e5d2595373765e2dc2604bbf20');
INSERT INTO `pods` VALUES ('61412da2-5684-11e9-a0fb-0a58ac14072d', 'ae609656-5683-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-dpqgl', null, 'product', 'invalid', '172.20.6.218', '172.19.148.225', 'Running', null, '2019-04-04 02:45:17', '2019-04-04 02:45:17', null, 'd3ae789bd5a04b5ea6e4e1b3a357c021');
INSERT INTO `pods` VALUES ('616dc64a-5f6b-11e9-96ec-0a58ac14072d', 'bcd96bf8-5f6a-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-fm89z', null, 'product', 'invalid', '172.20.21.12', '172.19.148.193', 'Running', null, '2019-04-15 10:39:25', '2019-04-15 10:39:25', null, '7b8c239f67468f4e100fe287964cf211');
INSERT INTO `pods` VALUES ('616e7278-5f6b-11e9-96c6-0a58ac14072d', 'bcdb031f-5f6a-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-wx4sr', null, 'product', 'invalid', '172.20.21.11', '172.19.148.193', 'Running', null, '2019-04-15 10:39:25', '2019-04-15 10:39:25', null, '5074711d4162961ec1c45ed7c7854a82');
INSERT INTO `pods` VALUES ('619c5810-64ea-11e9-bb20-0a58ac14072d', '35b460d5-64ea-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-9swm6', null, 'product', 'invalid', null, null, 'Pending', null, '2019-04-22 10:34:29', null, null, '22b7e7fa8efcec25a4160905272b7cb0');
INSERT INTO `pods` VALUES ('619d06ac-64ea-11e9-a0e5-0a58ac14072d', '35b32569-64ea-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-bwxs4', null, 'product', 'invalid', '172.20.16.44', '172.19.149.72', 'Running', null, '2019-04-22 10:34:29', '2019-04-22 10:34:29', null, '227c74d6ed3321af10c9cbe7f950cf41');
INSERT INTO `pods` VALUES ('61ab86ca-55b5-11e9-b3f9-0a58ac14072d', '58491faa-55b5-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-d7g9k', null, 'product', 'invalid', '172.20.19.7', '172.19.149.93', 'Running', null, '2019-04-03 02:08:17', '2019-04-03 02:08:17', null, '32221aab7a4eabbc67b8f0e5c1c4d880');
INSERT INTO `pods` VALUES ('65831026-542c-11e9-a636-0a58ac14072d', '4d887ce0-542c-11e9-bf66-00163e04a02f', 'ts-product-deploy-67bb59fcd-f648j', null, 'product', 'valid', '172.20.16.247', '172.19.149.72', 'Running', null, '2019-04-01 03:14:46', '2019-04-01 03:14:46', null, '8c377368a39f1aa05368a4ae62a47c78');
INSERT INTO `pods` VALUES ('6583c8c0-542c-11e9-b080-0a58ac14072d', '5f6f0609-542c-11e9-bf66-00163e04a02f', 'ts-product-deploy-67bb59fcd-pc57l', null, 'product', 'invalid', '172.20.6.214', '172.19.148.225', 'Running', null, '2019-04-01 03:15:16', '2019-04-01 03:15:16', '2019-04-01 03:20:46', '03d1041d981c1c26adf142d3e27c6e1c');
INSERT INTO `pods` VALUES ('6658a964-6608-11e9-9ecb-0a58ac14072d', '2d1464b9-6608-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-s5dnk', null, 'product', 'invalid', '172.20.29.49', '172.19.149.102', 'Running', null, '2019-04-23 20:41:31', '2019-04-23 20:41:31', null, '103c16bfe5496b1980dcd599b7b229d5');
INSERT INTO `pods` VALUES ('6907de94-4f08-11e9-8fb1-0a58ac14072d', '09a01934-4f08-11e9-bf66-00163e04a02f', 'marker-test-deploy-56ff8544b7-pj75q', null, 'test', 'invalid', '172.20.15.10', '172.19.149.90', 'Pending', null, '2019-03-25 14:12:35', '2019-03-25 14:12:35', null, 'bd1f1cdb590458b7438a6d66864139d2');
INSERT INTO `pods` VALUES ('69133f30-53c1-11e9-8109-0a58ac14072d', '23de67a2-53c1-11e9-bf66-00163e04a02f', 'ts-product-deploy-5ccbb88bb6-px8qj', null, 'product', 'invalid', '172.20.16.241', '172.19.149.72', 'Running', null, '2019-03-31 14:27:40', '2019-03-31 14:27:40', null, 'c778bd3cfec3dedf1810b2e857ea3721');
INSERT INTO `pods` VALUES ('6a969cca-64c7-11e9-8a53-0a58ac14072d', '5609a5f9-64c7-11e9-bf66-00163e04a02f', 'marker-test-deploy-76fbbf79c4-mj6rz', null, 'test', 'invalid', '172.20.16.37', '172.19.149.72', 'Running', null, '2019-04-22 06:24:51', '2019-04-22 06:24:51', null, '19bb2bd7e569ad619644603b1fd0d064');
INSERT INTO `pods` VALUES ('6af69624-4f01-11e9-8984-0a58ac14072d', '6035c83d-4f01-11e9-bf66-00163e04a02f', 'marker-test-test-deploy-58ff86c4db-bm5j4', null, 'test', 'invalid', '172.20.15.4', '172.19.149.90', 'Pending', null, '2019-03-25 13:24:53', '2019-03-25 13:24:53', null, '81fe299b635f74019a87d69476313839');
INSERT INTO `pods` VALUES ('6af74fde-4f01-11e9-8f42-0a58ac14072d', '60379e67-4f01-11e9-bf66-00163e04a02f', 'marker-test-test-deploy-58ff86c4db-dgjcg', null, 'test', 'invalid', '172.20.15.5', '172.19.149.90', 'Pending', null, '2019-03-25 13:24:53', '2019-03-25 13:24:53', null, '5e987394f528af7234ebcadcee39566f');
INSERT INTO `pods` VALUES ('7453570c-65d0-11e9-8f2b-0a58ac14072d', '047ae88a-65d0-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-529lp', null, 'product', 'invalid', '172.20.16.76', '172.19.149.72', 'Running', null, '2019-04-23 13:59:31', '2019-04-23 13:59:31', null, '938cf4cf6335109e30bc3159bd26ee97');
INSERT INTO `pods` VALUES ('7454c31a-65d0-11e9-b5d2-0a58ac14072d', '0479acc0-65d0-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-wd8qs', null, 'product', 'invalid', '172.20.29.37', '172.19.149.102', 'Running', null, '2019-04-23 13:59:31', '2019-04-23 13:59:31', null, '34c16aac1f207662d1f440b86480dbfc');
INSERT INTO `pods` VALUES ('74a4ec36-5f1e-11e9-a276-0a58ac14072d', 'c372ed18-5f1d-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-4r6s9', null, 'product', 'invalid', '172.20.21.5', '172.19.148.193', 'Running', null, '2019-04-15 01:28:24', '2019-04-15 01:28:24', null, 'ea7377be6db136a9a75c465228598125');
INSERT INTO `pods` VALUES ('74a6787e-5f1e-11e9-932c-0a58ac14072d', '52aa6db4-5f1e-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-t9bv9', null, 'product', 'invalid', '172.20.21.6', '172.19.148.193', 'Running', null, '2019-04-15 01:32:25', '2019-04-15 01:32:25', null, '93496716657156f84e70b4ac2c3a6def');
INSERT INTO `pods` VALUES ('760eb1b6-65c9-11e9-b62c-0a58ac14072d', '6152d45a-65c9-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-gw4rt', null, 'product', 'invalid', '172.20.16.75', '172.19.149.72', 'Running', null, '2019-04-23 13:12:00', '2019-04-23 13:12:00', null, '15bdf005bc4d539f9f2334712615ca2e');
INSERT INTO `pods` VALUES ('7617e434-5a67-11e9-93d8-0a58ac14072d', '0a30b59b-5a67-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-2bf2m', null, 'product', 'invalid', '172.20.6.242', '172.19.148.225', 'Running', null, '2019-04-09 01:30:21', '2019-04-09 01:30:21', null, 'fca7e1cff03a4aacd7c7e08a6d4738ca');
INSERT INTO `pods` VALUES ('761931fe-5a67-11e9-8fda-0a58ac14072d', '0a3229b7-5a67-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-p9tzv', null, 'product', 'invalid', '172.20.7.65', '172.19.149.6', 'Running', null, '2019-04-09 01:30:21', '2019-04-09 01:30:21', null, 'de3528b305f9aba5552866bee94ea9fd');
INSERT INTO `pods` VALUES ('769d42a4-662d-11e9-8f75-0a58ac14072d', 'fc742037-662c-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-sdf96', null, 'product', 'invalid', '172.20.29.50', '172.19.149.102', 'Running', null, '2019-04-24 01:05:01', '2019-04-24 01:05:01', null, 'da02d957efea1eef19e8471f65658403');
INSERT INTO `pods` VALUES ('76e8cca4-599f-11e9-a08b-0a58ac14072d', 'fd647256-599e-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-vtzh9', null, 'product', 'invalid', '172.20.6.236', '172.19.148.225', 'Running', null, '2019-04-08 01:38:20', '2019-04-08 01:38:20', null, '76384fa348d52fd17ab469c109d2e33d');
INSERT INTO `pods` VALUES ('8251fa08-5420-11e9-b849-0a58ac14072d', '7f12bb9b-5420-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-fl79f', null, 'product', 'invalid', '172.20.16.244', '172.19.149.72', 'Running', null, '2019-04-01 01:50:15', '2019-04-01 01:50:15', null, '8a5b9288b5001a511288df4e31838fbb');
INSERT INTO `pods` VALUES ('8252bc90-5420-11e9-9520-0a58ac14072d', '7f1159d6-5420-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-gp2qb', null, 'product', 'invalid', '172.20.16.243', '172.19.149.72', 'Running', null, '2019-04-01 01:50:15', '2019-04-01 01:50:15', null, '06a7dba27b91829e7bf6cbcbcaf2115a');
INSERT INTO `pods` VALUES ('826990d4-6598-11e9-826e-0a58ac14072d', 'ff300dd7-6597-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-wvtrl', null, 'product', 'invalid', '172.20.16.67', '172.19.149.72', 'Running', null, '2019-04-23 07:18:30', '2019-04-23 07:18:30', null, '6d08be107614f082551e79cc0e353b6d');
INSERT INTO `pods` VALUES ('83a9f48c-64c9-11e9-8569-0a58ac14072d', 'e0d37374-64c8-11e9-bf66-00163e04a02f', 'marker-test-deploy-8646dccbd-bgh7l', null, 'test', 'valid', '172.20.5.170', '172.19.148.227', 'Running', null, '2019-04-22 06:35:53', '2019-04-22 06:35:54', null, '2629b8ffad95a91065ef766ca5e8d780');
INSERT INTO `pods` VALUES ('842de4ca-6591-11e9-9c15-0a58ac14072d', 'f11b731f-6590-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-ph65m', null, 'product', 'invalid', '172.20.16.64', '172.19.149.72', 'Running', null, '2019-04-23 06:28:00', '2019-04-23 06:28:00', null, 'e8db55384d83cc74b22ed7b69de4f597');
INSERT INTO `pods` VALUES ('84e06724-63fa-11e9-8639-0a58ac14072d', '46a80cab-63fa-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-lrsw7', null, 'product', 'invalid', '172.20.16.19', '172.19.149.72', 'Running', null, '2019-04-21 05:56:58', '2019-04-21 05:56:59', null, 'cb056a8e93095483932ae9f74075becb');
INSERT INTO `pods` VALUES ('84e181ba-63fa-11e9-a633-0a58ac14072d', '46a95488-63fa-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-rc4x4', null, 'product', 'invalid', '172.20.5.158', '172.19.148.227', 'Running', null, '2019-04-21 05:56:58', '2019-04-21 05:56:59', null, 'ee1c0c5966e9d2a3788cd6b1e12379d6');
INSERT INTO `pods` VALUES ('86651966-65ee-11e9-84a5-0a58ac14072d', '5503f6c7-65ee-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-gs65k', null, 'product', 'invalid', '172.20.29.43', '172.19.149.102', 'Running', null, '2019-04-23 17:36:31', '2019-04-23 17:36:31', '2019-04-23 17:48:00', '6da1cd38f9c8a14fd2de7ddc7404c88a');
INSERT INTO `pods` VALUES ('86e108ba-583b-11e9-8e64-0a58ac14072d', '62bdd08c-583b-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-67kcx', null, 'product', 'invalid', '172.20.6.232', '172.19.148.225', 'Running', null, '2019-04-06 07:12:49', '2019-04-06 07:12:49', null, 'd2413d2211caec975a5b23954f4a4b6e');
INSERT INTO `pods` VALUES ('8c662202-5c00-11e9-a989-0a58ac14072d', '7fbad20a-5c00-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-fcbhb', null, 'product', 'invalid', '172.20.7.66', '172.19.149.6', 'Running', null, '2019-04-11 02:21:22', '2019-04-11 02:21:22', null, 'dd5fbb30e8b55189949401967ceb0b34');
INSERT INTO `pods` VALUES ('8d5e65da-569d-11e9-8a33-0a58ac14072d', 'e5a4ecb3-569c-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-972xm', null, 'product', 'invalid', '172.20.6.227', '172.19.148.225', 'Running', null, '2019-04-04 05:45:47', '2019-04-04 05:45:47', null, '286998387dbffea384d7d043dc0f9a1e');
INSERT INTO `pods` VALUES ('8dd17e52-617f-11e9-90af-0a58ac14072d', '7b54cd31-617f-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-q2clw', null, 'product', 'invalid', '172.20.19.22', '172.19.149.93', 'Running', null, '2019-04-18 02:12:56', '2019-04-18 02:12:56', null, 'c081e96d6cd2bfe4edaff6f4f67e1f5f');
INSERT INTO `pods` VALUES ('8fc06a06-662f-11e9-b116-0a58ac14072d', '02e74f20-662f-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-8fglr', null, 'product', 'invalid', '172.20.16.78', '172.19.149.72', 'Running', null, '2019-04-24 01:19:30', '2019-04-24 01:19:31', null, '0c75737821477e1e19af7ca61103666f');
INSERT INTO `pods` VALUES ('8fc2aaba-662f-11e9-a3e4-0a58ac14072d', '02ea7273-662f-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-pvlxm', null, 'product', 'invalid', '172.20.29.51', '172.19.149.102', 'Running', null, '2019-04-24 01:19:30', '2019-04-24 01:19:31', null, '296754c06d3a91594e54d68529b5ad51');
INSERT INTO `pods` VALUES ('90898838-5fe1-11e9-9917-0a58ac14072d', '342837d7-5fe1-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-5c9n5', null, 'product', 'invalid', '172.20.21.15', '172.19.148.193', 'Running', null, '2019-04-16 00:47:25', '2019-04-16 00:47:25', null, '8a599bd533c46b06345e99f78946ea94');
INSERT INTO `pods` VALUES ('90e04d52-65c4-11e9-afac-0a58ac14072d', '481411d6-65c4-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-hwtnk', null, 'product', 'invalid', '172.20.29.35', '172.19.149.102', 'Running', null, '2019-04-23 12:35:30', '2019-04-23 12:35:30', '2019-04-23 12:48:00', '2f919cf14f00e346c2a06c8d03a7bb27');
INSERT INTO `pods` VALUES ('910765a8-568f-11e9-82ed-0a58ac14072d', '46e06b36-568f-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-2nk59', null, 'product', 'invalid', '172.20.6.222', '172.19.148.225', 'Running', null, '2019-04-04 04:08:18', '2019-04-04 04:08:18', null, '6bc37a9395e13ca755188cfc0db1328f');
INSERT INTO `pods` VALUES ('92e248ac-5688-11e9-83cf-0a58ac14072d', '14f570d4-5688-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-lv9xb', null, 'product', 'invalid', '172.20.19.11', '172.19.149.93', 'Running', null, '2019-04-04 03:16:47', '2019-04-04 03:16:47', null, '7ce214e9972425c6f7cf876acd09bad3');
INSERT INTO `pods` VALUES ('93bc74cc-580a-11e9-9d60-0a58ac14072d', '8f6368b0-580a-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-7zmdq', null, 'product', 'invalid', '172.20.6.231', '172.19.148.225', 'Running', null, '2019-04-06 01:23:19', '2019-04-06 01:23:19', null, '4d500364d559054b09d8bb69d3598f95');
INSERT INTO `pods` VALUES ('9a401a08-60ea-11e9-b220-0a58ac14072d', '61b3ac47-60ea-11e9-bf66-00163e04a02f', 'archive-sc-product-deploy-68b76687f5-8rcbk', null, 'product', 'invalid', '172.20.16.253', '172.19.149.72', 'Running', null, '2019-04-17 08:25:38', '2019-04-17 08:25:38', null, 'e0f52e96abbe161a031b8361408c07a9');
INSERT INTO `pods` VALUES ('9a40cd42-60ea-11e9-a7c0-0a58ac14072d', '5fa34972-60ea-11e9-bf66-00163e04a02f', 'archive-sc-product-deploy-68b76687f5-nxzk7', null, 'product', 'invalid', '172.20.21.39', '172.19.148.193', 'Running', null, '2019-04-17 08:25:35', '2019-04-17 08:25:35', null, '3aae7dcafccbf8ab24cb216b945f7d40');
INSERT INTO `pods` VALUES ('9b76cc90-601b-11e9-bae4-0a58ac14072d', '990ee89e-601b-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-qpvz5', null, 'product', 'valid', '172.20.21.29', '172.19.148.193', 'Running', null, '2019-04-16 07:45:25', '2019-04-16 07:45:26', null, '953b45f72d91a28966c20c4f9eb52227');
INSERT INTO `pods` VALUES ('9b7a7b4a-601b-11e9-ae36-0a58ac14072d', '9900be7b-601b-11e9-bf66-00163e04a02f', 'fv-prod-product-deploy-775cbdcd78-8467z', null, 'product', 'valid', '172.20.21.28', '172.19.148.193', 'Running', null, '2019-04-16 07:45:25', '2019-04-16 07:45:25', null, 'f680abf378d3069f04f437609aa04622');
INSERT INTO `pods` VALUES ('9b7d9028-601b-11e9-8642-0a58ac14072d', '99209be2-601b-11e9-bf66-00163e04a02f', 'tb-fv-product-deploy-6f6444d789-2lwmb', null, 'product', 'valid', '172.20.21.30', '172.19.148.193', 'Running', null, '2019-04-16 07:45:26', '2019-04-16 07:45:26', null, 'f336b1a7a65d387162bd8bd2b4e38138');
INSERT INTO `pods` VALUES ('9b7e73e2-601b-11e9-b6ed-0a58ac14072d', '98ec36e3-601b-11e9-bf66-00163e04a02f', 'tb-fv-qc-product-deploy-78f8d68f44-qntqs', null, 'product', 'invalid', '172.20.21.25', '172.19.148.193', 'Running', null, '2019-04-16 07:45:25', '2019-04-16 07:45:25', null, '8b17bd9451eca62fa7b74734ec651a5c');
INSERT INTO `pods` VALUES ('9b918edc-601b-11e9-8a31-0a58ac14072d', '98e1a161-601b-11e9-bf66-00163e04a02f', 'demo1-test-deploy-8468b95f57-fqbbm', null, 'test', 'valid', '172.20.21.26', '172.19.148.193', 'Running', null, '2019-04-16 07:45:25', '2019-04-16 07:45:25', null, '2877832284d3aaf012ac40121367197c');
INSERT INTO `pods` VALUES ('9b9473be-601b-11e9-88ac-0a58ac14072d', '99268f05-601b-11e9-bf66-00163e04a02f', 'zipkin-test-deploy-bf7bf76d-6wl52', null, 'test', 'valid', '172.20.19.16', '172.19.149.93', 'Running', null, '2019-04-16 07:45:26', '2019-04-16 07:45:26', null, '173a0cc9107edae0015738cc92997df1');
INSERT INTO `pods` VALUES ('9d0d8b34-53be-11e9-a880-0a58ac14072d', '794ccb65-53be-11e9-bf66-00163e04a02f', 'ts-product-deploy-58ff4d884c-w6bxq', null, 'product', 'invalid', '172.20.6.210', '172.19.148.225', 'Running', null, '2019-03-31 14:08:35', '2019-03-31 14:08:35', null, '6a0089eb5722c7520d2c22cb7995a197');
INSERT INTO `pods` VALUES ('9e27cdb6-5072-11e9-99a1-0a58ac14072d', '6f288e77-5072-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-b4qpz', null, 'product', 'invalid', '172.20.6.206', '172.19.148.225', 'Running', null, '2019-03-27 09:26:43', '2019-03-27 09:26:43', null, '5b40664d93e8d3e4f7189bbbe8932b9e');
INSERT INTO `pods` VALUES ('9e292234-5072-11e9-8625-0a58ac14072d', '74dfcfcf-5072-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-hggn6', null, 'product', 'invalid', '172.20.15.22', '172.19.149.90', 'Running', null, '2019-03-27 09:26:52', '2019-03-27 09:26:52', null, '46e68fd07160e87cdf11be004a87ae9e');
INSERT INTO `pods` VALUES ('9f78bf2c-65f0-11e9-b132-0a58ac14072d', '6d476b6c-65f0-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-tc6w6', null, 'product', 'invalid', '172.20.29.44', '172.19.149.102', 'Running', null, '2019-04-23 17:51:31', '2019-04-23 17:51:31', '2019-04-23 17:58:01', '2c619c3e6ebfccb8b4db9aa7312e1880');
INSERT INTO `pods` VALUES ('a078acc0-523c-11e9-a837-0a58ac14072d', '398f7ec6-523c-11e9-bf66-00163e04a02f', 'ts-product-deploy-668dbb989-v9hc4', null, 'product', 'invalid', '172.20.16.238', '172.19.149.72', 'Running', null, '2019-03-29 16:03:42', '2019-03-29 16:03:42', null, '30b0322fae1bcbbd31aa6818e3c40eda');
INSERT INTO `pods` VALUES ('a2f95b0a-65e2-11e9-8856-0a58ac14072d', '98da6e51-65e2-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-7bm2h', null, 'product', 'invalid', '172.20.29.39', '172.19.149.102', 'Running', null, '2019-04-23 16:12:31', '2019-04-23 16:12:31', null, 'a96c32adc4d1618f95e7ba6cbd616f5b');
INSERT INTO `pods` VALUES ('a6e12a82-6181-11e9-97f4-0a58ac14072d', 'a5e9c0c0-6181-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-ghl6t', null, 'product', 'invalid', '172.20.19.23', '172.19.149.93', 'Running', null, '2019-04-18 02:28:27', '2019-04-18 02:28:27', null, '1166353029b95b105cbf4c478a8213da');
INSERT INTO `pods` VALUES ('a742f194-5cc3-11e9-864f-0a58ac14072d', '3d7fae6e-5cc3-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-kw77x', null, 'product', 'invalid', '172.20.7.67', '172.19.149.6', 'Running', null, '2019-04-12 01:35:23', '2019-04-12 01:35:23', null, 'e8150d7ecf9c2bede92529c254b4ed4f');
INSERT INTO `pods` VALUES ('a8425ff8-5a6b-11e9-9510-0a58ac14072d', 'a65c6e0d-5a6b-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-scrrp', null, 'product', 'invalid', '172.20.6.243', '172.19.148.225', 'Running', null, '2019-04-09 02:03:21', '2019-04-09 02:03:21', null, '8ef77d281745280cefb49b5bf77fa1f2');
INSERT INTO `pods` VALUES ('a84ab0c2-5698-11e9-abeb-0a58ac14072d', '4977c43e-5698-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-dzhhk', null, 'product', 'invalid', '172.20.6.225', '172.19.148.225', 'Running', null, '2019-04-04 05:12:47', '2019-04-04 05:12:47', null, 'f38e9a9089ecc0df657391357006be7b');
INSERT INTO `pods` VALUES ('a84b6526-5698-11e9-a86e-0a58ac14072d', '4979e7b6-5698-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-l8frq', null, 'product', 'invalid', '172.20.7.60', '172.19.149.6', 'Running', null, '2019-04-04 05:12:47', '2019-04-04 05:12:47', null, 'd769b30951a35961890dfc4c5bd57de9');
INSERT INTO `pods` VALUES ('a8af5ff6-617a-11e9-b07a-0a58ac14072d', 'f80eada7-6179-11e9-bf66-00163e04a02f', 'tb-fv-qc-product-deploy-78f8d68f44-sxkgb', null, 'product', 'invalid', '172.20.16.3', '172.19.149.72', 'Running', null, '2019-04-18 01:33:29', '2019-04-18 01:33:29', null, 'b9399908ec92e3c5083da8c47b2a1836');
INSERT INTO `pods` VALUES ('a90eca4c-59a3-11e9-86e6-0a58ac14072d', '52bdc447-59a3-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-vqjd7', null, 'product', 'invalid', '172.20.6.238', '172.19.148.225', 'Running', null, '2019-04-08 02:09:21', '2019-04-08 02:09:21', null, 'a89121b887ae5a2fab53bae8f03e057e');
INSERT INTO `pods` VALUES ('a9f5e8e8-65c6-11e9-9290-0a58ac14072d', '8493882c-65c6-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-lxz49', null, 'product', 'invalid', '172.20.29.36', '172.19.149.102', 'Running', null, '2019-04-23 12:51:31', '2019-04-23 12:51:31', null, '165113b7b696f6fda622370949dd4afc');
INSERT INTO `pods` VALUES ('aa14019a-5691-11e9-ba00-0a58ac14072d', '3b9762cc-5691-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-xx7js', null, 'product', 'invalid', '172.20.6.223', '172.19.148.225', 'Running', null, '2019-04-04 04:22:18', '2019-04-04 04:22:18', null, '44864d4574a2bf3da6f32e0b37c6eb8a');
INSERT INTO `pods` VALUES ('abe0cfa6-568a-11e9-90e0-0a58ac14072d', '633645f6-568a-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-9x6t4', null, 'product', 'invalid', '172.20.6.219', '172.19.148.225', 'Running', null, '2019-04-04 03:33:18', '2019-04-04 03:33:18', null, 'c650c077cb830e2acf85bfe6af4f960c');
INSERT INTO `pods` VALUES ('acd2ccfe-64f0-11e9-beab-0a58ac14072d', '380ff942-64f0-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-wwppf', null, 'product', 'invalid', '172.20.31.4', '172.19.149.104', 'Running', null, '2019-04-22 11:17:30', '2019-04-22 11:17:30', null, '057239a322946c75d49121872ec735d8');
INSERT INTO `pods` VALUES ('b060dec0-64e2-11e9-95b4-0a58ac14072d', '3f5525db-64e2-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-xrq6x', null, 'product', 'invalid', '172.20.16.43', '172.19.149.72', 'Running', null, '2019-04-22 09:37:29', '2019-04-22 09:37:29', null, '863cc6d8121250dc49e20f83fab40546');
INSERT INTO `pods` VALUES ('b2273250-64db-11e9-acb6-0a58ac14072d', '54ee4bdc-64db-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-cjl42', null, 'product', 'invalid', null, '172.19.149.102', 'Pending', null, '2019-04-22 08:47:59', '2019-04-22 08:50:34', null, '3d02d89dfa8537107a497debdcea7eef');
INSERT INTO `pods` VALUES ('b27f7586-542b-11e9-90f0-0a58ac14072d', '8c91b998-542b-11e9-bf66-00163e04a02f', 'ts-product-deploy-74c9946dbb-f26ht', null, 'product', 'invalid', '172.20.9.185', '172.19.149.9', 'Running', null, '2019-04-01 03:09:23', '2019-04-01 03:09:23', null, '1da70860fda99de4b6458a2ec9234cb0');
INSERT INTO `pods` VALUES ('b463d97e-5424-11e9-aa84-0a58ac14072d', '925df379-5424-11e9-bf66-00163e04a02f', 'ts-product-deploy-7b47d8796-5bmds', null, 'product', 'invalid', '172.20.16.245', '172.19.149.72', 'Running', null, '2019-04-01 02:19:26', '2019-04-01 02:19:26', '2019-04-01 03:05:47', '84e1c790a9862ccb90830cd871a79910');
INSERT INTO `pods` VALUES ('b4648cdc-5424-11e9-8556-0a58ac14072d', 'a46e4dc4-5424-11e9-bf66-00163e04a02f', 'ts-product-deploy-7b47d8796-vlmhr', null, 'product', 'invalid', '172.20.6.212', '172.19.148.225', 'Running', null, '2019-04-01 02:19:56', '2019-04-01 02:19:56', '2019-04-01 02:25:26', 'c8804fb83b1202d5a0539ba3c8f5c382');
INSERT INTO `pods` VALUES ('b78fdec2-64c6-11e9-a8d5-0a58ac14072d', '3cb350fe-64c6-11e9-bf66-00163e04a02f', 'marker-test-deploy-76fbbf79c4-bdxp6', null, 'test', 'invalid', '172.20.5.168', '172.19.148.227', 'Running', null, '2019-04-22 06:16:59', '2019-04-22 06:16:59', null, 'd467d12af3d94c76e0edbd679c28c10b');
INSERT INTO `pods` VALUES ('b79093a2-64c6-11e9-aaec-0a58ac14072d', '2e60ef58-64c6-11e9-bf66-00163e04a02f', 'marker-test-deploy-76fbbf79c4-vprgm', null, 'test', 'invalid', '172.20.16.36', '172.19.149.72', 'Running', null, '2019-04-22 06:16:35', '2019-04-22 06:16:35', null, '82c840695e8737902d4794c046fe23f5');
INSERT INTO `pods` VALUES ('be1c6d08-5f2b-11e9-8bae-0a58ac14072d', '506c83d6-5f2b-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-qhh9s', null, 'product', 'invalid', '172.20.21.8', '172.19.148.193', 'Running', null, '2019-04-15 03:05:24', '2019-04-15 03:05:24', null, 'f03a95cc993d26da945abd359534dd60');
INSERT INTO `pods` VALUES ('c045df64-59ac-11e9-b25e-0a58ac14072d', 'c0110f7f-59ac-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-jt995', null, 'product', 'invalid', '172.20.6.240', '172.19.148.225', 'Running', null, '2019-04-08 03:16:50', '2019-04-08 03:16:50', null, '57f0818cc5da30d26b71b5a2cef31815');
INSERT INTO `pods` VALUES ('c148e21a-5a6d-11e9-97ab-0a58ac14072d', '892c2275-5a6d-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-ws2f4', null, 'product', 'invalid', '172.20.6.244', '172.19.148.225', 'Running', null, '2019-04-09 02:16:51', '2019-04-09 02:16:51', null, '912f8186f34240b7f1c9b64b1ad74cfd');
INSERT INTO `pods` VALUES ('c2169f00-59a5-11e9-8cb4-0a58ac14072d', 'b26e2c86-59a5-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-c79k8', null, 'product', 'invalid', '172.20.7.63', '172.19.149.6', 'Running', null, '2019-04-08 02:26:20', '2019-04-08 02:26:20', null, '5504d2627916463b5b44b7f6549fd279');
INSERT INTO `pods` VALUES ('c2174dd4-59a5-11e9-a741-0a58ac14072d', '23450ed8-59a5-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-dkvvv', null, 'product', 'invalid', '172.20.19.14', '172.19.149.93', 'Running', null, '2019-04-08 02:22:20', '2019-04-08 02:22:20', null, 'a13db1e7fd93f9221583078e926a344a');
INSERT INTO `pods` VALUES ('c2182ec6-59a5-11e9-bdea-0a58ac14072d', '2343e067-59a5-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-h7ljj', null, 'product', 'invalid', '172.20.6.239', '172.19.148.225', 'Running', null, '2019-04-08 02:22:20', '2019-04-08 02:22:20', null, '4de6519f40e4a8834c3626d4df39592c');
INSERT INTO `pods` VALUES ('c4eeef3a-568c-11e9-a810-0a58ac14072d', '57eed993-568c-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-7dl9f', null, 'product', 'invalid', '172.20.6.220', '172.19.148.225', 'Running', null, '2019-04-04 03:47:18', '2019-04-04 03:47:18', null, 'b728ca6f571066d734b4171f1af51b5b');
INSERT INTO `pods` VALUES ('c7adfbc8-5807-11e9-a6bb-0a58ac14072d', '7cd7c37b-5807-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-ddzpj', null, 'product', 'invalid', '172.20.19.13', '172.19.149.93', 'Running', null, '2019-04-06 01:01:19', '2019-04-06 01:01:19', '2019-04-06 01:13:49', '6de1db6ce5828a0b1e1fde9dc77b786f');
INSERT INTO `pods` VALUES ('c7af8922-5807-11e9-b486-0a58ac14072d', '7cd5b300-5807-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-wxgph', null, 'product', 'invalid', '172.20.6.230', '172.19.148.225', 'Running', null, '2019-04-06 01:01:19', '2019-04-06 01:01:19', null, 'e806858a77af13c088812f4854ae5d64');
INSERT INTO `pods` VALUES ('c7b69558-55b6-11e9-acff-0a58ac14072d', '835bd228-55b6-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-2bf5b', null, 'product', 'valid', '172.20.16.248', '172.19.149.72', 'Running', null, '2019-04-03 02:16:38', '2019-04-03 02:16:38', null, '6feb203a830f88cc08b1de7f4175aee6');
INSERT INTO `pods` VALUES ('c7c3353a-5677-11e9-9750-0a58ac14072d', '87263d30-5677-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-2zmvt', null, 'product', 'invalid', '172.20.6.216', '172.19.148.225', 'Running', null, '2019-04-04 01:18:18', '2019-04-04 01:18:18', null, '217bc4dd615a836ca43b0e6a95f22676');
INSERT INTO `pods` VALUES ('c7d5c282-55b6-11e9-9159-0a58ac14072d', '884ca25f-55b6-11e9-bf66-00163e04a02f', 'marker-test-deploy-56ff8544b7-6d8hv', null, 'test', 'invalid', '172.20.19.9', '172.19.149.93', 'Running', null, '2019-04-03 02:16:47', '2019-04-03 02:16:47', null, '86cf24669730fed537c09526901a5d6c');
INSERT INTO `pods` VALUES ('c7d77962-55b6-11e9-8fc2-0a58ac14072d', '835b8cf5-55b6-11e9-bf66-00163e04a02f', 'marker-test-deploy-56ff8544b7-7lhhv', null, 'test', 'invalid', '172.20.7.58', '172.19.149.6', 'Running', null, '2019-04-03 02:16:38', '2019-04-03 02:16:38', null, 'aad635c5e366315014764bc049a432d6');
INSERT INTO `pods` VALUES ('ca7631dc-502e-11e9-98a6-0a58ac14072d', '9be393ba-502e-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-2n457', null, 'product', 'invalid', '172.20.6.204', '172.19.148.225', 'Running', null, '2019-03-27 01:21:12', '2019-03-27 01:21:12', null, '0efa501e794f2ddddcabc4acbdf613ba');
INSERT INTO `pods` VALUES ('ca76dd38-502e-11e9-9504-0a58ac14072d', '9be61193-502e-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-4t687', null, 'product', 'invalid', '172.20.15.21', '172.19.149.90', 'Running', null, '2019-03-27 01:21:12', '2019-03-27 01:21:12', null, '517422e55e4bbbdc1d80e2633ddea55f');
INSERT INTO `pods` VALUES ('cb637494-64dd-11e9-b43a-0a58ac14072d', '25ded877-64dd-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-nxnl5', null, 'product', 'invalid', '172.20.29.7', '172.19.149.102', 'Running', null, '2019-04-22 09:00:59', '2019-04-22 09:01:00', null, '11e1f493d5517fc5e56524e73a8e4bb4');
INSERT INTO `pods` VALUES ('cb64649a-64dd-11e9-9877-0a58ac14072d', '25dd6638-64dd-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-v4dsn', null, 'product', 'invalid', '172.20.29.6', '172.19.149.102', 'Running', null, '2019-04-22 09:00:59', '2019-04-22 09:01:00', null, '87970f6ba8bb17617c8bd9985e945740');
INSERT INTO `pods` VALUES ('d0a7df92-64c8-11e9-810d-0a58ac14072d', 'b1ff802d-64c8-11e9-bf66-00163e04a02f', 'marker-test-deploy-8646dccbd-m7kcg', null, 'test', 'invalid', '172.20.16.38', '172.19.149.72', 'Pending', null, '2019-04-22 06:34:35', '2019-04-22 06:34:35', null, 'c2cb02aec34d4bc4ce31082fcdec1c9c');
INSERT INTO `pods` VALUES ('d0fdb978-4f02-11e9-bd6e-0a58ac14072d', '45ca183c-4f02-11e9-bf66-00163e04a02f', 'marker-test-deploy-9b94b6cb-wbqcz', null, 'test', 'invalid', '172.20.15.8', '172.19.149.90', 'Running', null, '2019-03-25 13:31:19', '2019-03-25 13:31:19', null, '63a8fa51dcf82633d079dcf6532ac7fb');
INSERT INTO `pods` VALUES ('d104ed94-53bb-11e9-ad27-0a58ac14072d', 'a8eb0019-53bb-11e9-bf66-00163e04a02f', 'ts-product-deploy-675f496c4d-9dz9b', null, 'product', 'invalid', '172.20.16.240', '172.19.149.72', 'Running', null, '2019-03-31 13:48:26', '2019-03-31 13:48:26', null, 'c8a8ec696867da391ca14945f892b515');
INSERT INTO `pods` VALUES ('d19b0208-65f4-11e9-b045-0a58ac14072d', '8bfd98b1-65f4-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-ldwnh', null, 'product', 'invalid', '172.20.29.46', '172.19.149.102', 'Running', null, '2019-04-23 18:21:00', '2019-04-23 18:21:00', null, 'a6d67be3229101456e2bbe1bcb415002');
INSERT INTO `pods` VALUES ('d71076d2-6254-11e9-8b51-0a58ac14072d', '3e6c714c-6254-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-5xpqg', null, 'product', 'invalid', '172.20.5.157', '172.19.148.227', 'Running', null, '2019-04-19 03:35:57', '2019-04-19 03:35:57', null, '50cdc2c60af23a9738a254bb943635cb');
INSERT INTO `pods` VALUES ('d711b180-6254-11e9-a3f1-0a58ac14072d', '3e6447ce-6254-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-kmjl7', null, 'product', 'invalid', '172.20.16.17', '172.19.149.72', 'Running', null, '2019-04-19 03:35:57', '2019-04-19 03:35:57', null, '26d902a4e4a2e9f6cb63ff49ef3a2ac6');
INSERT INTO `pods` VALUES ('d8ddca36-624d-11e9-ac2d-0a58ac14072d', 'bc12e5ef-624d-11e9-bf66-00163e04a02f', 'tb-fv-qc-product-deploy-78f8d68f44-9cbzf', null, 'product', 'invalid', '172.20.9.187', '172.19.149.9', 'Running', null, '2019-04-19 02:49:21', '2019-04-19 02:49:21', null, '8703b425bd1e093aab9cac6a90ea61bf');
INSERT INTO `pods` VALUES ('d8de790a-624d-11e9-a86e-0a58ac14072d', 'bc13c163-624d-11e9-bf66-00163e04a02f', 'tb-fv-qc-product-deploy-78f8d68f44-z6zt5', null, 'product', 'invalid', '172.20.16.16', '172.19.149.72', 'Running', null, '2019-04-19 02:49:21', '2019-04-19 02:49:21', null, '23480d3a326d902f7674f334af1a0412');
INSERT INTO `pods` VALUES ('d92c1d94-4ec0-11e9-95e4-0a58ac14040b', 'b6c2f508-d76e-11e8-93e7-00163e1a01ff', 'adminui-product-deploy-6bb9946f9-mbgxd', null, 'product', 'valid', '172.20.8.125', '172.19.149.8', 'Running', null, '2018-10-24 09:25:14', '2018-10-24 09:25:14', null, '1c9a59254857ce444d2f3f5d00d0b243');
INSERT INTO `pods` VALUES ('d92d890a-4ec0-11e9-b8e5-0a58ac14040b', 'b20a1773-0f09-11e9-93e7-00163e1a01ff', 'ai-product-deploy-587c8c5558-5c8tq', null, 'product', 'invalid', '172.20.16.12', '172.19.149.72', 'Running', null, '2019-01-03 03:43:12', '2019-01-03 03:43:12', null, 'b9496247348aeb7afcd117780d68fd1b');
INSERT INTO `pods` VALUES ('d92e4848-4ec0-11e9-a6ae-0a58ac14040b', 'b1ea023c-0f09-11e9-93e7-00163e1a01ff', 'ai-product-deploy-587c8c5558-m748l', null, 'product', 'invalid', '172.20.16.13', '172.19.149.72', 'Running', null, '2019-01-03 03:43:12', '2019-01-03 03:43:12', null, 'cf92cfb545534a17909076eb551630d3');
INSERT INTO `pods` VALUES ('d92eedf0-4ec0-11e9-8f94-0a58ac14040b', '5c6bf616-cad7-11e8-93e7-00163e1a01ff', 'aiproxy-product-deploy-b745d65dc-c5mq6', null, 'product', 'valid', '172.20.5.91', '172.19.148.227', 'Running', null, '2018-10-08 08:51:35', '2018-10-08 08:51:35', null, '499bffd498e6537109869ecfbe4783e4');
INSERT INTO `pods` VALUES ('d92f9402-4ec0-11e9-83ca-0a58ac14040b', '5c6ab0a8-cad7-11e8-93e7-00163e1a01ff', 'aiproxy-product-deploy-b745d65dc-vdzk8', null, 'product', 'valid', '172.20.8.90', '172.19.149.8', 'Running', null, '2018-10-08 08:51:35', '2018-10-08 08:51:35', null, 'e55d300b8d75a3df06431dda6ab139c9');
INSERT INTO `pods` VALUES ('d9303cf4-4ec0-11e9-b0fb-0a58ac14040b', '5ab093e5-cc60-11e8-93e7-00163e1a01ff', 'archive-product-deploy-74fd5bdb9d-6cp25', null, 'product', 'valid', '172.20.5.106', '172.19.148.227', 'Running', null, '2018-10-10 07:44:44', '2018-10-10 07:44:44', null, 'd9e002d0f3d89528b53d694a3795e8ad');
INSERT INTO `pods` VALUES ('d930e074-4ec0-11e9-85d9-0a58ac14040b', '5ab213d9-cc60-11e8-93e7-00163e1a01ff', 'archive-product-deploy-74fd5bdb9d-dhbt8', null, 'product', 'valid', '172.20.8.117', '172.19.149.8', 'Running', null, '2018-10-10 07:44:44', '2018-10-10 07:44:44', null, '48663c1d3725d6b8180b21d7af65d1f4');
INSERT INTO `pods` VALUES ('d9318866-4ec0-11e9-9ecb-0a58ac14040b', 'dfd41659-02a8-11e9-93e7-00163e1a01ff', 'client-install-product-deploy-96fd88c46-jmmx6', null, 'product', 'valid', '172.20.9.142', '172.19.149.9', 'Running', null, '2018-12-18 09:39:54', '2018-12-18 09:39:54', null, '499e8620ba6dca4cfb39945f40e11805');
INSERT INTO `pods` VALUES ('d933029c-4ec0-11e9-944b-0a58ac14040b', '97a01ea1-f6bb-11e8-93e7-00163e1a01ff', 'crm-fv-product-deploy-8cc5f856f-vlzmp', null, 'product', 'valid', '172.20.8.143', '172.19.149.8', 'Running', null, '2018-12-03 05:23:39', '2018-12-03 05:23:39', null, '14b18f239bbf4c29af2bdd7bd604fc30');
INSERT INTO `pods` VALUES ('d93408a2-4ec0-11e9-9480-0a58ac14040b', '31fe5aa7-9f88-11e8-bb86-00163e1a0203', 'dcm-prod-product-deploy-69c58655d-8jm7x', null, 'product', 'valid', '172.20.9.70', '172.19.149.9', 'Running', null, '2018-08-14 06:06:33', '2018-08-14 06:06:33', null, 'cdfd3cf30ddb14de90ead9cc8b3089b2');
INSERT INTO `pods` VALUES ('d93559f0-4ec0-11e9-9a3e-0a58ac14040b', '31f7c575-9f88-11e8-bb86-00163e1a0203', 'dcm-prod-product-deploy-69c58655d-btb2p', null, 'product', 'valid', '172.20.8.52', '172.19.149.8', 'Running', null, '2018-08-14 06:06:33', '2018-08-14 06:06:33', null, '74a2f2602db2fa0cb94e5fddbb092a2a');
INSERT INTO `pods` VALUES ('d936be06-4ec0-11e9-aaf2-0a58ac14040b', '944289e6-35b8-11e9-93e7-00163e1a01ff', 'fms-prod-product-deploy-846777fb5c-mfr4x', null, 'product', 'valid', '172.20.16.80', '172.19.149.72', 'Running', null, '2019-02-21 09:10:48', '2019-02-21 09:10:48', null, 'e46c8fef85938980247e2742a2f41c68');
INSERT INTO `pods` VALUES ('d937ce12-4ec0-11e9-9264-0a58ac14040b', '9437d8fd-35b8-11e9-93e7-00163e1a01ff', 'fms-prod-product-deploy-846777fb5c-p75st', null, 'product', 'valid', '172.20.9.173', '172.19.149.9', 'Running', null, '2019-02-21 09:10:48', '2019-02-21 09:10:48', null, '9a235b870ab926c4772b3bfa153b86a1');
INSERT INTO `pods` VALUES ('d93877ec-4ec0-11e9-aba3-0a58ac14040b', '2816378d-4a42-11e9-bf66-00163e04a02f', 'fv-prod-product-deploy-775cbdcd78-gftsh', null, 'product', 'invalid', '172.20.6.175', '172.19.148.225', 'Running', null, '2019-03-19 12:26:01', '2019-03-19 12:26:01', null, '6b0ea4f19f9ce1dcaaef225b376bbe64');
INSERT INTO `pods` VALUES ('d93918c6-4ec0-11e9-bc0b-0a58ac14040b', '281228ca-4a42-11e9-bf66-00163e04a02f', 'fv-prod-product-deploy-775cbdcd78-rsgxw', null, 'product', 'valid', '172.20.7.15', '172.19.149.6', 'Running', null, '2019-03-19 12:26:01', '2019-03-19 12:26:01', null, '6f30a484f3daeaa638a75d926749081a');
INSERT INTO `pods` VALUES ('d939c70a-4ec0-11e9-b615-0a58ac14040b', '99404e77-d2a3-11e8-93e7-00163e1a01ff', 'quality-product-deploy-65cc594d68-ndlrp', null, 'product', 'valid', '172.20.5.111', '172.19.148.227', 'Running', null, '2018-10-18 07:01:12', '2018-10-18 07:01:12', null, '7af2eec6a6b576a3d25092c8ac18fe47');
INSERT INTO `pods` VALUES ('d93a68ca-4ec0-11e9-8772-0a58ac14040b', '99421eaa-d2a3-11e8-93e7-00163e1a01ff', 'quality-product-deploy-65cc594d68-rf9dk', null, 'product', 'valid', '172.20.7.149', '172.19.149.6', 'Running', null, '2018-10-18 07:01:12', '2018-10-18 07:01:12', null, '6178eb328979d722c219bc54a3963216');
INSERT INTO `pods` VALUES ('d93b147a-4ec0-11e9-82eb-0a58ac14040b', 'c1acc47f-033a-11e9-93e7-00163e1a01ff', 'rmis-crm-product-deploy-7c5ccf99c7-nr8sc', null, 'product', 'valid', '172.20.5.133', '172.19.148.227', 'Running', null, '2018-12-19 03:04:10', '2018-12-19 03:04:10', null, '74c8601591cb2ca776ae3f81492593f7');
INSERT INTO `pods` VALUES ('d93bc058-4ec0-11e9-89c4-0a58ac14040b', 'a9386c07-4a3d-11e9-bf66-00163e04a02f', 'rmis-prod-product-deploy-594d89fb75-56rpv', null, 'product', 'valid', '172.20.16.164', '172.19.149.72', 'Running', null, '2019-03-19 11:53:50', '2019-03-19 11:53:50', null, '47d34d4464ae40cd3b4d8746a338730f');
INSERT INTO `pods` VALUES ('d93cd302-4ec0-11e9-9193-0a58ac14040b', 'a93d4428-4a3d-11e9-bf66-00163e04a02f', 'rmis-prod-product-deploy-594d89fb75-l5rhr', null, 'product', 'valid', '172.20.8.206', '172.19.149.8', 'Running', null, '2019-03-19 11:53:50', '2019-03-19 11:53:50', null, '2150e9bcd916c31c7e419bc41793d136');
INSERT INTO `pods` VALUES ('d93d7900-4ec0-11e9-8a93-0a58ac14040b', '15d43426-38de-11e9-93e7-00163e1a01ff', 'rmis-qc-product-deploy-6df585fb79-pvjmq', null, 'product', 'valid', '172.20.16.127', '172.19.149.72', 'Running', null, '2019-02-25 09:16:51', '2019-02-25 09:16:51', null, '728b63513f83bfdcef614fb52bc59984');
INSERT INTO `pods` VALUES ('d93e2068-4ec0-11e9-857b-0a58ac14040b', '8eeab1ec-d5db-11e8-93e7-00163e1a01ff', 'rmisexe-product-deploy-5cfc445d6b-qf8wj', null, 'product', 'valid', '172.20.9.117', '172.19.149.9', 'Running', null, '2018-10-22 09:19:20', '2018-10-22 09:19:20', null, '6e3a521a3e61ab8c74245ec39a1c8a47');
INSERT INTO `pods` VALUES ('d93ed2fe-4ec0-11e9-bd0a-0a58ac14040b', '5b01255e-35c6-11e9-93e7-00163e1a01ff', 'tb-fv-product-deploy-6f6444d789-hkvxn', null, 'product', 'valid', '172.20.7.187', '172.19.149.6', 'Running', null, '2019-02-21 10:49:25', '2019-02-21 10:49:25', null, 'e079a601f6425c0961fefdb5aeac76c9');
INSERT INTO `pods` VALUES ('d93f7fbe-4ec0-11e9-bbf7-0a58ac14040b', '5b061e92-35c6-11e9-93e7-00163e1a01ff', 'tb-fv-product-deploy-6f6444d789-txtnx', null, 'product', 'invalid', '172.20.6.127', '172.19.148.225', 'Running', null, '2019-02-21 10:49:25', '2019-02-21 10:49:25', null, '5a32aada485524d05d4ca1e3444c1893');
INSERT INTO `pods` VALUES ('d940233a-4ec0-11e9-b9da-0a58ac14040b', 'ebab3491-3648-11e9-93e7-00163e1a01ff', 'tb-fv-qc-product-deploy-78f8d68f44-55n5f', null, 'product', 'invalid', '172.20.6.133', '172.19.148.225', 'Running', null, '2019-02-22 02:24:03', '2019-02-22 02:24:03', null, '4c34f81dd9172868a61cc44450b31c0f');
INSERT INTO `pods` VALUES ('d940c4de-4ec0-11e9-a02d-0a58ac14040b', 'ebb648e3-3648-11e9-93e7-00163e1a01ff', 'tb-fv-qc-product-deploy-78f8d68f44-t42qm', null, 'product', 'invalid', '172.20.9.182', '172.19.149.9', 'Running', null, '2019-02-22 02:24:03', '2019-02-22 02:24:03', null, '818523b31dc77d34df578e4751b5bf2c');
INSERT INTO `pods` VALUES ('d9416e94-4ec0-11e9-a950-0a58ac14040b', '056a70aa-d2a9-11e8-93e7-00163e1a01ff', 'tbscreen-product-deploy-85d9bc95f7-klsql', null, 'product', 'valid', '172.20.9.116', '172.19.149.9', 'Running', null, '2018-10-18 07:40:01', '2018-10-18 07:40:01', null, 'a8e214f4d8da70490709f34a52a13b73');
INSERT INTO `pods` VALUES ('d9421066-4ec0-11e9-b95e-0a58ac14040b', '05685ad5-d2a9-11e8-93e7-00163e1a01ff', 'tbscreen-product-deploy-85d9bc95f7-txjhc', null, 'product', 'valid', '172.20.5.112', '172.19.148.227', 'Running', null, '2018-10-18 07:40:01', '2018-10-18 07:40:01', null, '97050cb85945453dd58b3b5c989cdc8c');
INSERT INTO `pods` VALUES ('d942d950-4ec0-11e9-80df-0a58ac14040b', '3e95126c-f959-11e8-93e7-00163e1a01ff', 'ts-product-deploy-786f5bbbdd-j88d9', null, 'product', 'invalid', '172.20.7.174', '172.19.149.6', 'Running', null, '2018-12-06 13:17:13', '2018-12-06 13:17:13', null, '8e001b16f61fb6e3aada1c31e280fca1');
INSERT INTO `pods` VALUES ('d943a56e-4ec0-11e9-a9b8-0a58ac14040b', 'c85012b3-b770-11e8-93e7-00163e1a01ff', 'wv-prod-product-deploy-6595d5784c-5dcvw', null, 'product', 'valid', '172.20.5.75', '172.19.148.227', 'Running', null, '2018-09-13 16:19:25', '2018-09-13 16:19:25', null, '695f1569abecca4f4aef6a75447b8293');
INSERT INTO `pods` VALUES ('d944a03e-4ec0-11e9-ae38-0a58ac14040b', 'c855bbd1-b770-11e8-93e7-00163e1a01ff', 'wv-prod-product-deploy-6595d5784c-64lhz', null, 'product', 'valid', '172.20.7.116', '172.19.149.6', 'Running', null, '2018-09-13 16:19:26', '2018-09-13 16:19:26', null, '0dcd1d5e00bc0748124a4f4e2556b056');
INSERT INTO `pods` VALUES ('d9454526-4ec0-11e9-955f-0a58ac14040b', '21c3b94e-d774-11e8-93e7-00163e1a01ff', 'zipkin-product-deploy-79f97fcf96-l7vcs', null, 'product', 'valid', '172.20.5.114', '172.19.148.227', 'Running', null, '2018-10-24 10:04:01', '2018-10-24 10:04:01', null, '26453117a6a945400e01e10d9f7f4820');
INSERT INTO `pods` VALUES ('d945efb6-4ec0-11e9-af95-0a58ac14040b', '1ea29ab9-cc5f-11e8-93e7-00163e1a01ff', 'zuulroute-product-deploy-6b7f48b48c-grcvn', null, 'product', 'valid', '172.20.5.105', '172.19.148.227', 'Running', null, '2018-10-10 07:35:54', '2018-10-10 07:35:54', null, '94b75f30d74c2439c546cd24eb31c786');
INSERT INTO `pods` VALUES ('d9469a70-4ec0-11e9-9ac4-0a58ac14040b', '1ea0fc69-cc5f-11e8-93e7-00163e1a01ff', 'zuulroute-product-deploy-6b7f48b48c-nrps4', null, 'product', 'valid', '172.20.8.116', '172.19.149.8', 'Running', null, '2018-10-10 07:35:54', '2018-10-10 07:35:54', null, 'e85560c43ca8aeecce410c37ae7ef350');
INSERT INTO `pods` VALUES ('d950ed7a-55d4-11e9-8b1f-0a58ac14072d', '49db53ce-55d4-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-kb8jl', null, 'product', 'invalid', '172.20.6.215', '172.19.148.225', 'Running', null, '2019-04-03 05:49:47', '2019-04-03 05:49:47', null, 'd8d5a5b20df12adbea7493cc7267af48');
INSERT INTO `pods` VALUES ('d9570db4-4ec0-11e9-966f-0a58ac14040b', 'da02af1a-3f10-11e9-93e7-00163e1a01ff', 'ack-springcloud-zuul-test-ack-springcloud-zuul-598ffcb6b8-bkqdl', null, 'test', 'invalid', '172.20.6.160', '172.19.148.225', 'Running', null, '2019-03-05 06:35:22', '2019-03-05 06:35:22', null, '53b3f8be832e1d28b2a9c6597d0b7948');
INSERT INTO `pods` VALUES ('d957bbba-4ec0-11e9-91bc-0a58ac14040b', 'da0405db-3f10-11e9-93e7-00163e1a01ff', 'ack-springcloud-zuul-test-ack-springcloud-zuul-598ffcb6b8-mcvcp', null, 'test', 'invalid', '172.20.7.241', '172.19.149.6', 'Running', null, '2019-03-05 06:35:22', '2019-03-05 06:35:22', null, 'b45365e38dd857df76ebca3ef7a63162');
INSERT INTO `pods` VALUES ('d95860c6-4ec0-11e9-a031-0a58ac14040b', '16f1b393-9622-11e8-bb86-00163e1a0203', 'adminui-test-deploy-7bf588b5f6-ntvvp', null, 'test', 'valid', '172.20.7.94', '172.19.149.6', 'Running', null, '2018-08-02 07:02:59', '2018-08-02 07:02:59', null, 'c93f07ab3d2780c8c6f7a212fd4e4de7');
INSERT INTO `pods` VALUES ('d9590a48-4ec0-11e9-af21-0a58ac14040b', '40a83fea-bc86-11e8-93e7-00163e1a01ff', 'archive-test-deploy-bbccd448c-bccmt', null, 'test', 'invalid', '172.20.6.95', '172.19.148.225', 'Running', null, '2018-09-20 03:35:43', '2018-09-20 03:35:43', null, 'ee8723a4f0efbc4481d81611b32d3620');
INSERT INTO `pods` VALUES ('d959ac92-4ec0-11e9-8c3f-0a58ac14040b', '2f2bbdf3-bd4e-11e8-93e7-00163e1a01ff', 'dcm-prod-test-deploy-6c5865dfcb-86grd', null, 'test', 'valid', '172.20.7.122', '172.19.149.6', 'Running', null, '2018-09-21 03:26:53', '2018-09-21 03:26:53', null, 'd358460cf8c08cf62551664a8aa2ab93');
INSERT INTO `pods` VALUES ('d95a59ee-4ec0-11e9-b63f-0a58ac14040b', '7d83dd1a-9b98-11e8-bb86-00163e1a0203', 'demo1-test-deploy-8468b95f57-65lf4', null, 'test', 'invalid', '172.20.6.81', '172.19.148.225', 'Running', null, '2018-08-09 05:53:07', '2018-08-09 05:53:07', null, '98a4324a950c1cfba9629163deed6426');
INSERT INTO `pods` VALUES ('d95aa1ee-5bff-11e9-b75d-0a58ac14072d', '7377d022-5bff-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-6w8kv', null, 'product', 'invalid', '172.20.6.245', '172.19.148.225', 'Running', null, '2019-04-11 02:13:52', '2019-04-11 02:13:52', null, 'c72f759c090bf54ad46bd3e369a1ff97');
INSERT INTO `pods` VALUES ('d95afbfa-4ec0-11e9-81bf-0a58ac14040b', 'a9dcd623-4179-11e9-bf66-00163e04a02f', 'fms-tb-test-deploy-5b9db87df5-zsk9n', null, 'test', 'valid', '172.20.16.143', '172.19.149.72', 'Running', null, '2019-03-08 08:10:40', '2019-03-08 08:10:40', null, '0e27b02d309d5c5245250b758294ade9');
INSERT INTO `pods` VALUES ('d95c1e88-4ec0-11e9-badf-0a58ac14040b', 'd35e29b4-074c-11e9-93e7-00163e1a01ff', 'fms-test-test-deploy-6d78f98449-jl5wr', null, 'test', 'invalid', '172.20.5.134', '172.19.148.227', 'Running', null, '2018-12-24 07:23:35', '2018-12-24 07:23:35', null, '8c47fdf66e75979796bbf9b3e06724f1');
INSERT INTO `pods` VALUES ('d95cc788-4ec0-11e9-89b0-0a58ac14040b', 'd1f3c37f-4b76-11e9-bf66-00163e04a02f', 'marker-test-deploy-5769c65fc9-7q4tc', null, 'test', 'invalid', '172.20.7.17', '172.19.149.6', 'Running', null, '2019-03-21 01:15:31', '2019-03-21 01:15:31', null, '5d4ba6732d61b6feefab52d2b2a174cb');
INSERT INTO `pods` VALUES ('d95d6c2e-4ec0-11e9-9a7d-0a58ac14040b', '7ec4ecac-96d1-11e8-bb86-00163e1a0203', 'nginx-test-deploy-f646c9c45-brg85', null, 'test', 'valid', '172.20.8.46', '172.19.149.8', 'Running', null, '2018-08-03 03:58:35', '2018-08-03 03:58:35', null, 'd3c5008685c905cba99605531ceebbff');
INSERT INTO `pods` VALUES ('d95e1a28-4ec0-11e9-9b4b-0a58ac14040b', 'cdd8ef1e-453e-11e9-bf66-00163e04a02f', 'rmis-qc-test-deploy-7b79b946db-jtpm4', null, 'test', 'valid', '172.20.16.151', '172.19.149.72', 'Running', null, '2019-03-13 03:19:25', '2019-03-13 03:19:25', null, 'd477790bc73d80ca76182d0fa7a667b3');
INSERT INTO `pods` VALUES ('d95ebd2c-4ec0-11e9-a10d-0a58ac14040b', '9b45d682-3fa6-11e9-93e7-00163e1a01ff', 'tb-fv-qc-test-deploy-5fcc6d69b6-8n8sd', null, 'test', 'valid', '172.20.7.245', '172.19.149.6', 'Running', null, '2019-03-06 00:27:21', '2019-03-06 00:27:21', null, 'deaf2f7c273c29b76851ab4f21a795aa');
INSERT INTO `pods` VALUES ('d95f6006-4ec0-11e9-a56c-0a58ac14040b', 'e3727589-4179-11e9-bf66-00163e04a02f', 'tb-fv-test-deploy-5886f979f-cgmw7', null, 'test', 'valid', '172.20.8.200', '172.19.149.8', 'Running', null, '2019-03-08 08:12:17', '2019-03-08 08:12:17', null, 'b8fcf5e9265795fa97a62be31db7e668');
INSERT INTO `pods` VALUES ('d96006e6-4ec0-11e9-a0a4-0a58ac14040b', 'c2b3740e-4141-11e9-bf66-00163e04a02f', 'wv-test-deploy-75566457b9-x89zb', null, 'test', 'valid', '172.20.8.193', '172.19.149.8', 'Running', null, '2019-03-08 01:30:30', '2019-03-08 01:30:30', null, '01af1e39e33ccce9c38f0a9f6e0e5f2f');
INSERT INTO `pods` VALUES ('d960a1da-4ec0-11e9-bb15-0a58ac14040b', '5919c474-9a22-11e8-bb86-00163e1a0203', 'zipkin-test-deploy-bf7bf76d-f8h8r', null, 'test', 'invalid', '172.20.6.80', '172.19.148.225', 'Running', null, '2018-08-07 09:14:54', '2018-08-07 09:14:54', null, '7b482f5a1fc202b977fe5c765107926b');
INSERT INTO `pods` VALUES ('d9614b78-4ec0-11e9-bad0-0a58ac14040b', '0bbf001c-bcbb-11e8-93e7-00163e1a01ff', 'zuulroute-test-deploy-5946678d4c-sxbcz', null, 'test', 'valid', '172.20.9.101', '172.19.149.9', 'Running', null, '2018-09-20 09:53:37', '2018-09-20 09:53:37', null, '79d3ec9ead773c39da8a138967943598');
INSERT INTO `pods` VALUES ('daa89080-6246-11e9-8ff1-0a58ac14072d', '57fceb8c-6246-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-9qbw4', null, 'product', 'invalid', '172.20.16.13', '172.19.149.72', 'Running', null, '2019-04-19 01:56:27', '2019-04-19 01:56:27', null, 'f32c6d0ac13d44ec46231d66a39ad8de');
INSERT INTO `pods` VALUES ('daa9933a-6246-11e9-9c5f-0a58ac14072d', '57ffb0dd-6246-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-l5ws5', null, 'product', 'invalid', '172.20.25.3', '172.19.149.98', 'Running', null, '2019-04-19 01:56:27', '2019-04-19 01:59:00', null, '720d29edf875c3e2f7c32e23d0610503');
INSERT INTO `pods` VALUES ('e0bbdd54-64ed-11e9-bb94-0a58ac14072d', 'a1f1dea6-64ed-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-n7lr8', null, 'product', 'invalid', '172.20.16.45', '172.19.149.72', 'Running', null, '2019-04-22 10:58:59', '2019-04-22 10:58:59', null, '4114631e55ee29bd82172809e0565f0a');
INSERT INTO `pods` VALUES ('e4806e90-55aa-11e9-9dda-0a58ac14072d', 'ba724de3-55aa-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-wwtxt', null, 'product', 'invalid', '172.20.19.5', '172.19.149.93', 'Running', null, '2019-04-03 00:52:17', '2019-04-03 00:52:17', null, '9e01a50c73c38aeb2d5aa185b0422f01');
INSERT INTO `pods` VALUES ('e73894de-6604-11e9-83df-0a58ac14072d', 'e46d96ae-6604-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-khvrh', null, 'product', 'invalid', '172.20.29.48', '172.19.149.102', 'Running', null, '2019-04-23 20:18:00', '2019-04-23 20:18:01', '2019-04-23 20:38:00', 'f2ddb59504b4e8f45464391f26263105');
INSERT INTO `pods` VALUES ('e73d6cde-60e9-11e9-9654-0a58ac14072d', '3709964c-60e9-11e9-bf66-00163e04a02f', 'archive-sc-product-deploy-68b76687f5-hq56m', null, 'product', 'invalid', '172.20.21.38', '172.19.148.193', 'Running', null, '2019-04-17 08:17:17', '2019-04-17 08:17:17', null, 'b4d94763fefa2e07d0b54a561a289738');
INSERT INTO `pods` VALUES ('e90b1dae-60e2-11e9-b9d6-0a58ac14072d', 'c140814d-60e2-11e9-bf66-00163e04a02f', 'ack-springcloud-zuul-sc-ack-springcloud-zuul-867bc85cd8-wq9vj', null, 'product', 'invalid', '172.20.16.250', '172.19.149.72', 'Running', null, '2019-04-17 07:31:03', '2019-04-17 07:31:03', null, '661066260af09423db2c26f2af9a70ac');
INSERT INTO `pods` VALUES ('e90bcea4-60e2-11e9-a24e-0a58ac14072d', 'c13bd692-60e2-11e9-bf66-00163e04a02f', 'ack-springcloud-zuul-sc-ack-springcloud-zuul-867bc85cd8-zf9bt', null, 'product', 'invalid', '172.20.7.75', '172.19.149.6', 'Running', null, '2019-04-17 07:31:03', '2019-04-17 07:31:03', null, '9d72579b12f570164a82945f8bf1e38b');
INSERT INTO `pods` VALUES ('ed7b2ff4-523b-11e9-80fe-0a58ac14072d', '8668507f-523b-11e9-bf66-00163e04a02f', 'ts-product-deploy-786f5bbbdd-442nq', null, 'product', 'invalid', '172.20.6.208', '172.19.148.225', 'Running', null, '2019-03-29 15:58:42', '2019-03-29 15:58:42', null, 'be705568234277bcf1994f7452f8d0a6');
INSERT INTO `pods` VALUES ('f26f4dd2-5c01-11e9-9a98-0a58ac14072d', 'e5a9de26-5c01-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-kvfp2', null, 'product', 'invalid', '172.20.6.246', '172.19.148.225', 'Running', null, '2019-04-11 02:31:22', '2019-04-11 02:31:22', null, '9f5545d19c3a5c3d112295480d7c2e83');
INSERT INTO `pods` VALUES ('f43cbd58-5cc2-11e9-923a-0a58ac14072d', 'ae568d85-5cc2-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-48q2g', null, 'product', 'invalid', '172.20.6.248', '172.19.148.225', 'Running', null, '2019-04-12 01:31:22', '2019-04-12 01:31:23', null, 'b9c8799301ad7c1c7376b8bf5b87ec34');
INSERT INTO `pods` VALUES ('f9cabd1a-64ef-11e9-867c-0a58ac14072d', 'a8a3ea50-64ef-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-98tj2', null, 'product', 'invalid', '172.20.16.48', '172.19.149.72', 'Running', null, '2019-04-22 11:13:30', '2019-04-22 11:13:30', null, 'a881f91a092c0dd8acd6c6f47ec158e1');
INSERT INTO `pods` VALUES ('f9cb74be-64ef-11e9-863e-0a58ac14072d', 'a8a53d98-64ef-11e9-bf66-00163e04a02f', 'ai-product-deploy-587c8c5558-9nd9w', null, 'product', 'invalid', '172.20.31.3', '172.19.149.104', 'Running', null, '2019-04-22 11:13:30', '2019-04-22 11:16:03', null, '17a960631d302671d8fe142a1ef338a0');
INSERT INTO `pods` VALUES ('fba3ebd8-55b3-11e9-82ad-0a58ac14072d', '63a27183-55b3-11e9-bf66-00163e04a02f', 'dcm-prod-product-deploy-69c58655d-997nf', null, 'product', 'invalid', '172.20.19.6', '172.19.149.93', 'Running', null, '2019-04-03 01:54:17', '2019-04-03 01:54:17', null, '79b43417a4b106c4cefd3276a312deb6');
INSERT INTO `pods` VALUES ('ff7dcb30-542a-11e9-852e-0a58ac14072d', 'fa195233-542a-11e9-bf66-00163e04a02f', 'ts-product-deploy-876df6447-stfvx', null, 'product', 'invalid', null, '172.19.148.225', 'Pending', null, '2019-04-01 03:05:17', '2019-04-01 03:05:17', null, '5818f484471297c97aaf817bc6547031');

-- ----------------------------
-- Table structure for servers
-- ----------------------------
DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers` (
  `guid` varchar(255) NOT NULL,
  `serverid` varchar(255) NOT NULL,
  `servername` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `cpu` int(11) DEFAULT NULL,
  `memory` int(11) DEFAULT NULL,
  `privateip` varchar(255) DEFAULT NULL,
  `publicip` varchar(255) DEFAULT NULL,
  `dyncip` varchar(255) DEFAULT NULL,
  `regionid` varchar(255) DEFAULT NULL,
  `zoneid` varchar(255) DEFAULT NULL,
  `ostype` varchar(255) DEFAULT NULL,
  `osname` varchar(255) DEFAULT NULL,
  `creationtime` datetime DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `expiredtime` datetime DEFAULT NULL,
  `md5` varchar(255) NOT NULL,
  PRIMARY KEY (`guid`),
  KEY `servermodel_serverid` (`serverid`),
  KEY `servermodel_servername` (`servername`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of servers
-- ----------------------------
INSERT INTO `servers` VALUES ('199d7d5a-64eb-11e9-8ba7-0a58ac14072d', 'i-uf683bcjvw38l92gbqjk', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.103', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-22 10:34:00', '2019-04-22 10:34:00', '2099-12-31 15:59:00', 'd5a1d4258764b3448eaf04bc685a9764');
INSERT INTO `servers` VALUES ('1f198452-64d6-11e9-bc69-0a58ac14072d', 'i-uf63ee4icwt0iosmdhnx', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.101', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-22 08:06:00', '2019-04-22 08:06:00', '2099-12-31 15:59:00', '96faeaabd57c4f3a777f86154ce0f512');
INSERT INTO `servers` VALUES ('2e5e3612-623f-11e9-b3d6-0a58ac14072d', 'i-uf6ddonlpdvbho6o77yg', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.97', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-19 01:00:00', '2019-04-19 01:00:00', '2099-12-31 15:59:00', '1b88d17c98000560cccda0dc041f278f');
INSERT INTO `servers` VALUES ('31b9eeee-5444-11e9-bef1-0a58ac14072d', 'i-uf60zgmfu7nvhr3806mr', 'k8s-DR-worker7', 'Running', '4', '32768', '172.19.149.93', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.6 64位', '2019-04-01 05:57:00', '2019-04-01 05:59:00', '2019-06-01 16:00:00', 'a499e0c23267a089b5e825aeccb151b8');
INSERT INTO `servers` VALUES ('468291a6-4ee1-11e9-a809-0a58ac14072d', 'i-uf64hp2vchms2rtx6u1t', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.88', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-03-25 09:30:00', '2019-03-25 09:30:00', '2099-12-31 15:59:00', '4cc2670b8970200f017cf8d49ad75162');
INSERT INTO `servers` VALUES ('4b4ad878-61cf-11e9-ad20-0a58ac14072d', 'i-uf6ifxql8f9sgrvv95zt', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.95', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-18 11:41:00', '2019-04-18 11:41:00', '2099-12-31 15:59:00', 'c6d3a46262c46449d1a46dba8b50d7d8');
INSERT INTO `servers` VALUES ('5585bd3a-4f63-11e9-a177-0a58ac14072d', 'i-uf6d46fqruipo9y7yhmb', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.92', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-03-26 01:01:00', '2019-03-26 01:01:00', '2099-12-31 15:59:00', '9773bd5bcc4910219bf2084c9e466aef');
INSERT INTO `servers` VALUES ('5dd4a5b0-64be-11e9-bec1-0a58ac14072d', 'i-uf6iysrguy8grz6yfveh', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.100', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-22 05:17:00', '2019-04-22 05:17:00', '2099-12-31 15:59:00', 'b6995888520fbb12641d420eec95d905');
INSERT INTO `servers` VALUES ('7861470a-4ee5-11e9-a88f-0a58ac14072d', 'i-uf6a8rq0glqou10ofks4', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.89', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-03-25 09:56:00', '2019-03-25 09:56:00', '2099-12-31 15:59:00', 'e4adcc279ea968f75c4d87e56fc61d07');
INSERT INTO `servers` VALUES ('7a5b866c-4ede-11e9-8edd-0a58ac14072d', 'i-uf67pdybaz7uj49pn2wg', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.87', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-03-25 09:12:00', '2019-03-25 09:12:00', '2099-12-31 15:59:00', 'd39e3044f806dee3e73440cedb1f7941');
INSERT INTO `servers` VALUES ('89a1ca0a-4f60-11e9-a5a7-0a58ac14072d', 'i-uf6e5jfellnopsglh9fx', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.91', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-03-26 00:37:00', '2019-03-26 00:37:00', '2099-12-31 15:59:00', '6005fb5f8a7077ba837fbbbfa8774bb1');
INSERT INTO `servers` VALUES ('92bdd3a8-6247-11e9-b4c6-0a58ac14072d', 'i-uf690mzf9cmkhxx6l4lp', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.98', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-19 01:56:00', '2019-04-19 01:56:00', '2099-12-31 15:59:00', '942c8dfa0fe3e5a2fd4d8f3cb2c8ca65');
INSERT INTO `servers` VALUES ('92c68a36-4ec1-11e9-bd2a-0a58ac14040b', 'i-bp1fg1dxo9ggg7ip5b16', '新官方网站', 'Running', '2', '4096', '10.80.103.167', '120.55.38.169', '', 'cn-hangzhou', 'cn-hangzhou-f', 'windows', 'Windows Server  2012  R2 数据中心版 64位中文版', '2017-09-18 07:09:00', '2019-03-19 03:15:00', '2019-05-19 16:00:00', 'f5e5526170270ed225acd972681f23b5');
INSERT INTO `servers` VALUES ('92c758ae-4ec1-11e9-adb3-0a58ac14040b', 'i-23076lbnn', '国家消化病三级网络会诊平台', 'Running', '2', '16384', '10.25.70.144', '114.55.142.175', '', 'cn-hangzhou', 'cn-hangzhou-e', 'windows', 'Windows Server  2008 R2 企业版 64位中文版', '2016-06-17 14:09:00', '2018-08-20 01:24:00', '2019-07-02 16:00:00', '62f33b60768de9dc52f3d202971a227c');
INSERT INTO `servers` VALUES ('92c8189c-4ec1-11e9-b957-0a58ac14040b', 'i-uf60pipuxk1805vtm996', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.82', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-03-25 03:11:00', '2019-03-25 03:11:00', '2099-12-31 15:59:00', '28e72bb5342a63cdb073bc61de8ae6e9');
INSERT INTO `servers` VALUES ('92c8c988-4ec1-11e9-b2aa-0a58ac14040b', 'i-uf60pipuxk1805vtm997', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.83', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-03-25 03:11:00', '2019-03-25 03:11:00', '2099-12-31 15:59:00', '162bf72413221365363986fbecca78a0');
INSERT INTO `servers` VALUES ('92c97d46-4ec1-11e9-a4bc-0a58ac14040b', 'i-uf6cw4jfs7cu9nmms90f', 'worker-k8s-for-cs-c5bc193d27cf2402183a293fd00666a4f', 'Running', '4', '8192', '172.19.143.84', '', '', 'cn-shanghai', 'cn-shanghai-d', 'linux', 'CentOS  7.4 64位', '2019-03-08 07:21:00', '2019-03-08 07:22:00', '2019-05-08 16:00:00', '5584d5bd9f2f194e22f9ee655d536fa1');
INSERT INTO `servers` VALUES ('92ca2b6e-4ec1-11e9-9e8f-0a58ac14040b', 'i-uf6cw4jfs7cu9nmms90g', 'worker-k8s-for-cs-c5bc193d27cf2402183a293fd00666a4f', 'Running', '4', '8192', '172.19.143.85', '', '', 'cn-shanghai', 'cn-shanghai-d', 'linux', 'CentOS  7.4 64位', '2019-03-08 07:21:00', '2019-03-08 07:22:00', '2019-05-08 16:00:00', '8c81a8c8a9c927286247bda1a4e7e65c');
INSERT INTO `servers` VALUES ('92cb1e1a-4ec1-11e9-8de4-0a58ac14040b', 'i-uf6eb77mnxyujesw7xx2', 'k8s-DR-worker6', 'Running', '8', '32768', '172.19.149.72', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-12-28 01:34:00', '2018-12-28 01:38:00', '2019-05-27 16:00:00', '7415f688cf7d175785b7de196a7d97d5');
INSERT INTO `servers` VALUES ('92cbc5cc-4ec1-11e9-93ac-0a58ac14040b', 'i-uf694343quugpouyjw3v', 'TEST-SERVER', 'Running', '4', '32768', '172.19.149.10', '', '101.132.45.197', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-05-23 09:25:00', '2019-02-18 07:00:00', '2019-05-23 16:00:00', '8679dc0d073adec19a027fc223d27a1a');
INSERT INTO `servers` VALUES ('92cc7750-4ec1-11e9-81ab-0a58ac14040b', 'i-uf68ziziwunari31q4v5', 'k8s-DR-worker5', 'Running', '4', '8192', '172.19.149.9', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-05-22 10:25:00', '2018-05-22 10:25:00', '2019-06-02 16:00:00', 'ec6be19d4b304f85fc3f2f99da577325');
INSERT INTO `servers` VALUES ('92cd2e40-4ec1-11e9-b5c4-0a58ac14040b', 'i-uf69wdpcqvg38dd7xvlv', 'k8s-DR-worker4', 'Running', '4', '8192', '172.19.149.8', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-05-22 06:44:00', '2018-05-22 06:44:00', '2019-05-22 16:00:00', '6fed63d22eaa757e0935d6c4f156cd3a');
INSERT INTO `servers` VALUES ('92cdf29e-4ec1-11e9-bbd1-0a58ac14040b', 'i-uf63l5w3yargyg2wziza', 'k8s-DR-worker3', 'Running', '4', '8192', '172.19.149.6', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-05-22 01:11:00', '2018-05-22 01:11:00', '2019-05-22 16:00:00', 'a0d86719751e6fb684910cdc2b5a39b5');
INSERT INTO `servers` VALUES ('92cea06e-4ec1-11e9-826c-0a58ac14040b', 'i-uf6imcfr2u6u344qgxku', 'k8s-DR-master3', 'Running', '2', '4096', '172.19.148.240', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-04-20 06:01:00', '2018-04-20 06:01:00', '2019-05-22 16:00:00', '9101b3eafdd0bc204971ee5bcd5ff20a');
INSERT INTO `servers` VALUES ('92cf55b8-4ec1-11e9-a53a-0a58ac14040b', 'i-uf669y80z2k199dcikny', 'k8s-DR-master2', 'Running', '2', '4096', '172.19.148.239', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-04-20 05:59:00', '2018-04-20 05:59:00', '2019-05-22 16:00:00', '9676ce9267dbee4309ee4347d731b47e');
INSERT INTO `servers` VALUES ('92d00908-4ec1-11e9-981e-0a58ac14040b', 'i-uf6cpjob15p0hnlc7h5t', 'k8s-DR-master1', 'Running', '2', '4096', '172.19.148.238', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-04-20 05:58:00', '2018-04-20 05:58:00', '2019-05-22 16:00:00', 'b28fd7bf6ea6e2d820b5e5c156fc480d');
INSERT INTO `servers` VALUES ('92d0ba86-4ec1-11e9-81bf-0a58ac14040b', 'i-uf671pwk5ej93eo00p9o', 'k8s-deploy', 'Running', '1', '2048', '172.19.148.236', '', '47.100.212.78', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-04-18 08:00:00', '2018-04-18 08:00:00', '2019-06-02 16:00:00', '595ef1ddd4641b9421abfb486117caf9');
INSERT INTO `servers` VALUES ('92d17282-4ec1-11e9-91ad-0a58ac14040b', 'i-uf61i5xmdmgfanvpyhed', 'TB-ANNOTATION_标注工作站', 'Running', '4', '32768', '172.19.148.235', '', '47.100.41.69', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-04-16 06:53:00', '2019-03-18 01:43:00', '2019-05-16 16:00:00', 'ecefe0c06dbc85f27b07f3b25b27d46d');
INSERT INTO `servers` VALUES ('92d2317e-4ec1-11e9-a3cf-0a58ac14040b', 'i-uf63yd4r85qw058tw9dr', '演示服务器_肺结核', 'Running', '4', '16384', '172.19.148.231', '', '47.100.43.165', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-04-04 05:51:00', '2018-08-20 09:08:00', '2019-05-04 16:00:00', '5f39c45a9602e8848c78e55e2237dcd4');
INSERT INTO `servers` VALUES ('92d2d610-4ec1-11e9-a0c9-0a58ac14040b', 'i-uf6ionhm5ibblld0h9vo', 'k8s-DR-worker1', 'Running', '4', '8192', '172.19.148.227', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.3 64位', '2018-03-14 06:32:00', '2018-05-14 06:05:00', '2019-05-14 16:00:00', '703bdeb73e7543914bebee5c6bbe9e45');
INSERT INTO `servers` VALUES ('92d37ff6-4ec1-11e9-884e-0a58ac14040b', 'i-uf6glob57mdslcvdqh23', 'StreamingServer', 'Running', '4', '8192', '172.19.148.225', '', '47.101.32.205', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.6 64位', '2018-03-14 06:10:00', '2019-04-16 07:52:00', '2019-05-14 16:00:00', 'b74546c907f4b9116be82e16f887ada8');
INSERT INTO `servers` VALUES ('92d425f6-4ec1-11e9-87a1-0a58ac14040b', 'i-uf672azxmnjkgkjgtwk4', 'rp02-网址转发-配置SSL证书', 'Running', '2', '8192', '172.19.148.218', '', '47.100.252.41', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2018-01-23 07:35:00', '2018-01-23 07:35:00', '2019-05-23 16:00:00', 'c862fe9a768877a45c814519a3bb61d3');
INSERT INTO `servers` VALUES ('92d4cc24-4ec1-11e9-af42-0a58ac14040b', 'i-uf6bt4cnbrfakyey1s5a', '医影云端_南京', 'Running', '2', '4096', '10.25.34.135', '106.14.59.156', '', 'cn-shanghai', 'cn-shanghai-c', 'windows', 'Windows Server  2012  R2 数据中心版 64位中文版', '2017-12-28 08:44:00', '2018-05-15 03:46:00', '2019-12-28 16:00:00', '0f6e276096ab171e18065f02bfc3d8a5');
INSERT INTO `servers` VALUES ('92d5770c-4ec1-11e9-8223-0a58ac14040b', 'i-uf62ygb0nk4wudz1qyz8', 'rmis01-RMIS服务器_生产', 'Running', '4', '16384', '172.19.148.200', '', '47.100.31.228', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2017-11-27 08:05:00', '2017-12-07 03:21:00', '2019-05-27 16:00:00', '0c878c5da7b1ac69e2eaaf8e61e27bb1');
INSERT INTO `servers` VALUES ('92d6215a-4ec1-11e9-ae63-0a58ac14040b', 'i-uf6f4zynu3ndg7l49asj', 'ECG-远程心电演示服务器', 'Running', '1', '4096', '172.19.143.76', '', '47.100.107.150', 'cn-shanghai', 'cn-shanghai-d', 'windows', 'Windows Server  2012  R2 数据中心版 64位中文版', '2017-11-22 06:27:00', '2017-11-22 06:27:00', '2019-05-22 16:00:00', 'eca84b90c7b1e9acde4800c9e2537c49');
INSERT INTO `servers` VALUES ('92d6cd80-4ec1-11e9-9d4c-0a58ac14040b', 'i-uf64dhkm7u594fcyhtlc', 'fms01-FMS服务器_生产', 'Running', '4', '16384', '172.19.148.195', '', '106.14.126.234', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2017-11-13 02:31:00', '2017-12-18 07:47:00', '2019-05-13 16:00:00', '411be780013c67724d1475fb56571815');
INSERT INTO `servers` VALUES ('92d77d4a-4ec1-11e9-b383-0a58ac14040b', 'i-uf64dhkm7u594fcyhtla', 'rp01-网址转发-配置SSL证书', 'Running', '4', '16384', '172.19.148.196', '', '47.101.34.93', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2017-11-13 02:31:00', '2017-12-13 06:39:00', '2019-05-13 16:00:00', '62d54ae937958845057be24e5d4cedfe');
INSERT INTO `servers` VALUES ('92d82882-4ec1-11e9-96b7-0a58ac14040b', 'i-uf64dhkm7u594fcyhtl9', 'k8s-DR-worker2', 'Running', '4', '16384', '172.19.148.193', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.6 64位', '2017-11-13 02:31:00', '2019-04-12 03:06:00', '2019-05-13 16:00:00', 'f0bf5fb89f7a3d69d5e2da8132da974c');
INSERT INTO `servers` VALUES ('993898fe-55b9-11e9-bc27-0a58ac14072d', 'i-uf6dle9hlatt6h8jwny8', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.94', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-03 02:33:00', '2019-04-03 02:33:00', '2099-12-31 15:59:00', 'a2d971931a6ef2e19f368b6a2e50a458');
INSERT INTO `servers` VALUES ('b1f83824-64f0-11e9-b7b1-0a58ac14072d', 'i-uf6iotn3059v5ujk2nyn', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.104', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-22 11:13:00', '2019-04-22 11:13:00', '2099-12-31 15:59:00', '27567340f2a1956f3c4b1677c2717f05');
INSERT INTO `servers` VALUES ('b7178712-64db-11e9-bdc3-0a58ac14072d', 'i-uf6iotn3059v3zgi8rq5', 'k8s-DR-worker', 'Running', '8', '32768', '172.19.149.102', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-22 08:48:00', '2019-04-22 08:48:00', '2099-12-31 15:59:00', '4024b45178b2e05f8691d9c6aafe84b5');
INSERT INTO `servers` VALUES ('b7f3347e-65a3-11e9-9144-0a58ac14072d', 'i-uf6hfmfrycxbknlk04ib', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.105', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-23 08:40:00', '2019-04-23 08:40:00', '2099-12-31 15:59:00', 'e22ebf6690d9eb6ee1a1927c5cfe7581');
INSERT INTO `servers` VALUES ('d87efc1a-4efb-11e9-957d-0a58ac14072d', 'i-uf6f6sk3wabm8jgc4tdg', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.90', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-03-25 12:36:00', '2019-03-25 12:36:00', '2099-12-31 15:59:00', '094f0ae0844a9b63970c95bec58835a8');
INSERT INTO `servers` VALUES ('f3eca486-64b5-11e9-81d5-0a58ac14072d', 'i-uf6gz6b6l226tngn5i3q', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.99', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-22 04:13:00', '2019-04-22 04:14:00', '2099-12-31 15:59:00', '3a49768b66e187a981a730184a5978cb');
INSERT INTO `servers` VALUES ('f7095cc0-4ec9-11e9-a28f-0a58ac14040b', 'i-uf6d46fqruipa6va09cu', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.85', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-03-25 06:41:00', '2019-03-25 06:42:00', '2099-12-31 15:59:00', '0275ed5821c3e444dcc83e37941492e5');
INSERT INTO `servers` VALUES ('fc8611be-623a-11e9-9333-0a58ac14072d', 'i-uf6jfcqhdx9e4axy4jwt', 'k8s-DR-worker', 'Invalid', '8', '32768', '172.19.149.96', '', '', 'cn-shanghai', 'cn-shanghai-b', 'linux', 'CentOS  7.4 64位', '2019-04-19 00:25:00', '2019-04-19 00:25:00', '2099-12-31 15:59:00', '5b425da9c3e3905ee8abbdca5a0bc8bc');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(255) NOT NULL,
  `code` varchar(128) DEFAULT NULL COMMENT 'code',
  `name` varchar(128) DEFAULT NULL COMMENT 'key值',
  `value` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `isdelete` tinyint(1) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('1', 'dangercode', '1', '12', '预警值', 'xjm', '2019-03-26 10:23:52', 'xjm', '2019-03-26 10:23:57', '0');

-- ----------------------------
-- Table structure for sys_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_group`;
CREATE TABLE `sys_group` (
  `id` varchar(255) NOT NULL,
  `layer_id` varchar(255) DEFAULT NULL,
  `parent_id` varchar(1024) DEFAULT NULL COMMENT '父id',
  `name` varchar(255) DEFAULT NULL COMMENT '组名',
  `def_pic_type` smallint(12) DEFAULT NULL COMMENT '默认展示图片类型',
  `is_merge` tinyint(1) DEFAULT '0' COMMENT '是否合并',
  `mge_name_type` smallint(12) DEFAULT '1' COMMENT '合并用命类型',
  `mge_name` varchar(255) DEFAULT NULL COMMENT '合并名',
  `sort` smallint(255) DEFAULT NULL COMMENT '顺序',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `isdelete` tinyint(1) DEFAULT NULL COMMENT '删除标志',
  `type` varchar(255) DEFAULT NULL COMMENT '组对应的类型：lb ai archive fms emis zuul nginx',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_group
-- ----------------------------
INSERT INTO `sys_group` VALUES ('110211350147371008', '110208083929600000', '0', 'nginx负载', '0', '1', '2', ' ', '0', 'xjm', '2019-02-19 17:12:55', 'xjm', '2019-02-19 17:12:55', '0', 'lb');
INSERT INTO `sys_group` VALUES ('110212509629157376', '110208478789767168', '110211350147371008', ' ', '0', '0', '2', ' ', '1', 'xjm', '2019-02-19 17:17:31', 'xjm', '2019-02-19 17:17:31', '0', 'nginx');
INSERT INTO `sys_group` VALUES ('110213618582163456', '110208744075300864', '110212509629157376', 'fms负载', '0', '1', '2', ' ', '2', 'xjm', '2019-02-19 17:21:55', 'xjm', '2019-02-19 17:21:55', '0', 'lb');
INSERT INTO `sys_group` VALUES ('110214544353136640', '110208744075300864', '110212509629157376', 'viewer负载', '0', '1', '2', ' ', '0', 'xjm', '2019-02-19 17:25:36', 'xjm', '2019-02-19 17:25:36', '0', 'lb');
INSERT INTO `sys_group` VALUES ('110214974504177664', '110208744075300864', '110212509629157376', 'arc负载', '0', '1', '2', ' ', '3', 'xjm', '2019-02-19 17:27:19', 'xjm', '2019-02-19 17:27:19', '0', 'lb');
INSERT INTO `sys_group` VALUES ('110466317890359296', '110208744075300864', '110212509629157376', 'homepage负载', '0', '1', '2', ' ', '1', 'xjm', '2019-02-20 10:06:04', 'xjm', '2019-02-20 10:06:04', '0', 'lb');
INSERT INTO `sys_group` VALUES ('110470988143005696', '110208744075300864', '110212509629157376', 'rmis负载', '0', '1', '2', ' ', '4', 'xjm', '2019-02-20 10:24:37', 'xjm', '2019-02-20 10:24:37', '0', 'lb');
INSERT INTO `sys_group` VALUES ('110472564517638144', '110208878116868096', '110214544353136640', 'viewer实例', '0', '1', '2', '影像诊断', '0', 'xjm', '2019-02-20 10:30:53', 'xjm', '2019-02-20 10:30:53', '0', 'viewer');
INSERT INTO `sys_group` VALUES ('110473550577537024', '110208878116868096', '110213618582163456', '影像传输', '0', '0', '2', 'fms', '2', 'xjm', '2019-02-20 10:34:48', 'xjm', '2019-02-20 10:34:48', '0', 'fms');
INSERT INTO `sys_group` VALUES ('110488635316375552', '110208878116868096', '110214974504177664', '只读影像服务', '0', '0', '2', '只读影像服务', '3', 'xjm', '2019-02-20 11:34:44', 'xjm', '2019-02-20 11:34:44', '0', 'dcm');
INSERT INTO `sys_group` VALUES ('110529750216216576', '110208878116868096', '110466317890359296', 'homepage实例', '0', '1', '2', '前端页面', '1', 'xjm', '2019-02-20 14:18:07', 'xjm', '2019-02-20 14:18:07', '0', 'homepage');
INSERT INTO `sys_group` VALUES ('110530439529107456', '110208878116868096', '110470988143005696', '业务系统', '0', '0', '2', 'rmis', '4', 'xjm', '2019-02-20 14:20:51', 'xjm', '2019-02-20 14:20:51', '0', 'rmis');
INSERT INTO `sys_group` VALUES ('110531812383526912', '110209262835208192', '110473550577537024,110530439529107456', '网关负载', '0', '1', '2', ' ', '0', 'xjm', '2019-02-20 14:26:19', 'xjm', '2019-02-20 14:26:19', '0', 'lb');
INSERT INTO `sys_group` VALUES ('110532091397017600', '110209262835208192', '110530439529107456', 'AI负载', '0', '1', '2', 'AI负载', '1', 'xjm', '2019-02-20 14:27:25', 'xjm', '2019-02-20 14:27:25', '1', 'lb');
INSERT INTO `sys_group` VALUES ('110532716860018688', '110209986918879232', '110531812383526912', ' ', '0', '0', '2', 'zuul', '0', 'xjm', '2019-02-20 14:29:54', 'xjm', '2019-02-20 14:29:54', '0', 'zuul');
INSERT INTO `sys_group` VALUES ('110534331025330176', '110210249973043200', '110532716860018688', '人工智能', '0', '0', '2', 'AI', '1', 'xjm', '2019-02-20 14:36:19', 'xjm', '2019-02-20 14:36:19', '0', 'ai');
INSERT INTO `sys_group` VALUES ('110534809909989376', '110210249973043200', '110532716860018688', 'adminui', '0', '1', '2', 'adminui', '0', 'xjm', '2019-02-20 14:38:13', 'xjm', '2019-02-20 14:38:13', '1', 'adminui');
INSERT INTO `sys_group` VALUES ('110535361028952064', '110210249973043200', '110532716860018688', 'zipkin', '0', '1', '2', 'zipkin', '1', 'xjm', '2019-02-20 14:40:25', 'xjm', '2019-02-20 14:40:25', '1', 'zipkin');
INSERT INTO `sys_group` VALUES ('110538155483992064', '110210249973043200', '110532716860018688', '只写影像服务', '0', '0', '2', 'dcm-write', '2', 'xjm', '2019-02-20 14:51:31', 'xjm', '2019-02-20 14:51:31', '0', 'dcm');

-- ----------------------------
-- Table structure for sys_layer
-- ----------------------------
DROP TABLE IF EXISTS `sys_layer`;
CREATE TABLE `sys_layer` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '层级名称',
  `sort` smallint(255) DEFAULT NULL COMMENT '展示名称',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `isdelete` tinyint(1) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_layer
-- ----------------------------
INSERT INTO `sys_layer` VALUES ('110208083929600000', '负载均衡', '0', 'xjm', '2019-02-19 16:59:56', 'xjm', '2019-02-19 16:59:56', '0');
INSERT INTO `sys_layer` VALUES ('110208478789767168', '前置网关', '1', 'xjm', '2019-02-19 17:01:30', 'xjm', '2019-02-19 17:01:30', '0');
INSERT INTO `sys_layer` VALUES ('110208744075300864', '负载均衡', '2', 'xjm', '2019-02-19 17:02:33', 'xjm', '2019-02-19 17:02:33', '0');
INSERT INTO `sys_layer` VALUES ('110208878116868096', '服务实现', '3', 'xjm', '2019-02-19 17:03:05', 'xjm', '2019-02-19 17:03:05', '0');
INSERT INTO `sys_layer` VALUES ('110209262835208192', '负载均衡', '4', 'xjm', '2019-02-19 17:04:37', 'xjm', '2019-02-19 17:04:37', '0');
INSERT INTO `sys_layer` VALUES ('110209986918879232', '微服务网关', '5', 'xjm', '2019-02-19 17:07:29', 'xjm', '2019-02-19 17:07:29', '0');
INSERT INTO `sys_layer` VALUES ('110210249973043200', '微服务', '6', 'xjm', '2019-02-19 17:08:32', 'xjm', '2019-02-19 17:08:32', '0');

-- ----------------------------
-- Table structure for sys_network_connection_key
-- ----------------------------
DROP TABLE IF EXISTS `sys_network_connection_key`;
CREATE TABLE `sys_network_connection_key` (
  `id` varchar(255) NOT NULL,
  `key_id` varchar(255) DEFAULT NULL COMMENT 'key值',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_network_connection_key
-- ----------------------------
INSERT INTO `sys_network_connection_key` VALUES ('1', 'lb-uf65e2zigl8rgseve04jb', '1');

-- ----------------------------
-- Table structure for sys_pic
-- ----------------------------
DROP TABLE IF EXISTS `sys_pic`;
CREATE TABLE `sys_pic` (
  `id` varchar(255) NOT NULL,
  `group_id` varchar(255) NOT NULL COMMENT '组id',
  `pic_path` varchar(512) DEFAULT NULL,
  `pic_type` smallint(1) DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `isdelete` tinyint(1) DEFAULT NULL COMMENT '删除标志',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `sys_pic_ibfk_1` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_pic
-- ----------------------------
INSERT INTO `sys_pic` VALUES ('110211350596161536', '110211350147371008', 'picpath', '1', 'xjm', '2019-02-19 17:12:55', 'xjm', '2019-02-19 17:12:55', '0');
INSERT INTO `sys_pic` VALUES ('110212509855649792', '110212509629157376', 'picpath', '1', 'xjm', '2019-02-19 17:17:31', 'xjm', '2019-02-19 17:17:31', '0');
INSERT INTO `sys_pic` VALUES ('110213618657660928', '110213618582163456', 'picpath', '1', 'xjm', '2019-02-19 17:21:55', 'xjm', '2019-02-19 17:21:55', '0');
INSERT INTO `sys_pic` VALUES ('110214544546074624', '110214544353136640', 'picpath', '1', 'xjm', '2019-02-19 17:25:36', 'xjm', '2019-02-19 17:25:36', '0');
INSERT INTO `sys_pic` VALUES ('110214974747447296', '110214974504177664', 'picpath', '1', 'xjm', '2019-02-19 17:27:19', 'xjm', '2019-02-19 17:27:19', '0');
INSERT INTO `sys_pic` VALUES ('110464291366244352', '110213618582163456', 'picpath', '1', 'xjm', '2019-02-20 09:58:00', 'xjm', '2019-02-20 09:58:00', '0');
INSERT INTO `sys_pic` VALUES ('110464670329999360', '110214544353136640', 'picpath', '1', 'xjm', '2019-02-20 09:59:31', 'xjm', '2019-02-20 09:59:31', '0');
INSERT INTO `sys_pic` VALUES ('110466318070714368', '110466317890359296', 'picpath', '1', 'xjm', '2019-02-20 10:06:04', 'xjm', '2019-02-20 10:06:04', '0');
INSERT INTO `sys_pic` VALUES ('110470988382081024', '110470988143005696', 'picpath', '1', 'xjm', '2019-02-20 10:24:37', 'xjm', '2019-02-20 10:24:37', '0');
INSERT INTO `sys_pic` VALUES ('110472565763346432', '110472564517638144', 'picpath', '1', 'xjm', '2019-02-20 10:30:53', 'xjm', '2019-02-20 10:30:53', '0');
INSERT INTO `sys_pic` VALUES ('110473550938247168', '110473550577537024', 'picpath', '1', 'xjm', '2019-02-20 10:34:48', 'xjm', '2019-02-20 10:34:48', '0');
INSERT INTO `sys_pic` VALUES ('110488636075544576', '110488635316375552', 'picpath', '1', 'xjm', '2019-02-20 11:34:45', 'xjm', '2019-02-20 11:34:45', '0');
INSERT INTO `sys_pic` VALUES ('110529750547566592', '110529750216216576', 'picpath', '1', 'xjm', '2019-02-20 14:18:07', 'xjm', '2019-02-20 14:18:07', '0');
INSERT INTO `sys_pic` VALUES ('110530440154058752', '110530439529107456', 'picpath', '1', 'xjm', '2019-02-20 14:20:51', 'xjm', '2019-02-20 14:20:51', '0');
INSERT INTO `sys_pic` VALUES ('110531812685516800', '110531812383526912', 'picpath', '1', 'xjm', '2019-02-20 14:26:19', 'xjm', '2019-02-20 14:26:19', '0');
INSERT INTO `sys_pic` VALUES ('110532091552206848', '110532091397017600', 'picpath', '1', 'xjm', '2019-02-20 14:27:25', 'xjm', '2019-02-20 14:27:25', '0');
INSERT INTO `sys_pic` VALUES ('110532717103288320', '110532716860018688', 'picpath', '1', 'xjm', '2019-02-20 14:29:54', 'xjm', '2019-02-20 14:29:54', '0');
INSERT INTO `sys_pic` VALUES ('110534331146964992', '110534331025330176', 'picpath', '1', 'xjm', '2019-02-20 14:36:19', 'xjm', '2019-02-20 14:36:19', '0');
INSERT INTO `sys_pic` VALUES ('110534810056790016', '110534809909989376', 'picpath', '1', 'xjm', '2019-02-20 14:38:13', 'xjm', '2019-02-20 14:38:13', '0');
INSERT INTO `sys_pic` VALUES ('110535361129615360', '110535361028952064', 'picpath', '1', 'xjm', '2019-02-20 14:40:25', 'xjm', '2019-02-20 14:40:25', '0');
INSERT INTO `sys_pic` VALUES ('110538155718873088', '110538155483992064', 'picpath', '1', 'xjm', '2019-02-20 14:51:31', 'xjm', '2019-02-20 14:51:31', '0');

-- ----------------------------
-- Table structure for sys_rule
-- ----------------------------
DROP TABLE IF EXISTS `sys_rule`;
CREATE TABLE `sys_rule` (
  `id` varchar(255) NOT NULL,
  `group_id` varchar(255) NOT NULL COMMENT '组id',
  `math` varchar(512) DEFAULT NULL COMMENT '正则',
  `name` varchar(255) DEFAULT NULL COMMENT '展示用名',
  `create_user` varchar(255) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_user` varchar(255) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `isdelete` tinyint(1) DEFAULT NULL COMMENT '删除标志',
  `rule_type` smallint(12) DEFAULT NULL COMMENT '规则对应服务器类型',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `lay_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rule
-- ----------------------------
INSERT INTO `sys_rule` VALUES ('110211350482915328', '110211350147371008', 'svc_lb', 'nginx负载', 'xjm', '2019-02-19 17:12:55', 'xjm', '2019-02-19 17:12:55', '0', '3');
INSERT INTO `sys_rule` VALUES ('110212509805318144', '110212509629157376', '(rp)+.*(配置SSL证书)', 'nginx实例', 'xjm', '2019-02-19 17:17:31', 'xjm', '2019-02-19 17:17:31', '0', '1');
INSERT INTO `sys_rule` VALUES ('110213618636689408', '110213618582163456', '(k8s)+.*(fms)-prod', 'fms负载', 'xjm', '2019-02-19 17:21:55', 'xjm', '2019-02-19 17:21:55', '0', '3');
INSERT INTO `sys_rule` VALUES ('110214544512520192', '110214544353136640', '(k8s)+.*(wv)-prod', 'viewer负载', 'xjm', '2019-02-19 17:25:36', 'xjm', '2019-02-19 17:25:36', '0', '3');
INSERT INTO `sys_rule` VALUES ('110214974718087168', '110214974504177664', 'arc_lb', 'arc负载', 'xjm', '2019-02-19 17:27:19', 'xjm', '2019-02-19 17:27:19', '0', '3');
INSERT INTO `sys_rule` VALUES ('110464289520750592', '110213618582163456', 'uv_lb', 'uv_lb负载-fms', 'xjm', '2019-02-20 09:58:00', 'xjm', '2019-02-20 09:58:00', '0', '3');
INSERT INTO `sys_rule` VALUES ('110464670241918976', '110214544353136640', 'uv_lb', 'uv_lb负载-viewer', 'xjm', '2019-02-20 09:59:31', 'xjm', '2019-02-20 09:59:31', '0', '3');
INSERT INTO `sys_rule` VALUES ('110465522704846848', '110214974504177664', '(k8s)+.*(dcm)-prod', 'dcm负载', 'xjm', '2019-02-20 10:02:54', 'xjm', '2019-02-20 10:02:54', '0', '3');
INSERT INTO `sys_rule` VALUES ('110466318028771328', '110466317890359296', '(k8s)+.*(fv)-prod', 'homepage负载', 'xjm', '2019-02-20 10:06:04', 'xjm', '2019-02-20 10:06:04', '0', '3');
INSERT INTO `sys_rule` VALUES ('110470524798242816', '110466317890359296', 'dr_lb', 'dr_lb负载-homepage', 'xjm', '2019-02-20 10:22:47', 'xjm', '2019-02-20 10:22:47', '0', '3');
INSERT INTO `sys_rule` VALUES ('110470988352720896', '110470988143005696', '(k8s)+.*(rmis)-prod', 'rmis负载', 'xjm', '2019-02-20 10:24:37', 'xjm', '2019-02-20 10:24:37', '0', '3');
INSERT INTO `sys_rule` VALUES ('110471422865838080', '110470988143005696', 'dr_lb', 'dr_lb负载-rmise', 'xjm', '2019-02-20 10:26:21', 'xjm', '2019-02-20 10:26:21', '0', '3');
INSERT INTO `sys_rule` VALUES ('110472565314555904', '110472564517638144', '(fms)+.*(FMS服务器_生产)', 'viewer实例1', 'xjm', '2019-02-20 10:30:53', 'xjm', '2019-02-20 10:30:53', '0', '1');
INSERT INTO `sys_rule` VALUES ('110472954512412672', '110472564517638144', '^wv-prod-product-deploy', 'viewer实例2', 'xjm', '2019-02-20 10:32:26', 'xjm', '2019-02-20 10:32:26', '0', '2');
INSERT INTO `sys_rule` VALUES ('110473550829195264', '110473550577537024', '(fms)+.*(FMS服务器_生产)', 'fms实例1', 'xjm', '2019-02-20 10:34:48', 'xjm', '2019-02-20 10:34:48', '0', '1');
INSERT INTO `sys_rule` VALUES ('110473862751195136', '110473550577537024', '^fms-prod-product-deploy', 'fms实例2', 'xjm', '2019-02-20 10:36:02', 'xjm', '2019-02-20 10:36:02', '0', '2');
INSERT INTO `sys_rule` VALUES ('110488635609976832', '110488635316375552', '^arc01', 'dcm读实例1', 'xjm', '2019-02-20 11:34:45', 'xjm', '2019-02-20 11:34:45', '0', '1');
INSERT INTO `sys_rule` VALUES ('110489084140457984', '110538155483992064', '^archive-product-deploy', 'dcm写实例', 'xjm', '2019-02-20 11:36:31', 'xjm', '2019-02-20 11:36:31', '0', '2');
INSERT INTO `sys_rule` VALUES ('110529750518206464', '110529750216216576', '(rmis01)+.*(RMIS服务器_生产)', 'homepage实例', 'xjm', '2019-02-20 14:18:07', 'xjm', '2019-02-20 14:18:07', '0', '1');
INSERT INTO `sys_rule` VALUES ('110530013140357120', '110529750216216576', '^fv-prod-product-deploy', 'homepage实例2', 'xjm', '2019-02-20 14:19:10', 'xjm', '2019-02-20 14:19:10', '0', '2');
INSERT INTO `sys_rule` VALUES ('110530439935954944', '110530439529107456', '(rmis01)+.*(RMIS服务器_生产)', 'rmis实例', 'xjm', '2019-02-20 14:20:51', 'xjm', '2019-02-20 14:20:51', '0', '1');
INSERT INTO `sys_rule` VALUES ('110530617157881856', '110530439529107456', '^rmis-prod-product-deploy', 'rmis实例2', 'xjm', '2019-02-20 14:21:34', 'xjm', '2019-02-20 14:21:34', '0', '2');
INSERT INTO `sys_rule` VALUES ('110531812630990848', '110531812383526912', 'k8s-lb-zuul-prod', '网关负载', 'xjm', '2019-02-20 14:26:19', 'xjm', '2019-02-20 14:26:19', '0', '3');
INSERT INTO `sys_rule` VALUES ('110532091518652416', '110532091397017600', 'k8s-lb-ai', 'AI负载', 'xjm', '2019-02-20 14:27:25', 'xjm', '2019-02-20 14:27:25', '0', '3');
INSERT INTO `sys_rule` VALUES ('110532717023596544', '110532716860018688', '^zuulroute-product-deploy', 'zuul实例', 'xjm', '2019-02-20 14:29:54', 'xjm', '2019-02-20 14:29:54', '0', '2');
INSERT INTO `sys_rule` VALUES ('110534331121799168', '110534331025330176', '^ai-product-deploy', 'AI实例', 'xjm', '2019-02-20 14:36:19', 'xjm', '2019-02-20 14:36:19', '0', '2');
INSERT INTO `sys_rule` VALUES ('110534810035818496', '110534809909989376', '^adminui-product-deploy', 'adminui', 'xjm', '2019-02-20 14:38:13', 'xjm', '2019-02-20 14:38:13', '0', '2');
INSERT INTO `sys_rule` VALUES ('110535361096060928', '110535361028952064', '^zipkin-product-deploy', 'zipkin', 'xjm', '2019-02-20 14:40:25', 'xjm', '2019-02-20 14:40:25', '0', '2');
INSERT INTO `sys_rule` VALUES ('110538155672735744', '110488635316375552', '^dcm-prod-product-deploy', 'dcm读实例2', 'xjm', '2019-02-20 14:51:31', 'xjm', '2019-02-20 14:51:31', '0', '2');
