import mago.*
import enemigos.*
import bastion.*
import menu.*
import administradorDeEnemigos.*
object arcaneBastion {
  const property cosasConAnimacion = []
  const property movimientoDerecha = []
  const property movimientoIzquierda = []
  const property hechizosEnJuego = #{}
  const property enemigosEnJuego = #{}
  method hechizosActivos() = hechizosEnJuego
  method enemigosActivos() = enemigosEnJuego

  method iniciar() {
    game.title("Arcane Bastion")
    game.cellSize(12)
	  game.height(48)
	  game.width(96)
    game.onTick(100, "movimiento", {movimientoDerecha.forEach({cosa => cosa.moverseADerecha()})})
    game.onTick(250, "movimiento", {movimientoIzquierda.forEach({cosa => cosa.moverseAIzquierda()})})

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

