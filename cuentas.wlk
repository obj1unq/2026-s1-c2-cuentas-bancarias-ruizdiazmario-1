object cuentaCorriente {
    var saldo = 0


    method depositar(monto){
        saldo = saldo + monto
    }

    method extraer(monto){
        saldo = saldo - monto
    }

    method saldo(){
        return saldo
    }

    method saldo(monto) {
      saldo = monto
    } 
}

object cuentaConGastos {
    var saldo = 0
    var costoPorOperacion = 0

    method depositar(monto){
        if (self.costoPorOperacion() <= monto){
            saldo = saldo + monto - self.costoPorOperacion()
        } else {
            saldo = saldo + 0
        }
    }

    method extraer(monto){
        saldo = saldo - monto
    }

    method saldo(){
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
    self.validarPago(monto)
    if (cuentaPrimaria.saldo() >= monto) {
        cuentaPrimaria.extraer(monto)
    } else {
        var resto = monto - cuentaPrimaria.saldo()
        cuentaPrimaria.extraer(cuentaPrimaria.saldo())
        cuentaSecundaria.extraer(resto)
    }
  }
  
  method validarPago(monto){
    if (not(self.puedeExtraer(monto))){
        self.error("No se puede extraer"+ monto+".")
    }
  }  

  method puedeExtraer(monto){
    return self.saldoCuentaCombinada() >= monto
  }
}