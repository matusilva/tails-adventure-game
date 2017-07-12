require 'gosu'

class Arvores
	attr_reader :x, :y
	def initialize(window)
		@game = window
		@x = 1500
		@y = rand(700)
		@imagem = Gosu::Image.new("Imagens/Arvore01.png")
		
	end 
	
	def draw
		@imagem.draw(@x,610,1)
	end
	

	def move
		@x -= 7
	end

end