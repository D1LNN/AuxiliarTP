import wollok.game.*
import direcciones.*
import personajes.*

class Elemento {

	var property position
	var property direccion = arriba

	method sePuedePisar()

	method moverA(direc) {
	}

	method cambiarPosicion(pos) {
		if (self.puedeMoverseAl(direccion)) self.position(pos)
	}

	method puedeMoverseAl(direc) = game.getObjectsIn(direc.siguiente(position)).all({ elem => elem.sePuedePisar() }) and self.sePuedeMover()

	method sePuedeMover()

	method sePuedeConsumir()

	method esLlave() = false

	method esCofre() = false

	method esLingote() = false

	method esCorazon() = false

	method esMoneda() = false

	method esBanana() = false

	method esPuerta() = false

	method serAgarrada() {
		game.removeVisual(self)
	}

}

class Cofre inherits Elemento {

	const property image = "cofre.png"

	override method sePuedePisar() = false

	override method sePuedeMover() = true

	override method sePuedeConsumir() = false

	override method moverA(direc) {
		direccion = direc
		self.cambiarPosicion(direccion.siguiente(self.position()))
	}

	override method cambiarPosicion(pos) {
		if (self.puedeMoverseAl(direccion)) self.position(pos)
		if (self.estaEnDeposito()) deposito.agregarCofre()
	}

	override method esCofre() = true

	method estaEnDeposito() = position.y().between(deposito.position().y(), deposito.position().y() + 1) and position.x().between(deposito.position().x(), deposito.position().x() + 2)

	override method serAgarrada() {
	}

}

object deposito {

	var property position = game.at((0 .. game.width() - 3).anyOne(), (0 .. game.height() - 2).anyOne())
	var property cofres = 0
	const property image = "toalla.png"

	method moverA(direc) {
	}

	method puedeMoverseAl(direc) = game.getObjectsIn(direc.siguiente(position)).all({ elem => elem.sePuedePisar() }) and self.sePuedeMover()

	method esLlave() = false

	method esCofre() = false

	method esCorazon() = false

	method esLingote() = false

	method esMoneda() = false

	method esBanana() = false

	method esPuerta() = false

	method sePuedePisar() = true

	method sePuedeMover() = false

	method sePuedeConsumir() = false

	method estaLleno() = cofres == 3

	method agregarCofre() {
		cofres += 1
	}

	method serAgarrada() {
	}

}

class Llave inherits Elemento {

	var property image = "llave2.png"

	override method sePuedePisar() = false

	override method sePuedeMover() = false

	override method sePuedeConsumir() = false

	override method esLlave() = true

}

class Corazon inherits Elemento {

	var property image = "corazon.png"

	override method sePuedePisar() = true

	override method sePuedeMover() = false

	override method sePuedeConsumir() = true

	method saludQueAporta() = 15

	override method esCorazon() = true

}

class Lingote inherits Llave {

	override method image() = "lingote.png"

	override method esLingote() = true

	override method esLlave() = false

	method dineroQueAporta() = 20

	method saludQueSaca() = 30

}

class Moneda inherits Lingote {

	override method image() = "moneda.png"

	override method sePuedePisar() = true

	override method sePuedeConsumir() = true

	override method dineroQueAporta() = 10

	override method saludQueSaca() = 15

	override method esMoneda() = true

	override method esLingote() = false

}

class Banana inherits Elemento {

	var property image = "banana.png"

	override method sePuedePisar() = true

	override method sePuedeMover() = false

	override method sePuedeConsumir() = true

	method energiaQueAporta() = 25

	override method esBanana() = true

}

object puertaFinal {

	var property position = game.at((0 .. game.width() - 3).anyOne(), (0 .. game.height() - 2).anyOne())
	const property image = "puerta.png"

	method moverA(direc) {
	}

	method puedeMoverseAl(direc) = game.getObjectsIn(direc.siguiente(position)).all({ elem => elem.sePuedePisar() }) and self.sePuedeMover()

	method esLlave() = false

	method esCofre() = false

	method esCorazon() = false

	method esLingote() = false

	method esMoneda() = false

	method esBanana() = false

	method esPuerta() = true

	method sePuedePisar() = false

	method sePuedeMover() = false

	method sePuedeConsumir() = false

	method serAgarrada() {
	}

}

