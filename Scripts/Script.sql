CREATE VIEW v_class_detail
AS select
s.sno as no,
s.class as class,
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

select * from v_class_detail;

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
insert into seat(dno,class,price,max,sold) values
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
insert into seat(dno,class,price,max,sold) values
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

/*예매*/
	/*<예매시 수행*/
insert into reservation(uno,sno,rtime) values
(1,1,'2015-03-30 00:00:00'),
(1,2,'2015-03-30 00:00:00'),
(1,3,'2015-03-30 00:00:00');
	/*예매시 구매된 좌석 카운트*/
update seat set sold=1 where sno=1;
update seat set sold=1 where sno=2;
update seat set sold=1 where sno=3;
	/*예매시 영업정보에 insert>*/
insert into biz(rno,sno,fno) values
(1,1,1),
(1,2,1),
(1,3,1);


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



insert into category VALUES(1, "공지사항"),(2, "잡담"),(3, "질문"),(4, "정보");

insert into board(uno, cno, btitle, bcontent, bdate, bhit, brec) VALUES
(1, 1, "공지사항1", "공지사항입니다.", "2016-03-01", 10, 5),
(2, 1, "공지사항2", "공지사항입니다.", "2016-03-11", 50, 0),
(1, 2, "잡담1", "잡담입니다.", "2017-03-01", 110, 5),
(2, 3, "질문입니다.", "질문.", "2016-05-01", 10, 5);

SELECT * from board;
SELECT * from reply;
insert into reply(bno, uno, rparent, rlvl, rcontent, rdate, rrec) VALUES
(1, 1, 0, 0, "공지사항1 댓글", "2016-03-01", 1),
(1, 2, 0, 0, "공지사항1 댓글2", "2016-03-02", 2),
(1, 2, 2, 1, "공지사항1 대댓글2", "2016-03-02", 2),
(2, 2, 0, 0, "공지사항2 댓글2", "2016-03-03", 0),
(3, 2, 0, 0, "공지사항2 댓글2", "2016-03-03", 0);

SELECT * from replyreclist;
insert into replyreclist(uno, bno, rno) VALUES
(1, 1, 1),
(1, 1, 2),
(2, 1, 2),
(3, 1, 3),
(4, 1, 3);


SELECT * from boardreclist;
insert into boardreclist(bno, uno) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5);

