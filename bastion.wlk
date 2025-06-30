import niveles.*
object bastion {
    var property vida = 3

    method sonidoDanio() = game.sound("")

    // position()
    method text() = "Vidas restantes: " + vida.toString()

    method textColor() = "#FA0770"

    method recibirDanio(unEnemigo) {
        vida -= 1
        self.sonidoDanio().volume(0.4)
        if (vida <= 0) {
            //cambiar a una pantalla de que perdiste
            game.addVisual(gameOver)
            pantallaInicial.aparecerAlTocar()
            //terminar el nivel 
        }
        //elseif () matar a todos los de la fila
    }

    method reset() {
    vida = 3
    }
}