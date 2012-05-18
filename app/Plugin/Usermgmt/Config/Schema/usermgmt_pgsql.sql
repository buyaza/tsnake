/*------------- login_tokens -------------*/
CREATE TABLE login_tokens (
  id integer NOT NULL,
  user_id integer NOT NULL,
  token character varying(32) NOT NULL,
  duration character varying(32) NOT NULL,
  used smallint NOT NULL DEFAULT '0',
  created date NOT NULL,
  expires date NOT NULL,
  CONSTRAINT login_tokens_primary_key PRIMARY KEY (id )
);

CREATE SEQUENCE login_tokens_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;

ALTER TABLE login_tokens
ALTER COLUMN id
SET DEFAULT NEXTVAL('login_tokens_id_seq');


/*------------- users -------------*/
CREATE TABLE users (
  id integer NOT NULL,
  user_group_id integer,
  username character varying(100),
  password character varying(255),
  email character varying(100),
  first_name character varying(100),
  last_name character varying(100),
  active character varying(3) DEFAULT '0',
  created date DEFAULT NULL,
  modified date DEFAULT NULL,
  CONSTRAINT users_primary_key PRIMARY KEY (id, username, email, user_group_id )
);

CREATE SEQUENCE users_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 2
  CACHE 1;

ALTER TABLE users
ALTER COLUMN id
SET DEFAULT NEXTVAL('users_id_seq');

INSERT INTO users (id, user_group_id, username, password, email, first_name, last_name, active, created, modified) VALUES
(1, 1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin@admin.com', 'Admin', NULL, '1', now(), now());


/*------------- user_groups -------------*/
CREATE TABLE user_groups (
  id integer NOT NULL,
  name character varying(100),
  alias_name varchar(100) DEFAULT NULL,
  allow_registration boolean,
  created date,
  modified date,
  CONSTRAINT user_groups_primary_key PRIMARY KEY (id)
);

CREATE SEQUENCE user_groups_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 4
  CACHE 1;

ALTER TABLE user_groups
ALTER COLUMN id
SET DEFAULT NEXTVAL('user_groups_id_seq');

INSERT INTO user_groups (id, name, alias_name, allow_registration, created, modified) VALUES
(1, 'Admin', 'Admin', false, now(), now()),
(2, 'User', 'User', true, now(), now()),
(3, 'Guest', 'Guest', false, now(), now());


/*------------- user_group_permissions -------------*/
CREATE TABLE user_group_permissions (
  id integer NOT NULL,
  user_group_id integer NOT NULL,
  controller character varying(50) NOT NULL,
  action character varying(100) NOT NULL,
  allowed smallint NOT NULL DEFAULT '1',
  CONSTRAINT user_group_permissions_primary_key PRIMARY KEY (id)
);

CREATE SEQUENCE user_group_permissions_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 70
  CACHE 1;

ALTER TABLE user_group_permissions
ALTER COLUMN id
SET DEFAULT NEXTVAL('user_group_permissions_id_seq');


INSERT INTO user_group_permissions (id, user_group_id, controller, action, allowed) VALUES
(1, 1, 'Pages', 'display', 1),
(2, 2, 'Pages', 'display', 1),
(3, 3, 'Pages', 'display', 1),
(4, 1, 'UserGroupPermissions', 'index', 1),
(5, 2, 'UserGroupPermissions', 'index', 0),
(6, 3, 'UserGroupPermissions', 'index', 0),
(7, 1, 'UserGroupPermissions', 'update', 1),
(8, 2, 'UserGroupPermissions', 'update', 0),
(9, 3, 'UserGroupPermissions', 'update', 0),
(10, 1, 'UserGroups', 'index', 1),
(11, 2, 'UserGroups', 'index', 0),
(12, 3, 'UserGroups', 'index', 0),
(13, 1, 'UserGroups', 'addGroup', 1),
(14, 2, 'UserGroups', 'addGroup', 0),
(15, 3, 'UserGroups', 'addGroup', 0),
(16, 1, 'UserGroups', 'editGroup', 1),
(17, 2, 'UserGroups', 'editGroup', 0),
(18, 3, 'UserGroups', 'editGroup', 0),
(19, 1, 'UserGroups', 'deleteGroup', 1),
(20, 2, 'UserGroups', 'deleteGroup', 0),
(21, 3, 'UserGroups', 'deleteGroup', 0),
(22, 1, 'Users', 'index', 1),
(23, 2, 'Users', 'index', 0),
(24, 3, 'Users', 'index', 0),
(25, 1, 'Users', 'viewUser', 1),
(26, 2, 'Users', 'viewUser', 0),
(27, 3, 'Users', 'viewUser', 0),
(28, 1, 'Users', 'myprofile', 1),
(29, 2, 'Users', 'myprofile', 1),
(30, 3, 'Users', 'myprofile', 0),
(31, 1, 'Users', 'login', 1),
(32, 2, 'Users', 'login', 1),
(33, 3, 'Users', 'login', 1),
(34, 1, 'Users', 'logout', 1),
(35, 2, 'Users', 'logout', 1),
(36, 3, 'Users', 'logout', 1),
(37, 1, 'Users', 'register', 1),
(38, 2, 'Users', 'register', 1),
(39, 3, 'Users', 'register', 1),
(40, 1, 'Users', 'changePassword', 1),
(41, 2, 'Users', 'changePassword', 1),
(42, 3, 'Users', 'changePassword', 0),
(43, 1, 'Users', 'changeUserPassword', 1),
(44, 2, 'Users', 'changeUserPassword', 0),
(45, 3, 'Users', 'changeUserPassword', 0),
(46, 1, 'Users', 'addUser', 1),
(47, 2, 'Users', 'addUser', 0),
(48, 3, 'Users', 'addUser', 0),
(49, 1, 'Users', 'editUser', 1),
(50, 2, 'Users', 'editUser', 0),
(51, 3, 'Users', 'editUser', 0),
(52, 1, 'Users', 'dashboard', 1),
(53, 2, 'Users', 'dashboard', 1),
(54, 3, 'Users', 'dashboard', 0),
(55, 1, 'Users', 'deleteUser', 1),
(56, 2, 'Users', 'deleteUser', 0),
(57, 3, 'Users', 'deleteUser', 0),
(58, 1, 'Users', 'makeActive', 1),
(59, 2, 'Users', 'makeActive', 0),
(60, 3, 'Users', 'makeActive', 0),
(61, 1, 'Users', 'accessDenied', 1),
(62, 2, 'Users', 'accessDenied', 1),
(63, 3, 'Users', 'accessDenied', 1),
(64, 1, 'Users', 'userVerification', 1),
(65, 2, 'Users', 'userVerification', 1),
(66, 3, 'Users', 'userVerification', 1),
(67, 1, 'Users', 'forgotPassword', 1),
(68, 2, 'Users', 'forgotPassword', 1),
(69, 3, 'Users', 'forgotPassword', 1);
