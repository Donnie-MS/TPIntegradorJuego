import administradorDeOleadas.*
import enemigos.*
import menu.*
import mago.*
object pantallaInicial {
    const position = new MutablePosition(x = 0, y = 0)

    method image() = "PantallaInicio.png" // Asegúrate de tener esta imagen
    method position() = position
    method desaparecerAlTocar(){
        keyboard.space().onPressDo({game.removeVisual(self)})
        menu.aparecerAlTocar()
    }
    method aparecerAlTocar(){
        keyboard.enter().onPressDo({game.addVisual(self)})
    }
}
object gameOver{
    const position = new MutablePosition(x = 0, y = 0)
    method image() = "gameOver.png" 
    method position()=position
}
object nivelFacil{
    method image() = "EscenarioNivelFacil.png" 
    method  position ()= new MutablePosition(x = 0, y = 0)
     method iniciarNivel() {
        //game.addVisual(self)
        config.configTeclas()
        magoProtagonista.iniciar()
       administradorDeOleadas.iniciarOleada([arpia,esqueleto, dragon, arbolMaldito, fantasma, dragon])
    }
}
object nivelSurvival{
    method image() = "escenarioSurvival.png"
    method position() = new MutablePosition(x = 0, y = 0)
    method iniciarNivel() {
          //game.addVisual(self)
          config.configTeclas()
          magoProtagonista.iniciar()
          administradorDeOleadas.iniciarOleada([arbolMaldito, dragon, dragon, arbolMaldito, dragon, dragon])
    }
}
object config{
    method configTeclas(){
        keyboard.up().onPressDo({magoProtagonista.moverArriba()})
        keyboard.down().onPressDo({magoProtagonista.moverAbajo()})
        keyboard.f().onPressDo({magoProtagonista.hacerHechizo()})
        keyboard.num1().onPressDo({magoProtagonista.cambiarTipoDeMagiaA(hielo)})
        keyboard.num2().onPressDo({magoProtagonista.cambiarTipoDeMagiaA(fuego)})
        keyboard.num3().onPressDo({magoProtagonista.cambiarTipoDeMagiaA(roca)})
        keyboard.num4().onPressDo({game.addVisual(gameOver)})
    }
}