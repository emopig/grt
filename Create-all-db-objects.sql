----------------------------------------------------
-- Export file for user GRT                       --
-- Created by Zengwang Lin on 2016/9/26, 16:14:06 --
----------------------------------------------------

spool Create-all-db-objects.log

prompt
prompt Creating table GRT_GROUP
prompt ========================
prompt
create table GRT_GROUP
(
  line VARCHAR2(10),
  grp  VARCHAR2(10)
)
;
comment on column GRT_GROUP.line
  is '线别';
comment on column GRT_GROUP.grp
  is '模组';

prompt
prompt Creating table GRT_LINE
prompt =======================
prompt
create table GRT_LINE
(
  line VARCHAR2(10),
  am1  VARCHAR2(4),
  am2  VARCHAR2(4),
  pm1  VARCHAR2(4),
  pm2  VARCHAR2(4)
)
;

prompt
prompt Creating table GRT_LOT_DTL
prompt ==========================
prompt
create table GRT_LOT_DTL
(
  line     VARCHAR2(10) not null,
  whl_no   VARCHAR2(10) not null,
  turn     NUMBER(3) not null,
  ssize    VARCHAR2(10) not null,
  lot_no   VARCHAR2(10) not null,
  grp      VARCHAR2(10) not null,
  qty      NUMBER(13,2),
  dzn      NUMBER(13,2),
  user_id  VARCHAR2(30),
  sys_date DATE,
  style    VARCHAR2(30),
  flag     VARCHAR2(1)
)
;
alter table GRT_LOT_DTL
  add constraint GRT_LOT_DTL_PK primary key (LINE, WHL_NO, TURN, SSIZE, LOT_NO, GRP);

prompt
prompt Creating table GRT_MY_SIZE
prompt ==========================
prompt
create table GRT_MY_SIZE
(
  line   VARCHAR2(10) not null,
  pid    VARCHAR2(10) not null,
  whl_no VARCHAR2(10) not null,
  part   VARCHAR2(30) not null,
  grp    VARCHAR2(10) not null,
  ssize  VARCHAR2(10) not null,
  wid    VARCHAR2(30) not null,
  wname  VARCHAR2(30)
)
;
alter table GRT_MY_SIZE
  add constraint GRT_MY_SIZE_PK primary key (LINE, PID, WHL_NO, PART, GRP, SSIZE, WID);

prompt
prompt Creating table GRT_PART
prompt =======================
prompt
create table GRT_PART
(
  line     VARCHAR2(10),
  style    VARCHAR2(30),
  part     VARCHAR2(30),
  user_id  VARCHAR2(30) default 'SYSTEM',
  sys_date DATE default SYSDATE,
  pid      VARCHAR2(10),
  limit    NUMBER(3)
)
;

prompt
prompt Creating table GRT_PC
prompt =====================
prompt
create table GRT_PC
(
  line VARCHAR2(10),
  pid  VARCHAR2(10),
  pc   VARCHAR2(30)
)
;

prompt
prompt Creating table GRT_PLAN
prompt =======================
prompt
create table GRT_PLAN
(
  line     VARCHAR2(10) not null,
  style    VARCHAR2(30),
  pid      VARCHAR2(10) not null,
  part     VARCHAR2(30) not null,
  turn1    NUMBER(3) not null,
  turn2    NUMBER(3),
  user_id  VARCHAR2(30) default 'SYSTEM',
  sys_date DATE default SYSDATE,
  whl_no   VARCHAR2(10) not null,
  qty      NUMBER(13,2),
  dzn      NUMBER(13,2),
  flag     VARCHAR2(1),
  ptime1   DATE,
  ptime2   DATE
)
;
alter table GRT_PLAN
  add constraint GRT_PLAN primary key (LINE, WHL_NO, PART, TURN1, PID);

prompt
prompt Creating table GRT_POS
prompt ======================
prompt
create table GRT_POS
(
  line     VARCHAR2(10),
  user_id  VARCHAR2(30) default 'SYSTEM',
  sys_date DATE default SYSDATE,
  pid      VARCHAR2(10),
  pname    VARCHAR2(30)
)
;

prompt
prompt Creating table GRT_PROD
prompt =======================
prompt
create table GRT_PROD
(
  line     VARCHAR2(10) not null,
  lot_no   VARCHAR2(10) not null,
  part     VARCHAR2(30) not null,
  turn     NUMBER(3) not null,
  ssize    VARCHAR2(10) not null,
  qty      NUMBER(13,2),
  dzn      NUMBER(13,2),
  wid      VARCHAR2(30),
  wname    VARCHAR2(30),
  dtime    DATE,
  whl_no   VARCHAR2(10),
  user_id  VARCHAR2(30) default 'SYSTEM',
  sys_date DATE default SYSDATE,
  pid      VARCHAR2(10),
  style    VARCHAR2(30),
  done     VARCHAR2(1),
  grp      VARCHAR2(10) not null,
  ptime    DATE
)
;
alter table GRT_PROD
  add constraint GRT_PROD_PK primary key (LINE, LOT_NO, PART, TURN, SSIZE, GRP);

