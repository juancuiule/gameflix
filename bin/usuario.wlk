import gameflix.*
import Suscripcion.*

object usuario {
	var tipoSuscripcion
	var dinero
	var humor
	
	//Retorna todos los juegos de gameflix
	method juegosDeGameflix(){
		return gameflix.juegos()
	}
	//Retorna los juegos que mi suscripcion permite jugar
	method juegosDeMiSubscripcion(){
		return tipoSuscripcion.juegosSuscripcion()
	}
	//Juego un juego está permitido por mi suscripcion, de lo contrario tiro una excepcion
	method jugarJuego(unJuego){
		if(self.esJuegoPermitido(unJuego)){
			unJuego.jugar(self)
		}else{
			throw new Exception("No puedo jugar a este juego")
		}
	}
	//Indica si un juego está permitido por mi suscripcion
	method esJuegoPermitido(unJuego){
		return tipoSuscripcion.esJuegoPermitido(unJuego)
	}
	//Reducir humor según una cantidad
	method reducirHumor(unaCantidad){
		humor =- unaCantidad
	}
	//Compra de cosméticos para el MOBA
	method comprarCosmeticos(unPrecio){
		self.pagar(unPrecio)
	}
	//Abstracción más expresiva
	method cambiarSuscripcion(unaSuscripcion){
		tipoSuscripcion = unaSuscripcion
	}
	//Aumentar humor según horas
	method aumentarHumor(horas){
		humor =+ horas*5
	}
	//Intento pagar la suscripción de lo contrario cambio mi suscripcion a prueba
	method pagarSuscripcion(costo){
		try{
			self.pagar(tipoSuscripcion.costo())
		}catch e : Exception{
			self.cambiarSuscripcion(suscripcionPrueba)
		}
	}
	//Abstracción para pagar cualquier cosa, tira excepción atrapable si el dinero no alcanza para pagar el monto
	method pagar(unaCantidad){
		if(self.puedePagar(unaCantidad)){
			dinero =- unaCantidad
		}else{
			throw new Exception("No alcanza el dinero del usuario para pagar")
		}
	
	}
	//Delegar la actualización de la suscripción a mi suscripción actual
	method actualizarSuscripcion(unaSuscripcion){
		tipoSuscripcion.actualizarSuscripcion(self,unaSuscripcion)
	}
	//El dinero alcanza para pagar un monto
	method puedePagar(unCosto){
		return dinero >= unCosto
	}
	


}