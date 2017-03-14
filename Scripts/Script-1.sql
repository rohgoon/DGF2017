create database dgf;
-- 페스티벌
DROP SCHEMA IF EXISTS dgf;

-- 페스티벌
CREATE SCHEMA dgf;

-- 페스티벌정보
CREATE TABLE dgf.fesinfo (
	fno   INT         NOT NULL COMMENT '회차', -- 회차
	place VARCHAR(50) NOT NULL COMMENT '장소', -- 장소
	sday  DATE        NOT NULL COMMENT '시작일', -- 시작일
	eday  DATE        NOT NULL COMMENT '마감일' -- 마감일
)
COMMENT '페스티벌정보';

-- 페스티벌정보
ALTER TABLE dgf.fesinfo
	ADD CONSTRAINT PK_fesinfo -- 페스티벌정보 기본키
		PRIMARY KEY (
			fno -- 회차
		);

ALTER TABLE dgf.fesinfo
	MODIFY COLUMN fno INT NOT NULL AUTO_INCREMENT COMMENT '회차';

-- 세부일정
CREATE TABLE dgf.days (
	dno   INT  NOT NULL COMMENT '일정번호', -- 일정번호
	fno   INT  NOT NULL COMMENT '회차', -- 회차
	day   DATE NOT NULL COMMENT '날짜', -- 날짜
	stime TIME NULL     COMMENT '시작시간', -- 시작시간
	etime TIME NULL     COMMENT '마감시간' -- 마감시간
)
COMMENT '세부일정';

-- 세부일정
ALTER TABLE dgf.days
	ADD CONSTRAINT PK_days -- 세부일정 기본키
		PRIMARY KEY (
			dno -- 일정번호
		);

ALTER TABLE dgf.days
	MODIFY COLUMN dno INT NOT NULL AUTO_INCREMENT COMMENT '일정번호';

-- 등급
CREATE TABLE dgf.seat (
	sno   INT     NOT NULL COMMENT '등급번호', -- 등급번호
	dno   INT     NOT NULL COMMENT '일정번호', -- 일정번호
	class CHAR(2) NOT NULL COMMENT '등급', -- 등급
	price INT     NOT NULL COMMENT '가격', -- 가격
	max   INT     NOT NULL COMMENT '좌석수', -- 좌석수
	sold  INT     NULL     COMMENT '예매완료수' -- 예매완료수
)
COMMENT '등급';

-- 등급
ALTER TABLE dgf.seat
	ADD CONSTRAINT PK_seat -- 좌석 기본키
		PRIMARY KEY (
			sno -- 등급번호
		);

ALTER TABLE dgf.seat
	MODIFY COLUMN sno INT NOT NULL AUTO_INCREMENT COMMENT '등급번호';

-- 회원
CREATE TABLE dgf.user (
	uno       INT         NOT NULL COMMENT '회원번호', -- 회원번호
	id        VARCHAR(20) NOT NULL COMMENT '아이디', -- 아이디
	uname     VARCHAR(20) NOT NULL COMMENT '이름', -- 이름
	upassword VARCHAR(20) NOT NULL COMMENT '비밀번호', -- 비밀번호
	email     VARCHAR(50) NOT NULL COMMENT '이메일', -- 이메일
	phone     VARCHAR(20) NOT NULL COMMENT '전화번호', -- 전화번호
	regdate   DATE        NOT NULL COMMENT '가입일', -- 가입일
	outmember BOOLEAN     NOT NULL COMMENT '탈퇴' -- 탈퇴
)
COMMENT '회원';

-- 회원
ALTER TABLE dgf.user
	ADD CONSTRAINT PK_user -- 회원 기본키
		PRIMARY KEY (
			uno -- 회원번호
		);

ALTER TABLE dgf.user
	MODIFY COLUMN uno INT NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 예매
CREATE TABLE dgf.reservation (
	rno   INT  NOT NULL COMMENT '예매번호', -- 예매번호
	uno   INT  NOT NULL COMMENT '회원번호', -- 회원번호
	sno   INT  NULL     COMMENT '등급번호', -- 등급번호
	rtime DATE NOT NULL COMMENT '예매시간' -- 예매시간
)
COMMENT '예매';