prompt
prompt Creating table GRT_PROD_ALL
prompt ===========================
prompt
create table GRT_PROD_ALL
(
  line     VARCHAR2(10),
  lot_no   VARCHAR2(10),
  part     VARCHAR2(30),
  turn     NUMBER(3),
  ssize    VARCHAR2(10),
  qty      NUMBER(13,2),
  dzn      NUMBER(13,2),
  wid      VARCHAR2(30),
  wname    VARCHAR2(30),
  dtime    DATE,
  whl_no   VARCHAR2(10),
  user_id  VARCHAR2(30),
  sys_date DATE,
  pid      VARCHAR2(10),
  style    VARCHAR2(30),
  done     VARCHAR2(1),
  grp      VARCHAR2(10),
  bak_date DATE
)
;

prompt
prompt Creating table GRT_PROD_LOT
prompt ===========================
prompt
create table GRT_PROD_LOT
(
  line   VARCHAR2(10) not null,
  whl_no VARCHAR2(10) not null,
  lot_no VARCHAR2(10) not null,
  style  VARCHAR2(30),
  turn1  NUMBER(3),
  turn2  NUMBER(3)
)
;
alter table GRT_PROD_LOT
  add constraint GRT_PROD_LOT_PK primary key (LINE, WHL_NO, LOT_NO);

prompt
prompt Creating table GRT_PROD_PART
prompt ============================
prompt
create table GRT_PROD_PART
(
  line   VARCHAR2(10) not null,
  pid    VARCHAR2(10) not null,
  whl_no VARCHAR2(10) not null,
  part   VARCHAR2(30) not null,
  dturn  NUMBER(3),
  eturn  NUMBER(3),
  style  VARCHAR2(30)
)
;
alter table GRT_PROD_PART
  add constraint GRT_PROD_PART_PK primary key (LINE, PID, WHL_NO, PART);

prompt
prompt Creating table GRT_PROD_SIZE
prompt ============================
prompt
create table GRT_PROD_SIZE
(
  line   VARCHAR2(10) not null,
  pid    VARCHAR2(10) not null,
  whl_no VARCHAR2(10) not null,
  style  VARCHAR2(20) not null,
  part   VARCHAR2(30) not null,
  grp    VARCHAR2(10) not null,
  ssize  VARCHAR2(10) not null,
  wid    VARCHAR2(30),
  wname  VARCHAR2(30)
)
;
alter table GRT_PROD_SIZE
  add constraint GRT_PROD_SIZE primary key (LINE, PID, WHL_NO, STYLE, PART, GRP, SSIZE);
create index GRT_PROD_SIZE_IDX1 on GRT_PROD_SIZE (WID);

prompt
prompt Creating table GRT_PROD_T
prompt =========================
prompt
create table GRT_PROD_T
(
  line   VARCHAR2(10),
  part   VARCHAR2(30),
  turn   NUMBER(3),
  ssize  VARCHAR2(10),
  wid    VARCHAR2(30),
  dtime  DATE,
  whl_no VARCHAR2(10),
  pid    VARCHAR2(10),
  grp    VARCHAR2(10),
  seq    NUMBER(3)
)
;

prompt
prompt Creating table GRT_PROD_WHL
prompt ===========================
prompt
create table GRT_PROD_WHL
(
  line   VARCHAR2(10) not null,
  pid    VARCHAR2(10) not null,
  whl_no VARCHAR2(10) not null,
  eturn  NUMBER(3),
  dturn  NUMBER(3),
  style  VARCHAR2(30)
)
;
alter table GRT_PROD_WHL
  add constraint GRT_PROD_WHL_PK primary key (LINE, PID, WHL_NO);

prompt
prompt Creating table GRT_SHEET
prompt ========================
prompt
create table GRT_SHEET
(
  line     VARCHAR2(10) not null,
  pid      VARCHAR2(1) not null,
  whl_no   VARCHAR2(10) not null,
  part     VARCHAR2(30) not null,
  ssize    VARCHAR2(10) not null,
  turn1    NUMBER(13,2),
  turn2    NUMBER(13,2),
  turn3    NUMBER(13,2),
  turn4    NUMBER(13,2),
  turn5    NUMBER(13,2),
  turn6    NUMBER(13,2),
  turn7    NUMBER(13,2),
  turn8    NUMBER(13,2),
  turn9    NUMBER(13,2),
  turn10   NUMBER(13,2),
  flag     VARCHAR2(1),
  ttype    VARCHAR2(1),
  turn_min NUMBER(3),
  grp      VARCHAR2(10) not null,
  status1  VARCHAR2(1),
  status2  VARCHAR2(1),
  status3  VARCHAR2(1),
  status4  VARCHAR2(1),
  status5  VARCHAR2(1),
  status6  VARCHAR2(1),
  status7  VARCHAR2(1),
  status8  VARCHAR2(1),
  status9  VARCHAR2(1),
  status10 VARCHAR2(1),
  wid      VARCHAR2(30) not null,
  turn_max NUMBER(3)
)
;
alter table GRT_SHEET
  add constraint GRT_SHEET_PK primary key (LINE, PID, WHL_NO, PART, SSIZE, GRP, WID);
create index GRT_SHEET_IDX on GRT_SHEET (WID);

