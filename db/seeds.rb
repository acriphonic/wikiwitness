k = User.new(:username => "kendallmccar", :email => "kendallmccar@gmail.com",
	:password => "Password1", :password_confirmation => "Password1",
	:name => "Kendall McCarthy")
k.account = "admin"
k.save
m = User.new(:username => "mustyneon", :email => "misa@brandeis.edu",
	:password => "Password1", :password_confirmation => "Password1",
	:name => "Mustapha Isa")
m.account = "admin"
m.save