import magos.*
import enemigos.*
object arcaneBastion {
  const property cosasConAnimacion = []
  const property movimientoDerecha = []
  const property movimientoIzquierda = []
  method iniciar() {
    game.title("Arcane Bastion")
    game.cellSize(12.5)
	  game.height(48)
	  game.width(96)
    game.boardGround("EscenarioNivelFacil.jpg")

    game.onTick(100, "movimiento", {movimientoDerecha.forEach({cosa => cosa.moverseADerecha()})})
    game.onTick(250, "movimiento", {movimientoIzquierda.forEach({cosa => cosa.moverseAIzquierda()})})
    mh1.iniciar()

    game.onTick(150, "animarTodo", {cosasConAnimacion.forEach({cosa => cosa.animar()})})
    dragon1.iniciar()

  }
}

class PersonajeAnimado {//SI VAN HACER UNO QUE SEA SOLO DE 4 IMAGENES NI MÁS NI MENOS 
  var property frames 
  var property index = 0
  var property image = null
  method animar() {
    self.index((index + 1)%4)
    self.image(frames.get(index))
  }
  method iniciar() {
    image = frames.get(index)
    game.addVisual(self)
    arcaneBastion.cosasConAnimacion().add(self)
  }
}

