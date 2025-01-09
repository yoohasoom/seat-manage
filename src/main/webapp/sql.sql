create table tbl_emp_202109(
empno char(4) not null primary key,
empname varchar2(20),
tel1 char(3),
tel2 char(4),
tel3 char(4),
deptcode char(2),
position char(1)
);

create table tbl_seat_202109(
seatno char(4) not null primary key,
office varchar2(20),
callno varchar2(10),
useflag char(1)
);

create table tbl_resv_202109(
resvno char(8) not null primary key,
empno char(4),
resvdate char(8),
seatno char(4)
);

insert into tbl_emp_202109 values('1001', '김사원', '010', '1234', '1111', '10', '1');
insert into tbl_emp_202109 values('1002', '이사원', '010', '1234', '2222', '20', '2');
insert into tbl_emp_202109 values('1003', '박사원', '010', '1234', '3333', '30', '3');
insert into tbl_emp_202109 values('1004', '홍사원', '010', '1234', '4444', '10', '4');
insert into tbl_emp_202109 values('1005', '조사원', '010', '1234', '5555', '20', '1');
insert into tbl_emp_202109 values('1006', '정사원', '010', '1234', '6666', '30', '2');
insert into tbl_emp_202109 values('1007', '황사원', '010', '1234', '7777', '10', '3');

insert into tbl_seat_202109 values('S001', '1층101호', '7777-0001', 'N');
insert into tbl_seat_202109 values('S002', '1층101호', '7777-0002', 'Y');
insert into tbl_seat_202109 values('S003', '1층101호', '7777-0003', 'Y');
insert into tbl_seat_202109 values('S004', '1층102호', '7777-0004', 'Y');
insert into tbl_seat_202109 values('S005', '1층102호', '7777-0005', 'Y');
insert into tbl_seat_202109 values('S006', '1층102호', '7777-0006', 'N');
insert into tbl_seat_202109 values('S007', '1층103호', '7777-0007', 'Y');
insert into tbl_seat_202109 values('S008', '1층103호', '7777-0008', 'Y');
insert into tbl_seat_202109 values('S009', '1층103호', '7777-0009', 'Y');

insert into tbl_resv_202109 values('20210001', '1001', '20211004', 'S002');
insert into tbl_resv_202109 values('20210002', '1002', '20211004', 'S002');
insert into tbl_resv_202109 values('20210003', '1003', '20211004', 'S004');
insert into tbl_resv_202109 values('20210004', '1004', '20211004', 'S005');
insert into tbl_resv_202109 values('20210005', '1005', '20211005', 'S004');
insert into tbl_resv_202109 values('20210006', '1006', '20211005', 'S005');
insert into tbl_resv_202109 values('20210007', '1007', '20211005', 'S007');
insert into tbl_resv_202109 values('20210008', '1001', '20211005', 'S008');
insert into tbl_resv_202109 values('20210009', '1002', '20211006', 'S002');
insert into tbl_resv_202109 values('20210010', '1003', '20211006', 'S003');

<--ListConfirm-->
select te.empno, te.empname, substr(tr.resvdate, 1, 4), substr(tr.resvdate, 5, 2), substr(tr.resvdate, 7, 2), ts.seatno, ts.office, ts.callno
from tbl_emp_202109 te, tbl_seat_202109 ts, tbl_resv_202109 tr
where te.empno = tr.empno and ts.seatno = tr.seatno and te.empno = ?;

<--RegiConfirm-->
insert into tbl_resv_202109 values(?, ?, ?, ?);

<--Result-->
select empno, empname, deptcode, position from tbl_emp_202109;