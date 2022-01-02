--��������� �� ������:

--��������� �� ���� �� ����� �����
sp_addumpdevice disk, fullbackup, 'f:\admin\full.bak'

--��������� �� ���� �� ����� �� ���������
sp_addumpdevice disk, diffbackup, 'f:\admin\diff.bak'

--��������� �� ���� �� ����� �� ����
sp_addumpdevice disk, tailbackup, 'f:\admin\tail.bak'


--��������� �� ����� ����� � ����������
backup database BakeryBusiness
to fullbackup
with init

--��������� �� ����� �� ��������� ��� �������,� ����� � � �����

--�������� �� �����
insert into Customers(FirstName,LastName,Gender,Age,PhoneNumber,CountryId) 
values ('Ivan','Todorov','M',23,06234125,4)

backup database BakeryBusiness
to diffbackup
with differential, init

--�������� �� �����
insert into Feedbacks(Description,Rate,ProductId,CustomerId)
values ('Very delicious',8.5,2,22)

backup database BakeryBusiness
to diffbackup
with differential

--�������� �� ���������
Create proc usp_ChangePrice(@AccountId int,@Price decimal(15,4))
as
	Begin Transaction
declare @account int=(Select top(1) Id from Products where Id=@AccountId)

if(@account is null)
Begin
RollBack
RAISERROR('Invalid data',16,1)
Return
End

if(@Price<=0)
Begin
Rollback
RAISERROR('Price amount cannot be less or equal to 0',16,1)
Return
End

Update Products
Set Price=@Price
where Id=@AccountId
Commit

exec usp_ChangePrice 2,2.50


--��������� �� ����� �� ���� � ���������, ����� � ����� �� ���������
backup log BakeryBusiness
to tailbackup
with no_truncate, init

--�������������� �� ��������� �� ����
use master
restore database BakeryBusiness
from fullbackup
with replace,norecovery

restore database BakeryBusiness
from diffbackup
with replace,norecovery

restore log BakeryBusiness
from tailbackup
with recovery


