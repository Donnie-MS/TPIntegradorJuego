import arcaneBastion.*
import bastion.*
class Enemigo inherits CosaAnimada{
  const property frames
  var property vida = 100
  var property x
  var property y
  override method iniciar() {
    super()
    arcaneBastion.movimientoIzquierda().add(self)
  }
  method position() = new MutablePosition(x = x, y = y)
  method moverseAIzquierda() {
    if (x > 0) {
      x -= 1
    }
    else if(x <= 0) {
      bastion.recibirDanio(self)
    }
  }
  method recibirAtaque() {}
  method lanzarAtaque() {}
}
object dragon inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"], x = 96, y = 6) {
  override method lanzarAtaque() {
  }
}

object arbolMaldito inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"], x = 96, y = 6) {
}
object esqueleto inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"], x = 96, y = 6) {

}
object fantasma inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"], x = 96, y = 6) {

}
object arpia inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"], x = 96, y = 6) {

}
/*
object bossRayo inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"]) {

}


object hechiceroSupremo inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"]) {
  
}

object giganteDeHielo inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"]) {

}

object golem inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"]) {

}

object loboDeHielo inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"]) {

}

object magoOscuro inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"]) {

}

object mounstruoPantano inherits Enemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"]) {

}
*/