class ProfesionalVinculado {
  const property universidad
  method honorarios() = universidad.honorariosRecomendados()
  method provinciasDondeTrabaja() = universidad.provincia()
  method cobrar(unImporte) {
    universidad.recibirDonacion(unImporte * 0.5)
  }
}

class ProfesionalAsociado {
  const property universidad
  method honorarios() = 3000
  method provinciasDondeTrabaja() =  ["Entre Rios", "Santa Fe", "Corrientes"]
  method cobrar(unImporte) {
    asociacion.recibirDonacion(unImporte)
  }
}

object asociacion {
  var totalRecaudado = 0
  method recibirDonacion(unImporte) {
    totalRecaudado += unImporte
  }
}

class ProfesionalLibre {
  var totalRecaudado = 0
  const property universidad
  const property provinciasDondeTrabaja = []
  var property honorarios //se deja vacio para despues indicarle el valor
  method totalRecaudado() = totalRecaudado
  method agregarProvincia(unaProv) = provinciasDondeTrabaja.add({unaProv})
  method cobrar(unImporte) {
    totalRecaudado += unImporte
  }
  method pasarDinero(unImporte, unProfesional) {
    totalRecaudado = (totalRecaudado - unImporte).max(0)
    unProfesional.cobrar(unImporte)
  }
}
