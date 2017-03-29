DROP VIEW seatDetailView;

CREATE VIEW seatDetailView
AS select
s.sno as no,
s.grade as grade,
s.price as price,
s.max as maxseat,
s.sold as soldseat,
d.dno as dno,
d.day as day,
d.stime as stime,
d.etime as etime,
f.fno as fno,
f.place as place,
f.sday as sday,
f.eday as eday
from seat s
left join days d on s.dno = d.dno
left join fesinfo f on d.fno = f.fno;

select * from seatDetailView;

/*페스티벌정보*/
insert into fesinfo(place,sday,eday) values
('대구광역시 남구 대명동 1797-6, 대구교육대학교', '2015-04-03','2015-04-05');
insert into fesinfo(place,sday,eday) values
('대구광역시 남구 대명동317-1, 영남대 대구캠퍼스', '2016-04-01','2016-04-03');

/*세부일정*/
insert into days(fno,day,stime,etime) values
(1,'2015-04-03','18:00','21:00'),
(1,'2015-04-04','19:00','22:00'),
(1,'2015-04-05','18:00','21:00');

insert into days(fno,day,stime,etime) values
(2,'2016-04-01','18:00','21:00'),
(2,'2016-04-02','19:00','22:00'),
(2,'2016-04-03','18:00','21:00');

/*등급*/
/*1회차*/
insert into seat(dno,grade,price,max,sold) values
(1,'S','100000','50','0'),
(1,'A','70000','100','0'),
(1,'B','50000','50','0'),
(2,'S','100000','50','0'),
(2,'A','70000','100','0'),
(2,'B','50000','50','0'),
(3,'S','100000','50','0'),
(3,'A','70000','100','0'),
(3,'B','50000','50','0');
/*2회차*/
insert into seat(dno,grade,price,max,sold) values
(4,'S','110000','50','0'),
(4,'A','90000','100','0'),
(4,'B','70000','100','0'),
(5,'S','110000','50','0'),
(5,'A','90000','100','0'),
(5,'B','70000','100','0'),
(6,'S','110000','50','0'),
(6,'A','90000','100','0'),
(6,'B','70000','100','0');

/*회원*/
insert into user(id,uname,upassword,email,phone, regdate,outmember) values
('t1111','김일수','t1111','t1111@dgit.or.kr','010-1111-1111','2015-05-05',0),
('t2222','나이수','t2222','t2222@dgit.or.kr','010-2222-1111','2015-06-05',0),
('t3333','박삼수','t3333','t3333@dgit.or.kr','010-3333-1111','2015-07-05',0),
('t4444','이사수','t4444','t4444@dgit.or.kr','010-4444-1111','2015-08-05',0),
('t5555','최오수','t5555','t5555@dgit.or.kr','010-5555-1111','2015-09-05',0),
('t6666','구육수','t6666','t6666@dgit.or.kr','010-6666-1111','2015-10-05',0),
('t7777','오칠수','t7777','t7777@dgit.or.kr','010-7777-1111','2015-11-05',0),
('t8888','탁팔수','t8888','t8888@dgit.or.kr','010-8888-1111','2015-11-06',0),
('t9999','정구수','t9999','t9999@dgit.or.kr','010-9999-1111','2015-11-07',0),
('t0000','임십수','t0000','t0000@dgit.or.kr','010-1010-1111','2015-11-08',0);

insert into user(id,uname,upassword,email,phone, regdate,outmember) values
('admin', 'admin', 'admin', 'admin@admin.co.kr', '010-0000-0000', '2015-01-01', 0);

/*예매*/
	/*<예매시 수행*/
insert into reservation(uno,sno,rtime) values
(1,1,'2015-03-20 00:00:00'),
(1,2,'2015-03-25 00:00:00'),
(1,3,'2015-03-30 00:00:00'),
(1,4,'2015-03-15 00:00:00'),
(1,5,'2015-03-26 00:00:00'),
(1,6,'2015-03-31 00:00:00');
	/*예매시 구매된 좌석 카운트*/
update seat set sold=1 where sno=1;
update seat set sold=1 where sno=2;
update seat set sold=1 where sno=3;
update seat set sold=1 where sno=4;
update seat set sold=1 where sno=5;
update seat set sold=1 where sno=6;
	
