select c.Name from Categories as c
inner join Videos as v
on c.CategoryId = v.CategoryId