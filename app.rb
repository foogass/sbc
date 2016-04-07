#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

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

