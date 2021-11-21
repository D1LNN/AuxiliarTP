import wollok.game.*

object izquierda {

	method siguiente(position) = if (position.x() > 0) position.left(1) else game.at(game.width() - 1, position.y())
	
	method esIzquierda() = true

}

object derecha {

	method siguiente(position) = if (position.x() < game.height() - 1) position.right(1) else game.at(0, position.y())
	
	method esDerecha() = true

}

object abajo {

	method siguiente(position) = if (position.y() > 0) position.down(1) else game.at(position.x(), game.height() - 1)
	
	method esAbajo() = true

}

object arriba {

	method siguiente(position) = if (position.y() < game.width() - 1) position.up(1) else game.at(position.x(), 0)

	method esArriba() = true

}

