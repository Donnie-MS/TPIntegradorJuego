import mago.*

// ===============================
// Administrador de Proyectiles: Controla la creación y gestión de proyectiles
// ===============================
object administradorDeHechizos {
    // Propiedades
    var nombreHechizo = 20000 // Identificador único para cada proyectil creado
    var property hechizos = #{} // Almacena los proyectiles creados

    method nombre() = nombreHechizo // Obtiene el último nombre usado

    // Incrementa el contador de nombreHechizo para nombrar proyectiles de manera única
    method sumarProyectil() { nombreHechizo += 1 }

    // Genera un nuevo proyectil en la posición y tipo especificado
    method generarProyectil(posicion, tipoDeMagia) {
        var nombreParaHechizo = self.nombre()
        nombreParaHechizo = new Hechizo(position = posicion, tipo = tipoDeMagia, frames = tipoDeMagia.frames(), danio = tipoDeMagia.danio())
        hechizos.add(nombreParaHechizo)
        self.sumarProyectil()
        nombreParaHechizo.iniciar()

        game.onCollideDo(nombreParaHechizo, { enemigo => 
            enemigo.recibirAtaque(nombreParaHechizo.danio())
            nombreParaHechizo.eliminar()
        })
    }

    // Mueve cada proyectil en la lista
    method moverHechizos() {
        hechizos.forEach({ proyectil => proyectil.mover() })
    }

    // Activa la colisión para cada hechizo en la lista
    method impactarHechizos() {
        hechizos.forEach({ hechizo => hechizo.colisionar() })
    }

    // Elimina un hechizo de la lista
    method destruirHechizo(hechizo) {
        hechizos.remove(hechizo)
    }
    /*
    hacer que esto sea el ontick de cosa animada
    method cambiarFrame(){
        proyectiles.forEach({proyectil=> proyectil.cambiarFrame()})
    }
    */
    // Restablece el administrador, eliminando todos los hechizos y reiniciando el contador de nombres
    method reset() {
        hechizos.forEach({ hechizo => hechizo.eliminar() })
        nombreHechizo = 0
        hechizos = []
    }
}
