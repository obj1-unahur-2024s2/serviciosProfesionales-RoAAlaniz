class Empresa {
    var property honorariosReferencia
    const property profesionales = []
    const property clientes = []

    method contratar(unProfesional) {
        profesionales.add(unProfesional)
    }
    method cantEstudiantesEn(unaUni) {
        return profesionales.count({p => p.universidad() == unaUni})
    }
    method profesionalesCaros() {
        return profesionales.filter({p => p.honorarios() > honorariosReferencia})
    }
    method universidadesFormadoras() {
        return profesionales.map({p => p.universidad()}).asSet()
    }
    method profesionalMasBarato() {
        return profesionales.min({p => p.honorarios()})
    }
    method esDeGenteAcotada() {
        return profesionales.all({p => p.provinciaDondeTrabaja().size() <=3})
    } 
    method puedeSatisfacerA(unSolicitante) {
        return profesionales.any({p => unSolicitante.puedeSerAtendidoPor(p)})
    }
    method darServicio(unSolicitante) {
        if (self.puedeSatisfacerA(unSolicitante)){
            const unPrlf = profesionales.find({p => unSolicitante.puedeSerAtendidoPor(p)})
            unPrlf.cobrar(unPrlf.honorarios())
            clientes.add(unSolicitante)
        }
    }
    method cantidadDeClientes() = clientes.size()
    method tieneComoClienteA(unSolicitante) = clientes.contains(unSolicitante)
    method esProfesionalPocoAtractivo(unProfesional) {
        const provinciasProf = unProfesional.provinciasDondeTrabaja().asSet()
        const profMismasProv = profesionales.filter({p=>p.provinciasDondeTrabaja().asSet() == provinciasProf })
        return profMismasProv.any({p=>p.honorarios() < unProfesional.honorarios()})
    }
}