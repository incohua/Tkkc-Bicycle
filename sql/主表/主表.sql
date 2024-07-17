# todo:添加数据
-- ----------------------------
-- 用户表
CREATE TABLE `user` (
                        `user_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '用户的唯一编号',
                        `username` VARCHAR(20) NOT NULL COMMENT '用户自定义昵称',
                        `password` VARCHAR(10) NOT NULL COMMENT '用户设置的密码',
                        `balance` DECIMAL(20,2) NOT NULL COMMENT '用户的账号剩余金额',
                        PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储用户个人信息';
-- 管理员表
CREATE TABLE `admin` (
                         `admin_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '管理员的唯一编号',
                         `password` VARCHAR(20) NOT NULL COMMENT '管理员密码',
                         `assigned_region` VARCHAR(10) NOT NULL COMMENT '所分配充电桩的负责区域',
                         PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储管理员信息';
-- 充值记录表
CREATE TABLE `recharge_record` (
                                   `recharge_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '充值记录序号',
                                   `user_id` INT(10) NOT NULL COMMENT '用户的唯一编号',
                                   `amount` DECIMAL(20,2) NOT NULL COMMENT '用户所选充值金额',
                                   `method` VARCHAR(10) NOT NULL COMMENT '充值金额的方式',
                                   `recharge_time` DATETIME NOT NULL COMMENT '充值交易的时间',
                                   PRIMARY KEY (`recharge_id`),
                                   FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储用户充值信息记录';
-- 充电记录表
CREATE TABLE `charging_record` (
                                   `transaction_id` INT(20) NOT NULL AUTO_INCREMENT COMMENT '充值记录序号',
                                   `charge_amount` DECIMAL(20,2) NOT NULL COMMENT '本次充电的金额',
                                   `charge_duration` TIME NOT NULL COMMENT '本次充电时长',
                                   `start_time` DATETIME NOT NULL COMMENT '充电开始时间',
                                   `end_time` DATETIME NOT NULL COMMENT '充电结束时间',
                                   `socket_id` VARCHAR(10) NOT NULL COMMENT '将使用的插座ID',
                                   `charger_id` VARCHAR(10) NOT NULL COMMENT '将使用的充电桩ID',
                                   `user_id` INT(10) NOT NULL COMMENT '用户的唯一编号',
                                   `charge_status` VARCHAR(10) NOT NULL COMMENT '充电进度状态',
                                   PRIMARY KEY (`transaction_id`),
                                   FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储用户的充电记录';
-- 充电桩表
CREATE TABLE `charger` (
                           `charger_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '充电桩的唯一编号',
                           `region` VARCHAR(20) NOT NULL COMMENT '充电桩所属区域',
                           `status` VARCHAR(10) NOT NULL COMMENT '充电桩运行状态',
                           `socket_count` DECIMAL(20,2) NOT NULL COMMENT '充电桩上插座数量',
                           PRIMARY KEY (`charger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储充电桩相关信息';
-- 插座表
CREATE TABLE `socket` (
                          `socket_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '插座唯一编号',
                          `charger_id` INT(10) NOT NULL COMMENT '插座归属充电桩编号',
                          `status` VARCHAR(10) NOT NULL COMMENT '插座状态',
                          PRIMARY KEY (`socket_id`),
                          FOREIGN KEY (`charger_id`) REFERENCES `charger` (`charger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储插座相关信息';
-- 维修记录表
CREATE TABLE `maintenance_record` (
                                      `maintenance_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '维修报告编号',
                                      `maintenance_time` DATETIME NOT NULL COMMENT '进行维修的时间',
                                      `issue` VARCHAR(50) NOT NULL COMMENT '需要维修的问题',
                                      `status` VARCHAR(10) NOT NULL COMMENT '维修状态显示',
                                      PRIMARY KEY (`maintenance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储维修信息';
-- 用户反馈表
CREATE TABLE `user_feedback` (
                                 `user_id` INT(10) NOT NULL COMMENT '用户的唯一编号',
                                 `issue` VARCHAR(50) NOT NULL COMMENT '需要维修的问题',
                                 `suggestion` VARCHAR(50) NOT NULL COMMENT '用户提供平台优化建议',
                                 `status` VARCHAR(10) NOT NULL COMMENT '反馈状态显示',
                                 FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='存储用户的反馈信息内容';