import gameflix.*

//Clase abstracta para la suscripción de prueba y la infantil que comparten comportamiento
class SuscripcionLimitada{
	var categoriaPermitida
	var costo
	
	constructor(unCosto,unaCategoria){
		costo = unCosto
		categoriaPermitida = unaCategoria
	}
	
	method esJuegoPermitido(unJuego){
		return unJuego.esCategoria(categoriaPermitida)
	}
	method juegosSuscripcion(){
		return gameflix.filtrarJuegos(categoriaPermitida)
	}
	method costo(){
		return costo
	}
}

object suscripcionPrueba inherits SuscripcionLimitada(0,"Prueba") {
}
object suscripcionInfantil inherits SuscripcionLimitada(15,"Infantil") {
}

object suscripcionPremium{
	var costo = 50
		
	method esJuegoPermitido(unJuego){
		return true
	}
	method juegosSuscripcion(){
		return gameflix.juegos()
	}
	method costo(){
		return costo
	}
}

object suscripcionBase{
	var costo = 25
	
	method esJuegoPermitido(unJuego){
		return unJuego.esJuegoBarato()
	}
	method juegosSuscripcion(){
		return gameflix.juegosConPrecioMenorA(30)
	}
	method costo(){
		return costo
	}
}