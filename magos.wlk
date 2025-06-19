import arcaneBastion.*
class Mago inherits CosaAnimada{
  var property hechizoActual = self.tipoDeMagia().hechizoDe(self)
  method tipoDeMagia()
  var property vida = 100
  var property x = 20
  var property y = 6
  //HACER LA POSICION DINAMICA
  method hacerHechizo() {
    self.hechizoActual().iniciar()
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
  override method frames() = ["frame1HH.png", "frame2HH.png", "frame3HH.png", "frame4HH.png"]
  method moverseADerecha() {
    if (x < 96) {
      x += 1
    }
  }
  method position() = game.at(x,y)
}

// ===============================
// Definición de los magos Específicos
// ===============================

class MagoHielo inherits Mago{
  override method frames() = ["frame1MH.png", "frame2MH.png", "frame3MH.png", "frame4MH.png"]
  override method tipoDeMagia() = hielo
}
object magoHielo inherits MagoHielo(){
}

/*
object magoArcano {
  const magoHielo1 = new MagoHielo(frames=["frame1MH.png", "frame2MH.png", "frame3MH.png", "frame4MH.png"]) 
}
object magoRayo {
  const magoHielo1 = new MagoHielo(frames=["frame1MH.png", "frame2MH.png", "frame3MH.png", "frame4MH.png"]) 
}

object magoNaturaleza {
  const magoHielo1 = new MagoHielo(frames=["frame1MH.png", "frame2MH.png", "frame3MH.png", "frame4MH.png"]) 
}
*/
//Tipos de magos
object hielo {
  var hechizoActual = null
  method hechizoDe(unMago) {
    hechizoActual = new HechizoHielo(x= (unMago.x() + 5), y = unMago.y())
    return hechizoActual
  }
  method hechizoActual() = hechizoActual
}
object fuego {
  method hechizo() {
    
  }
}

object arcano {
  method hechizo() {

  }
}

object rayo {
  
}

object naturaleza {

}