object cuentaCorriente {
    var saldo = 0

    method depositar(monto) {
        saldo = saldo + monto
    }

    method extraer(monto) {
        saldo = saldo - monto
    }

    method saldo() {
        return saldo
    }

    method saldo(monto) {
        saldo = monto
    }
    
    method puedeExtraer(monto) {
        return true
    } 
}

object cuentaConGastos {
    var saldo = 0
    var costoPorOperacion = 0

    method depositar(monto) {
    if (monto >= costoPorOperacion) {
        saldo = saldo + monto - costoPorOperacion
    }
}

    method extraer(monto) {
        saldo = saldo - monto
    }

    method saldo() {
        return saldo
    }

    method saldo(monto) {
        saldo = monto
    }

    method costoPorOperacion(costo) {
        costoPorOperacion = costo 
    }

    method costoPorOperacion() {
        return costoPorOperacion
    }
    
    method puedeExtraer(monto) {
        return true
    }
}

object cuentaCombinada {
    var cuentaPrimaria = null
    var cuentaSecundaria = null
    var sobranteDeExtraccion = 0

    method asignarCuentaPrimaria(unaCuenta) {
        cuentaPrimaria = unaCuenta
    }

    method asignarCuentaSecundaria(unaCuenta) {
        cuentaSecundaria = unaCuenta
    }      
  
    method saldoCuentaPrimaria() {
        if (cuentaPrimaria != null) {
            return 0.max(cuentaPrimaria.saldo())
        } else {
            return 0
        }
    }

    method saldoCuentaSecundaria() {
        if (cuentaSecundaria != null) {
            return 0.max(cuentaSecundaria.saldo())
        } else {
            return 0
        }
    } 
   
    method saldoCuentaCombinada() {
        return self.saldoCuentaPrimaria() + self.saldoCuentaSecundaria()
    } 

    method cuentaPrimaria() {
        return cuentaPrimaria
    }

    method cuentaSecundaria() {
        return cuentaSecundaria
    }
  
    method saldo() {
        return self.saldoCuentaCombinada()
    }

    method depositar(monto) {
        cuentaPrimaria.depositar(monto)
    }

    method extraer(monto) {
        if (self.puedeExtraer(monto)) {
            var saldoPrimario = cuentaPrimaria.saldo()
            if (saldoPrimario >= monto) {
                cuentaPrimaria.extraer(monto)
            } else {
                var resto = monto - saldoPrimario
                cuentaPrimaria.extraer(saldoPrimario)
                cuentaSecundaria.extraer(resto)
            }
        }
    }
    method puedeExtraer(monto) {
        return self.saldoCuentaCombinada() >= monto
    }
}