import niveles.*
import administradorDeEnemigos.*
object bastion {
    var property vida = 3
    method sinVida() = vida <= 0
    method sonidoDanio() = game.sound("")

    // position()
    method text() = "Vidas restantes: " + vida.toString()

    method textColor() = "#FA0770"

    method recibirDanio() {
        if (not self.sinVida()) {
            vida = vida - 1
            if (self.sinVida()) {
                game.addVisual(gameOver)
                pantallaInicial.aparecerAlTocar()
            }
        }
    }
    method reset() {
    vida = 3
    }
}