import arcaneBastion.*
import bastion.*
import administradorDeEnemigos.*
// ===============================
// Clase Base: Enemigo
// ===============================
class Enemigo inherits CosaAnimada {
    const property tipo
    var property vida = tipo.vida()
    var property danio = tipo.danio()
    var property position

    // Frames para animación
    override method frames() = tipo.frames()

    override method iniciar() {
        super() // Agrega visual y lista de animación
        arcaneBastion.movimientoIzquierda().add(self)
        arcaneBastion.enemigosActivos().add(self)
    }

    method moverseAIzquierda() {
        if (not self.sinVida()) {
            if (position.x() == 0) {
                bastion.recibirDanio()
                self.eliminar()
            }
            else {
                position.goLeft(1)
            }
        }
    }
    method recibirAtaque(danioRecibido) {
        vida = vida - danioRecibido
        if (self.sinVida()) {
            self.eliminar()
        }
    }

    method lanzarAtaque() {
        // Por defecto no hace nada, se sobrescribe en cada objeto
    }

    method sinVida() = vida <= 0

    method eliminar() {
        arcaneBastion.movimientoIzquierda().remove(self)
        arcaneBastion.enemigosActivos().remove(self)
        game.removeVisual(self)
        administradorDeEnemigos.eliminarEnemigo(self)
    }
}

// ===============================
// Clase TipoEnemigo
// ===============================
class TipoEnemigo {
    const property frames
    const property vida
    const property danio

    method frames() = frames
    method vida() = vida
}

// ===============================
// Definición de tipos de enemigos
// ===============================
object dragon inherits TipoEnemigo(frames = ["frame1D.png", "frame2D.png", "frame3D.png", "frame4D.png"], vida = 300, danio = 25) {}

object arbolMaldito inherits TipoEnemigo(frames = ["frame1A.png", "frame2A.png", "frame3A.png", "frame4A.png"], vida = 500, danio = 25) {}

object esqueleto inherits TipoEnemigo(frames = ["frame1E.png", "frame2E.png", "frame3E.png", "frame4E.png"], vida = 100, danio = 25) {}

object fantasma inherits TipoEnemigo(frames = ["frame1F.png", "frame2F.png", "frame3F.png", "frame4F.png"], vida = 150, danio = 25) {}

object arpia inherits TipoEnemigo(frames = ["frame1H.png", "frame2H.png", "frame3H.png", "frame4H.png"], vida = 200, danio = 25) {}


// ===============================
// Objetos específicos de enemigos

// ===============================

/*
object dragon inherits Enemigo(tipo = dragonTipo, position = new MutablePosition(x = 96, y = 12)) {
    override method lanzarAtaque() {
        // Lógica especial si querés
    }
}
*/
