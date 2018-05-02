require 'securerandom'
class Blockchain 

	def initialize
		@chain = []
		@trans = []
		@wallet = {}
	end 

	def show_all_wallet
		@wallet
	end

	def make_a_new_wallet
		address = SecureRandom.uuid.gsub("-","")
		@wallet[address] = 1000
		@wallet
		#하이푼을 공백으로합친다 gsub
	end

	def make_a_trans(s,r,a)
		if @wallet[s].nil? 
			#sender 의 값이 0 ㅇㅣ면 
			"보내는 주소가 잘못되었습니다."
		elsif @wallet[r].nil?
			"받는 주소가 잘못되었습니다"
			#보통 받는주소 체크안함
		elsif @wallet[s].to_f < a.to_f
			"돈이 읍써여"
		else 

			@wallet[s] = @wallet[s].to_f - a.to_f
			@wallet[r] = @wallet[r].to_f + a.to_f
		
			trans = {
			"sender" => s,
			"receiver" => r,
			"amount" => a
			}
			@trans << trans
			@trans
		end
	end
#end 위에 있는 값이 최종값 = 결과값

	def mining
		history = []
		begin
			nonce = rand(100000)
			history << nonce
			hashed = Digest::SHA256.hexdigest(nonce.to_s)
		end while hashed[0..2] != "000"

		block = {
		"nHeight" => @chain.size,
		"nTime" => Time.now.to_i,
		#현재시간을 숫자로 바꿔서 출력 
		"nNonce" => nonce,
		"previous_address" => Digest::SHA256.hexdigest(last_block.to_s),
		"transactions" => @trans
		}
		@trans = []
		@chain << block
		block
	end
  
		def last_block
			@chain[-1]
		end

	def all_chains
		@chain
	end


end
