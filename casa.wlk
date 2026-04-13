import pepe.*
import julian.*


object casa {
    var gastosDelMes = 0
    var mes = "abril"
    var cuenta = null

    method asignarCuenta(unaCuenta) {
        cuenta = unaCuenta
    }

    method gastosDelMes(){
        return gastosDelMes
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