import arcaneBastion.*
//test enemigo dragon 

object dragon1{
  const dr1 = new Enemigo() 
  method iniciar() {
    dr1.iniciar()
  }
}

class Enemigo inherits CosaAnimada{
  override method frames() = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"]
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
