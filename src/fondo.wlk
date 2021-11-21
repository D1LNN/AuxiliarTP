import wollok.game.*
import elementos.*

class Fondo inherits Elemento {

	var property image

	override method sePuedePisar() = true

	override method sePuedeMover() = false

	override method sePuedeConsumir() = false

	override method serAgarrada() {
	}

}

