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
	//Juego un juego est� permitido por mi suscripcion, de lo contrario tiro una excepcion
	method jugarJuego(unJuego){
		if(self.esJuegoPermitido(unJuego)){
			unJuego.jugar(self)
		}else{
			throw new Exception("No puedo jugar a este juego")
		}
	}
	//Indica si un juego est� permitido por mi suscripcion
	method esJuegoPermitido(unJuego){
		return tipoSuscripcion.esJuegoPermitido(unJuego)
	}
	//Reducir humor seg�n una cantidad
	method reducirHumor(unaCantidad){
		humor =- unaCantidad
	}
	//Compra de cosm�ticos para el MOBA
	method comprarCosmeticos(unPrecio){
		self.pagar(unPrecio)
	}
	//Abstracci�n m�s expresiva
	method cambiarSuscripcion(unaSuscripcion){
		tipoSuscripcion = unaSuscripcion
	}
	//Aumentar humor seg�n horas
	method aumentarHumor(horas){
		humor =+ horas*5
	}
	//Intento pagar la suscripci�n de lo contrario cambio mi suscripcion a prueba
	method pagarSuscripcion(costo){
		try{
			self.pagar(tipoSuscripcion.costo())
		}catch e : Exception{
			self.cambiarSuscripcion(suscripcionPrueba)
		}
	}
	//Abstracci�n para pagar cualquier cosa, tira excepci�n atrapable si el dinero no alcanza para pagar el monto
	method pagar(unaCantidad){
		if(self.puedePagar(unaCantidad)){
			dinero =- unaCantidad
		}else{
			throw new Exception("No alcanza el dinero del usuario para pagar")
		}
	
	}
	//Delegar la actualizaci�n de la suscripci�n a mi suscripci�n actual
	method actualizarSuscripcion(unaSuscripcion){
		tipoSuscripcion.actualizarSuscripcion(self,unaSuscripcion)
	}
	//El dinero alcanza para pagar un monto
	method puedePagar(unCosto){
		return dinero >= unCosto
	}
	


}