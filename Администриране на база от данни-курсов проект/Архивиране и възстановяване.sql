--Създаване на архиви:

--създаване на файл за пълен архив
sp_addumpdevice disk, fullbackup, 'f:\admin\full.bak'

--създаване на файл за архив на разликата
sp_addumpdevice disk, diffbackup, 'f:\admin\diff.bak'

--създаване на файл за архив на лога
sp_addumpdevice disk, tailbackup, 'f:\admin\tail.bak'


--създаване на пълен архив в понеделник
backup database BakeryBusiness
to fullbackup
with init

--създаване на архив на разликата във вторник,а после и в сряда

--добавяне на данни
insert into Customers(FirstName,LastName,Gender,Age,PhoneNumber,CountryId) 
values ('Ivan','Todorov','M',23,06234125,4)

backup database BakeryBusiness
to diffbackup
with differential, init

--добавяне на данни
insert into Feedbacks(Description,Rate,ProductId,CustomerId)
values ('Very delicious',8.5,2,22)

backup database BakeryBusiness
to diffbackup
with differential

--добавяне на процедура
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


--създаване на архив на лога в четвъртък, както и архив на разликата
backup log BakeryBusiness
to tailbackup
with no_truncate, init

--възстановяване на системата от срив
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


