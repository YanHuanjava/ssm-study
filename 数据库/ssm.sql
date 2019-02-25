prompt PL/SQL Developer import file
prompt Created on 2019年2月25日 星期一 by Administrator
set feedback off
set define off
prompt Dropping DEPT...
drop table DEPT cascade constraints;
prompt Dropping EMP...
drop table EMP cascade constraints;
prompt Dropping SCORE...
drop table SCORE cascade constraints;
prompt Dropping SUBJECT...
drop table SUBJECT cascade constraints;
prompt Dropping T_ATTENDANCE...
drop table T_ATTENDANCE cascade constraints;
prompt Dropping T_COURSE...
drop table T_COURSE cascade constraints;
prompt Dropping T_GRADE...
drop table T_GRADE cascade constraints;
prompt Dropping T_MODULES...
drop table T_MODULES cascade constraints;
prompt Dropping T_POWERS...
drop table T_POWERS cascade constraints;
prompt Dropping T_ROLES...
drop table T_ROLES cascade constraints;
prompt Dropping T_SCORE...
drop table T_SCORE cascade constraints;
prompt Dropping T_STUDENT...
drop table T_STUDENT cascade constraints;
prompt Dropping T_SYS_LOG...
drop table T_SYS_LOG cascade constraints;
prompt Dropping T_TEACHER...
drop table T_TEACHER cascade constraints;
prompt Dropping T_USERS...
drop table T_USERS cascade constraints;
prompt Dropping T_USER_INFO...
drop table T_USER_INFO cascade constraints;
prompt Creating DEPT...
create table DEPT
(
  DEPTNO NUMBER(2) not null,
  DNAME  VARCHAR2(14),
  LOC    VARCHAR2(13)
)
;
alter table DEPT
  add primary key (DEPTNO);

prompt Creating EMP...
create table EMP
(
  EMPNO    NUMBER(4) not null,
  ENAME    VARCHAR2(10),
  JOB      VARCHAR2(9),
  MGR      NUMBER(4),
  HIREDATE DATE,
  SAL      NUMBER(7,2),
  COMM     NUMBER(7,2),
  DEPTNO   NUMBER(2)
)
;
alter table EMP
  add primary key (EMPNO);
alter table EMP
  add foreign key (MGR)
  references EMP (EMPNO);
alter table EMP
  add foreign key (DEPTNO)
  references DEPT (DEPTNO);

prompt Creating SCORE...
create table SCORE
(
  SCORE_ID NUMBER not null,
  SCORE    NUMBER not null,
  USER_ID  NUMBER not null,
  PAGE_ID  NUMBER not null
)
;
alter table SCORE
  add constraint SCORE_SCORE_ID_PK unique (SCORE_ID);

prompt Creating SUBJECT...
create table SUBJECT
(
  SUBJECT_ID   NUMBER not null,
  SUBJECT_NAME VARCHAR2(200) not null
)
;
alter table SUBJECT
  add constraint SUBJECT_SUBJECT_ID_PK primary key (SUBJECT_ID);

prompt Creating T_ATTENDANCE...
create table T_ATTENDANCE
(
  ATTEND_ID    NUMBER(10),
  EMP_ID       NUMBER,
  ATTEND_STATE NUMBER(1),
  CHECK_TIME   TIMESTAMP(6)
)
;
comment on column T_ATTENDANCE.ATTEND_ID
  is '主键';
comment on column T_ATTENDANCE.EMP_ID
  is '员工编号';
comment on column T_ATTENDANCE.ATTEND_STATE
  is '1：正常，2：迟到，3：缺勤 ';
comment on column T_ATTENDANCE.CHECK_TIME
  is '打卡时间';
alter table T_ATTENDANCE
  add constraint PI_ATTEND_ID primary key (ATTEND_ID)
  disable;

prompt Creating T_COURSE...
create table T_COURSE
(
  CNO   VARCHAR2(20) not null,
  CNAME VARCHAR2(20) not null,
  TNO   VARCHAR2(20) not null
)
;

prompt Creating T_GRADE...
create table T_GRADE
(
  LOW  NUMBER(3),
  UPP  NUMBER(3),
  RANK CHAR(1)
)
;

prompt Creating T_MODULES...
create table T_MODULES
(
  M_ID        NUMBER(5) not null,
  M_NAME      VARCHAR2(100) not null,
  M_LEVEL     NUMBER(5) not null,
  P_ID        NUMBER(5),
  CREATE_TIME DATE,
  UPDATE_TIME DATE,
  WEB_INFO    VARCHAR2(500)
)
;
comment on table T_MODULES
  is '模块表';
comment on column T_MODULES.M_ID
  is '模块id';
comment on column T_MODULES.M_NAME
  is '模块名';
comment on column T_MODULES.M_LEVEL
  is '模块层次';
comment on column T_MODULES.P_ID
  is '父模块id';
comment on column T_MODULES.CREATE_TIME
  is '创建时间';
comment on column T_MODULES.UPDATE_TIME
  is '更新时间';
comment on column T_MODULES.WEB_INFO
  is '网址';
alter table T_MODULES
  add constraint T_MODULES_M_ID_PK primary key (M_ID);

