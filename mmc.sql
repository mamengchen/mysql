create table if not exists goods(
	goods_id int primary key auto_increment comment '商品编号',
	goods_name varchar(32) not null comment '商品名称',
	unitprice int not null default 0 comment '单价',
	category varchar(12) comment '商品类别',
	provider varchar(64) not null comment '供应商'
);

//default:表示如果没有输入价钱，不输入就表示default之后的值

create table if not exists customer(
	customer_id int primary key auto_increment comment '客户编号',
	name varchar(32) not null comment '客户姓名',
	address varchar(256) comment '客户住址',
	email varchar(64) unique key comment '电子邮箱',
	sex enum('男', '女') not null comment '性别',
	card_id char(18) unique key comment '身份证'
);

create table if not exists purchase(
	order_id int primary key auto_increment comment '订单号',
	customer_id int comment '客户编号',
	goods_id int comment '商品编号',
	nums int default 0 comment '购买数量',
	foreign key (customer_id) references customer(customer_id),
	foreign key (goods_id) references goods(goods_id)
);

CREATE TABLE exam_result (
id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL COMMENT '同学姓名',
yuwen float DEFAULT 0.0 COMMENT '语文成绩',
shuxue float DEFAULT 0.0 COMMENT '数学成绩',
yingyu float DEFAULT 0.0 COMMENT '英语成绩'
);


INSERT INTO exam_result (name, yuwen, shuxue, yingyu) VALUES
('tsz', 67, 98, 56),
('swk', 87, 78, 77),
('zwn', 88, 98, 90),
('cam', 82, 84, 67),
('lxd', 55, 85, 45),
('zzm', 70, 73, 78),
('skm', 75, 65, 30);

INSERT INTO exam_result (name, yuwen, shuxue, yingyu) VALUES
('唐三藏', 67, 98, 56),
('孙悟空', 87, 78, 77),
('猪悟能', 88, 98, 90),
('曹孟德', 82, 84, 67),
('刘玄德', 55, 85, 45),
('孙仲谋', 70, 73, 78),
('宋公明', 75, 65, 30);

插入一列
alter table exam_result add qq varchar(100) comment 'qq' after yingyu;

alter table exam_result modify qq varchar(60);

insert into exam_result (id, name) values (4, '曹孟德') on duplicate key update qq = 111111;

select name, shuxue, yingyu, yuwen from exam_result order by shuxue desc, yingyu, yuwen;
select name, shuxue, yingyu, yuwen from exam_result order by shuxue desc, yingyu desc, yuwen;

select name, shuxue+yuwen+yingyu from exam_result order by yuwen+yingyu+shuxue desc;
select name, shuxue+yuwen+yingyu 总分 from exam_result order by 总分 desc;

select name, shuxue from exam_result where name like '孙%' or name like '曹%' order by shuxue desc;

筛选分页结果
select id, name, shuxue, yingyu, yuwen from exam_result order by id limit 3 offset 0;
limit是看几行，offset是看几行后被分成几页的页数：建议多写几个结果看
select id, name, shuxue, yingyu, yuwen from exam_result order by id limit 3 offset 3;
select id, name, shuxue, yingyu, yuwen from exam_result order by id limit 2 offset 3;
select id, name, shuxue, yingyu, yuwen from exam_result order by id limit 2 offset 1;

update exam_result set shuxue = 80 where name like '孙悟空';

select name, shuxue from exam_result where name like '孙悟空';

update exam_result set shuxue = 60, yuwen = 71 where name like '曹孟德';

select name, shuxue, yuwen+shuxue+yingyu 总分 from exam_result order by 总分 limit 3;

update exam_result set shuxue = shuxue + 30 order by
