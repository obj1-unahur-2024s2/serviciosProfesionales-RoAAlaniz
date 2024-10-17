class Persona {
    const property provincia 
    method puedeSerAtendidoPor(unProfesional) {
        return unProfesional.provinciaDondeTrabaja().contains(provincia)
    }
}

class Institucion {
    const property uniReconocidas 
    method agregarUniversidad(unaUni) {
        uniReconocidas.add(unaUni)
    } 
    method puedeSerAtendidoPor(unProfesional) {
        return uniReconocidas.contains(unProfesional.universidad())
    }
}

class Club {
    const property provinciaDondeEsta 
    method agregarProvincia(unaProv) {
        provinciaDondeEsta.add(unaProv)
    }  
    method puedeSerAtendidoPor(unProfesional) {
        return provinciaDondeEsta.asSet().intersection(unProfesional.provinciasDondeTrabaja().asSet()).isEmpty()
    }
}