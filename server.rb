require 'sinatra'
require './block'
#block.rb 랑 시나트나랑 연결

b = Blockchain.new
#block.rb 의 Blockchain 클래스 불러오기

	get '/' do
		message = "<center>"

	 b.all_chains.each do |a|
		message << "번호는 : " + a['index'].to_s + "<br>"
		message << "nonce는 : " + a['nonce'].to_s + "<br>"
		message << "시간은 : " + a['time'].to_s + "<br>"
		message << "앞 주소는 : " + a['previous_address'].to_s + "<br>"
		message << "내 주소는 : " + Digest::SHA256.hexdigest(a.to_s) + "<br>"
		message << "<hr>"
	end

	message << "</center>"
	end

	get '/mine' do
	b.mining.to_s  
	#block.rb의 def된 마이닝을 가져옴. 숫자값을 문자값(string)으로 변경 함
	end

	get '/trans' do
		params["sender"] + params["recv"] + params["amount"]
	end




