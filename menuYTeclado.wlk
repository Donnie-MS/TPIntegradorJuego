import arcaneBastion.*

object menu{
  method image()="PantallaInicio.png"
  method iniciar(){
    arcaneBastion.clear()
    
    //Visuales
    self.drawMenu()

    //Teclado
    //configTeclado.menuOn()
  }
  
  method drawMenu(){
    game.boardGround("PantallaInicio.png")
    new OnlyVisual(image = "Logo.png", position = game.at(8,7)).iniciar()
    levelMenu.iniciar()
  }
}

object levelMenu{
  const property position = new MutablePosition(x = 20, y = 6)
  var levelMenuIsOpen = false
  var image = "CloseMenu.png"

  method image() = image

  method iniciar(){
    game.addVisual(self)
    configTeclado.menuOn()
    levelMenuIsOpen = false
    image = "CloseMenu.png"
  }
}
class OnlyVisual{
  method iniciar(){
    game.addVisual(self)
  }

  var property image 

  const property position 
}

object configTeclado {
  var teclado = tecladoJuego
  method iniciar() {
    //* MENU ON:
    keyboard.space().onPressDo({teclado.space()})
  }
  method gameOn(){
    teclado = tecladoJuego
  }

  method menuOn(){
    teclado = tecladoMenu
  }

  method levelMenuOn(){
    teclado = tecladoSelectorNivel
  }
}
class TecladoBase {
  method space(){}
}
  class TecladoMenu inherits TecladoBase{
    override method space(){
      game.boardGround("EscenarioNivelFacil.jpg")
    }

  }

  const tecladoMenu = new TecladoMenu()
object tecladoJuego inherits TecladoBase {
}
object tecladoSelectorNivel {
  
}