prompt
prompt Creating table GRT_SHEET_TITLE
prompt ==============================
prompt
create table GRT_SHEET_TITLE
(
  line     VARCHAR2(10) not null,
  pid      VARCHAR2(1) not null,
  whl_no   VARCHAR2(10) not null,
  part     VARCHAR2(30) not null,
  turn1    NUMBER(13,2),
  turn2    NUMBER(13,2),
  turn3    NUMBER(13,2),
  turn4    NUMBER(13,2),
  turn5    NUMBER(13,2),
  turn6    NUMBER(13,2),
  turn7    NUMBER(13,2),
  turn8    NUMBER(13,2),
  turn9    NUMBER(13,2),
  turn10   NUMBER(13,2),
  turn_min NUMBER(3),
  ptime1   DATE,
  ptime2   DATE,
  ptime3   DATE,
  ptime4   DATE,
  ptime5   DATE,
  ptime6   DATE,
  ptime7   DATE,
  ptime8   DATE,
  ptime9   DATE,
  ptime10  DATE,
  lot1     VARCHAR2(10),
  lot2     VARCHAR2(10),
  lot3     VARCHAR2(10),
  lot4     VARCHAR2(10),
  lot5     VARCHAR2(10),
  lot6     VARCHAR2(10),
  lot7     VARCHAR2(10),
  lot8     VARCHAR2(10),
  lot9     VARCHAR2(10),
  lot10    VARCHAR2(10),
  wid      VARCHAR2(30) not null,
  turn_max NUMBER(3)
)
;
alter table GRT_SHEET_TITLE
  add constraint GRT_SHEET_TITLE_PK primary key (LINE, PID, WHL_NO, PART, WID);

prompt
prompt Creating table GRT_WHL
prompt ======================
prompt
create table GRT_WHL
(
  line     VARCHAR2(10) not null,
  lot_no   VARCHAR2(10) not null,
  ssize    VARCHAR2(10) not null,
  qty      NUMBER(13,2),
  dzn      NUMBER(13,2),
  whl_no   VARCHAR2(10) not null,
  user_id  VARCHAR2(30) default 'SYSTEM',
  sys_date DATE default SYSDATE,
  style    VARCHAR2(30),
  turn     NUMBER(3) not null,
  flag     VARCHAR2(1)
)
;
alter table GRT_WHL
  add constraint GRT_WHL_PK primary key (LINE, WHL_NO, TURN, SSIZE, LOT_NO);

prompt
prompt Creating table GRT_WORKER
prompt =========================
prompt
create table GRT_WORKER
(
  line     VARCHAR2(10),
  wid      VARCHAR2(30),
  wname    VARCHAR2(30),
  user_id  VARCHAR2(30) default 'SYSTEM',
  sys_date DATE default SYSDATE,
  pid      VARCHAR2(10)
)
;

prompt
prompt Creating view GRT_V_PRE_PLAN
prompt ============================
prompt
create or replace view grt_v_pre_plan as
Select a.line,a.whl_no,a.style,b.pid,b.part,Max(a.turn) disturn,
       (Select Max(turn2) From grt_plan Where line = a.line And whl_no = a.whl_no And pid = b.pid And part = b.part) pturn,
       (Select Max(dturn) From grt_prod_part Where line = a.line And whl_no = a.whl_no And pid = b.pid And part = b.part) dturn
   From grt_lot_dtl a,grt_part b
  Where a.line = b.line And a.style = b.style
    And Nvl(a.flag,'0') = '1'
  Group By a.line,a.whl_no,a.style,b.pid,b.part;

prompt
prompt Creating view GRT_V_PROD_PART
prompt =============================
prompt
create or replace view grt_v_prod_part as
Select a.line, a.pid, a.whl_no, a.part,a.dturn,Rownum - (Select Count(*) From grt_prod_part Where line = a.line And pid = a.pid And whl_no < a.whl_no) row_num
  From grt_prod_part a
 Order By a.line,a.pid,a.whl_no;

prompt
prompt Creating function GRT_F_QTY2DZN
prompt ===============================
prompt
CREATE OR REPLACE Function grt_f_qty2dzn(p_qty Number) Return Number Is
Begin
  Return Trunc(p_qty/12) + Mod(p_qty,12)/100;
End;
/

prompt
prompt Creating view GRT_V_REF001
prompt ==========================
prompt
create or replace view grt_v_ref001 as
Select b.whl_no, b.lot_no, c.wo020_style style, b.wheel_no turn, b.ssize, b.qty, grt_f_qty2dzn(b.qty) dzn
    From gpc.pc_wheel_desc@sfpis a, pc_wheel_attach@sfpis b, wo020@sfmis c
   Where a.whl_no = b.whl_no
     and b.lot_no = c.wo020_lot_no;

prompt
prompt Creating view GRT_V_REF002
prompt ==========================
prompt
create or replace view grt_v_ref002 as
Select a.style, b.name part
  From PC_SC_STYLE_PART@sfpis a, sd_code@sfpis b
 Where b.TABLE_NAME = 'PC_PART_IN_DETAIL'
   And b.FIELD_NAME = 'PART_NO'
   And a.part_no = b.code
   And a.chk_code = '1'
 Order By a.style,a.seq_no;

