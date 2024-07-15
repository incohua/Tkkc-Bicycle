-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电桩管理', '2001', '1', '/charger/chargerinfo', 'C', '0', 'charger:chargerinfo:view', '#', 'admin', sysdate(), '', null, '充电桩管理菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电桩管理查询', @parentId, '1',  '#',  'F', '0', 'charger:chargerinfo:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电桩管理新增', @parentId, '2',  '#',  'F', '0', 'charger:chargerinfo:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电桩管理修改', @parentId, '3',  '#',  'F', '0', 'charger:chargerinfo:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电桩管理删除', @parentId, '4',  '#',  'F', '0', 'charger:chargerinfo:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('充电桩管理导出', @parentId, '5',  '#',  'F', '0', 'charger:chargerinfo:export',       '#', 'admin', sysdate(), '', null, '');
