#include <stdio.h>
#include <iostream>
#include <string>

using namespace std;
//Lo de aca arriba ignoralo son librerias para otras cosas

class cuentas{
    private: //creo las variables privadas
        float val1 = 0;
        float val2 = 0;

    public: //creo el metodo constructor publico
        cuentas(float v1, float v2){
            val1 = v1;
            val2 = v2; //igualo las variables dadas cuando fue llamada la case
            //imaginatelo como un void setup de arduino masomeno.
        }
    
    //creo distintas funciones haciendo cosas con las variables para hacer cuentas
    float sumar(){
        float out = val1+val2;
        return out;
    }
    
    float restar(){
        float out = val1-val2;
        return out;
    }

    float multiplicar(){
        float out = val1*val2;
        return out;
    }

    float dividir(){
        float out = val1/val2;
        return out;
    }
    //creo una funcion para poder modificar los valores
    void val_set(float v1, float v2){
        val1 = v1;
        val2 = v2;
    }

};




int main()
{
    cuentas c = cuentas(10, 2); //llamo a la clase y le pongo los 2 valores 10 y 2
    
    printf("%f \n", c.multiplicar()); //10*2 = 20 por ende deberia imprimir 20

    c.val_set(10, 5); //cambio los valores a 10 y 5
    printf("%f \n", c.multiplicar()); //10*5 = 50
    return 0;
}