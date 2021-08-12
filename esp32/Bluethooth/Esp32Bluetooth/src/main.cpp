#include <Arduino.h>
#include "BluetoothSerial.h"
#if !defined(CONFIG_BT_ENABLED) || !defined(CONFIG_BLUEDROID_ENABLED)
#error Bluetooth is not enabled! Please run `make menuconfig` to and enable it
#endif
#define INT1 27
#define INT2 5
#define INT3 18
#define INT4 19
#define INT1_CHANNEL 0
#define INT2_CHANNEL 1
#define INT3_CHANNEL 2
#define INT4_CHANNEL 3
#define RESOLUTION 10
#define FREQUENCY 30000
#define VAl 1023
#define VAl2 0

BluetoothSerial SerialBT;
//int rele = 13;
String comando2 = "";
boolean codigo_true = false;

void bluetoothTerminal(){
  if(SerialBT.available()){
    char caracter = SerialBT.read();
    String comando;
    comando = (String)caracter;

    if(comando != "\n"){
      comando2 += comando;
//      Serial.println(comando2);
    }
    else if(comando == "\n"){
      //Serial.println(comando2);
      codigo_true = true;
      Serial.println("en el else if");
//      comando = "";
//      comando2 = "";
    }

  }
}
void driverMotor(){
  if (codigo_true){
    if(comando2 == "00"){
      ledcWrite(INT1_CHANNEL, VAl);
      digitalWrite(INT2, 0);
      digitalWrite(INT3, 0);
      digitalWrite(INT4, 0);
      Serial.println(comando2);
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
    }
    else if (comando2 == "01"){
      ledcWrite(INT3_CHANNEL, VAl);
      digitalWrite(INT2, 0);
      digitalWrite(INT1, 0);
      digitalWrite(INT4, 0);
      Serial.println(comando2);
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
    }
    else if (comando2 == "10"){
      ledcWrite(INT3_CHANNEL, VAl);
      ledcWrite(INT1_CHANNEL, VAl);
      digitalWrite(INT2, 0);
      digitalWrite(INT4, 0);
      Serial.println(comando2);
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
    }
    else if (comando2 == "11"){
      ledcWrite(INT2_CHANNEL, VAl);
      ledcWrite(INT4_CHANNEL, VAl);
      digitalWrite(INT1, 0);
      digitalWrite(INT3, 0);
      Serial.println(comando2);
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
    }
    Serial.println("hoal" + comando2);
    comando2 = "";
    codigo_true = false;
    Serial.println("en la funcion");
    Serial.println("hoal" + comando2);
  }

}
void setup() {
  Serial.begin(115200);
  SerialBT.begin("ESP32");// Nombre del dispositivo Bluetooth
  ledcSetup(INT1_CHANNEL, FREQUENCY, RESOLUTION);
  ledcAttachPin(INT1, INT1_CHANNEL);
  ledcSetup(INT2_CHANNEL, FREQUENCY, RESOLUTION);
  ledcAttachPin(INT2, INT2_CHANNEL);
  ledcSetup(INT3_CHANNEL, FREQUENCY, RESOLUTION);
  ledcAttachPin(INT3, INT3_CHANNEL);
  ledcSetup(INT4_CHANNEL, FREQUENCY, RESOLUTION);
  ledcAttachPin(INT4, INT4_CHANNEL);
  pinMode(INT1, OUTPUT);
  pinMode(INT2, OUTPUT);
  pinMode(INT3, OUTPUT);
  pinMode(INT4, OUTPUT);
  digitalWrite(INT1, 0);
  digitalWrite(INT2, 0);
  digitalWrite(INT3, 0);
  digitalWrite(INT4, 0);
//  pinMode(rele, OUTPUT);
//  digitalWrite(rele, LOW);

}

void loop() {
/*   while(SerialBT.available()){
    char comando = SerialBT.read();
    Serial.println(comando);
   
    //Control del relé
    if(comando == '1')
       digitalWrite(rele, HIGH);
     else if (comando=='0')
        digitalWrite(rele, LOW);

   }
  delay(20);
*/
bluetoothTerminal();
driverMotor();
}