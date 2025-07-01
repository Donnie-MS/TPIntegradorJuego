import niveles.*
//Para que quede bien los fondos deben ser de 1200px x 600px
object menu{
    method position() = game.origin()
    method image() = "menu.png" 
    method aparecerAlTocar(){
        keyboard.space().onPressDo({game.addVisual(self)})
    }
    method activarModoFacil(){
        keyboard.e().onPressDo({
            game.removeVisual(self)
            game.addVisual(nivelFacil)
            nivelFacil.iniciarNivel()
        })
    }
    method activarModoSurvival(){
        keyboard.s().onPressDo({
            gameaddVisual(nivelSurvival)
            game.removeVisual(self)
            nivelSurvival.iniciarNivel()
        })
    }
}