-- 예매
ALTER TABLE dgf.reservation
	ADD CONSTRAINT PK_reservation -- 예매 기본키
		PRIMARY KEY (
			rno -- 예매번호
		);

ALTER TABLE dgf.reservation
	MODIFY COLUMN rno INT NOT NULL AUTO_INCREMENT COMMENT '예매번호';

-- 아티스트
CREATE TABLE dgf.artist (
	ano   INT         NOT NULL COMMENT '아티스트번호', -- 아티스트번호
	aname VARCHAR(50) NOT NULL COMMENT '이름' -- 이름
)
COMMENT '아티스트';

-- 아티스트
ALTER TABLE dgf.artist
	ADD CONSTRAINT PK_artist -- 아티스트 기본키
		PRIMARY KEY (
			ano -- 아티스트번호
		);

-- 출연진
CREATE TABLE dgf.lineup (
	lno   INT         NOT NULL COMMENT '출연진번호', -- 출연진번호
	dno   INT         NOT NULL COMMENT '일정번호', -- 일정번호
	aname VARCHAR(50) NOT NULL COMMENT '아티스트명' -- 아티스트명
)
COMMENT '출연진';

-- 출연진
ALTER TABLE dgf.lineup
	ADD CONSTRAINT PK_lineup -- 출연진 기본키
		PRIMARY KEY (
			lno -- 출연진번호
		);

ALTER TABLE dgf.lineup
	MODIFY COLUMN lno INT NOT NULL AUTO_INCREMENT COMMENT '출연진번호';

-- 영업현황
CREATE TABLE dgf.biz (
	bno INT NOT NULL COMMENT '영업번호', -- 영업번호
	rno INT NULL     COMMENT '예매번호', -- 예매번호
	sno INT NULL     COMMENT '등급번호', -- 등급번호
	fno INT NULL     COMMENT '회차' -- 회차
)
COMMENT '영업현황';

-- 영업현황
ALTER TABLE dgf.biz
	ADD CONSTRAINT PK_biz -- 영업현황 기본키
		PRIMARY KEY (
			bno -- 영업번호
		);

ALTER TABLE dgf.biz
	MODIFY COLUMN bno INT NOT NULL AUTO_INCREMENT COMMENT '영업번호';

-- 세부일정
ALTER TABLE dgf.days
	ADD CONSTRAINT FK_fesinfo_TO_days -- 페스티벌정보 -> 세부일정
		FOREIGN KEY (
			fno -- 회차
		)
		REFERENCES dgf.fesinfo ( -- 페스티벌정보
			fno -- 회차
		);

-- 등급
ALTER TABLE dgf.seat
	ADD CONSTRAINT FK_days_TO_seat -- 세부일정 -> 등급
		FOREIGN KEY (
			dno -- 일정번호
		)
		REFERENCES dgf.days ( -- 세부일정
			dno -- 일정번호
		);

-- 예매
ALTER TABLE dgf.reservation
	ADD CONSTRAINT FK_user_TO_reservation -- 회원 -> 예매
		FOREIGN KEY (
			uno -- 회원번호
		)
		REFERENCES dgf.user ( -- 회원
			uno -- 회원번호
		);

-- 예매
ALTER TABLE dgf.reservation
	ADD CONSTRAINT FK_seat_TO_reservation -- 등급 -> 예매
		FOREIGN KEY (
			sno -- 등급번호
		)
		REFERENCES dgf.seat ( -- 등급
			sno -- 등급번호
		);

-- 출연진
ALTER TABLE dgf.lineup
	ADD CONSTRAINT FK_days_TO_lineup -- 세부일정 -> 출연진
		FOREIGN KEY (
			dno -- 일정번호
		)
		REFERENCES dgf.days ( -- 세부일정
			dno -- 일정번호
		);

-- 영업현황
ALTER TABLE dgf.biz
	ADD CONSTRAINT FK_reservation_TO_biz -- 예매 -> 영업현황
		FOREIGN KEY (
			rno -- 예매번호
		)
		REFERENCES dgf.reservation ( -- 예매
			rno -- 예매번호
		);

