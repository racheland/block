require 'securerandom'
class Blockchain 

	def initialize
		@chain = []
		@trans = []
	end 

	def make_a_new_wallet
		SecureRandom.uuid.gsub("-","")
		#하이푼을 공백으로합친다 gsub
	end

	def make_a_trans(s,r,a)
		trans = {
			"sender" => s,
			"receiver" => r,
			"amount" => a
		}
		@trans << trans
		@trans
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
