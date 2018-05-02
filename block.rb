class Blockchain 
	def initialize
		@chain = []
		@trans = []
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
		"index" => @chain.size + 1,
		"time" => Time.now,
		#현재시간을 숫자로 바꿔서 출력 
		"nonce" => nonce,
		"previous_address" => Digest::SHA256.hexdigest(last_block.to_s)

		}
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
