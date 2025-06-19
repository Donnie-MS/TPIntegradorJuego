import arcaneBastion.*
class Mago inherits CosaAnimada{
  var property hechizoActual = self.tipoDeMagia().hechizoDe(self)
  const property frames
  var property tipoDeMagia 
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
  const property frames
  override method iniciar() {
    super()
    arcaneBastion.movimientoDerecha().add(self)
  }
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


object magoHielo inherits Mago(tipoDeMagia = hielo, frames=["frame1MH.png", "frame2MH.png", "frame3MH.png", "frame4MH.png"]){
}
object magoArcano inherits Mago(tipoDeMagia = hielo, frames=["frame1MH.png", "frame2MH.png", "frame3MH.png", "frame4MH.png"]){
}
object magoRayo inherits Mago(tipoDeMagia = hielo, frames=["frame1MH.png", "frame2MH.png", "frame3MH.png", "frame4MH.png"]){
}

object magoNaturaleza inherits Mago(tipoDeMagia = hielo, frames=["frame1MH.png", "frame2MH.png", "frame3MH.png", "frame4MH.png"]){
}


//Tipos de magias
class TiposDeMagia {
  var hechizoActual = null
  method hechizoActual() = hechizoActual
  method hechizoDe(unMago)
}
object hielo inherits TiposDeMagia{
  override method hechizoDe(unMago) {
    hechizoActual = new Hechizo(x= (unMago.x() + 5), y = unMago.y(), frames = ["frame1HH.png", "frame2HH.png", "frame3HH.png", "frame4HH.png"])
    return hechizoActual
  }
}
object fuego inherits TiposDeMagia{
  override method hechizoDe(unMago) {
    hechizoActual = new Hechizo(x= (unMago.x() + 5), y = unMago.y(), frames = ["frame1HH.png", "frame2HH.png", "frame3HH.png", "frame4HH.png"])
    return hechizoActual
  }
}

object arcano inherits TiposDeMagia{
  override method hechizoDe(unMago) {
    hechizoActual = new Hechizo(x= (unMago.x() + 5), y = unMago.y(), frames = ["frame1HH.png", "frame2HH.png", "frame3HH.png", "frame4HH.png"])
    return hechizoActual
  }
}

object rayo inherits TiposDeMagia{
  override method hechizoDe(unMago) {
    hechizoActual = new Hechizo(x= (unMago.x() + 5), y = unMago.y(), frames = ["frame1HH.png", "frame2HH.png", "frame3HH.png", "frame4HH.png"])
    return hechizoActual
  }
}

object naturaleza inherits TiposDeMagia{
  override method hechizoDe(unMago) {
    hechizoActual = new Hechizo(x= (unMago.x() + 5), y = unMago.y(), frames = ["frame1HH.png", "frame2HH.png", "frame3HH.png", "frame4HH.png"])
    return hechizoActual
  }
}