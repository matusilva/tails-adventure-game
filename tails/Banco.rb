require 'gosu'

class Banco
	attr_reader :x, :y,:radius
	def initialize(window)
		@game = window
		@x = 1500 + rand(500)
		@y = 700
		@imagem = Gosu::Image.new("Imagens/Banco01.png")
		@radius = 50
	end 
	
	def draw
		@imagem.draw(@x,610,1)
	end
	

	def move
		@x -= 7
	end

end

