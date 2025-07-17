CREATE TABLE 部門
(
部門ID nchar(4) PRIMARY KEY,
部門名稱 nchar(20)
);

CREATE TABLE 科系資料表
(
科系ID nchar(4) PRIMARY KEY,
科系名稱 nchar(20)
);

CREATE TABLE 教師資料表
(
教師ID nchar(4) PRIMARY KEY,
教師姓名 nchar(20)
);

CREATE TABLE 教室資料表
(
教室ID nchar(4) PRIMARY KEY,
教室名稱 nchar(20),
容納人數 int,
類型 nchar(10)
);

CREATE TABLE 製造商資料表
(
製造商ID nchar(4) PRIMARY KEY,
製造商名稱 nchar(20),
電話 nchar(10)
);

CREATE TABLE 公司員工資料表
(
員工ID nchar(4) PRIMARY KEY,
員工姓名 nchar(20),
員工部門 nchar(10)
);

CREATE TABLE 產品資料表2
(
產品ID nchar(4) PRIMARY KEY,
產品名稱 nchar(20),
定價 int,
本產品的製造商ID nchar(4),
FOREIGN KEY (本產品的製造商ID) REFERENCES 製造商資料表(製造商ID)
);

CREATE TABLE 學生資料表
(
學生ID nchar(4) PRIMARY KEY,
姓名 nvarchar(10) NOT NULL,
身高 real NULL,
體重 int NULL,
生日 date NULL,
性別 nchar(1) NULL,
血型 nchar(2) NULL,
居住地 nvarchar(50) NULL,
所屬科系ID nchar(4) NULL,
班導師ID nchar(4)
);

ALTER TABLE 學生資料表
ADD CONSTRAINT FK_學生資料_科系 FOREIGN KEY (所屬科系ID) REFERENCES 科系資料表(科系ID);

CREATE TABLE 員工
(
員工ID nchar(4) PRIMARY KEY,
員工姓名 nchar(20),
性別 nchar(1),
部門名稱 nchar(10),
所屬部門ID nchar(4),
FOREIGN KEY (所屬部門ID) REFERENCES 部門(部門ID)
);

CREATE TABLE 產品
(
產品ID nchar(4) PRIMARY KEY,
產品名稱 nchar(20),
定價 money
);

CREATE TABLE 銷售
(
員工ID nchar(4),
產品ID nchar(4),
銷售數量 int,
PRIMARY KEY (員工ID, 產品ID),
FOREIGN KEY (員工ID) REFERENCES 員工(員工ID),
FOREIGN KEY (產品ID) REFERENCES 產品(產品ID)
);

CREATE TABLE 課程資料表
(
課程ID nchar(4) PRIMARY KEY,
課程名稱 nchar(20),
學分數 int,
授課老師ID nchar(4),
FOREIGN KEY (授課老師ID) REFERENCES 教師資料表(教師ID)
);

CREATE TABLE 選課資料表
(
選課ID nchar(4) PRIMARY KEY,
學生ID nchar(4),
課程ID nchar(4),
FOREIGN KEY (學生ID) REFERENCES 學生資料表(學生ID),
FOREIGN KEY (課程ID) REFERENCES 課程資料表(課程ID)
);

-- 新增成績欄位
ALTER TABLE 選課資料表
ADD 成績 int;

CREATE TABLE 課程與教室分配表
(
分配ID nchar(4) PRIMARY KEY,
教室ID nchar(4),
課程ID nchar(4),
FOREIGN KEY (教室ID) REFERENCES 教室資料表(教室ID),
FOREIGN KEY (課程ID) REFERENCES 課程資料表(課程ID)
);

CREATE TABLE 考績資料表
(
員工ID nchar(4) PRIMARY KEY,
第1季銷售量 int,
第2季銷售量 int,
FOREIGN KEY (員工ID) REFERENCES 員工(員工ID)
);

CREATE TABLE 教師薪資表
(
教師ID nchar(4) PRIMARY KEY,
薪資 int,
FOREIGN KEY (教師ID) REFERENCES 教師資料表(教師ID)
);

CREATE TABLE 訂單資料表
(
訂單ID nchar(4) PRIMARY KEY,
日期 date,
負責員工ID nchar(4),
FOREIGN KEY (負責員工ID) REFERENCES 員工(員工ID)
);

CREATE TABLE 客戶資料表
(
客戶ID nchar(4) PRIMARY KEY,
訂單ID nchar(4),
訂單產品ID nchar(4),
FOREIGN KEY (訂單ID) REFERENCES 訂單資料表(訂單ID)
);

CREATE TABLE 產品資料表
(
產品ID nchar(4) PRIMARY KEY,
購買客戶ID nchar(4),
訂單ID nchar(4),
FOREIGN KEY (購買客戶ID) REFERENCES 客戶資料表(客戶ID),
FOREIGN KEY (訂單ID) REFERENCES 訂單資料表(訂單ID)
);

CREATE TABLE 員工與產品多對多
(
序號 nchar(4) PRIMARY KEY,
員工ID nchar(4),
產品ID nchar(4),
FOREIGN KEY (員工ID) REFERENCES 公司員工資料表(員工ID),
FOREIGN KEY (產品ID) REFERENCES 產品資料表2(產品ID)
);

-- 插入部門資料
INSERT INTO 部門 VALUES ('D001','總經理室'),('D002','業務部'),('D003','研發部');

-- 插入員工資料
INSERT INTO 員工 VALUES
('E001','Apple','女','業務部','D001'),
('E002','Bob','男','研發部','D002'),
('E003','Catty','女','製造部','D003'),
('E004','David','男','業務部','D001'),
('E005','Frank','男','研發部','D002'),
('E006','Emy','女','製造部','D003');

-- 插入產品資料
INSERT INTO 產品 VALUES
('P001','手機',2000),('P002','筆電',3000),('P003','記憶體',1000),
('P004','鍵盤',500),('P005','滑鼠',100),('P006','螢幕',1500);

-- 插入銷售資料
INSERT INTO 銷售 VALUES
('E001','P001',5),('E001','P002',2),('E001','P003',15),('E001','P004',25),('E001','P005',3),
('E002','P001',6),('E002','P002',15),('E002','P004',25),('E002','P005',25),('E002','P006',3),
('E003','P003',7),('E003','P002',4),('E004','P006',35),('E004','P002',15),('E004','P001',6),
('E005','P005',9),('E005','P003',55),('E005','P006',15),('E006','P001',5),('E006','P004',7);

select * from 員工 where 性別 ='女';
select * from 員工 where 所屬部門ID ='D001';

select * from 銷售;
select * from 銷售 where 銷售數量>10;
select * from 銷售 where not 銷售數量>10;

select * from 員工
where 性別 ='女' and 部門名稱 ='業務部';

select * from 員工
where 性別 ='女' or 部門名稱 ='業務部';

select * from 銷售;
select * from 銷售 where 銷售數量>10;
select * from 銷售 where not 銷售數量>10;

select * from 員工 where 性別 ='女' and 部門名稱 ='業務部';

select * from 員工 where not (性別 ='女' and 部門名稱 ='業務部');

select * from 員工 where 性別 ='女' and not 部門名稱 ='業務部';

select * from 員工
where 性別 ='女' or 部門名稱 ='業務部';