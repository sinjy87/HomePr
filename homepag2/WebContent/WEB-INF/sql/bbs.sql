create table bbs(
	bbsno	number(7)		not null,
	bname	varchar(20)		not null,
	title	varchar(150)	not null,
	content	varchar(3000)	not null,
	passwd	varchar(20)		not null,
	viewcnt	number(5)		default 0,
	wdate	date			not null,
	grono	number(7)		default 0, --부모글번호
	indent	number(2)		default	0,	--답변여부
	ansnum	number(5)		default	0,	--답변순서
	refno	number			default 0,
	
	primary key (bbsno)
);

alter table bbs
add (filename varchar(100) null)

insert into bbs(bbsno, bname, title, content, passwd, wdate, grono)
values((select nvl(max(bbsno),0)+1 as bbsno from bbs ),
'왕눈이','제목','내용','123',sysdate,
(select nvl(max(grono),0)+1 from bbs)
)

select * from bbs

-- 글 전체 출력
select bbsno,bname,title,content,passwd,viewcnt,wdate,grono,indent,ansnum,r
from(
	select bbsno,bname,title,content,passwd,viewcnt,wdate,grono,indent,ansnum, 
	rownum r
	from(
		select bbsno,bname,title,content,passwd,viewcnt,wdate,grono,indent,ansnum
		from bbs
		order by grono desc, ansnum
	)
)where r>=1 and r<=5

-- 조회수 증가
update BBS
set viewcnt = viewcnt + 1
where bbsno = 1

-- 패스워드 검사
select count(bbsno) as cnt
from BBS
where bbsno = 1 and passwd ='123';

-- 답변등록
insert into bbs(bbsno,bname,title,content,passwd,wdate,
grono,indent,ansnum)
values((select nvl(max(bbsno),0) +1 as bbsno from bbs),
'아로미','부모글1 답변글2','내용','123', sysdate,2,1,1)

-- 검색
select bbsno,bname,title,content,passwd,viewcnt,wdate,grono,indent,ansnum
from BBS
where bname like '%왕눈이%'
order by bbsno desc;