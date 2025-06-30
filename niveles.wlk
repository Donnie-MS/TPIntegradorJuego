import menu.*
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
    method image() = "gameOver.png" // Asegúrate de tener esta imagen
    method position()=position
}
object nivelFacil{
     method iniciarNivel() {
        
    }
}
object nivelSurvival{
    method iniciarNivel() {
        
    }
}