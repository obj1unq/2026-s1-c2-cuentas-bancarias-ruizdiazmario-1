object pepe {
}

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
}

object cuentaConGastos {
    var saldo = 0
    var costoPorOpeacion = 10

    method depositar(monto){
        if (self.costoPorOpeacion() >= monto){
            saldo = saldo + monto - self.costoPorOpeacion()
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

    method costoPorOpeacion() {
      return costoPorOpeacion
    }
}
