object casa {
    var gastosDelMes = 0
    var mes = "abril"
    var cuenta = null
    var saldo = 0
    var viveres = 0
    var reparacionesPendientes = 0
    var estrategia = null 
    
    method asignarCuenta(unaCuenta) {
        cuenta = unaCuenta
    }

    method cuenta() {
        return cuenta
    }

    method gastosDelMes() {
        return gastosDelMes
    }
    
    method saldo() {
        if (cuenta != null) {
            return self.cuenta().saldo()
        } else {
            return 0
        }
    }

    method depositar(monto) {
        self.cuenta().depositar(monto)
    }

    method mes() {
        return mes
    }

    method cambiarMes(unMes) {
        self.realizarMantenimiento()
        mes = unMes
        gastosDelMes = 0
    }
    method gastar(monto) {
        if (cuenta.puedeExtraer(monto)) {
            cuenta.extraer(monto)
            gastosDelMes = gastosDelMes + monto
        }
    }
    
    method viveres() {
        return viveres
    }

    method viveres(porcentaje) {
         viveres = porcentaje
    }

    method reparacionesPendientes() {
        return reparacionesPendientes
    }
    
    method registrarRotura(monto) {
        reparacionesPendientes = reparacionesPendientes + monto
    }

    method comprarViveres(porcentaje, calidad) {
        if (viveres + porcentaje > 100) {
            self.error("No se puede superar el 100% de víveres")
        } else {
            var costo = porcentaje * calidad
            self.gastar(costo)
            viveres = viveres + porcentaje
        }
    }

    method hacerReparaciones() {
        self.gastar(reparacionesPendientes)
        reparacionesPendientes = 0
    }

    method tieneViveresSuficientes() {
        return viveres >= 40
    }

    method hayReparacionesPendientes() {
        return reparacionesPendientes > 0
    }

    method estaEnOrden() {
        return not(self.hayReparacionesPendientes()) && self.tieneViveresSuficientes()
    }

    method estrategia(unaEstrategia) {
    estrategia = unaEstrategia
    }

    method estrategia() {
        return estrategia
    }

    method realizarMantenimiento() {
        if (estrategia != null) {
            estrategia.aplicar(self)
        }
    }

    method puedeGastar(monto) {
        return cuenta.puedeExtraer(monto)
    }
}