-- 영업현황
ALTER TABLE dgf.biz
	ADD CONSTRAINT FK_seat_TO_biz -- 등급 -> 영업현황
		FOREIGN KEY (
			sno -- 등급번호
		)
		REFERENCES dgf.seat ( -- 등급
			sno -- 등급번호
		);

-- 영업현황
ALTER TABLE dgf.biz
	ADD CONSTRAINT FK_fesinfo_TO_biz -- 페스티벌정보 -> 영업현황
		FOREIGN KEY (
			fno -- 회차
		)
		REFERENCES dgf.fesinfo ( -- 페스티벌정보
			fno -- 회차
		);
		
		
		
		
		
		
-- 게시물
CREATE TABLE `dgf`.`board` (
	`bno`      INT(11)      NOT NULL COMMENT '게시물번호', -- 게시물번호
	`uno`      INT(11)      NOT NULL COMMENT '작성자(회원번호)', -- 작성자(회원번호)
	`cno`      INT(11)      NOT NULL COMMENT '카테고리번호', -- 카테고리번호
	`btitle`   VARCHAR(120) NOT NULL COMMENT '게시물제목', -- 게시물제목
	`bcontent` TEXT         NOT NULL COMMENT '게시물내용', -- 게시물내용
	`bdate`    DATETIME     NOT NULL COMMENT '게시물작성시간', -- 게시물작성시간
	`bhit`     INT(11)      NOT NULL COMMENT '게시물조회수', -- 게시물조회수
	`brec`     INT(11)      NOT NULL COMMENT '게시물추천수', -- 게시물추천수
	`battach`  MEDIUMBLOB   NULL     COMMENT '게시물첨부파일' -- 게시물첨부파일
)
COMMENT '게시물';

-- 게시물
ALTER TABLE `dgf`.`board`
	ADD CONSTRAINT
		PRIMARY KEY (
			`bno` -- 게시물번호
		);

ALTER TABLE `dgf`.`board`
	MODIFY COLUMN `bno` INT(11) NOT NULL AUTO_INCREMENT COMMENT '게시물번호';

ALTER TABLE `dgf`.`board`
	AUTO_INCREMENT = 1;

-- 게시물추천목록
CREATE TABLE `dgf`.`boardreclist` (
	`bno` INT(11) NOT NULL COMMENT '게시물번호', -- 게시물번호
	`uno` INT(11) NOT NULL COMMENT '회원번호' -- 회원번호
)
COMMENT '게시물추천목록';

-- 게시물추천목록
ALTER TABLE `dgf`.`boardreclist`
	ADD CONSTRAINT
		PRIMARY KEY (
			`bno`, -- 게시물번호
			`uno`  -- 회원번호
		);

-- 카테고리
CREATE TABLE `dgf`.`category` (
	`cno`   INT(11)     NOT NULL COMMENT '카테고리번호', -- 카테고리번호
	`ctype` VARCHAR(20) NOT NULL COMMENT '카테고리이름' -- 카테고리이름
)
COMMENT '카테고리';

-- 카테고리
ALTER TABLE `dgf`.`category`
	ADD CONSTRAINT
		PRIMARY KEY (
			`cno` -- 카테고리번호
		);

ALTER TABLE `dgf`.`category`
	MODIFY COLUMN `cno` INT(11) NOT NULL AUTO_INCREMENT COMMENT '카테고리번호';

ALTER TABLE `dgf`.`category`
	AUTO_INCREMENT = 1;

-- 댓글
CREATE TABLE `dgf`.`reply` (
	`bno`      INT(11)    NOT NULL COMMENT '게시물번호', -- 게시물번호
	`rno`      INT(11)    NOT NULL COMMENT '댓글번호', -- 댓글번호
	`uno`      INT(11)    NOT NULL COMMENT '회원번호', -- 회원번호
	`rparent`  INT(11)    NOT NULL COMMENT '부모댓글', -- 부모댓글
	`rlvl`     TINYINT(4) NOT NULL COMMENT '댓글들여쓰기', -- 댓글들여쓰기
	`rcontent` TEXT       NOT NULL COMMENT '댓글내용', -- 댓글내용
	`rdate`    DATETIME   NOT NULL COMMENT '댓글작성시간' -- 댓글작성시간
)
COMMENT '댓글';