prompt Creating T_POWERS...
create table T_POWERS
(
  R_ID        NUMBER(9) not null,
  M_ID        NUMBER(9) not null,
  CREATE_TIME DATE,
  UPDATE_TIME DATE
)
;
comment on table T_POWERS
  is '权限表';
comment on column T_POWERS.R_ID
  is '角色id';
comment on column T_POWERS.M_ID
  is '模块id';
comment on column T_POWERS.CREATE_TIME
  is '创建时间';
comment on column T_POWERS.UPDATE_TIME
  is '更新时间';
alter table T_POWERS
  add constraint T_POWERS_R_ID_M_ID_PK primary key (R_ID, M_ID);

prompt Creating T_ROLES...
create table T_ROLES
(
  R_ID        NUMBER(9) not null,
  R_NAME      VARCHAR2(50) not null,
  STATE       NUMBER(2) not null,
  CREATE_TIME DATE,
  UPDATE_TIME DATE
)
;
comment on table T_ROLES
  is '角色表';
comment on column T_ROLES.R_ID
  is '角色id';
comment on column T_ROLES.R_NAME
  is '角色名';
comment on column T_ROLES.STATE
  is '状态';
comment on column T_ROLES.CREATE_TIME
  is '创建时间';
comment on column T_ROLES.UPDATE_TIME
  is '更新时间';
alter table T_ROLES
  add primary key (R_ID);

prompt Creating T_SCORE...
create table T_SCORE
(
  SNO    VARCHAR2(20) not null,
  CNO    VARCHAR2(20) not null,
  DEGREE NUMBER(10,1) not null
)
;

prompt Creating T_STUDENT...
create table T_STUDENT
(
  SNO       VARCHAR2(20) not null,
  SNAME     VARCHAR2(20) not null,
  SSEX      VARCHAR2(10) not null,
  SBIRTHDAY DATE,
  CLASS     VARCHAR2(20)
)
;

prompt Creating T_SYS_LOG...
create table T_SYS_LOG
(
  LOG_ID      NUMBER(18) not null,
  LOG_INFO    VARCHAR2(200),
  CREATE_DATE TIMESTAMP(6),
  USER_NAME   VARCHAR2(200) not null,
  REMARK      VARCHAR2(200),
  LOG_TYPE    NUMBER(1) default 0
)
;
comment on table T_SYS_LOG
  is '系统日志表';
comment on column T_SYS_LOG.LOG_ID
  is '主键';
comment on column T_SYS_LOG.CREATE_DATE
  is '创建时间';
comment on column T_SYS_LOG.REMARK
  is '备注';
comment on column T_SYS_LOG.LOG_TYPE
  is '-1:DEBUG 0:INFO 1:WARAING 2:ERROR';
alter table T_SYS_LOG
  add primary key (LOG_ID);

prompt Creating T_TEACHER...
create table T_TEACHER
(
  TNO       VARCHAR2(10) not null,
  TNAME     VARCHAR2(20) not null,
  TSEX      VARCHAR2(20) not null,
  TBIRTHDAY DATE not null,
  PROF      VARCHAR2(20),
  DEPART    VARCHAR2(20) not null
)
;

prompt Creating T_USERS...
create table T_USERS
(
  U_ID        NUMBER(9) not null,
  U_NAME      VARCHAR2(50) not null,
  U_PASSWORD  VARCHAR2(100) not null,
  U_GENDER    VARCHAR2(10),
  U_BIRTHDAY  DATE,
  R_ID        NUMBER(9),
  C_ID        NUMBER(9),
  STATE       NUMBER(2) not null,
  CREATE_TIME DATE,
  UPDATE_TIME DATE
)
;
comment on table T_USERS
  is '用户表';
comment on column T_USERS.U_ID
  is '用户id';
comment on column T_USERS.U_NAME
  is '用户名';
comment on column T_USERS.U_PASSWORD
  is '密码';
comment on column T_USERS.U_GENDER
  is '性别';
comment on column T_USERS.U_BIRTHDAY
  is '生日';
comment on column T_USERS.R_ID
  is '角色id';
comment on column T_USERS.C_ID
  is '教室id';
comment on column T_USERS.STATE
  is '状态';
comment on column T_USERS.CREATE_TIME
  is '创建时间';
comment on column T_USERS.UPDATE_TIME
  is '更新时间';
alter table T_USERS
  add primary key (U_ID);

prompt Creating T_USER_INFO...
create table T_USER_INFO
(
  USER_ID     NUMBER(9) not null,
  USER_NAME   VARCHAR2(200) not null,
  USER_PSW    VARCHAR2(200),
  CREATE_TIME TIMESTAMP(6),
  REMARK      VARCHAR2(400)
)
;
comment on table T_USER_INFO
  is '用户表';
comment on column T_USER_INFO.USER_ID
  is '主键';
comment on column T_USER_INFO.USER_NAME
  is '用户名';
comment on column T_USER_INFO.USER_PSW
  is '密码';
comment on column T_USER_INFO.CREATE_TIME
  is '注册时间';
comment on column T_USER_INFO.REMARK
  is '备注';
alter table T_USER_INFO
  add primary key (USER_ID);