prompt
prompt Creating function GRT_F_DZN_FMT
prompt ===============================
prompt
CREATE OR REPLACE Function grt_f_dzn_fmt(p_dzn Number) Return Number Is
--合计打后，出现2.05 + 2.07 = 4.12,将其转化为 5 打
  v_qty Number(5);
Begin
  If Trunc(p_dzn) = p_dzn Then
    Return p_dzn;
  End If;

  v_qty := (p_dzn - Trunc(p_dzn)) * 100;
  Return trunc(p_dzn) + grt_f_qty2dzn(v_qty);
End;
/

prompt
prompt Creating function GRT_F_GEN_MY_SHEET
prompt ====================================
prompt
CREATE OR REPLACE Function grt_f_gen_my_sheet(p_line Varchar2,p_pid Varchar2,p_wid Varchar2) Return Varchar2 Is

  --取当前作业员的所有关联鞋部位
  Cursor c_part Is 
    Select a.line,a.pid,a.whl_no,a.part,
           Min(turn) turn_min,Max(turn) turn_max  --当前部位的已派工最小轮次与最大轮次
      From grt_prod_size a,grt_prod b
     Where a.line = b.line And a.pid = b.pid And a.whl_no = b.whl_no And a.part = b.part And a.ssize = b.ssize And a.grp = b.grp
       And a.line = p_line And a.pid = p_pid     
       And a.wid = p_wid
     Group By a.line,a.pid,a.whl_no,a.part
     Order By line,pid,whl_no,part;

  --刚刚形成的 grt_sheet，准备内容行填充数量
  Cursor c_sheet Is
    Select *
      From grt_sheet
     Where line = p_line And pid = p_pid
       And wid = p_wid
     Order By pid,whl_no,part,grp,ssize Desc
     For Update;

  --当前鞋部位当前作业员正要做第几轮
  v_turn Number;
  --当前要显示的轮次起止
  v_turn1 Number;
  v_turn2 Number;

