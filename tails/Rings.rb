require 'gosu'
require_relative 'player'

class Rings
	attr_reader :x, :y, :radius
	def initialize(window,x, y)
		@x = x
		@y = y
		@imagem = Gosu::Image.new("Imagens/Rings.png")
		@radius = 10
		@game = window
	end
	def move
		@y += 10
	end
	def draw
		@imagem.draw(@x,@y,1)


	end

end
