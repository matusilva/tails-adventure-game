require 'gosu'
require_relative 'player'

class Poder
	attr_reader :x, :y, :radius
	def initialize(window,x, y)
		@x = x
		@y = y
		@imagem = Gosu::Image.new("Imagens/Poder1.png")
		@radius = 10
		@game = window
		

	end
	def move
		@x +=  8
	end
	def draw
		@imagem.draw(@x, @y, 1)
		
	end


	
end