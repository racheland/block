require 'sinatra'
require './block'
#block.rb 랑 시나트나랑 연결

set :port, 4567
b = Blockchain.new
#block.rb 의 Blockchain 클래스 불러오기

get '/number_of_blocks' do 
	b.all_chains.size.to_s
end

	get '/' do
		message = "<center>"

	 b.all_chains.each do |a|
		message << "BlockHeight : " + a['nHeight'].to_s + "<br>"
		message << "Time : " + a['nTime'].to_s + "<br>"
		message << "Nonce : " + a['nNounce'].to_s + "<br>"
		message << "Previous BlockHash : " + a['previous_address'].to_s + "<br>"
		message << "Cur_Block : " + Digest::SHA256.hexdigest(a.to_s) + "<br>"
		message << "Transactions : " + a["transactions"].to_s + "<br>"
		message << "<hr>"
	end

	message << "</center>"
	end

	get '/mine' do
	b.mining.to_s  
	#block.rb의 def된 마이닝을 가져옴. 숫자값을 문자값(string)으로 변경 함
	end

	get '/trans' do
		b.make_a_trans(params["sender"],params["recv"],params["amount"]).to_s
	end

	get '/new_wallet' do 
		b.make_a_new_wallet.to_s
	end

	get '/all_wallet' do
		b.show_all_wallet.to_s
	end


get '/ask' do 
	b.ask_other_block.to_s 
end

get '/recv' do 
	recv_block = JSON.parse(params["blocks"])
	b.recv(recv_block)
	b.all_chains.to_json
	
	#합쳐진것이 호출됨
	end

#친구리스트 받아오기
get '/add_node' do
	b.add_node(params["node"]).to_s
end


