import pepe.*
import julian.*
import cuentas.*


object casa {
    var gastosDelMes = 0
    var mes = "abril"
    var cuenta = null
    var saldo = 0

    method asignarCuenta(unaCuenta) {
        cuenta = unaCuenta
    }

    method cuenta() {
      return cuenta
    }

    method gastosDelMes(){
        return gastosDelMes
    }
    
    method saldo() {
    if (cuenta != null) {
        return (self.cuenta().saldo())
    } else {
        return 0
    }
}
    method depositar(monto) {
      self.cuenta().depositar(monto)
    }

    method mes(){
        return mes
    }

    method cambiarMes(unMes) {
        mes = unMes
        gastosDelMes = 0
    }

    method gastar(monto) {
        cuenta.extraer(monto)
        gastosDelMes = gastosDelMes + monto
    }
}