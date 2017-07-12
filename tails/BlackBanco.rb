require 'gosu'

class BlackBanco
	attr_reader :x, :y
	def initialize(window)
		@game = window
		@x = 2100
		@y = 700
		@imagem = Gosu::Image.new("Imagens/Banco02.png")
		
	end
	def draw
		@imagem.draw(@x,610,1)
		
	end
	def move
		@x -= 7
	end
	
end