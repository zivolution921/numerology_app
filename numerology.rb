require 'sinatra'
 
def get_birth_path_num(birthdate)
number = birthdate[0].to_i + birthdate[1].to_i + birthdate[2].to_i + birthdate[3].to_i + birthdate[4].to_i + birthdate[5].to_i + birthdate[6].to_i + birthdate[7].to_i
 
number = number.to_s
number = number[0].to_i + number[1].to_i
 
if number > 9
number = number[0].to_i + number[1].to_i
end
 
return number
end
 
def get_message(birth_path_num)
		case birth_path_num
		when 1
		message = "Your numerology number is #{birth_path_num}.\nOne is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
		when 2
		message = "Your numerology number is #{birth_path_num}.\nThis is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
		when 3
		message = "Your numerology number is #{birth_path_num}.\nThis is the motivatinal person and ambitious."
		when 4
		message = "Your numerology number is #{birth_path_num}.\nThis is the motivatinal person and ambitious."
		when 5
		message = "Your numerology number is #{birth_path_num}.\nThis is the motivatinal person and ambitious."
		when 6
		message = "Your numerology number is #{birth_path_num}.\nThis is the motivatinal person and ambitious."
		when 7
		message = "Your numerology number is #{birth_path_num}.\nThis is the motivatinal person and ambitious."
		when 8
		message = "Your numerology number is #{birth_path_num}.\nThis is the motivatinal person and ambitious."
		when 9
		message = "Your numerology number is #{birth_path_num}.\nThis is the motivatinal person and ambitious."
		else
		message = "Uh oh! Your birth path number is not 1-9!"
		end
end
 
get '/:birthdate' do
  setup_index_view
end

get '/newpage/' do
	erb :newpage
end

get '/message/:birth_path_num' do
  birth_path_num = params[:birth_path_num].to_i
  @message = get_message(birth_path_num)
  erb :index
end

get '/' do
  erb :form
end

post '/' do
	birth_path_num = get_birth_path_num(params[:birthdate])
  birthdate = params[:birthdate].gsub("-", "")
  birth_path_num = get_birth_path_num(birthdate)
  redirect "/message/#{birth_path_num}"
end

def setup_index_view
	birthdate = params[:birthdate]
	birth_path_num = get_birth_path_num(birthdate)
	@message = get_message(birth_path_num)
  erb :index
end