create unique index T_USER_INFO_USER_NAME_UINDEX on T_USER_INFO (USER_NAME);

prompt Disabling triggers for DEPT...
alter table DEPT disable all triggers;
prompt Disabling triggers for EMP...
alter table EMP disable all triggers;
prompt Disabling triggers for SCORE...
alter table SCORE disable all triggers;
prompt Disabling triggers for SUBJECT...
alter table SUBJECT disable all triggers;
prompt Disabling triggers for T_ATTENDANCE...
alter table T_ATTENDANCE disable all triggers;
prompt Disabling triggers for T_COURSE...
alter table T_COURSE disable all triggers;
prompt Disabling triggers for T_GRADE...
alter table T_GRADE disable all triggers;
prompt Disabling triggers for T_MODULES...
alter table T_MODULES disable all triggers;
prompt Disabling triggers for T_POWERS...
alter table T_POWERS disable all triggers;
prompt Disabling triggers for T_ROLES...
alter table T_ROLES disable all triggers;
prompt Disabling triggers for T_SCORE...
alter table T_SCORE disable all triggers;
prompt Disabling triggers for T_STUDENT...
alter table T_STUDENT disable all triggers;
prompt Disabling triggers for T_SYS_LOG...
alter table T_SYS_LOG disable all triggers;
prompt Disabling triggers for T_TEACHER...
alter table T_TEACHER disable all triggers;
prompt Disabling triggers for T_USERS...
alter table T_USERS disable all triggers;
prompt Disabling triggers for T_USER_INFO...
alter table T_USER_INFO disable all triggers;
prompt Disabling foreign key constraints for EMP...
alter table EMP disable constraint SYS_C006990;
alter table EMP disable constraint SYS_C006991;
prompt Loading DEPT...
insert into DEPT (DEPTNO, DNAME, LOC)
values (10, 'ACCOUNTING', 'NEW YORK');
insert into DEPT (DEPTNO, DNAME, LOC)
values (20, 'RESEARCH', 'DALLAS');
insert into DEPT (DEPTNO, DNAME, LOC)
values (30, 'SALES', 'CHICAGO');
insert into DEPT (DEPTNO, DNAME, LOC)
values (40, 'OPERATIONS', 'BOSTON');
insert into DEPT (DEPTNO, DNAME, LOC)
values (80, '运营部', '南昌');
insert into DEPT (DEPTNO, DNAME, LOC)
values (25, '技术部2', null);
insert into DEPT (DEPTNO, DNAME, LOC)
values (26, '技术部3', null);
insert into DEPT (DEPTNO, DNAME, LOC)
values (23, '技术部', null);
insert into DEPT (DEPTNO, DNAME, LOC)
values (24, '技术部1', null);
insert into DEPT (DEPTNO, DNAME, LOC)
values (11, '财务部', null);
commit;
prompt 10 records loaded
prompt Loading EMP...
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7839, 'KING', 'PRESIDENT', null, to_date('17-11-1981', 'dd-mm-yyyy'), 5000, null, 10);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7698, 'BLAKE', 'MANAGER', 7839, to_date('01-05-1981', 'dd-mm-yyyy'), 2850, null, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7782, 'CLARK', 'MANAGER', 7839, to_date('09-06-1981', 'dd-mm-yyyy'), 2450, null, 10);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7566, 'JONES', 'MANAGER', 7839, to_date('02-04-1981', 'dd-mm-yyyy'), 2975, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7788, 'SCOTT', 'ANALYST', 7566, to_date('09-12-1982', 'dd-mm-yyyy'), 3000, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7902, 'FORD', 'ANALYST', 7566, to_date('03-12-1981', 'dd-mm-yyyy'), 3000, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7369, 'SMITH', 'CLERK', 7902, to_date('17-12-1980', 'dd-mm-yyyy'), 1800, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-02-1981', 'dd-mm-yyyy'), 2100, 300, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7521, 'WARD', 'SALESMAN', 7698, to_date('22-02-1981', 'dd-mm-yyyy'), 1750, 500, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-09-1981', 'dd-mm-yyyy'), 1750, 1400, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7844, 'TURNER', 'SALESMAN', 7698, to_date('08-09-1981', 'dd-mm-yyyy'), 2000, 0, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7876, 'ADAMS', 'CLERK', 7788, to_date('12-01-1983', 'dd-mm-yyyy'), 1600, null, 20);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7900, 'JAMES', 'CLERK', 7698, to_date('03-12-1981', 'dd-mm-yyyy'), 1450, null, 30);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7934, 'MILLER', 'CLERK', 7782, to_date('23-01-1982', 'dd-mm-yyyy'), 1800, null, 10);
insert into EMP (EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
values (7767, '小黑', '程序员', null, null, null, null, null);
commit;
prompt 15 records loaded
prompt Loading SCORE...
prompt Table is empty
prompt Loading SUBJECT...
insert into SUBJECT (SUBJECT_ID, SUBJECT_NAME)
values (1, 'java');
insert into SUBJECT (SUBJECT_ID, SUBJECT_NAME)
values (2, 'html');
insert into SUBJECT (SUBJECT_ID, SUBJECT_NAME)
values (3, 'oracle');
commit;
prompt 3 records loaded
prompt Loading T_ATTENDANCE...
insert into T_ATTENDANCE (ATTEND_ID, EMP_ID, ATTEND_STATE, CHECK_TIME)
values (6, 7902, 1, null);
insert into T_ATTENDANCE (ATTEND_ID, EMP_ID, ATTEND_STATE, CHECK_TIME)
values (7, 7839, 1, null);
insert into T_ATTENDANCE (ATTEND_ID, EMP_ID, ATTEND_STATE, CHECK_TIME)
values (1, 7839, 1, null);
insert into T_ATTENDANCE (ATTEND_ID, EMP_ID, ATTEND_STATE, CHECK_TIME)
values (2, 7839, 2, null);
insert into T_ATTENDANCE (ATTEND_ID, EMP_ID, ATTEND_STATE, CHECK_TIME)
values (3, 7839, 3, null);
insert into T_ATTENDANCE (ATTEND_ID, EMP_ID, ATTEND_STATE, CHECK_TIME)
values (4, 7788, 1, null);
insert into T_ATTENDANCE (ATTEND_ID, EMP_ID, ATTEND_STATE, CHECK_TIME)
values (5, 7788, 2, null);
commit;
prompt 7 records loaded
prompt Loading T_COURSE...
insert into T_COURSE (CNO, CNAME, TNO)
values ('3-105', '计算机导论', '825');
insert into T_COURSE (CNO, CNAME, TNO)
values ('3-245', '操作系统', '804');
insert into T_COURSE (CNO, CNAME, TNO)
values ('6-166', '数据电路', '856');
insert into T_COURSE (CNO, CNAME, TNO)
values ('9-888', '高等数学', '100');
commit;
prompt 4 records loaded
prompt Loading T_GRADE...
insert into T_GRADE (LOW, UPP, RANK)
values (90, 100, 'a');
insert into T_GRADE (LOW, UPP, RANK)
values (80, 89, 'b');
insert into T_GRADE (LOW, UPP, RANK)
values (70, 79, 'c');
insert into T_GRADE (LOW, UPP, RANK)
values (60, 69, 'd');
insert into T_GRADE (LOW, UPP, RANK)
values (0, 59, 'e');
commit;
prompt 5 records loaded
prompt Loading T_MODULES...
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (1, '系统管理', 0, 3, to_date('22-12-2018 10:18:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2019', 'dd-mm-yyyy'), '个');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (2, '学员管理', 0, 2, to_date('22-12-2018 10:18:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2019', 'dd-mm-yyyy'), '哈哈哈');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (3, '班级管理', 0, null, to_date('22-12-2018 10:18:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:52', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (4, '就业管理', 0, null, to_date('22-12-2018 10:18:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:52', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (5, '营销管理', 0, 5, to_date('22-12-2018 10:18:52', 'dd-mm-yyyy hh24:mi:ss'), to_date('01-01-2019', 'dd-mm-yyyy'), '哈哈哈哈');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (7, '模块管理', 1, 1, to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), '/module/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (8, '公告管理', 1, 1, to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), '/notice/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (9, '角色管理', 1, 1, to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), '/role/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (10, '用户管理', 1, 1, to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), '/user/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (13, '学员信息', 1, 2, to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), '/student/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (14, '考勤管理', 1, 2, to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), '/attendance/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (15, '职业发展谈话管理', 1, 2, to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), '/careerPlan/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (16, '班级管理', 1, 3, to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), '/class/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (17, '评审管理', 1, 3, to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), '/project/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (18, '班级活动', 1, 3, to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), '/activity/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (19, '入职管理', 1, 4, to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:53', 'dd-mm-yyyy hh24:mi:ss'), '/job/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (20, '面试管理', 1, 4, to_date('22-12-2018 10:18:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:54', 'dd-mm-yyyy hh24:mi:ss'), '/interview/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (21, '企业管理', 1, 4, to_date('22-12-2018 10:18:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:54', 'dd-mm-yyyy hh24:mi:ss'), '/company/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (22, '客户信息', 1, 5, to_date('22-12-2018 10:18:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:54', 'dd-mm-yyyy hh24:mi:ss'), '/customer/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (23, '渠道管理', 1, 5, to_date('22-12-2018 10:18:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:54', 'dd-mm-yyyy hh24:mi:ss'), '/way/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (24, '中心管理', 1, 5, to_date('22-12-2018 10:18:54', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:18:54', 'dd-mm-yyyy hh24:mi:ss'), '/center/list');
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (25, '安全管理', 1, null, to_date('01-01-1970 20:55:13', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (26, '安全管理1', 1, null, to_date('01-01-1970 08:00:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into T_MODULES (M_ID, M_NAME, M_LEVEL, P_ID, CREATE_TIME, UPDATE_TIME, WEB_INFO)
values (28, '安全管理', 1, null, to_date('01-01-1970 08:07:45', 'dd-mm-yyyy hh24:mi:ss'), null, null);
commit;
prompt 24 records loaded
prompt Loading T_POWERS...
insert into T_POWERS (R_ID, M_ID, CREATE_TIME, UPDATE_TIME)
values (0, 1, to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into T_POWERS (R_ID, M_ID, CREATE_TIME, UPDATE_TIME)
values (0, 2, to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into T_POWERS (R_ID, M_ID, CREATE_TIME, UPDATE_TIME)
values (0, 3, to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into T_POWERS (R_ID, M_ID, CREATE_TIME, UPDATE_TIME)
values (0, 4, to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into T_POWERS (R_ID, M_ID, CREATE_TIME, UPDATE_TIME)
values (0, 5, to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'));
insert into T_POWERS (R_ID, M_ID, CREATE_TIME, UPDATE_TIME)
values (0, 6, to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:21:03', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 6 records loaded
prompt Loading T_ROLES...
insert into T_ROLES (R_ID, R_NAME, STATE, CREATE_TIME, UPDATE_TIME)
values (0, '超级管理员', 0, to_date('22-12-2018 10:22:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('02-01-2019', 'dd-mm-yyyy'));
insert into T_ROLES (R_ID, R_NAME, STATE, CREATE_TIME, UPDATE_TIME)
values (1, '管理员', 1, to_date('22-12-2018 10:22:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:22:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into T_ROLES (R_ID, R_NAME, STATE, CREATE_TIME, UPDATE_TIME)
values (2, '老师', 1, to_date('22-12-2018 10:22:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:22:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into T_ROLES (R_ID, R_NAME, STATE, CREATE_TIME, UPDATE_TIME)
values (3, '学员', 1, to_date('22-12-2018 10:22:05', 'dd-mm-yyyy hh24:mi:ss'), to_date('22-12-2018 10:22:05', 'dd-mm-yyyy hh24:mi:ss'));
insert into T_ROLES (R_ID, R_NAME, STATE, CREATE_TIME, UPDATE_TIME)
values (32, '657', 0, to_date('31-12-2018', 'dd-mm-yyyy'), null);
insert into T_ROLES (R_ID, R_NAME, STATE, CREATE_TIME, UPDATE_TIME)
values (33, 'ryer', 0, to_date('31-12-2018', 'dd-mm-yyyy'), null);
insert into T_ROLES (R_ID, R_NAME, STATE, CREATE_TIME, UPDATE_TIME)
values (34, '54y', 1, to_date('31-12-2018', 'dd-mm-yyyy'), null);
insert into T_ROLES (R_ID, R_NAME, STATE, CREATE_TIME, UPDATE_TIME)
values (35, 'rehy', 0, to_date('31-12-2018', 'dd-mm-yyyy'), null);
insert into T_ROLES (R_ID, R_NAME, STATE, CREATE_TIME, UPDATE_TIME)
values (36, 'et', 1, to_date('31-12-2018', 'dd-mm-yyyy'), null);
commit;
prompt 9 records loaded
prompt Loading T_SCORE...
insert into T_SCORE (SNO, CNO, DEGREE)
values ('103', '3-245', 86);
insert into T_SCORE (SNO, CNO, DEGREE)
values ('105', '3-245', 75);
insert into T_SCORE (SNO, CNO, DEGREE)
values ('109', '3-245', 68);
insert into T_SCORE (SNO, CNO, DEGREE)
values ('103', '3-105', 92);
insert into T_SCORE (SNO, CNO, DEGREE)
values ('105', '3-105', 88);
insert into T_SCORE (SNO, CNO, DEGREE)
values ('109', '3-105', 76);
insert into T_SCORE (SNO, CNO, DEGREE)
values ('101', '3-105', 64);
insert into T_SCORE (SNO, CNO, DEGREE)
values ('107', '3-105', 91);
insert into T_SCORE (SNO, CNO, DEGREE)
values ('108', '3-105', 78);
insert into T_SCORE (SNO, CNO, DEGREE)
values ('101', '6-166', 85);
insert into T_SCORE (SNO, CNO, DEGREE)
values ('107', '6-106', 79);
insert into T_SCORE (SNO, CNO, DEGREE)
values ('108', '6-166', 81);
commit;
prompt 12 records loaded
prompt Loading T_STUDENT...
insert into T_STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS)
values ('108', '曾华', '男', to_date('01-09-1977', 'dd-mm-yyyy'), '95033');
insert into T_STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS)
values ('105', '匡明', '男', to_date('02-10-1975', 'dd-mm-yyyy'), '95031');
insert into T_STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS)
values ('107', '王丽', '女', to_date('23-01-1976', 'dd-mm-yyyy'), '95033');
insert into T_STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS)
values ('101', '李军', '男', to_date('20-02-1976', 'dd-mm-yyyy'), '95033');
insert into T_STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS)
values ('109', '王芳', '女', to_date('10-02-1975', 'dd-mm-yyyy'), '95031');
insert into T_STUDENT (SNO, SNAME, SSEX, SBIRTHDAY, CLASS)
values ('103', '陆君', '男', to_date('03-06-1974', 'dd-mm-yyyy'), '95031');
commit;
prompt 6 records loaded
prompt Loading T_SYS_LOG...
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (2, '测试日志添加', to_timestamp('03-01-2019 14:38:36.258000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'zs', null, null);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (3, '测试日志添加', to_timestamp('03-01-2019 14:46:33.733000', 'dd-mm-yyyy hh24:mi:ss.ff'), '123', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (10, '执行了show方法', to_timestamp('03-01-2019 15:50:11.068000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (11, '执行了list方法', to_timestamp('03-01-2019 15:51:02.306000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (18, '执行了show方法', to_timestamp('04-01-2019 11:12:53.700000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (19, '执行了list方法', to_timestamp('04-01-2019 11:13:05.013000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (24, '打开教师信息列表', to_timestamp('04-01-2019 14:46:15.445000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'abc', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (1, '测试日志添加', to_timestamp('03-01-2019 14:35:12.871000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, null);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (6, '执行了showLogin方法', to_timestamp('03-01-2019 15:43:22.808000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (7, '执行了login方法', to_timestamp('03-01-2019 15:46:39.935000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (8, '执行了show方法', to_timestamp('03-01-2019 15:46:56.734000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (9, '执行了list方法', to_timestamp('03-01-2019 15:47:05.423000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (12, '执行了show方法', to_timestamp('03-01-2019 22:41:58.502000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (13, '执行了list方法', to_timestamp('03-01-2019 22:46:24.774000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (14, '执行了show方法', to_timestamp('03-01-2019 22:50:39.184000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (15, '执行了list方法', to_timestamp('03-01-2019 22:56:43.927000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (16, '执行了show方法', to_timestamp('04-01-2019 11:09:11.878000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (17, '执行了list方法', to_timestamp('04-01-2019 11:09:22.806000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (20, '打开教师信息列表', to_timestamp('04-01-2019 11:35:21.021000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'abc', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (21, '显示教师列表数据', to_timestamp('04-01-2019 11:36:17.883000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'abc', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (22, '查看教师信息', to_timestamp('04-01-2019 11:36:53.020000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'abc', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (23, '添加一条教师数据', to_timestamp('04-01-2019 11:37:18.307000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'abc', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (41, '打开教师信息列表', to_timestamp('09-01-2019 17:35:05.385000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'abc', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (42, '显示教师列表数据', to_timestamp('09-01-2019 17:35:09.579000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'abc', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (61, '测试日志添加', to_timestamp('20-02-2019 21:03:39.738000', 'dd-mm-yyyy hh24:mi:ss.ff'), '123', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (4, '测试日志添加', to_timestamp('03-01-2019 14:52:13.207000', 'dd-mm-yyyy hh24:mi:ss.ff'), '123', null, 0);
insert into T_SYS_LOG (LOG_ID, LOG_INFO, CREATE_DATE, USER_NAME, REMARK, LOG_TYPE)
values (5, '执行了list方法', to_timestamp('03-01-2019 14:59:03.584000', 'dd-mm-yyyy hh24:mi:ss.ff'), '匿名', null, 0);
commit;
prompt 27 records loaded
prompt Loading T_TEACHER...
insert into T_TEACHER (TNO, TNAME, TSEX, TBIRTHDAY, PROF, DEPART)
values ('804', '李诚', '男', to_date('02-12-1958', 'dd-mm-yyyy'), '副教授', '计算机系');
insert into T_TEACHER (TNO, TNAME, TSEX, TBIRTHDAY, PROF, DEPART)
values ('856', '张旭', '男', to_date('12-03-1969', 'dd-mm-yyyy'), '讲师', '电子工程系');
insert into T_TEACHER (TNO, TNAME, TSEX, TBIRTHDAY, PROF, DEPART)
values ('825', '王萍', '女', to_date('05-05-1972', 'dd-mm-yyyy'), '助教', '计算机系');
insert into T_TEACHER (TNO, TNAME, TSEX, TBIRTHDAY, PROF, DEPART)
values ('831', '刘冰', '女', to_date('14-08-1977', 'dd-mm-yyyy'), '助教', '电子工程系');
commit;
prompt 4 records loaded
prompt Loading T_USERS...
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (45, 'yhyh', 'yhyh', '女', to_date('04-12-2018', 'dd-mm-yyyy'), 3, 5, 0, to_date('20-01-2019', 'dd-mm-yyyy'), to_date('22-01-2019', 'dd-mm-yyyy'));
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (20, '35', '46', '女', to_date('31-12-2018', 'dd-mm-yyyy'), 1, null, 1, to_date('01-01-2019', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'));
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (21, '21', '21', '女', to_date('04-12-2018', 'dd-mm-yyyy'), 2, null, 1, to_date('01-01-2019', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'));
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (42, 'admin', 'admin', '男', to_date('04-12-2018', 'dd-mm-yyyy'), 1, null, 0, to_date('01-01-2019', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'));
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (10, '524', '4', '男', to_date('11-12-2018', 'dd-mm-yyyy'), 3, 4, 1, null, null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (11, '安抚', 'rf', '男', to_date('03-12-2018', 'dd-mm-yyyy'), 3, 2, 1, null, null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (22, '35', '46', '男', to_date('15-12-2018', 'dd-mm-yyyy'), 3, 1, 1, null, null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (41, '王五', '123', '男', to_date('10-12-2018', 'dd-mm-yyyy'), 1, null, 1, null, to_date('01-01-2019', 'dd-mm-yyyy'));
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (43, '425', '4', '男', to_date('27-11-2018', 'dd-mm-yyyy'), 3, 1, 1, null, null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (24, '45', '45', '男', to_date('28-11-2018', 'dd-mm-yyyy'), 3, 2, 1, null, null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (19, 'aaa', 'aaa', '女', to_date('04-12-2018', 'dd-mm-yyyy'), 3, 1, 1, null, null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (2, '张三', 'zs', '男', to_date('04-12-2018', 'dd-mm-yyyy'), 1, 1, 0, null, null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (46, '245', '3245', '男', to_date('27-11-2018', 'dd-mm-yyyy'), 2, null, 1, to_date('31-12-2018', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'));
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (47, '45', '35', '男', to_date('11-12-2018', 'dd-mm-yyyy'), 2, null, 1, to_date('31-12-2018', 'dd-mm-yyyy'), to_date('01-01-2019', 'dd-mm-yyyy'));
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (48, '56', '6y', '男', to_date('12-12-2018', 'dd-mm-yyyy'), 2, null, 1, to_date('31-12-2018', 'dd-mm-yyyy'), null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (49, '465', '45', '男', to_date('05-12-2018', 'dd-mm-yyyy'), 2, null, 1, to_date('31-12-2018', 'dd-mm-yyyy'), null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (50, '365', '345', '女', to_date('04-01-2019', 'dd-mm-yyyy'), 3, null, 0, to_date('31-12-2018', 'dd-mm-yyyy'), null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (51, 'sys', 'sc', '女', to_date('07-01-2019', 'dd-mm-yyyy'), 1, null, 1, to_date('01-01-2019', 'dd-mm-yyyy'), null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (52, '方好', 'fh', '男', to_date('17-01-2019', 'dd-mm-yyyy'), 1, null, 1, to_date('01-01-2019', 'dd-mm-yyyy'), null);
insert into T_USERS (U_ID, U_NAME, U_PASSWORD, U_GENDER, U_BIRTHDAY, R_ID, C_ID, STATE, CREATE_TIME, UPDATE_TIME)
values (53, '乐灵', 'll', '男', to_date('14-01-2019', 'dd-mm-yyyy'), 2, null, 1, to_date('01-01-2019', 'dd-mm-yyyy'), null);
commit;
prompt 20 records loaded
prompt Loading T_USER_INFO...
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (136, 'XXXXX', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (53, '11', '222222', to_timestamp('28-12-2018 20:57:10.265000', 'dd-mm-yyyy hh24:mi:ss.ff'), '111');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (45, '00', '45', to_timestamp('28-12-2018 20:43:17.504000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'sgf g');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (137, '策士', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (48, 'eshrg', 'shtg', to_timestamp('28-12-2018 20:46:19.017000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'dhgf会话');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (51, '222', '222', to_timestamp('28-12-2018 20:56:05.186000', 'dd-mm-yyyy hh24:mi:ss.ff'), '222');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (56, '333', '3333', to_timestamp('28-12-2018 20:58:55.014000', 'dd-mm-yyyy hh24:mi:ss.ff'), '33333');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (57, '5555', '5555', to_timestamp('28-12-2018 20:59:05.140000', 'dd-mm-yyyy hh24:mi:ss.ff'), '5555');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (58, '4444', '44444444', to_timestamp('28-12-2018 20:59:24.731000', 'dd-mm-yyyy hh24:mi:ss.ff'), '4444444');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (59, '1', '1', to_timestamp('28-12-2018 21:01:29.199000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (60, '45', '2542', to_timestamp('28-12-2018 21:04:05.787000', 'dd-mm-yyyy hh24:mi:ss.ff'), '424');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (61, '52', '152', to_timestamp('28-12-2018 21:04:35.914000', 'dd-mm-yyyy hh24:mi:ss.ff'), '452');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (62, 'gf', 'dfg', to_timestamp('28-12-2018 21:06:15.768000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'sg');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (63, 'sxhr g', 'xdhc', to_timestamp('28-12-2018 21:07:28.830000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'xhdgf');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (64, 'w rg', 'zdg', to_timestamp('28-12-2018 21:08:23.968000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'evrf');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (65, 'dyt', 'cnfy', to_timestamp('28-12-2018 21:09:32.171000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'bctf');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (66, '75', '42', to_timestamp('28-12-2018 21:17:04.362000', 'dd-mm-yyyy hh24:mi:ss.ff'), '421');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (67, '54', '45', to_timestamp('28-12-2018 21:17:34.152000', 'dd-mm-yyyy hh24:mi:ss.ff'), '45');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (68, '544', '4523', to_timestamp('28-12-2018 21:18:08.967000', 'dd-mm-yyyy hh24:mi:ss.ff'), '41');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (73, '47', '21', to_timestamp('28-12-2018 21:18:23.070000', 'dd-mm-yyyy hh24:mi:ss.ff'), '241');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (74, '41', '42', to_timestamp('28-12-2018 21:18:31.404000', 'dd-mm-yyyy hh24:mi:ss.ff'), '1');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (76, 'dxg', 'dxb', to_timestamp('28-12-2018 21:18:44.805000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'zdx');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (42, '8', null, to_timestamp('28-12-2018 20:22:49.921000', 'dd-mm-yyyy hh24:mi:ss.ff'), '8');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (121, 'aa', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (130, 'aa7', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (131, 'aa8', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (21, 'zhang', '132', to_timestamp('26-12-2018 20:02:22.270000', 'dd-mm-yyyy hh24:mi:ss.ff'), '哈哈哈');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (24, 'admin4524', '4534', to_timestamp('26-12-2018 20:06:35.850000', 'dd-mm-yyyy hh24:mi:ss.ff'), '3453');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (28, '张三123', '4651', to_timestamp('26-12-2018 20:16:05.961000', 'dd-mm-yyyy hh24:mi:ss.ff'), '7524');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (30, '111', '333', to_timestamp('28-12-2018 20:05:20.354000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'hhhhh');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (31, 'rsecf', 'esbg', to_timestamp('28-12-2018 20:07:50.315000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'hhhhhhhhhhhhh');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (32, 'ht', 'fxgb', to_timestamp('28-12-2018 20:08:58.214000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gfncf');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (33, 'rbg', 'dgcb', to_timestamp('28-12-2018 20:09:32.136000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'fxgb');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (34, '34t', 'ersgt', to_timestamp('28-12-2018 20:14:16.805000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'hhhhhhhaaaaaaaaaa');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (35, 'bgfc', 'fgnc', to_timestamp('28-12-2018 20:15:16.401000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'tgbdx');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (36, 'sge', 'dgb', to_timestamp('28-12-2018 20:15:41.125000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'zbg');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (37, 'ehtg', 'tg', to_timestamp('28-12-2018 20:16:21.623000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'gfc');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (38, '666', 'hesdg', to_timestamp('28-12-2018 20:17:46.477000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'xgbf');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (39, '435', '43', to_timestamp('28-12-2018 20:19:28.917000', 'dd-mm-yyyy hh24:mi:ss.ff'), '4342');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (41, '43', '43', to_timestamp('28-12-2018 20:21:41.146000', 'dd-mm-yyyy hh24:mi:ss.ff'), '453');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (77, '254', '4521', to_timestamp('28-12-2018 22:29:22.229000', 'dd-mm-yyyy hh24:mi:ss.ff'), '4521');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (78, 'aw', 'dx', to_timestamp('28-12-2018 22:29:26.523000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'caf');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (27, '李四11', '13242544', to_timestamp('26-12-2018 20:09:12.933000', 'dd-mm-yyyy hh24:mi:ss.ff'), '132456');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (23, 'zhang85', '1324254', to_timestamp('26-12-2018 20:03:10.092000', 'dd-mm-yyyy hh24:mi:ss.ff'), '哈哈哈524');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (79, 'wafs', 'ax', to_timestamp('28-12-2018 22:30:50.116000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'asf');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (83, '566', '666', to_timestamp('29-12-2018 09:27:08.740000', 'dd-mm-yyyy hh24:mi:ss.ff'), 'arge');
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (123, 'aa1', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (124, 'aa2', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (125, 'aa3', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (127, 'aa4', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (128, 'aa5', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (129, 'aa6', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (132, 'aa10', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (133, 'aa11', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (134, 'aa12', '123', null, null);
insert into T_USER_INFO (USER_ID, USER_NAME, USER_PSW, CREATE_TIME, REMARK)
values (135, 'aa54', '123', null, null);
commit;
prompt 56 records loaded
prompt Enabling foreign key constraints for EMP...
alter table EMP enable constraint SYS_C006990;
alter table EMP enable constraint SYS_C006991;
prompt Enabling triggers for DEPT...
alter table DEPT enable all triggers;
prompt Enabling triggers for EMP...
alter table EMP enable all triggers;
prompt Enabling triggers for SCORE...
alter table SCORE enable all triggers;
prompt Enabling triggers for SUBJECT...
alter table SUBJECT enable all triggers;
prompt Enabling triggers for T_ATTENDANCE...
alter table T_ATTENDANCE enable all triggers;
prompt Enabling triggers for T_COURSE...
alter table T_COURSE enable all triggers;
prompt Enabling triggers for T_GRADE...
alter table T_GRADE enable all triggers;
prompt Enabling triggers for T_MODULES...
alter table T_MODULES enable all triggers;
prompt Enabling triggers for T_POWERS...
alter table T_POWERS enable all triggers;
prompt Enabling triggers for T_ROLES...
alter table T_ROLES enable all triggers;
prompt Enabling triggers for T_SCORE...
alter table T_SCORE enable all triggers;
prompt Enabling triggers for T_STUDENT...
alter table T_STUDENT enable all triggers;
prompt Enabling triggers for T_SYS_LOG...
alter table T_SYS_LOG enable all triggers;
prompt Enabling triggers for T_TEACHER...
alter table T_TEACHER enable all triggers;
prompt Enabling triggers for T_USERS...
alter table T_USERS enable all triggers;
prompt Enabling triggers for T_USER_INFO...
alter table T_USER_INFO enable all triggers;
set feedback on
set define on
prompt Done.
