-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电记录', '2002', '1', '/chargingRecord/charingRecordinfo', 'C', '0', 'chargingRecord:charingRecordinfo:view', '#', 'admin', sysdate(), '', null, '充电记录菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电记录查询', @parentId, '1',  '#',  'F', '0', 'chargingRecord:charingRecordinfo:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电记录新增', @parentId, '2',  '#',  'F', '0', 'chargingRecord:charingRecordinfo:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电记录修改', @parentId, '3',  '#',  'F', '0', 'chargingRecord:charingRecordinfo:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电记录删除', @parentId, '4',  '#',  'F', '0', 'chargingRecord:charingRecordinfo:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电记录导出', @parentId, '5',  '#',  'F', '0', 'chargingRecord:charingRecordinfo:export',       '#', 'admin', sysdate(), '', null, '');
