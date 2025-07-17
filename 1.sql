CREATE TABLE ����
(
����ID nchar(4) PRIMARY KEY,
�����W�� nchar(20)
);

CREATE TABLE ��t��ƪ�
(
��tID nchar(4) PRIMARY KEY,
��t�W�� nchar(20)
);

CREATE TABLE �Юv��ƪ�
(
�ЮvID nchar(4) PRIMARY KEY,
�Юv�m�W nchar(20)
);

CREATE TABLE �ЫǸ�ƪ�
(
�Ы�ID nchar(4) PRIMARY KEY,
�ЫǦW�� nchar(20),
�e�ǤH�� int,
���� nchar(10)
);

CREATE TABLE �s�y�Ӹ�ƪ�
(
�s�y��ID nchar(4) PRIMARY KEY,
�s�y�ӦW�� nchar(20),
�q�� nchar(10)
);

CREATE TABLE ���q���u��ƪ�
(
���uID nchar(4) PRIMARY KEY,
���u�m�W nchar(20),
���u���� nchar(10)
);

CREATE TABLE ���~��ƪ�2
(
���~ID nchar(4) PRIMARY KEY,
���~�W�� nchar(20),
�w�� int,
�����~���s�y��ID nchar(4),
FOREIGN KEY (�����~���s�y��ID) REFERENCES �s�y�Ӹ�ƪ�(�s�y��ID)
);

CREATE TABLE �ǥ͸�ƪ�
(
�ǥ�ID nchar(4) PRIMARY KEY,
�m�W nvarchar(10) NOT NULL,
���� real NULL,
�魫 int NULL,
�ͤ� date NULL,
�ʧO nchar(1) NULL,
�嫬 nchar(2) NULL,
�~��a nvarchar(50) NULL,
���ݬ�tID nchar(4) NULL,
�Z�ɮvID nchar(4)
);

ALTER TABLE �ǥ͸�ƪ�
ADD CONSTRAINT FK_�ǥ͸��_��t FOREIGN KEY (���ݬ�tID) REFERENCES ��t��ƪ�(��tID);

CREATE TABLE ���u
(
���uID nchar(4) PRIMARY KEY,
���u�m�W nchar(20),
�ʧO nchar(1),
�����W�� nchar(10),
���ݳ���ID nchar(4),
FOREIGN KEY (���ݳ���ID) REFERENCES ����(����ID)
);

CREATE TABLE ���~
(
���~ID nchar(4) PRIMARY KEY,
���~�W�� nchar(20),
�w�� money
);

CREATE TABLE �P��
(
���uID nchar(4),
���~ID nchar(4),
�P��ƶq int,
PRIMARY KEY (���uID, ���~ID),
FOREIGN KEY (���uID) REFERENCES ���u(���uID),
FOREIGN KEY (���~ID) REFERENCES ���~(���~ID)
);

