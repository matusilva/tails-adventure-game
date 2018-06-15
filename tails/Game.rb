require 'gosu'
require_relative 'player'
require_relative 'corvos'
require_relative 'banco'
require_relative 'poder'
require_relative 'rings'
require_relative 'explosao'
require_relative 'blackbanco'
require_relative 'arvores'


class GameWindow < Gosu::Window
  GAMEWIDTH = 1000
  GAMEHEIGHT = 800
  #Frequencia aleatoria de objetos
  CORVOS = 0.05  
  BANCOS = 0.005 
  BLACKBANCO = 0.001 
  ARVORES = 0.009 
  def initialize
    super GAMEWIDTH, GAMEHEIGHT
    self.caption = "Tails:Adventure"
    @estado = "inicio"
    @scroll_x = 0
    @tails = Player.new(self)
    
    @musica = Gosu::Song.new("Musicas/Emerald Hill Zone.ogg")
    @som = Gosu::Sample.new("Musicas/Moeda.wav")
    @musicainicio = Gosu::Song.new("Musicas/Theme Song.wav")
    @musicagameover = Gosu::Song.new("Musicas/Game Over Theme.wav")

    @background_image = Gosu::Image.new("Imagens/background.png")
    #@bg05 = Gosu::Image.new("Imagens/Backgrounds/bg05.png")
    #@bg10 = Gosu::Image.new("Imagens/backgrounds/bg10.png")
    #@bg15 = Gosu::Image.new("Imagens/Backgrounds/bg15.png")
    #@bg20 = Gosu::Image.new("Imagens/Backgrounds/bg20.png")
    #@bg25 = Gosu::Image.new("Imagens/Backgrounds/bg25.png")
    #@bg30 = Gosu::Image.new("Imagens/Backgrounds/bg30.png")
    #@bg35 = Gosu::Image.new("Imagens/Backgrounds/bg35.png")
    #@bg40 = Gosu::Image.new("Imagens/Backgrounds/bg40.png")
    #@bg45 = Gosu::Image.new("Imagens/Backgrounds/bg45.png")
    #@bg50 = Gosu::Image.new("Imagens/Backgrounds/bg50.png")
    #@bg55 = Gosu::Image.new("Imagens/Backgrounds/bg55.png")
    #@bg60 = Gosu::Image.new("Imagens/Backgrounds/bg60.png")
    #@bg65 = Gosu::Image.new("Imagens/Backgrounds/bg65.png")
    #@bg70 = Gosu::Image.new("Imagens/Backgrounds/bg70.png")
    #@bg75 = Gosu::Image.new("Imagens/Backgrounds/bg75.png")
    #@bg80 = Gosu::Image.new("Imagens/Backgrounds/bg80.png")
    #@bg85 = Gosu::Image.new("Imagens/Backgrounds/bg85.png")
    #@bg90 = Gosu::Image.new("Imagens/Backgrounds/bg90.png")
    #@bg95 = Gosu::Image.new("Imagens/Backgrounds/bg95.png")
    #@bg100 = Gosu::Image.new("Imagens/Backgrounds/bg100.png")


    @ground = Gosu::Image.new("Imagens/grass.png", :tileable => false)
    @ringstails = Gosu::Image.new("Imagens/TailsRings.png")
    @corvotails = Gosu::Image.new("Imagens/CorvoIcon.png")
    @bancoicon = Gosu::Image.new("Imagens/BancoIcon.png")
    @tela = Gosu::Image.new("Imagens/inicial01.png")
    @tela2 = Gosu::Image.new("Imagens/inicial02.png")
    @telatutorial = Gosu::Image.new("Imagens/tutorial.png")
    @gameover = Gosu::Image.new("Imagens/gameover06.png")

    @font = Gosu::Font.new(self, "Verdana", 30)

    @corvos = []
    @banco = []
    @blackbanco = []
    @arvores = []
    @poder = []
    @rings = []
    @explosao = []
    @placar = 0
    @score = 0
    @bancosperdidos = 10
    @quantidade = 1
    @z = -1
    @telas = 1
    @tempo = 0.0
    @x = 100
    #@bgz = -1
    
    


  end

  
  def draw
    if @estado == "inicio" then 
      draw_inicio
    elsif @estado == "jogando" then
      draw_jogando
    elsif @estado == "tutorial" then 
      draw_tutorial
    elsif @estado == "gameover" then 
      draw_gameover
      
    end 
  end 
  

  def update
    
    
    if @estado == "inicio" then
      update_inicio
  
    elsif @estado == "jogando" then 
      update_jogando
    elsif @estado == "tutorial" then 
      update_tutorial
    elsif @estado == "gameover" then 
      update_gameover
      
      
    end 
  end


  def button_down(id)
     if id == (Gosu::KbS)then
      @poder.push Poder.new(self, @tails.x, @tails.y) if @poder.size < 2
    end
     if id == (Gosu::KbSpace)then
      @rings.push Rings.new(self, @tails.x, @tails.y) if @rings.size < 1
    end
    if id ==(Gosu::KbReturn) && @z == -1 && @estado == "inicio" then 
      @estado = "jogando"
    end
    if id ==(Gosu::KbReturn) && @z == 0 && @estado == "inicio" then 
      @estado = "tutorial"
    end
    if id ==(Gosu::KbB) && @estado == "tutorial" then 
      @estado = "inicio"
    end
    if id ==(Gosu::KbI) && @estado == "gameover" then 
      initialize
      
    end
    if id == (Gosu::KbDown)then 
      @z = 0
    end
    if id ==(Gosu::KbUp)then 
      @z = -1
      
    end

    
  end
  
  
  def draw_inicio
    @tela.draw(0, 0, 0)
    @tela2.draw(0,0,@z) 
    
    
  end 

  
  def update_inicio
    @musicainicio.play(true)
  
  end

  def update_tutorial
    @musicainicio.stop
   
      
  end

  
  
  def draw_tutorial
    @telatutorial.draw(0,0,0)
    
  end

  
  


  def update_jogando

    @musica.play(true)
    
    @scroll_x += 7
    if @scroll_x > @background_image.width
      @scroll_x = 0
    end

    if button_down?(Gosu::KbUp) then
      @tails.subir

    end
    if button_down?(Gosu::KbDown) then
      @tails.descer
    end
    if button_down?(Gosu::KbRight) then
      @tails.direita

    end
    if button_down?(Gosu::KbLeft) then
      @tails.esquerda
    end

    #Condição para que adicione um novo objeto no array 
    if rand < CORVOS then 
      @corvos.push Corvos.new(self) 
    end

    #Mover cada objeto que foi adicionado 
    @corvos.each do |corvos|
      corvos.move
    end
    if rand < BANCOS then
      @banco.push Banco.new(self) elsif @banco.size < 1 
    end 
    
    @banco.each do |banco|
      banco.move
    end
    if rand < BLACKBANCO then
      @blackbanco.push BlackBanco.new(self) 
        
    end
    @blackbanco.each do |blackbanco|
      blackbanco.move
    end
    if rand < ARVORES then 
      @arvores.push Arvores.new(self)
    end 
    @arvores.each do |arvores|
      arvores.move
    end
    @poder.each do |poder|
      poder.move
    end
    @rings.each do |rings|
      rings.move
    end

    #Condição para colisões entre dois objetos
    @corvos.dup.each do |corvos|
      @poder.dup.each do |poder|
        distancia = Gosu::distance(corvos.x, corvos.y, poder.x, poder.y)
        if distancia < corvos.radius + poder.radius then
          @corvos.delete corvos
          @poder.delete poder
          @explosao.push Explosao.new(self, corvos.x, corvos.y)
          @score += 1

      
        end
      end
    end
    @corvos.each do |corvos|
      if (Gosu::distance(@tails.x,@tails.y,corvos.x,corvos.y-15)) < 50 then
        @estado = "gameover"
      end 
    end
    @banco.dup.each do |banco|
      @rings.dup.each do |rings|
        distancia = Gosu::distance(banco.x + @x, banco.y, rings.x, rings.y)
        if distancia < @x then 
          @banco.delete banco
          @rings.delete rings
          @som.play
          @placar += 10
        end 
      end
    end
    @blackbanco.dup.each do |blackbanco|
      @rings.dup.each do |rings|
        distancia = Gosu::distance(blackbanco.x + @x, blackbanco.y, rings.x, rings.y)
        if distancia < @x then 
          @blackbanco.delete blackbanco
          @rings.delete rings 
          @placar -= 20
        end 
      end
     end 
    if 
      @placar < 0 then
      @estado = "gameover"
      
    end
    @banco.dup.each do |banco|
      if banco.x < GAMEWIDTH - 1200 then
        @bancosperdidos -=1
        @banco.delete banco
      elsif 
        @bancosperdidos == 0 then 
        @estado = "gameover"
      end
    end
    @poder.dup.each do |poder|
      if poder.x > GAMEWIDTH - 50 then 
        @poder.delete poder
      end 
    end
    @rings.dup.each do |rings|
      if rings.y > GAMEHEIGHT - 140 then 
        @rings.delete rings 
         
       end
    end
    
    @explosao.dup.each do |explosao|
      @explosao.delete explosao if explosao.finished
    end 


        
      
  end 
   



  def draw_jogando
    @bancoicon.draw(50,0,3)
    @font.draw(" = #{@bancosperdidos}", 110,20,3,1.0,1.0,0xffffff00)
    @corvotails.draw(200,0,3)
    @font.draw(" = #{@score}", 260,20,3,1.0,1.0,0xffffff00)
    @ringstails.draw(350,-10,3)
    @font.draw(" = #{@placar}",410,20,3,1.0,1.0,0xffffff00)
    @tails.draw()
    @ground.draw(-@scroll_x,738, 1)
    @ground.draw(-@scroll_x + @background_image.width, 738, 1)
    @background_image.draw(0, 0, 0)
   

    #Desenha cada objeto que foi adicionado
    @corvos.each do |corvos|
      corvos.draw
    end
    @banco.each do |banco|
      banco.draw
    end
    @blackbanco.each do |blackbanco|
      blackbanco.draw
    end
    @poder.each do |poder|
      poder.draw
    end
    @rings.each do |rings|
      rings.draw
    end
    @arvores.each do |arvores|
      arvores.draw
    end
    @explosao.each do |explosao|
      explosao.draw
    end 

    def update_gameover
    time = @tempo.to_i/30
    @tempo += 1.0/60.0
      @musica.stop
      @musicagameover.play(true)
      if @tempo >= 6.0 then 
        @musicagameover.stop
        
      end
    end

    def draw_gameover
      @gameover.draw(0,0,0)
       
     end 



end
end





window = GameWindow.new
window.show