insert into reservation(uno,sno,rtime) values
(1,7,'2015-03-21 00:00:00'),
(1,8,'2015-03-23 00:00:00'),
(1,9,'2015-03-29 00:00:00'),
(1,10,'2016-03-15 00:00:00'),
(1,11,'2016-03-16 00:00:00'),
(1,12,'2016-03-17 00:00:00'),
(1,13,'2016-03-18 00:00:00'),
(1,14,'2016-03-19 00:00:00'),
(1,15,'2016-03-20 00:00:00'),
(1,16,'2016-03-21 00:00:00'),
(1,17,'2016-03-22 00:00:00'),
(1,18,'2016-03-23 00:00:00');

update seat set sold=1 where sno=7;
update seat set sold=1 where sno>7;

insert into reservation(uno,sno,rtime) values
(1,8,'2015-03-21 16:15:10'); -- 7 ,8
update seat set sold=2 where sno=7;
update seat set sold=1 where sno=8;


select * from `user`;
select * from reservation;
select * from seat;
select * from biz;

/*출연진 정보*/
insert into lineup(dno,aname) values
(1,'걸스데이'),
(2,'에이핑크'),
(3,'씨스타'),
(4,'마마무'),
(5,'A.O.A'),
(6,'트와이스');
select * from lineup;

select uno,id,uname,upassword,email,phone, regDate from user where id = 't1111';
<<<<<<< HEAD
select * from seat where dno =2 order by sno desc;

update seat set dno = 2, grade='A', price='70000', max='100', sold='0' where dno = '2' and grade='A';

/*예매확인용 뷰*/
CREATE VIEW reservationView
AS select
r.rno as rno,
r.uno as uno,
r.rtime as rtime,
s.sno as sno,
s.grade as grade,
s.price as price,
s.max as maxseat,
s.sold as soldseat,
d.dno as dno,
d.day as day,
d.stime as stime,
d.etime as etime,
f.fno as fno,
f.place as place,
f.sday as sday,
f.eday as eday
from reservation r
left join seat s on r.sno = s.sno
left join days d on s.dno = d.dno
left join fesinfo f on d.fno = f.fno;

SELECT * from reservationView;


select count(*) from reservation where uno = 1 and rtime = '2017-03-16 00:00:00';

DELETE from reservation;
UPDATE seat set sold = 0;

select * from seatDetailView where day >= '2015-04' and day <= '2015-05';
-- test용
drop view testView;

SELECT (SELECT COUNT(*)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m%d') = DATE_FORMAT(s2.rtime, '%Y%m%d') and s1.grade = s2.grade
GROUP by DATE_FORMAT(s2.rtime, '%Y%m%d'),grade) as rowCount,
DATE_FORMAT(rtime, '%Y%m%d') as ymdDate, YEAR(rtime) as year, MONTH(rtime) as month, DAY(rtime) as nowday,
fno,count(*) as ticketcount, sum(price) as sumgradeprice ,grade, price,
(SELECT sum(s2.price)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m%d') = DATE_FORMAT(s2.rtime, '%Y%m%d')
GROUP by DATE_FORMAT(s2.rtime, '%Y%m%d')) as totalPrice,
(SELECT count(*)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m%d') = DATE_FORMAT(s2.rtime, '%Y%m%d')
GROUP by DATE_FORMAT(s2.rtime, '%Y%m%d')) as totalcount
from reservationView s1
GROUP by DATE_FORMAT(rtime, '%Y%m%d'),grade
ORDER BY ymdDate desc, grade asc;

drop view bmYearView;
drop view bmMonthView;
drop view bmDayView;
-- 연도별 영업현황
CREATE VIEW bmYearView AS
SELECT (SELECT COUNT(*)
from reservationView s2
where YEAR(s1.rtime) = YEAR(s2.rtime) and s1.grade = s2.grade
GROUP by YEAR(s2.rtime),grade) as rowCount,
YEAR(rtime) as year, fno,
count(*) as ticketcount, sum(price) as sumgradeprice ,grade, price,
(SELECT sum(s2.price)
from reservationView s2
where YEAR(s1.rtime) = YEAR(s2.rtime)
GROUP by YEAR(s2.rtime)) as totalPrice,
(SELECT count(*)
from reservationView s2
where YEAR(s1.rtime) = YEAR(s2.rtime)
GROUP by YEAR(s2.rtime)) as totalcount
from reservationView s1
GROUP by YEAR(rtime),grade
ORDER BY year desc, grade asc;

