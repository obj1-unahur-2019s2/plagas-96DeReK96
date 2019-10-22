import plagas.*
class Hogar {
	var property nivelDeMugre
	var property confortQueOfrece
	method esBueno() {
		return nivelDeMugre <= confortQueOfrece / 2
	}
	method ataque(plaga) {
		nivelDeMugre = nivelDeMugre + plaga.nivelDeDanio() 
	}
	
}
class Huerta {
	var property produccionMedidaEnKilosPorMes
	method esBueno() {
		return produccionMedidaEnKilosPorMes < nivelDeHuerta.nivel()
	}
	method ataque(plaga) {
		if (not plaga.transmiteEnfermedades()) {
			produccionMedidaEnKilosPorMes = produccionMedidaEnKilosPorMes - 0.1
		} else {
			produccionMedidaEnKilosPorMes = (produccionMedidaEnKilosPorMes - 0.1) - 10
		}	
	}
}

object nivelDeHuerta {
	var property nivel = 0
}


class Mascota {
	var property nivelDeSalud
	method esBueno() {
		return nivelDeSalud > 250
	}
	method ataque(plaga) {
		if (plaga.transmiteEnfermedades()) {
			nivelDeSalud = nivelDeSalud - plaga.nivelDeDanio()
		} 
	}
}

class Barrio {
	var barrios = []
	method elementosBuenos() {
		return barrios.count({elemento => elemento.esBueno()})
	}
	method esCopado() {
		var elementosNoBuenos = barrios.count({elementos => not elementos.esBueno()})
		return self.elementosBuenos() > elementosNoBuenos
	}
}