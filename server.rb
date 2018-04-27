require 'sinatra'
require './block'
#block.rb 랑 시나트나랑 연결

b = Blockchain.new
#block.rb 의 Blockchain 클래스 불러오기

	get '/' do
	"블럭 리스트 입니다."
	end

	get '/mine' do
	b.mining.to_s  
	#block.rb의 def된 마이닝을 가져옴. 숫자값을 문자값(string)으로 변경 함
	end


