-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充值记录', '2002', '1', '/recharge_record/rechargerecord', 'C', '0', 'recharge_record:rechargerecord:view', '#', 'admin', sysdate(), '', null, '充值记录菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充值记录查询', @parentId, '1',  '#',  'F', '0', 'recharge_record:rechargerecord:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充值记录新增', @parentId, '2',  '#',  'F', '0', 'recharge_record:rechargerecord:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充值记录修改', @parentId, '3',  '#',  'F', '0', 'recharge_record:rechargerecord:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充值记录删除', @parentId, '4',  '#',  'F', '0', 'recharge_record:rechargerecord:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充值记录导出', @parentId, '5',  '#',  'F', '0', 'recharge_record:rechargerecord:export',       '#', 'admin', sysdate(), '', null, '');
