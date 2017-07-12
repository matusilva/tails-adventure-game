require 'gosu'

class Corvos
	attr_reader :x, :y, :radius
	def initialize(window)
		@game = window
		@radius = 30
		@x = 1500
		@y = rand(450)
		@imagem = Gosu::Image.load_tiles(@game, "Imagens/Corvos.png",66,75, false)
	end
	def draw
		@draw = @imagem[Gosu::milliseconds / 50% @imagem.size]
		@draw.draw(@x,@y,1)

	end
	def move
		@x -= 7
	end
end
