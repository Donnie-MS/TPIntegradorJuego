import magos.*
import enemigos.*
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
    game.cellSize(12.5)
	  game.height(48)
	  game.width(96)
    game.boardGround("EscenarioNivelFacil.jpg")

    game.onTick(100, "movimiento", {movimientoDerecha.forEach({cosa => cosa.moverseADerecha()})})
    game.onTick(250, "movimiento", {movimientoIzquierda.forEach({cosa => cosa.moverseAIzquierda()})})
    magoHielo.iniciar()
    magoHielo.hacerHechizo()
    game.onTick(150, "animarTodo", {cosasConAnimacion.forEach({cosa => cosa.animar()})})
    dragon1.iniciar()

    game.onCollideDo(magoHielo.hechizoActual(), {enemigo =>
      enemigo.removeVisual()
    })
  }
}

class CosaAnimada {//SI VAN HACER UNO QUE SEA SOLO DE 4 IMAGENES NI MÁS NI MENOS 
  var property index = 0
  var property image = null
  method frames()
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

