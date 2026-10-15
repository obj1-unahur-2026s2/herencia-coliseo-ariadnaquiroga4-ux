object pepita {
  var energy = 100

  method energy() = energy

  method fly(minutes) {
    energy = energy - minutes * 3
  }
}

object coliseo {
  var gladiadores = []
  var cantPeleasGladiadores = 0
  method agregarAGrupo(gladiador) {
    gladiadores.add(gladiador)
  }
  method quitarDeGrupo(gladiador) {
    gladiadores.remove(gladiador)
  }
  method nombreGrupo(nombre) = nombre
  method masFuerteDeGrupo() {
    return gladiadores.max({g => g.puntosVida()})
  }
  method combate(grupoContra) {

  }
  method gladiadorConMasFuerza(){
    gladiadores.max({g => g.fuerza()})
  }
  method crearGrupo() {
    var grupoNuevo = []
    return if(self == Mirmillones) {
      self.nombreGrupo("Mirmillolandia")
    } else {
      self.nombreGrupo("D")
    }
  }
  method curarGladiador() {}
  method cuararGrupo() {}
}


class ArmasDeFilo {
  var filo = 0
  var longitud
  method filo() = filo
  method longitud() = longitud
  method valorAtaque() {
    return filo * longitud
  }
  method poderDeAtaque() {}
}
class ArmasContundentes {
  var peso
  method poderDeAtaque() = peso
}

class armadura {
  var puntos
  var destreza
  method puntos() = puntos
  method destreza() = destreza
}
class cascos inherits armadura {
  override method puntos() = 10
}
class escudos inherits armadura {
  override method puntos() = 5 + (self.destreza() / 10)
}

class Gladiador {
  var vida = 100
  var destreza
  var fuerza
  var arma
  var armadura
  method fuerza() = fuerza
  method puntosVida() = vida
  method poderAtaque() {}
  method atacar(enemigo) {
    enemigo.daño() == self.poderAtaque() - enemigo.defensa()
  }
  method defensa() {}
  method cambiarArmadura(armaduraNueva) {
    armadura = armaduraNueva
  }
  method cambiarArma(arma1) {
    arma = arma1
  }
  method daño() = 0
  method pelear(enemigo) {
    self.atacar(enemigo)
    enemigo.daño()
    enemigo.atacar(self)
  }
}

class Mirmillones inherits Gladiador(destreza = 15) {
  override method poderAtaque() {
    return arma.poderDeAtaque() + fuerza
  }
  override method defensa() {
    return armadura.puntos() + destreza
  }
}
class Dimachaerus inherits Gladiador(fuerza = 10, armadura = false) {
  override method atacar(enemigo) {
    super()
    destreza + 1
  }
  override method poderAtaque() {
    return fuerza + arma.sum({a => a.poderDeAtaque()})
  }
  override method defensa() {
    return destreza / 2
  }
}