Begin
  --资料清空，重新形成
  Delete grt_sheet Where line = p_line And pid = p_pid And wid = p_wid;
  Delete grt_sheet_title Where line = p_line And pid = p_pid And wid = p_wid;

  --Cursor
  For c1 In c_part Loop    
    --取当前鞋部位本人正在做的最小轮次   
    Select Max(dturn) + 1 Into v_turn From grt_prod_part Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part = c1.part;

    --计算当前要显示的起止轮次；
    v_turn1 := v_turn - 4;
    If v_turn1 < c1.turn_min Then
      v_turn1 := c1.turn_min;
    End If;
    v_turn2 := v_turn + 3;
    If v_turn2 > c1.turn_max Then
      v_turn2 := c1.turn_max;
    End If;

    --形成标题行，包含动态轮次指示行、计划时间、制令
    Insert Into grt_sheet_title(line,pid,whl_no,part,turn_min,turn_max,
                                turn1,turn2,turn3,turn4,turn5,turn6,turn7,turn8,
                                ptime1,ptime2,ptime3,ptime4,ptime5,ptime6,ptime7,ptime8,
                                lot1,lot2,lot3,lot4,lot5,lot6,lot7,lot8,
                                wid)
      Values (c1.line,c1.pid,c1.whl_no,c1.part,v_turn1,v_turn2,
              (Select v_turn1 - 1 + 1 From Dual Where v_turn1 - 1 + 1 Between v_turn1 And v_turn2),
              (Select v_turn1 - 1 + 2 From Dual Where v_turn1 - 1 + 2 Between v_turn1 And v_turn2),
              (Select v_turn1 - 1 + 3 From Dual Where v_turn1 - 1 + 3 Between v_turn1 And v_turn2),
              (Select v_turn1 - 1 + 4 From Dual Where v_turn1 - 1 + 4 Between v_turn1 And v_turn2),
              (Select v_turn1 - 1 + 5 From Dual Where v_turn1 - 1 + 5 Between v_turn1 And v_turn2),
              (Select v_turn1 - 1 + 6 From Dual Where v_turn1 - 1 + 6 Between v_turn1 And v_turn2),
              (Select v_turn1 - 1 + 7 From Dual Where v_turn1 - 1 + 7 Between v_turn1 And v_turn2),
              (Select v_turn1 - 1 + 8 From Dual Where v_turn1 - 1 + 8 Between v_turn1 And v_turn2),
              --每一轮次的计划完成时间
              (Select Max(ptime) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 1 And turn Between v_turn1 And v_turn2),
              (Select Max(ptime) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 2 And turn Between v_turn1 And v_turn2),
              (Select Max(ptime) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 3 And turn Between v_turn1 And v_turn2),
              (Select Max(ptime) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 4 And turn Between v_turn1 And v_turn2),
              (Select Max(ptime) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 5 And turn Between v_turn1 And v_turn2),
              (Select Max(ptime) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 6 And turn Between v_turn1 And v_turn2),
              (Select Max(ptime) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 7 And turn Between v_turn1 And v_turn2),
              (Select Max(ptime) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 8 And turn Between v_turn1 And v_turn2),
              --每一轮次对应的制令
              (Select Max(lot_no) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 1 And turn Between v_turn1 And v_turn2),
              (Select Max(lot_no) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 2 And turn Between v_turn1 And v_turn2),
              (Select Max(lot_no) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 3 And turn Between v_turn1 And v_turn2),
              (Select Max(lot_no) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 4 And turn Between v_turn1 And v_turn2),
              (Select Max(lot_no) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 5 And turn Between v_turn1 And v_turn2),
              (Select Max(lot_no) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 6 And turn Between v_turn1 And v_turn2),
              (Select Max(lot_no) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 7 And turn Between v_turn1 And v_turn2),
              (Select Max(lot_no) From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part=c1.part And turn = v_turn1 - 1 + 8 And turn Between v_turn1 And v_turn2)
              ,p_wid);
    --形成内容行，数量为空
    Insert Into grt_sheet(line,pid,whl_no,part,grp,ssize,turn_min,turn_max,wid)
      Select line,pid,whl_no,part,grp,ssize,
             v_turn1,v_turn2,--要显示的轮次起止
             p_wid  
        From grt_prod_size
       Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part = c1.part
         And wid = p_wid;
  End Loop;

  --内容行数量回填
  For c1 In c_sheet Loop
    Update grt_sheet h Set turn1 = (Select grt_f_qty2dzn(Sum(qty)) From grt_prod
                                     Where line = h.line And pid = h.pid And whl_no = h.whl_no And part = h.part And grp = h.grp And ssize = h.ssize And turn = h.turn_min - 1 + 1
                                       And turn Between c1.turn_min And c1.turn_max),
                           turn2 = (Select grt_f_qty2dzn(Sum(qty)) From grt_prod
                                     Where line = h.line And pid = h.pid And whl_no = h.whl_no And part = h.part And grp = h.grp And ssize = h.ssize And turn = h.turn_min - 1 + 2
                                       And turn Between c1.turn_min And c1.turn_max),
                           turn3 = (Select grt_f_qty2dzn(Sum(qty)) From grt_prod
                                     Where line = h.line And pid = h.pid And whl_no = h.whl_no And part = h.part And grp = h.grp And ssize = h.ssize And turn = h.turn_min - 1 + 3
                                       And turn Between c1.turn_min And c1.turn_max),
                           turn4 = (Select grt_f_qty2dzn(Sum(qty)) From grt_prod
                                     Where line = h.line And pid = h.pid And whl_no = h.whl_no And part = h.part And grp = h.grp And ssize = h.ssize And turn = h.turn_min - 1 + 4
                                       And turn Between c1.turn_min And c1.turn_max),
                           turn5 = (Select grt_f_qty2dzn(Sum(qty)) From grt_prod
                                     Where line = h.line And pid = h.pid And whl_no = h.whl_no And part = h.part And grp = h.grp And ssize = h.ssize And turn = h.turn_min - 1 + 5
                                       And turn Between c1.turn_min And c1.turn_max),
                           turn6 = (Select grt_f_qty2dzn(Sum(qty)) From grt_prod
                                     Where line = h.line And pid = h.pid And whl_no = h.whl_no And part = h.part And grp = h.grp And ssize = h.ssize And turn = h.turn_min - 1 + 6
                                       And turn Between c1.turn_min And c1.turn_max),
                           turn7 = (Select grt_f_qty2dzn(Sum(qty)) From grt_prod
                                     Where line = h.line And pid = h.pid And whl_no = h.whl_no And part = h.part And grp = h.grp And ssize = h.ssize And turn = h.turn_min - 1 + 7
                                       And turn Between c1.turn_min And c1.turn_max),
                           turn8 = (Select grt_f_qty2dzn(Sum(qty)) From grt_prod
                                     Where line = h.line And pid = h.pid And whl_no = h.whl_no And part = h.part And grp = h.grp And ssize = h.ssize And turn = h.turn_min - 1 + 8
                                       And turn Between c1.turn_min And c1.turn_max)
      Where Current Of c_sheet;
  End Loop;
  --提交
  Commit;
  --没有错误发生，返回OK
  Return 'OK';
Exception
  When Others Then
    Rollback;
    Return 'GRT_F_GEN_MY_SHEET ERROR:' || Substr(Sqlerrm,1,200);
End;
/

prompt
prompt Creating function GRT_F_GET_DAY_MINS
prompt ====================================
prompt
CREATE OR REPLACE Function grt_f_get_day_mins(p_line varchar2,p_time1 Date,p_time2 Date) Return Number Is
/*起始时间 + 每轮耗时时间，要扣除午休时间*/
  v_am1 Date;
  v_am2 Date;
  v_pm1 Date;
  v_pm2 Date;
  v_time Date;
  v_yyyymmdd Varchar2(8);
  --i Pls_Integer;
  v_mins Number(5);
  v_cnt Number(5);
