select Username from Users
where Username in (select Username from Channel)