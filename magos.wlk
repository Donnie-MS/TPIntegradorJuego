import arcaneBastion.*
//MAGO HIELO TEST:
object mh1{
  const magoHielo1 = new MagoHielo(frames=["frame1MH.png", "frame2MH.png", "frame3MH.png", "frame4MH.png"]) 
  method iniciar() {
    magoHielo1.iniciar()
    magoHielo1.hacerHechizo()
  }
}
class Mago inherits CosaAnimada{
   var property vida = 100
}
class MagoHielo inherits Mago{
  var property hechizoActual = new HechizoHielo(x = (x + 5), y= (y + 2), frames = ["frame1HH.png", "frame2HH.png", "frame3HH.png", "frame4HH.png"])
  //HACER LA POSICION DINAMICA
  var x = 20
  var y = 6

  method hacerHechizo() {
    hechizoActual.iniciar()
  }
  method position() = game.at(x,y)
}
class Hechizo inherits CosaAnimada{
  var property x
  var property y 
  var property danio = 25
  override method iniciar() {
    super()
    arcaneBastion.movimientoDerecha().add(self)
  }
}
class HechizoHielo inherits Hechizo{

  method moverseADerecha() {
    if (x < 96) {
      x += 1
    }
  }
  method position() = game.at(x,y)
}