CREATE TABLE �ҵ{��ƪ�
(
�ҵ{ID nchar(4) PRIMARY KEY,
�ҵ{�W�� nchar(20),
�Ǥ��� int,
�½ҦѮvID nchar(4),
FOREIGN KEY (�½ҦѮvID) REFERENCES �Юv��ƪ�(�ЮvID)
);

CREATE TABLE ��Ҹ�ƪ�
(
���ID nchar(4) PRIMARY KEY,
�ǥ�ID nchar(4),
�ҵ{ID nchar(4),
FOREIGN KEY (�ǥ�ID) REFERENCES �ǥ͸�ƪ�(�ǥ�ID),
FOREIGN KEY (�ҵ{ID) REFERENCES �ҵ{��ƪ�(�ҵ{ID)
);

-- �s�W���Z���
ALTER TABLE ��Ҹ�ƪ�
ADD ���Z int;

CREATE TABLE �ҵ{�P�ЫǤ��t��
(
���tID nchar(4) PRIMARY KEY,
�Ы�ID nchar(4),
�ҵ{ID nchar(4),
FOREIGN KEY (�Ы�ID) REFERENCES �ЫǸ�ƪ�(�Ы�ID),
FOREIGN KEY (�ҵ{ID) REFERENCES �ҵ{��ƪ�(�ҵ{ID)
);

CREATE TABLE ���Z��ƪ�
(
���uID nchar(4) PRIMARY KEY,
��1�u�P��q int,
��2�u�P��q int,
FOREIGN KEY (���uID) REFERENCES ���u(���uID)
);

CREATE TABLE �Юv�~���
(
�ЮvID nchar(4) PRIMARY KEY,
�~�� int,
FOREIGN KEY (�ЮvID) REFERENCES �Юv��ƪ�(�ЮvID)
);

CREATE TABLE �q���ƪ�
(
�q��ID nchar(4) PRIMARY KEY,
��� date,
�t�d���uID nchar(4),
FOREIGN KEY (�t�d���uID) REFERENCES ���u(���uID)
);

CREATE TABLE �Ȥ��ƪ�
(
�Ȥ�ID nchar(4) PRIMARY KEY,
�q��ID nchar(4),
�q�沣�~ID nchar(4),
FOREIGN KEY (�q��ID) REFERENCES �q���ƪ�(�q��ID)
);

CREATE TABLE ���~��ƪ�
(
���~ID nchar(4) PRIMARY KEY,
�ʶR�Ȥ�ID nchar(4),
�q��ID nchar(4),
FOREIGN KEY (�ʶR�Ȥ�ID) REFERENCES �Ȥ��ƪ�(�Ȥ�ID),
FOREIGN KEY (�q��ID) REFERENCES �q���ƪ�(�q��ID)
);

CREATE TABLE ���u�P���~�h��h
(
�Ǹ� nchar(4) PRIMARY KEY,
���uID nchar(4),
���~ID nchar(4),
FOREIGN KEY (���uID) REFERENCES ���q���u��ƪ�(���uID),
FOREIGN KEY (���~ID) REFERENCES ���~��ƪ�2(���~ID)
);

-- ���J�������
INSERT INTO ���� VALUES ('D001','�`�g�z��'),('D002','�~�ȳ�'),('D003','��o��');

-- ���J���u���
INSERT INTO ���u VALUES
('E001','Apple','�k','�~�ȳ�','D001'),
('E002','Bob','�k','��o��','D002'),
('E003','Catty','�k','�s�y��','D003'),
('E004','David','�k','�~�ȳ�','D001'),
('E005','Frank','�k','��o��','D002'),
('E006','Emy','�k','�s�y��','D003');

-- ���J���~���
INSERT INTO ���~ VALUES
('P001','���',2000),('P002','���q',3000),('P003','�O����',1000),
('P004','��L',500),('P005','�ƹ�',100),('P006','�ù�',1500);

-- ���J�P����
INSERT INTO �P�� VALUES
('E001','P001',5),('E001','P002',2),('E001','P003',15),('E001','P004',25),('E001','P005',3),
('E002','P001',6),('E002','P002',15),('E002','P004',25),('E002','P005',25),('E002','P006',3),
('E003','P003',7),('E003','P002',4),('E004','P006',35),('E004','P002',15),('E004','P001',6),
('E005','P005',9),('E005','P003',55),('E005','P006',15),('E006','P001',5),('E006','P004',7);

select * from ���u where �ʧO ='�k';
select * from ���u where ���ݳ���ID ='D001';

select * from �P��;
select * from �P�� where �P��ƶq>10;
select * from �P�� where not �P��ƶq>10;

select * from ���u
where �ʧO ='�k' and �����W�� ='�~�ȳ�';

select * from ���u
where �ʧO ='�k' or �����W�� ='�~�ȳ�';

select * from �P��;
select * from �P�� where �P��ƶq>10;
select * from �P�� where not �P��ƶq>10;

select * from ���u where �ʧO ='�k' and �����W�� ='�~�ȳ�';

select * from ���u where not (�ʧO ='�k' and �����W�� ='�~�ȳ�');

select * from ���u where �ʧO ='�k' and not �����W�� ='�~�ȳ�';

select * from ���u
where �ʧO ='�k' or �����W�� ='�~�ȳ�';