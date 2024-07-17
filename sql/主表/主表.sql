# todo:�������
-- ----------------------------
-- �û���
CREATE TABLE `user` (
                        `user_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '�û���Ψһ���',
                        `username` VARCHAR(20) NOT NULL COMMENT '�û��Զ����ǳ�',
                        `password` VARCHAR(10) NOT NULL COMMENT '�û����õ�����',
                        `balance` DECIMAL(20,2) NOT NULL COMMENT '�û����˺�ʣ����',
                        PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�洢�û�������Ϣ';
-- ����Ա��
CREATE TABLE `admin` (
                         `admin_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '����Ա��Ψһ���',
                         `password` VARCHAR(20) NOT NULL COMMENT '����Ա����',
                         `assigned_region` VARCHAR(10) NOT NULL COMMENT '��������׮�ĸ�������',
                         PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�洢����Ա��Ϣ';
-- ��ֵ��¼��
CREATE TABLE `recharge_record` (
                                   `recharge_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '��ֵ��¼���',
                                   `user_id` INT(10) NOT NULL COMMENT '�û���Ψһ���',
                                   `amount` DECIMAL(20,2) NOT NULL COMMENT '�û���ѡ��ֵ���',
                                   `method` VARCHAR(10) NOT NULL COMMENT '��ֵ���ķ�ʽ',
                                   `recharge_time` DATETIME NOT NULL COMMENT '��ֵ���׵�ʱ��',
                                   PRIMARY KEY (`recharge_id`),
                                   FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�洢�û���ֵ��Ϣ��¼';
-- ����¼��
CREATE TABLE `charging_record` (
                                   `transaction_id` INT(20) NOT NULL AUTO_INCREMENT COMMENT '��ֵ��¼���',
                                   `charge_amount` DECIMAL(20,2) NOT NULL COMMENT '���γ��Ľ��',
                                   `charge_duration` TIME NOT NULL COMMENT '���γ��ʱ��',
                                   `start_time` DATETIME NOT NULL COMMENT '��翪ʼʱ��',
                                   `end_time` DATETIME NOT NULL COMMENT '������ʱ��',
                                   `socket_id` VARCHAR(10) NOT NULL COMMENT '��ʹ�õĲ���ID',
                                   `charger_id` VARCHAR(10) NOT NULL COMMENT '��ʹ�õĳ��׮ID',
                                   `user_id` INT(10) NOT NULL COMMENT '�û���Ψһ���',
                                   `charge_status` VARCHAR(10) NOT NULL COMMENT '������״̬',
                                   PRIMARY KEY (`transaction_id`),
                                   FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�洢�û��ĳ���¼';
-- ���׮��
CREATE TABLE `charger` (
                           `charger_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '���׮��Ψһ���',
                           `region` VARCHAR(20) NOT NULL COMMENT '���׮��������',
                           `status` VARCHAR(10) NOT NULL COMMENT '���׮����״̬',
                           `socket_count` DECIMAL(20,2) NOT NULL COMMENT '���׮�ϲ�������',
                           PRIMARY KEY (`charger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�洢���׮�����Ϣ';
-- ������
CREATE TABLE `socket` (
                          `socket_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT '����Ψһ���',
                          `charger_id` INT(10) NOT NULL COMMENT '�����������׮���',
                          `status` VARCHAR(10) NOT NULL COMMENT '����״̬',
                          PRIMARY KEY (`socket_id`),
                          FOREIGN KEY (`charger_id`) REFERENCES `charger` (`charger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�洢���������Ϣ';
-- ά�޼�¼��
CREATE TABLE `maintenance_record` (
                                      `maintenance_id` INT(10) NOT NULL AUTO_INCREMENT COMMENT 'ά�ޱ�����',
                                      `maintenance_time` DATETIME NOT NULL COMMENT '����ά�޵�ʱ��',
                                      `issue` VARCHAR(50) NOT NULL COMMENT '��Ҫά�޵�����',
                                      `status` VARCHAR(10) NOT NULL COMMENT 'ά��״̬��ʾ',
                                      PRIMARY KEY (`maintenance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�洢ά����Ϣ';
-- �û�������
CREATE TABLE `user_feedback` (
                                 `user_id` INT(10) NOT NULL COMMENT '�û���Ψһ���',
                                 `issue` VARCHAR(50) NOT NULL COMMENT '��Ҫά�޵�����',
                                 `suggestion` VARCHAR(50) NOT NULL COMMENT '�û��ṩƽ̨�Ż�����',
                                 `status` VARCHAR(10) NOT NULL COMMENT '����״̬��ʾ',
                                 FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='�洢�û��ķ�����Ϣ����';