import arcaneBastion.*
import administradorDeHechizos.*
class Mago inherits CosaAnimada{
  var property tipoDeMagia 
  var property vida = 100
  var property x
  var property y 
  method danio() = tipoDeMagia.danio()
  method position() = new MutablePosition(x = x, y = y)
  method cambiarTipoDeMagiaA(unTipoMagia) {
    tipoDeMagia = unTipoMagia
  }
  method hacerHechizo() {
    var posicionTemporal = new MutablePosition(x = x + 2, y = y)
    administradorDeHechizos.generarProyectil(posicionTemporal, tipoDeMagia)
  }
}

class Hechizo inherits CosaAnimada{
  const property tipo
  var property danio = tipo.danio()
  override method frames() = tipo.frames()
  var property position
  method mover() {
      //se mueve solo a la izquierda al menos que lo cambien
      if (position.x() == 100) {
        self.eliminar()
      }
      else {
        position.goRight(1)
      }
  }
  method eliminar() {
    game.removeVisual(self)
    administradorDeHechizos.destruirHechizo(self)
  }
  method colisionar() {}// esto es lo que ocurre cuando colisiona con algo
}

// ===============================
// Definición de los magos Específicos
// ===============================
/*
que podria hacer para que cuando se apriete 1 el mago cambie 
su tipo de magia a tipoHielo: y dispare y asi con los demas
*/
object magoProtagonista inherits Mago(tipoDeMagia = hielo, frames=["frame1MH.png", "frame2MH.png", "frame3MH.png", "frame4MH.png"]
, x = 10, y = 12){
}


//Tipos de magias
class TiposDeMagia {
  const property frames
  const property danio
}

object hielo inherits TiposDeMagia(frames = ["frame1HH.png", "frame2HH.png", "frame3HH.png", "frame4HH.png"],
  danio = 25){}
object fuego inherits TiposDeMagia(frames = ["frame1HH.png", "frame2HH.png", "frame3HH.png", "frame4HH.png"],
  danio = 25){}

object tierra inherits TiposDeMagia(frames = ["rocaObstaculo.png", "rocaObstaculo.png", "rocaObstaculo.png", "rocaObstaculo.png"],
  danio = 0){

}

object viento inherits TiposDeMagia(frames = ["frame1HH.png", "frame2HH.png", "frame3HH.png", "frame4HH.png"],
  danio = 25){}



/*
HACER MANA 

object mana {
	const manaInicial = 100

	var property mana = manaInicial

	method position() = new MutablePosition(x = 7, y = 5)
	method sumarMana() { self.mana(mana + 5 + administradorDeMagos.magos().map({mago => mago.valorAgregado()}).sum())} // preguntar que opina fede | posiblemente se cambie para la presentacion del concurso
	method restarMana(manaARestar) { if (mana>manaARestar) self.mana(mana - manaARestar) else mana=0 }

	// Métodos para mostrar el puntaje
	method text() = mana.toString() + "💧"
	method textColor() = "#FA0770"

	// Método de reset
	method reset() {
		mana = manaInicial
	}
	method recibeDanioMago(danio,enemigo){}
}
*/
