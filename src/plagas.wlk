import elementos.*

class Plaga {
	var property poblacion = 0
	
	method transmiteEnfermedades() {
		return poblacion >= 10
	}
	method efectoAlAtaque() {
		poblacion += poblacion  * 0.1
	}
	method implementarAtaque(elemento) {
		self.efectoAlAtaque()
		elemento.ataque(self)
	}
}

class PlagaCucarachas inherits Plaga {
	var property pesoEnPromedio
	method nivelDeDanio() {
		return poblacion / 2
	}
	override method transmiteEnfermedades() {
		return super() and pesoEnPromedio >= 10
	}
	override method efectoAlAtaque() {
		super() 
		pesoEnPromedio += 2
	}
}

class PlagaDePulgas inherits Plaga {
	method nivelDeDanio() {
		return poblacion * 2
	}
}

class PlagaDeGarrapatas inherits Plaga {
	override method efectoAlAtaque() {
		poblacion += poblacion  * 0.2
	}
}

class PlagaDeMosquitos inherits Plaga {
	method nivelDeDanio() {
		return poblacion
	}
	override method transmiteEnfermedades() {
		return super() and poblacion % 3 == 0
	}
}