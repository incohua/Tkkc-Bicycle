-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('反馈信息', '2003', '1', '/userfeedback/feedback', 'C', '0', 'userfeedback:feedback:view', '#', 'admin', sysdate(), '', null, '反馈信息菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('反馈信息查询', @parentId, '1',  '#',  'F', '0', 'userfeedback:feedback:list',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('反馈信息新增', @parentId, '2',  '#',  'F', '0', 'userfeedback:feedback:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('反馈信息修改', @parentId, '3',  '#',  'F', '0', 'userfeedback:feedback:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('反馈信息删除', @parentId, '4',  '#',  'F', '0', 'userfeedback:feedback:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('反馈信息导出', @parentId, '5',  '#',  'F', '0', 'userfeedback:feedback:export',       '#', 'admin', sysdate(), '', null, '');