-- 월별 영업현황
CREATE VIEW bmMonthView AS
SELECT (SELECT COUNT(*)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m') = DATE_FORMAT(s2.rtime, '%Y%m') and s1.grade = s2.grade
GROUP by DATE_FORMAT(s2.rtime, '%Y%m'),grade) as rowCount,
DATE_FORMAT(rtime, '%Y%m') as ymDate, YEAR(rtime) as year, MONTH(rtime) as month, fno, 
count(*) as ticketcount, sum(price) as sumgradeprice ,grade, price,
(SELECT sum(s2.price)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m') = DATE_FORMAT(s2.rtime, '%Y%m')
GROUP by DATE_FORMAT(s2.rtime, '%Y%m')) as totalPrice,
(SELECT count(*)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m') = DATE_FORMAT(s2.rtime, '%Y%m')
GROUP by DATE_FORMAT(s2.rtime, '%Y%m')) as totalcount
from reservationView s1
GROUP by DATE_FORMAT(rtime, '%Y%m'),grade
ORDER BY ymDate desc, grade asc;

-- 일별 영업현황 (안씀)
CREATE VIEW bmDayView AS
SELECT (SELECT COUNT(*)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m%d') = DATE_FORMAT(s2.rtime, '%Y%m%d') and s1.grade = s2.grade
GROUP by DATE_FORMAT(s2.rtime, '%Y%m%d'),grade) as rowCount,
DATE_FORMAT(rtime, '%Y%m%d') as ymdDate, YEAR(rtime) as year, MONTH(rtime) as month, DAY(rtime) as nowday,
fno,count(*) as ticketcount, sum(price) as sumgradeprice ,grade, price,
(SELECT sum(s2.price)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m%d') = DATE_FORMAT(s2.rtime, '%Y%m%d')
GROUP by DATE_FORMAT(s2.rtime, '%Y%m%d')) as totalPrice,
(SELECT count(*)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m%d') = DATE_FORMAT(s2.rtime, '%Y%m%d')
GROUP by DATE_FORMAT(s2.rtime, '%Y%m%d')) as totalcount
from reservationView s1
GROUP by DATE_FORMAT(rtime, '%Y%m%d'),grade
ORDER BY ymdDate desc, grade asc;

-- 회차별 영업현황
DROP VIEW bmFesInfoView;
CREATE VIEW bmFesInfoView AS
SELECT DATE_FORMAT(day, '%Y-%m-%d') as ymdDate, fno, sday, eday,
grade,price,count(*) as ticketcount, sum(price) as sumgradeprice ,
(SELECT sum(s2.price)
from seatDetailView s2
where s1.fno = s2.fno
GROUP by s2.fno) as totalPrice,
(SELECT count(*)
from seatDetailView s2
where s1.fno = s2.fno
GROUP by s2.fno) as totalcount
from seatDetailView s1
GROUP by fno,grade;

-- 일별 영업현황ver2
CREATE VIEW bmDayView AS
SELECT (SELECT COUNT(*)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m%d') = DATE_FORMAT(s2.rtime, '%Y%m%d') and not(s1.grade = s2.grade)
GROUP by DATE_FORMAT(s2.rtime, '%Y%m%d'), grade) as rowCount,
DATE_FORMAT(rtime, '%Y%m%d') as ymdDate, YEAR(rtime) as year, MONTH(rtime) as month, DAY(rtime) as nowday,
fno,count(*) as ticketcount, sum(price) as sumgradeprice ,grade, price,
(SELECT sum(s2.price)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m%d') = DATE_FORMAT(s2.rtime, '%Y%m%d')
GROUP by DATE_FORMAT(s2.rtime, '%Y%m%d')) as totalPrice,
(SELECT count(*)
from reservationView s2
where DATE_FORMAT(s1.rtime, '%Y%m%d') = DATE_FORMAT(s2.rtime, '%Y%m%d')
GROUP by DATE_FORMAT(s2.rtime, '%Y%m%d')) as totalcount
from reservationView s1
GROUP by DATE_FORMAT(rtime, '%Y%m%d'),grade
ORDER BY ymdDate desc, grade asc;

