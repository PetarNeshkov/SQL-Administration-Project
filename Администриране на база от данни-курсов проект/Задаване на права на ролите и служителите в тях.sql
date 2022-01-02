use BakeryBusiness
--Administators
GRANT Insert,Update,Delete,Select ON Ingredients To Administrators
GRANT Insert,Update,Delete,Select ON Countries To Administrators
GRANT Insert,Update,Delete,Select ON Distributors To Administrators
GRANT Insert,Update,Delete,Select ON Customers To Administrators
GRANT Insert,Update,Delete,Select ON Feedbacks To Administrators
GRANT Insert,Update,Delete,Select ON Products To Administrators
GRANT Insert,Update,Delete,Select ON ProductsIngredients To Administrators

--Human Resources agent
Grant select on Customers To HumanResourcesAgents
Grant select on Feedbacks To HumanResourcesAgents
Deny delete on Customers To HumanResourcesAgents
Deny delete on Feedbacks To HumanResourcesAgents

--ProductManagers
Grant select on Ingredients To ProductManagers
Grant select on Countries To ProductManagers
Grant select on Products To ProductManagers


--тестване на delete забрана
execute as user = 'MirsolavaToneva'
Delete from Customers
where Id=1

revert