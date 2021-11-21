import wollok.game.*
import elementos.*
import personajes.*

object paleta {

	const property verde = "00FF00FF"
	const property rojo = "FF0000FF"
	const property azul = "003bff"

}

object salud {

	const property position = game.at(1, 14)

	method text() = "Salud: " + pirata.salud().printString()

	method textColor() = if (pirata.salud() > 30) paleta.verde() else paleta.rojo()

	method sePuedePisar() = true

	method moverA(direc) {
	}

	method cambiarPosicion(pos) {
	}

	method puedeMoverseAl(direc) = game.getObjectsIn(direc.siguiente(position)).all({ elem => elem.sePuedePisar() }) and self.sePuedeMover()

	method sePuedeMover() = false

	method sePuedeConsumir() = false

	method esLlave() = false

	method esCofre() = false

	method esLingote() = false

	method esCorazon() = false

	method esMoneda() = false

	method esBanana() = false

	method esPuerta() = false

}

object energia {

	const property position = game.at(4, 14)

	method text() = "Energia: " + pirata.energia().printString()

	method textColor() = if (pirata.energia() > 30) paleta.verde() else paleta.rojo()

	method sePuedePisar() = true

	method moverA(direc) {
	}

	method cambiarPosicion(pos) {
	}

	method puedeMoverseAl(direc) = game.getObjectsIn(direc.siguiente(position)).all({ elem => elem.sePuedePisar() }) and self.sePuedeMover()

	method sePuedeMover() = false

	method sePuedeConsumir() = false

	method esLlave() = false

	method esCofre() = false

	method esLingote() = false

	method esCorazon() = false

	method esMoneda() = false

	method esBanana() = false

	method esPuerta() = false

}

object llaves {

	const property position = game.at(12, 14)

	method text() = "Llaves: " + pirata.llaves().printString() + "/3"

	method textColor() = if (pirata.llaves() == 3) paleta.verde() else paleta.azul()

	method sePuedePisar() = true

	method moverA(direc) {
	}

	method cambiarPosicion(pos) {
	}

	method puedeMoverseAl(direc) = game.getObjectsIn(direc.siguiente(position)).all({ elem => elem.sePuedePisar() }) and self.sePuedeMover()

	method sePuedeMover() = false

	method sePuedeConsumir() = false

	method esLlave() = false

	method esCofre() = false

	method esLingote() = false

	method esCorazon() = false

	method esMoneda() = false

	method esBanana() = false

	method esPuerta() = false

}

object dinero {

	const property position = game.at(7, 14)

	method text() = "Dinero: " + pirata.dinero().printString()

	method textColor() = paleta.verde()

	method sePuedePisar() = true

	method moverA(direc) {
	}

	method cambiarPosicion(pos) {
	}

	method puedeMoverseAl(direc) = game.getObjectsIn(direc.siguiente(position)).all({ elem => elem.sePuedePisar() }) and self.sePuedeMover()

	method sePuedeMover() = false

	method sePuedeConsumir() = false

	method esLlave() = false

	method esCofre() = false

	method esLingote() = false

	method esCorazon() = false

	method esMoneda() = false

	method esBanana() = false

	method esPuerta() = false

}

