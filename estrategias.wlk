object estrategiaMinima {
    var calidad = 1

    method calidad(valor) {
        calidad = valor
    }

    method aplicar(unaCasa) {
        if (self.necesitaViveres(unaCasa)) {
            self.comprarSiPuede(unaCasa)
        }
    }

    method necesitaViveres(unaCasa) {
        return not(unaCasa.tieneViveresSuficientes())
    }

    method porcentajeFaltante(unaCasa) {
        return 40 - unaCasa.viveres()
    }

    method costoCompra(unaCasa) {
        return self.porcentajeFaltante(unaCasa) * calidad
    }

    method puedeComprar(unaCasa) {
        return unaCasa.saldo() >= self.costoCompra(unaCasa)
    }

    method comprarSiPuede(unaCasa) {
        if (self.puedeComprar(unaCasa)) {
            unaCasa.comprarViveres(self.porcentajeFaltante(unaCasa), calidad)
        } else {
            self.error("No hay saldo suficiente para comprar víveres")
        }
    }
}

object estrategiaFull {

    method aplicar(unaCasa) {
        if (unaCasa.estaEnOrden()) {
            self.completarViveres(unaCasa)
        } else {
            self.asegurarMinimoViveres(unaCasa)
            self.repararSiPuede(unaCasa)
        }
    }

    method completarViveres(unaCasa) {
        var falta = self.faltanteHasta100(unaCasa)
        if (falta > 0) {
            unaCasa.comprarViveres(falta, 5)
        }
    }

    method asegurarMinimoViveres(unaCasa) {
        if (not(unaCasa.tieneViveresSuficientes())) {
            unaCasa.comprarViveres(self.faltanteHasta40(unaCasa), 5)
        }
    }

    method repararSiPuede(unaCasa) {
        if (unaCasa.hayReparacionesPendientes() &&
            self.alcanzaParaReparar(unaCasa)) {

            unaCasa.hacerReparaciones()
        }
    }

    method alcanzaParaReparar(unaCasa) {
        return unaCasa.saldo() >= unaCasa.reparacionesPendientes()
    }

    method faltanteHasta40(unaCasa) {
        return 40 - unaCasa.viveres()
    }

    method faltanteHasta100(unaCasa) {
        return 100 - unaCasa.viveres()
    }
}