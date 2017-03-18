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