Begin
  --
  Select To_Char(Sysdate,'yyyymmdd') Into v_yyyymmdd From Dual;
  --
  Select To_Date(v_yyyymmdd || am1 || '00','yyyymmddhh24miss'),To_Date(v_yyyymmdd || am2 || '00','yyyymmddhh24miss'),To_Date(v_yyyymmdd || pm1 || '00','yyyymmddhh24miss'),To_Date(v_yyyymmdd || pm2 || '00','yyyymmddhh24miss')
    Into v_am1,v_am2,v_pm1,v_pm2
    From grt_line Where line = p_line;
    
  v_cnt := Round((p_time2 - p_time1) * 24 * 60);
  v_mins := 0;
  For i In 1..v_cnt Loop
    If p_time1 + 1/24/60 * i Between v_am1 + 1/24/60 And v_am2 Then
      v_mins := v_mins  + 1;
    Elsif p_time1 + 1/24/60 * i Between v_pm1 + 1/24/60 And v_pm2 Then
      v_mins := v_mins  + 1;
    End If;      
  End Loop;
  
  Return v_mins;
End;
/

prompt
prompt Creating function GRT_F_GET_PTIME
prompt =================================
prompt
CREATE OR REPLACE Function grt_f_get_ptime(p_line varchar2,p_time Date,p_tspend Number) Return Date Is
/*起始时间 + 每轮耗时时间，要扣除午休时间*/
  v_am1 Date;
  v_am2 Date;
  v_pm1 Date;
  v_pm2 Date;
  v_time Date;
  v_yyyymmdd Varchar2(8);
  --i Pls_Integer;
  v_mins Number(5);
  v_cnt Number(5);
  v_ptime Date;
Begin
  --
  Select To_Char(Sysdate,'yyyymmdd') Into v_yyyymmdd From Dual;
  --
  Select To_Date(v_yyyymmdd || am1 || '00','yyyymmddhh24miss'),To_Date(v_yyyymmdd || am2 || '00','yyyymmddhh24miss'),To_Date(v_yyyymmdd || pm1 || '00','yyyymmddhh24miss'),To_Date(v_yyyymmdd || pm2 || '00','yyyymmddhh24miss')
    Into v_am1,v_am2,v_pm1,v_pm2
    From grt_line Where line = p_line;
    
  v_cnt := 0;
  v_ptime := p_time;
  For i In 1..10000 Loop    
    If p_time + 1/24/60 * i Between v_am1 + 1/24/60 And v_am2 Then
      v_cnt := v_cnt + 1;
      v_ptime := p_time + 1/24/60 * i;
    Elsif p_time + 1/24/60 * i Between v_pm1 + 1/24/60 And v_pm2 Then
      v_cnt := v_cnt + 1;
      v_ptime := p_time + 1/24/60 * i;
    End If;  
    Exit When v_cnt = p_tspend;    
  End Loop;
  
  Return v_ptime;
End;
/

prompt
prompt Creating function GRT_F_GEN_PROD
prompt ================================
prompt
CREATE OR REPLACE Function grt_f_gen_prod(p_line Varchar2,p_user_id Varchar2,p_sysdate Date) Return Varchar2 Is
  --
  Cursor c_plan_part Is
    Select line,pid,whl_no,style,part,turn1,turn2,qty,ptime1,ptime2
      From grt_plan Where line = p_line
        And Nvl(flag,'0') = '0'
      Order By line,pid,whl_no,part
      For Update;
  --
  Cursor c_prod_turn(pc_line Varchar2,pc_pid Varchar2,pc_whl_no Varchar2,pc_part Varchar2,pc_turn1 Number,pc_turn2 Number) Is
    Select turn,Sum(qty) qty
      From grt_prod
      Where line = pc_line
        And pid = pc_pid
        And whl_no = pc_whl_no
        And part = pc_part
        And turn Between pc_turn1 And pc_turn2
      Group By line,pid,whl_no,part,turn
      Order By turn;
  --已完成的轮号
  Cursor c_dwhl Is
    Select line,pid,whl_no
      From grt_prod_whl
     Where Nvl(dturn,0) >= Nvl(eturn,0)
       And line = p_line;
  --
  v_ptime Date;
  --v_ptimestr Varchar2(30);
  v_tspend Number;
  v_dmins Number(5);
