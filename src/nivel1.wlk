import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import direcciones.*
import indicadores.*

//import textosVisibles.*
object nivelBloques {

	method configurate() {
		// Fondos y Depositos
		game.addVisual(new Fondo(position = game.at(0, 0), image = "arena2.png"))
		game.addVisual(deposito)
		self.restartDeposito()
			// Cofres
		(0 .. 2).forEach({ x => game.addVisual(new Cofre(position = game.at((0 .. game.width() - 1).anyOne(), (0 .. game.height() - 1).anyOne())))})
			// Llaves
		(0 .. 2).forEach({ x => game.addVisual(new Llave(position = game.at((0 .. game.width() - 1).anyOne(), (0 .. game.height() - 1).anyOne())))})
			// Banana
		(0 .. 2).forEach({ x => game.addVisual(new Banana(position = game.at((0 .. game.width() - 1).anyOne(), (0 .. game.height() - 1).anyOne())))})
			// Pirata
		game.addVisual(pirata)
		self.restartPirata()
			// Textos
		game.addVisual(energia)
		game.addVisual(llaves)
			// teclado
			// Flechas
		keyboard.right().onPressDo{ pirata.moverA(derecha)}
		keyboard.left().onPressDo{ pirata.moverA(izquierda)}
		keyboard.up().onPressDo{ pirata.moverA(arriba)}
		keyboard.down().onPressDo{ pirata.moverA(abajo)}
			// Especiales
		keyboard.space().onPressDo{ pirata.agarrarObjetoAl(pirata.direccion())} // Agarrar objeto en la direccion dada
		keyboard.t().onPressDo({ self.terminar()}) // pasar a nivel 2
		keyboard.p().onPressDo({ self.perder()}) // Perder
		keyboard.r().onPressDo({ self.restart()}) // restaurar
		keyboard.any().onPressDo{ self.comprobarSiGane()}
			// Coliciones
		game.whenCollideDo(pirata, { elemento => elemento.moverA(pirata.direccion())})
	}

	method terminar() {
		game.clear()
		game.addVisual(new Fondo(position = game.at(0, 0), image = "arena2.png"))
		game.addVisual(pirata)
		game.schedule(2500, { game.clear()
			game.addVisual(new Fondo(position = game.at(0, 0), image = "ganasteNivel1.png"))
			game.schedule(3000, { game.clear()
				nivelLlaves.configurate()
			})
		})
	}

	method presentacion() {
		game.clear()
		game.addVisual(new Fondo(position = game.at(0, 0), image = "presentacion.png"))
		keyboard.enter().onPressDo{ game.clear()
		; self.configurate()
		}
	}

	method perder() {
		game.clear()
		game.addVisual(new Fondo(position = game.at(0, 0), image = "gameOver.png"))
		game.schedule(3000, { game.stop()})
	}

	method restart() {
		game.clear()
		self.configurate()
	}

	method comprobarSiGane() {
		if (deposito.estaLleno() and pirata.tieneTresLlaves()) self.terminar() else if (not pirata.tieneEnergia() or not pirata.tieneSalud()) self.perder()
	}

	method restartPirata() {
		pirata.energia(30)
		pirata.llaves(0)
	}

	method restartDeposito() {
		deposito.cofres(0)
	}

}

