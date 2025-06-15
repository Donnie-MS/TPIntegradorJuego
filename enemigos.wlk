import arcaneBastion.*
//test enemigo dragon 
object dragon1{
  const dr1 = new Enemigo(frames= ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"]) 
  method iniciar() {
    dr1.iniciar()
  }
}

class Enemigo inherits PersonajeAnimado{
  var property vida = 100
  var x = 96
  var y = 6
  override method iniciar() {
    super()
    arcaneBastion.movimientoIzquierda().add(self)
  }
  method position() = game.at(x, y)
  method moverseAIzquierda() {
    if (x > 0) {
      x -= 1
    }
  }
}
