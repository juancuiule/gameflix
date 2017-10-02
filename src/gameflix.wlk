
object gameflix {

	var usuarios
	var juegos
	
	method juegos(){
		return juegos
	}
	
	method filtrarJuegos(categoria)
	{
		return juegos.filter({unJuego => unJuego.esCategoria(categoria)})
	}
	method buscarJuego(nombreJuego)
	{
		return juegos.findOrElse({unJuego => unJuego.seLlama(nombreJuego)},{throw new Exception("No existe el juego")})
	}
	method recomendarJuego(){
		return juegos.anyOne()
	}
	method juegosConPrecioMenorA(unPrecio){
		return juegos.filter({unJuego => unJuego.precioMenorA(unPrecio)})
	}
	method cobrarSuscripciones(){
		usuarios.forEach({usuario => usuario.cobrarSuscripcion()})
	}

}