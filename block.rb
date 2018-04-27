class Blockchain 
	def initialize
		@chain = []
	end 

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
