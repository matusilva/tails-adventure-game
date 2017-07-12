require 'gosu'

class Player
	attr_reader :x, :y, :radius
	def initialize(window)
		@radius = 30
		@game = window
		@personagem = Gosu::Image.load_tiles(@game, "Imagens/Tails.png",93,90, false)
		@x = @game.width / 10
		@y = @game.height - 450
		


		
	end
	def draw 
	@draw = @personagem[Gosu::milliseconds / 60% @personagem.size]
	@draw.draw(@x,@y,1)
	
		
	end
	def descer
		if @y < @game.height - 450
			@y +=5
		end
	end 

	def subir
		if @y > @game.height - 800 
			@y -=5		
		end
	end 
	
	def direita 
		if @x < @game.width - 60
			@x +=5

		end
	end
	def esquerda 
		if @x > @game.width - 1000
			@x -=5 
			
		end
		
	end

  	



end