-- 댓글
ALTER TABLE `dgf`.`reply`
	ADD CONSTRAINT
		PRIMARY KEY (
			`bno`, -- 게시물번호
			`rno`  -- 댓글번호
		);

ALTER TABLE `dgf`.`reply`
	MODIFY COLUMN `rno` INT(11) NOT NULL AUTO_INCREMENT COMMENT '댓글번호';

ALTER TABLE `dgf`.`reply`
	AUTO_INCREMENT = 1;

-- 댓글추천목록
CREATE TABLE `dgf`.`replyreclist` (
	`uno` INT(11) NOT NULL COMMENT '회원번호', -- 회원번호
	`bno` INT(11) NOT NULL COMMENT '게시물번호', -- 게시물번호
	`rno` INT(11) NOT NULL COMMENT '댓글번호' -- 댓글번호
)
COMMENT '댓글추천목록';

-- 댓글추천목록
ALTER TABLE `dgf`.`replyreclist`
	ADD CONSTRAINT
		PRIMARY KEY (
			`uno`, -- 회원번호
			`bno`, -- 게시물번호
			`rno`  -- 댓글번호
		);

-- 게시물
ALTER TABLE `dgf`.`board`
	ADD CONSTRAINT `FK_category_TO_board` -- FK_category_TO_board
		FOREIGN KEY (
			`cno` -- 카테고리번호
		)
		REFERENCES `dgf`.`category` ( -- 카테고리
			`cno` -- 카테고리번호
		),
	ADD INDEX `FK_category_TO_board` (
		`cno` -- 카테고리번호
	);

-- 게시물
ALTER TABLE `dgf`.`board`
	ADD CONSTRAINT `FK_user_TO_board` -- FK_user_TO_board
		FOREIGN KEY (
			`uno` -- 작성자(회원번호)
		)
		REFERENCES `dgf`.`user` ( -- 회원
			`uno` -- 회원번호
		),
	ADD INDEX `FK_user_TO_board` (
		`uno` -- 작성자(회원번호)
	);

-- 댓글
ALTER TABLE `dgf`.`reply`
	ADD CONSTRAINT `FK_board_TO_reply` -- FK_board_TO_reply
		FOREIGN KEY (
			`bno` -- 게시물번호
		)
		REFERENCES `dgf`.`board` ( -- 게시물
			`bno` -- 게시물번호
		),
	ADD INDEX `FK_board_TO_reply` (
		`bno` -- 게시물번호
	);

-- 댓글
ALTER TABLE `dgf`.`reply`
	ADD CONSTRAINT `FK_user_TO_reply` -- FK_user_TO_reply
		FOREIGN KEY (
			`uno` -- 회원번호
		)
		REFERENCES `dgf`.`user` ( -- 회원
			`uno` -- 회원번호
		),
	ADD INDEX `FK_user_TO_reply` (
		`uno` -- 회원번호
	);

-- 게시물추천목록
ALTER TABLE `dgf`.`boardreclist`
	ADD CONSTRAINT `FK_board_TO_boardreclist` -- FK_board_TO_boardreclist
		FOREIGN KEY (
			`bno` -- 게시물번호
		)
		REFERENCES `dgf`.`board` ( -- 게시물
			`bno` -- 게시물번호
		);

-- 댓글추천목록
ALTER TABLE `dgf`.`replyreclist`
	ADD CONSTRAINT `FK_reply_TO_replyreclist` -- 댓글 -> 댓글추천목록
		FOREIGN KEY (
			`bno`, -- 게시물번호
			`rno`  -- 댓글번호
		)
		REFERENCES `dgf`.`reply` ( -- 댓글
			`bno`, -- 게시물번호
			`rno`  -- 댓글번호
		);