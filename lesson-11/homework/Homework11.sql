create table StrTest([Payment Details] varchar(max))
insert into StrTest values ('Full Name = Abdullayev Shoxruh Account = 20201123456789790001 CorrAccount = 105USD777132005'),
              ('Full Name = Alimboev Hamid Account = 20001123459872543510 CorrAccount = 110USD000177007')

select 
*,
LEFT([Payment Details],CHARINDEX(' Account',[payment details])) as FullName,
RIGHT([Payment Details],(len([payment details])-CHARINDEX(' CorrAccount',[payment details]))) as [Correspondent account],
SUBSTRING([Payment Details],CHARINDEX('Account',[payment details]),CHARINDEX(' Corr',[payment details])-CHARINDEX('Account',[payment details])-1) as [Account]
from StrTest