Begin
  --已全部完成的轮号移入历史档;
  For c1 In c_dwhl Loop
    Insert Into grt_prod_all(line,lot_no,part,turn,ssize,qty,dzn,wid,wname,dtime,whl_no,user_id,sys_date,pid,style,done,grp,bak_date)
      Select line,lot_no,part,turn,ssize,qty,dzn,wid,wname,dtime,whl_no,user_id,sys_date,pid,style,done,grp,p_sysdate
        From grt_prod
        Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no;
    Delete grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no;
    --删除相应的 grt_prod_whl/part/size/lot 档
    Delete grt_prod_whl Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no;
    Delete grt_prod_part Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no;
    Delete grt_prod_size Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no;
    Delete grt_prod_lot Where line = c1.line And whl_no = c1.whl_no;
  End Loop; 
   
  --形成派工最明细档
  For c1 In c_plan_part Loop
   
    Insert Into grt_prod(line,pid,whl_no,style,part,turn,ssize,lot_no,grp,qty,dzn,
                         user_id,sys_date)
      Select c1.line,c1.pid,whl_no,style,c1.part,turn,ssize,lot_no,grp,Sum(qty),grt_f_qty2dzn(Sum(qty)),
             p_user_id,p_sysdate
        From grt_lot_dtl
        Where line = c1.line
          And whl_no = c1.whl_no
          And Nvl(flag,'0') = '1'
          And turn Between c1.turn1 And c1.turn2
        Group By c1.line,c1.pid,whl_no,style,c1.part,turn,ssize,lot_no,grp;
    --计算每轮的计划完成时间    
    v_ptime := c1.ptime1;  --上一轮计划完成时间，用于计算出本轮的计划完成时间
    v_dmins := grt_f_get_day_mins(p_line,c1.ptime1,c1.ptime2);--计算本次派工的总时长(分钟)
    For c2 In c_prod_turn(c1.line,c1.pid,c1.whl_no,c1.part,c1.turn1,c1.turn2) Loop
      
      v_tspend := Round(v_dmins * c2.qty / c1.qty);  -- 本轮耗时(分) = 本次派工的总时长 * 本轮双数 / 本次派工总双数 =  
      v_ptime := grt_f_get_ptime(p_line,v_ptime,v_tspend);--本轮计划完成时间
      
      --由于算法误差，最后一轮的计划完成时间要直接取ptime2
      If c2.turn = c1.turn2 Then
        v_ptime := c1.ptime2;
      End If;
      --回填本轮计划完成时间，本轮耗时
      Update grt_prod Set ptime = v_ptime
       Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part = c1.part And turn = c2.turn;
    End Loop;
   
    --确认当天派工计划标识
    Update grt_plan Set flag = '1' Where Current Of c_plan_part;
  End Loop;
  --形成 grt_prod_whl/lot/part/size 档
  Insert Into grt_prod_whl(line,pid,whl_no,style)
    Select Distinct line,pid,whl_no,style
      From grt_prod
      Where line = p_line
    Minus
    Select line,pid,whl_no,style
      From grt_prod_whl Where line = p_line; 
      
  Insert Into grt_prod_lot(line,whl_no,style,lot_no)
    Select Distinct line,whl_no,style,lot_no
      From grt_prod
      Where line = p_line
    Minus
    Select line,whl_no,style,lot_no
      From grt_prod_lot Where line = p_line;  
  --取制令的轮次起止
  Update grt_prod_lot h Set (turn1,turn2) = (Select Min(turn),Max(turn) From grt_whl Where line = h.line And whl_no = h.whl_no And lot_no = h.lot_no)
    Where line = p_line 
      And turn1 Is Null And turn2 Is Null;
      
  Insert Into grt_prod_part(line,pid,whl_no,style,part)
    Select Distinct line,pid,whl_no,style,part
      From grt_prod
      Where line = p_line
    Minus
    Select line,pid,whl_no,style,part
      From grt_prod_part Where line = p_line;  
      
  Insert Into grt_prod_size(line,pid,whl_no,style,part,grp,ssize)
    Select Distinct line,pid,whl_no,style,part,grp,ssize 
      From grt_prod
      Where line = p_line
    Minus
    Select line,pid,whl_no,style,part,grp,ssize 
      From grt_prod_size Where line = p_line;
  --更新 grt_prod_whl/part 的 eturn(轮号中最大轮次)
  Update grt_prod_whl h Set eturn = (Select Max(turn) From grt_whl Where line = p_line And whl_no = h.whl_no)
    Where line = p_line And eturn Is Null;
    
  Update grt_prod_part h Set eturn = (Select Max(turn) From grt_whl Where line = p_line And whl_no = h.whl_no)
    Where line = p_line And eturn Is Null;
      
  --提交
  Commit;
  --没有错误发生，返回OK
  Return 'OK';
Exception
  When Others Then
    Rollback;
    Return 'GRT_F_GEN_PROD ERROR:' || Substr(Sqlerrm,1,200);
End;
/

prompt
prompt Creating function GRT_F_GEN_WHL
prompt ===============================
prompt
CREATE OR REPLACE Function grt_f_gen_whl(p_line varchar2,p_whl_no Varchar2,p_user_id Varchar2,p_sysdate Date) Return Varchar2 Is
      v_cnt Pls_Integer;
Begin
  Select Count(*) Into v_cnt From grt_whl Where line = p_line And whl_no = p_whl_no;
  If v_cnt > 0 Then
    Return '本轮号已存在，不可再转入';
  End If;
  Delete grt_whl Where line = p_line And whl_no = p_whl_no And Nvl(flag,'0') = '0';
  --
  Insert Into grt_whl(line, lot_no, style, whl_no, turn, ssize, qty,dzn, user_id, sys_date)
    Select p_line,lot_no,style,whl_no,turn,ssize,qty,dzn,p_user_id,p_sysdate
      From grt_v_ref001
      Where whl_no = p_whl_no;
  Commit;
  Return 'OK';
End;
/

prompt
prompt Creating function GRT_F_GET_PART_DONE
prompt =====================================
prompt
CREATE OR REPLACE Function grt_f_get_part_done(p_line varchar2,p_pid Varchar2,p_whl_no varchar2,p_part Varchar2) Return Number Is
  Cursor c_turn Is
    Select Distinct turn
      From grt_prod
      Where line = p_line And pid = p_pid And whl_no = p_whl_no And part = p_part
        Order By turn;
  --
  v_cnt Number;
  v_done_cnt Number;
  v_done_turn Number;
