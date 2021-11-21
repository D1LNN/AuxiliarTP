import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel1.*
import direcciones.*
import indicadores.*

object nivelLlaves {

	method configurate() {
		// Fondos
		game.addVisual(new Fondo(position = game.at(0, 0), image = "arena2.png"))
			// -------------------------------------------------------------------------------
			// Elementos:
			// Monedas
		(0 .. 2).forEach({ x => game.addVisual(new Moneda(position = game.at((0 .. game.width() - 1).anyOne(), (0 .. game.height() - 1).anyOne())))})
			// Bananas
		(0 .. 2).forEach({ x => game.addVisual(new Banana(position = game.at((0 .. game.width() - 1).anyOne(), (0 .. game.height() - 1).anyOne())))})
			// Lingotes
		(0 .. 3).forEach({ x => game.addVisual(new Lingote(position = game.at((0 .. game.width() - 1).anyOne(), (0 .. game.height() - 1).anyOne())))})
			// Corazones
		(0 .. 4).forEach({ x => game.addVisual(new Corazon(position = game.at((0 .. game.width() - 1).anyOne(), (0 .. game.height() - 1).anyOne())))})
			// -----------------------------------------------------------------------------------
			// Textos
		game.addVisual(energia)
		game.addVisual(salud)
		game.addVisual(dinero)
			// Personaje
		game.addVisual(pirata)
		self.restartPirata()
			// Teclado
		keyboard.right().onPressDo{ pirata.moverA(derecha)}
		keyboard.left().onPressDo{ pirata.moverA(izquierda)}
		keyboard.up().onPressDo{ pirata.moverA(arriba)}
		keyboard.down().onPressDo{ pirata.moverA(abajo)}
		keyboard.space().onPressDo{ pirata.agarrarObjetoAl(pirata.direccion())}
		keyboard.g().onPressDo({ self.ganar()})
		keyboard.p().onPressDo({ self.perder()})
		keyboard.r().onPressDo({ self.restart()})
		keyboard.any().onPressDo{ self.mostrarPuerta()}
		keyboard.any().onPressDo{ self.comprobarSiGane()}
		keyboard.o().onPressDo{ game.addVisual(puertaFinal)}
	// Colisiones
	}

	method perder() {
		game.clear()
		game.addVisual(new Fondo(position = game.at(0, 0), image = "gameOver.png"))
		game.schedule(3000, { game.stop()})
	}

	method ganar() {
		game.clear()
		game.addVisual(new Fondo(position = game.at(0, 0), image = "arena2.png"))
		game.schedule(2500, { game.clear()
			game.addVisual(new Fondo(position = game.at(0, 0), image = "ganasteElJuego.png"))
			game.schedule(3000, { game.stop()})
		})
	}

	method restart() {
		game.clear()
		self.configurate()
	}

	method mostrarPuerta() {
		if (pirata.cantDeObjetosDeOroAgarrados() == 7) game.addVisual(puertaFinal)
	}

	method comprobarSiGane() {
		if (pirata.entro()) self.ganar() else if (not pirata.tieneEnergia() or not pirata.tieneSalud()) self.perder()
	}

	method restartPirata() {
		pirata.energia(30)
		pirata.salud(100)
		pirata.dinero(0)
		pirata.cantDeObjetosDeOroAgarrados(0)
	}

}

