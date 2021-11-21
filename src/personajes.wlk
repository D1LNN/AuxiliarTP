import wollok.game.*
import direcciones.*
import nivel1.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición
object pirata {

	var property position = game.at(10, 8)
	const property image = "pirata.png"
	var property direccion
	var property llaves = 0
	var property salud = 100
	var property energia = 30
	var property dinero = 0
	var property entro = false
	var property cantDeObjetosDeOroAgarrados = 0

	method cambiarPosicion(pos) {
		if (self.puedeMoverseAl(direccion)) {
			if (self.hayObjetoConsumibleAl(direccion)) {
				self.agarrarObjetoAl(direccion)
			}
			self.position(pos)
			energia -= 1
		}
	}

	method moverA(direc) {
		direccion = direc
		self.cambiarPosicion(direccion.siguiente(self.position()))
	}

	method agarrarObjetoAl(direc) {
		if (self.hayObjetoAl(direc)) self.agarrar(self.objetosAl(direc).get(0)) else game.say(self, "No hay objetos para agarrar en esta direccion.")
	}

	method agarrar(objeto) {
		if (objeto.esLlave()) {
			llaves += 1
		} else if (objeto.esLingote() or objeto.esMoneda()) {
			dinero += objeto.dineroQueAporta()
			salud = (salud - objeto.saludQueSaca()).max(0)
			cantDeObjetosDeOroAgarrados += 1
		} else if (objeto.esCorazon()) {
			salud = (salud + objeto.saludQueAporta()).min(100)
		} else if (objeto.esBanana()) {
			energia = (energia + objeto.energiaQueAporta()).min(100)
		} else if (objeto.esPuerta()) {
			entro = true
		}
		objeto.serAgarrada()
	}

	method puedeMoverseAl(direc) = self.objetosAl(direc).all({ elem => elem.sePuedePisar() or elem.puedeMoverseAl(direc) })

	method objetosAl(direc) = game.getObjectsIn(direc.siguiente(position))

	method hayObjetoAl(direc) = not game.getObjectsIn(direc.siguiente(position)).isEmpty()

	method hayObjetoConsumibleAl(direc) = self.hayObjetoAl(direc) and self.objetosAl(direc).all({ obj => obj.sePuedeConsumir() })

	method tieneEnergia() = energia > 0

	method tieneSalud() = salud > 0

	method tieneTresLlaves() = llaves == 3

}

