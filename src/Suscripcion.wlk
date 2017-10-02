import gameflix.*

class Suscripcion {
	var costo
	
	constructor(unCosto){
		costo = unCosto
	}
	//Cuando actualizo mi suscripción a una nueva, pago la diferencia entre el valor de la actual con la nueva, el costo mínimo es 0 (Gameflix no devuelve dinero)
	method actualizarSuscripcion(unUsuario,unaSuscripcion){
		try{
			unUsuario.pagar(0.max(unaSuscripcion.costo()-costo))
			unUsuario.cambiarSuscripcion(unaSuscripcion)
		}catch e : Exception{
			throw new Exception("El usuario no puede pagar la nueva suscripcion ya que es muy cara")
		}
		
	}
	method costo(){
		return costo
	}
}

//Clase abstracta para la suscripción de prueba y la infantil que comparten comportamiento
class SuscripcionLimitada inherits Suscripcion{
	var categoriaPermitida
	
	constructor(unCosto,unaCategoria) = super(unCosto){
		categoriaPermitida = unaCategoria
	}
	
	method esJuegoPermitido(unJuego){
		return unJuego.esCategoria(categoriaPermitida)
	}
	method juegosSuscripcion(){
		return gameflix.filtrarJuegos(categoriaPermitida)
	}
}

object suscripcionPrueba inherits SuscripcionLimitada(0,"Prueba") {
}

object suscripcionPremium inherits Suscripcion(50) {
	
	
	method esJuegoPermitido(unJuego){
		return true
	}
	method juegosSuscripcion(){
		return gameflix.juegos()
	}
}

object suscripcionInfantil inherits SuscripcionLimitada(15,"Infantil") {
}

object suscripcionBase inherits Suscripcion(25){
	method esJuegoPermitido(unJuego){
		return unJuego.esJuegoBarato()
	}
	method juegosSuscripcion(){
		return gameflix.juegosConPrecioMenorA(30)
	}
}