-- 3회차 추가
/*페스티벌정보*/
insert into fesinfo(place,sday,eday) values
('대구광역시 남구 대명동 1797-6, 대구교육대학교', '2017-04-07','2017-04-09');

/*세부일정*/
insert into days(fno,day,stime,etime) values
(4,'2017-04-07','18:00','21:00'),
(4,'2017-04-08','19:00','22:00'),
(4,'2017-04-09','18:00','21:00');

/*등급*/
/*2회차*/
insert into seat(dno,grade,price,max,sold) values
(13,'S','110000','50','0'),
(13,'A','90000','100','0'),
(13,'B','70000','100','0'),
(14,'S','110000','50','0'),
(14,'A','90000','100','0'),
(14,'B','70000','100','0'),
(15,'S','110000','50','0'),
(15,'A','90000','100','0'),
(15,'B','70000','100','0');

=======





select * from board;
select * from board order by board_no;
select * from board order by board_no ;

insert into board(board_name) VALUES "board1";

INSERT INTO dgf.board (board_name) VALUES('board');

UPDATE board SET board_name='board' WHERE board_no = 4    

delete from board where board_no = 9;

SELECT * from `user`;

SELECT * FROM article;

select a.article_no, u.id, a.title, a.category, a.write_time, a.hits, a.recommend, a.attached_file
from article as a, `user` as u
where a.uno=u.uno && a.del = 0
ORDER by article_no DESC;


INSERT INTO dgf.article
(board_no, uno, title, content, category, write_time, hits, recommend, attached_file, file_location, del)
VALUES(6, 10, 'test3', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0);


INSERT INTO dgf.article
(board_no, uno, title, content, category, write_time, hits, recommend, attached_file, file_location, del)
VALUES
(6, 10, 'test4', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 1, 'test5', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 2, 'test6', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 3, 'test7', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 1, 'test8', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 2, 'test9', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 3, 'test10', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 1, 'test11', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 2, 'test12', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 3, 'test13', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 1, 'test14', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 2, 'test15', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 3, 'test16', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 10, 'test4', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 1, 'test5', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 2, 'test6', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 3, 'test7', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 1, 'test8', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 2, 'test9', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 3, 'test10', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 1, 'test11', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 2, 'test12', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 3, 'test13', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 1, 'test14', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 2, 'test15', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0),
(6, 3, 'test16', 'test3 그럼 20000', '공지사항', '2017-03-17 12:38:52.000', 0, 0, NULL, NULL, 0);

select * from article_list_view ORDER by article_no desc limit 2, 2;

select * 
from article_list_view 
where category = ''
ORDER by article_no desc limit 0, 10;

select * from article_list_view ORDER by article_no desc;
select * from article;
select a.*, u.id, u.uname from article a, user u where a.uno = u.uno && a.del = 0 && a.article_no = 1 && a.board_no = 6;

select a.article_no, u.id, a.title, a.category, a.write_time, a.hits, a.recommend, a.attached_file, a.content from article as a, `user` as u where a.uno=u.uno && a.del = 0 && a.article_no = 1 && a.board_no = 6

select * from reply;


select r.*, u.uname, u.id from reply r, user u where r.uno = u.uno && r.board_no = 6 && r.article_no = 73;


select * from reply;


select * from board;

insert into reply(board_no, article_no, reply_no, uno, content, write_time) 
values
(6, 73, 17, 1, "test", "2017-03-20 09:00:00");

select * from article;
SELECT * from article_list_view;


CREATE VIEW linupDetailView
AS select
l.lno as lno,
l.aname as aname,
l.contents as contents,
l.song1 as song1,
l.song2 as song2,
l.song3 as song3,
l.file as file,
d.dno as dno,
d.day as day,
d.stime as stime,
d.etime as etime,
f.fno as fno,
f.place as place,
f.sday as sday,
f.eday as eday
from lineup l
left join days d on l.dno = d.dno
left join fesinfo f on d.fno = f.fno;

select * from linupDetailView; 
