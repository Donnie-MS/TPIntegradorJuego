import arcaneBastion.*

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
object dragon inherits Enemigo() {
}

object arbolMaldito inherits Enemigo() {
}
object bossRayo inherits Enemigo() {

}

object esqueleto inherits Enemigo() {

}

object fantasma inherits Enemigo() {

}

object hechiceroSupremo inherits Enemigo() {
  
}

object giganteDeHielo inherits Enemigo() {

}

object golem inherits Enemigo() {

}

object loboDeHielo inherits Enemigo() {

}

object magoOscuro inherits Enemigo() {

}

object mounstruoPantano inherits Enemigo() {

}

object arpia inherits Enemigo() {
  
}