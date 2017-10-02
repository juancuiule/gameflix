import gameflix.*

class Suscripcion {
	var costo
		
	method cobrarSuscripcion(unUsuario){
		unUsuario.pagarSuscripcion(costo)
	}
	method actualizarSuscripcion(unUsuario,unaSuscripcion){
		if(unUsuario.puedePagar(0.max(unaSuscripcion.costo() - costo))){
			unUsuario.pagar(0.max(unaSuscripcion.costo()-costo))
			unUsuario.cambiarSuscripcion(unaSuscripcion)
		}else{
			throw new Exception("No puede pagar una suscripcion mas cara en este momento")
		}
	}
	method costo(){
		return costo
	}
}

class SuscripcionLimitada inherits Suscripcion{
	var categoriaPermitida
	
	method esJuegoPermitido(unJuego){
		return unJuego.esCategoria(categoriaPermitida)
	}
	method juegosSuscripcion(){
		return gameflix.filtrarJuegos(categoriaPermitida)
	}
}

class SuscripcionPrueba inherits SuscripcionLimitada{
		
	constructor(){
		costo = 0
		categoriaPermitida = "Prueba"
	}
}

class SuscripcionPremium inherits Suscripcion{
	
	constructor(){
		costo = 50
	}
	
	method esJuegoPermitido(unJuego){
		return true
	}
	method juegosSuscripcion(){
		return gameflix.juegos()
	}
}

class SuscripcionInfantil inherits SuscripcionLimitada{
	constructor(){
		costo = 10
		categoriaPermitida = "Infantil"
	}
}

class SuscripcionBase inherits Suscripcion{
	method esJuegoPermitido(unJuego){
		return unJuego.esJuegoBarato()
	}
	method juegosSuscripcion(){
		return gameflix.juegosConPrecioMenorA(30)
	}
}