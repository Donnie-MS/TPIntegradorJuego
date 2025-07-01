import administradorDeHechizos.*
import mago.*
import enemigos.*
import bastion.*
import menu.*
import administradorDeEnemigos.*
object arcaneBastion {
  const property cosasConAnimacion = []

  method iniciar() {
    game.title("Arcane Bastion")
    game.cellSize(12)
	  game.height(48)
	  game.width(96)
    game.onTick(100, "movimiento", {administradorDeHechizos.moverHechizos()})//Se mueven hacia la derecha
    game.onTick(250, "movimiento", {administradorDeEnemigos.moverEnemigos()})//Se meuven hacia la izquierda
    game.onTick(150, "animarTodo", {cosasConAnimacion.forEach({cosa => cosa.animar()})})

    game.onCollideDo(magoProtagonista.hechizoActual(), {enemigo =>
      enemigo.recibirAtaque(magoProtagonista.danio())
    })
    administradorDeEnemigos.generarEnemigo(dragon)
    administradorDeEnemigos.generarEnemigo(dragon)
    administradorDeEnemigos.generarEnemigo(dragon)
    administradorDeEnemigos.generarEnemigo(dragon)
    magoProtagonista.iniciar()
    magoProtagonista.hacerHechizo()
    
    //menu.iniciar()
  }
  method clear() {}
}

class CosaAnimada {//SI VAN HACER UNO QUE SEA SOLO DE 4 IMAGENES NI MÁS NI MENOS 
  var property index = 0
  var property image = null
  const frames 
  method frames ()= frames
  method animar() {
    self.index((index + 1)%4)
    self.image(self.frames().get(index))
  }
  method iniciar() {
    image = self.frames().get(index)
    game.addVisual(self)
    arcaneBastion.cosasConAnimacion().add(self)
  }
  method removeVisual(){
    game.removeVisual(self)
  }
  //method colisionaCon(cosa)
}

