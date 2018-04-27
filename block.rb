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
		end while hashed[0..3] != "0000"

		block = {
		"index" => 1,
		"time" => 203242354,
		"nonce" => 3234
		}

		history.size
		
	end
  
end
