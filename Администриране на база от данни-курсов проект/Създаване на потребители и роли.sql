--(Administraros) Ivan Todorov
create role Administrators

create login ivantodorov
with password='123'

create user IvanTodorov for login ivantodorov

alter role Administrators
add member IvanTodorov

--(human resources agents) Miroslava Toneva
create role HumanResourcesAgents

create login miroslavaToneva
with password='123'

create user MirsolavaToneva for login miroslavaToneva

alter role HumanResourcesAgents
add member MirsolavaToneva

--(product managers) Emil Tanchev
create role ProductManagers

create login emilTanchev
with password='123'

create user EmilTanchev for login emilTanchev

alter role ProductManagers
add member EmilTanchev