Begin
  --
  v_done_turn := 0;
  --
  For c1 In c_turn Loop
    Select Count(*),Sum(decode(Nvl(done,'0'),'0',0,1)) Into v_cnt,v_done_cnt
      From grt_prod Where line = p_line And pid = p_pid And whl_no = p_whl_no And part = p_part
        And turn = c1.turn;
    If v_cnt = v_done_cnt Then
      v_done_turn := c1.turn;
    Else
      Exit;
    End If;
  End Loop;
  Return v_done_turn;
End;
/

prompt
prompt Creating function GRT_F_GET_WHL_LOTS
prompt ====================================
prompt
CREATE OR REPLACE Function grt_f_get_whl_lots(p_line Varchar2,p_whl_no Varchar2) Return Varchar2 Is
  Cursor c_lots Is
    Select Distinct Substr(lot_no,-3,3) lot_no
      From grt_prod_lot 
      Where line = p_line And whl_no = p_whl_no
      Order By lot_no;
  --
  v_lots Varchar2(100);
Begin  
  --
  v_lots := '';
  --
  For c1 In c_lots Loop
    v_lots := v_lots || c1.lot_no || ';';
  End Loop; 
  Select Rtrim(v_lots,';') Into v_lots From Dual;
  Return v_lots;
End;
/

prompt
prompt Creating function GRT_F_SHEET_COMMIT
prompt ====================================
prompt
CREATE OR REPLACE Function grt_f_sheet_commit
(
  p_line Varchar2,
  p_pid  Varchar2,
  p_wid  Varchar2,
  p_wname Varchar2,
  p_sysdate Date
) Return Varchar2 Is
  --
  Cursor c_part Is 
    Select line,pid,whl_no,part 
      From grt_prod_part h
     Where Exists (Select 1 From grt_prod_t 
                    Where line = h.line And pid = h.pid And whl_no = h.whl_no And part = h.part
                      And line = p_line And pid = p_pid And wid = p_wid)
     For Update;
  --
  Cursor c_turn(pc_line Varchar2,pc_pid Varchar2,pc_whl_no Varchar2,pc_part Varchar2) Is
    Select Distinct turn
      From grt_prod 
      Where line = pc_line And pid = pc_pid And whl_no = pc_whl_no And part = pc_part
      Order By turn;
      
  v_done_turn Pls_Integer;
  v_cnt Pls_Integer;
  v_done_cnt Pls_Integer;
Begin
  --已完成的保后标识为1
  Update grt_prod Set done = '1',dtime = p_sysdate,wid = p_wid,wname = p_wname
   Where (line,pid,whl_no,part,ssize,turn,grp) In 
         (Select line,pid,whl_no,part,ssize,turn,grp From grt_prod_t 
           Where line = p_line And pid = p_pid And wid = p_wid);
  --更新当前部位已完成的轮次
  For c1 In c_part Loop
    v_done_turn := 0;
    For c2 In c_turn(c1.line,c1.pid,c1.whl_no,c1.part) Loop --当前部位下逐轮次从前到后检查是否已完成所有号码
      Select Count(*),Sum(decode(Nvl(done,'0'),'0',0,1)) Into v_cnt,v_done_cnt
        From grt_prod Where line = c1.line And pid = c1.pid And whl_no = c1.whl_no And part = c1.part And turn = c2.turn;
      If v_cnt = v_done_cnt Then
        v_done_turn := c2.turn;
      Else
        Exit;
      End If;
    End Loop; 
    Update grt_prod_part Set dturn = v_done_turn
      Where Current Of c_part;    
  End Loop;
  --更新当前轮号已完成的轮次  
  Update grt_prod_whl h Set dturn = (Select Min(dturn) From grt_prod_part Where line = h.line And pid = h.pid And whl_no = h.whl_no)
    Where Exists (Select 1 From grt_prod_t 
                    Where line = h.line And pid = h.pid And whl_no = h.whl_no
                      And line = p_line And pid = p_pid And wid = p_wid);
  --删除临时档
  Delete grt_prod_t Where line = p_line And pid = p_pid And wid = p_wid;
  Commit;
  --没有错误发生，返回OK
  Return 'OK';
Exception
  When Others Then
    Rollback;
    Return 'GRT_F_SHEET_COMMIT Error:' || Substr(Sqlerrm,1,200);
End;
/

prompt
prompt Creating function GRT_GET
prompt =========================
prompt
CREATE OR REPLACE Function grt_get
(
  p_type Varchar2
) Return Varchar2 Is
  v_result Varchar2(100);
  v_step Varchar2(100);
Begin
  v_step := '取线别名称';
  If p_type = 'LINE' Then
    Return '3B';
    --Select line Into v_result
      --From grt_pc Where pc In (Select terminal From v$session Where audsid = Userenv('SESSIONID'));
    --
    --Return v_result;
  End If;

  If p_type = 'USER_ID' Then
    Return 'TEST';
  End If;

  If p_type = 'PID' Then
    Return '1';
  End If;

  If p_type = 'PORD' Then
    Return 'DZN';
  End If;

  Return Null;
Exception
  When Others Then
    Rollback;
    Return 'GRT_GET ERROR:' || v_step || ' ' || Substr(Sqlerrm,1,200);
End;
/


spool off
