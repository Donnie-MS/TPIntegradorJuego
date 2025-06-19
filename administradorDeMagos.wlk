import magos.*
import wollok.game.*


/* ===============================
   Administrador de Magos: Gestión de los magos en el juego
   =============================== */
object administradorDeMagos {
    var cantMagos = 0 
    const magos = #{}
    // HACER TIENDA : var property magoAGenerar = magoPiedraTienda

    // Métodos de Consulta
    method magos() = magos
    method cantMagos() = cantMagos

    
    // Suma 1 al contador de nombres de mago para crear nuevos nombres.
    method sumarMago() {cantMagos += 1 }
    /*
    // Método para generar un nuevo mago sin usar múltiples if anidados
    method generarMago(magoSeleccionado, posicion) { 
        self.magoAGenerar(magoSeleccionado) 
        var nuevoMago = self.cantMagos() 
        nuevoMago = self.magoAGenerar().generarMago(posicion) 
        magos.add(nuevoMago)
        self.sumarMago()
        return game.addVisual(nuevoMago)
    }
    */
    // Elimina un mago 
    method eliminar(unMago) {
        magos.remove(unMago)
    }

    // Verifica el estado de cada mago para determinar si están muertos (cambiar metodo matar a morir o  verificar muerte)
    method matarMagos() { magos.forEach({ mago => mago.matar() })  }

    //Ordena a cada mago realizar su acción de disparar
    method disparar() { magos.forEach({ mago => mago.hacerHechizo() })  }
    
    //Resetea el administrador de magos, eliminando todos los magos y reiniciando el contador de magos 
    method reset() {
        magos.forEach({ mago => mago.eliminar() })
        cantMagos = 0 
    }
    
}