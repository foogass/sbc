#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'
	
configure do
	@db = SQLite3::Database.new 'users.db'
	@db.execute 'CREATE TABLE IF NOT EXISTS
		"users"
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT,
			"username" TEXT,
			"phone" TEXT,
			"datestamp" TEXT,
			"barber" TEXT
		)'
end


get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@date_time = params[:date_time]
	@barber = params[:barber]

	# хеш ошибок
	hh = { :username => 'Введите имя', :phone => 'Введите телефон', :date_time => 'Введите дату и время'}

	@error = hh.select {|key,_| params[key] == ''}.values.join(",")
	if @error != '' 
		return erb :visit
	end

	#db.execute "INSERT INTO users (name, phone, datestamp, barber) VALUES (#{@username}, #{@phone}, #{@date_time}, #{@barber});"
	#db.close

# ИЛИ

#	# для каждой пары ключ-значение
#	hh.each do |key, value|
#
#		# если параметр пуст
#		if params[key] == ''
#
#			# переменной error присвоить значение value из хэша ошибок
#			@error = hh[key]
#
#			return erb ;
#		end
#	end

#	f = File.open("/users.txt", "a")
#	f.write("Name: #{@username.capitalize}, phone: #{@phone}, Date & Time: #{@date_time}, barber: #{@barber}")
#	f.close

	@title = "Спасибо!"
	@message = "Мы будем ждать вас в #{@date_time}"

	erb :message
end

get '/contacts' do
	erb :contacts
end

