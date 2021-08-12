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
#define VAL 1023
#define VAL2 0

BluetoothSerial SerialBT;
//int rele = 13;
String comando2 = "";
int datos;

String leerBluetooth(){
  String data;
  String comando;
  if(SerialBT.available()){
    while(1){
      char caracter = SerialBT.read();
      comando = (String)caracter;
      data += comando;
      if(comando == "\n")
      break;
    }
  }
  return data;
}

void driverMotor(){
    comando2 = leerBluetooth();
    datos = comando2.toInt();
    if(datos == 0){
      ledcWrite(INT1_CHANNEL, VAL);
      ledcWrite(INT2_CHANNEL, VAL2);
      ledcWrite(INT3_CHANNEL, VAL2);
      ledcWrite(INT4_CHANNEL, VAL2);
      Serial.println(comando2);
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
    }
    else if (datos == 1){
      ledcWrite(INT3_CHANNEL, VAL);
      ledcWrite(INT2_CHANNEL, VAL2);
      ledcWrite(INT1_CHANNEL, VAL2);
      ledcWrite(INT4_CHANNEL, VAL2);
      Serial.println(comando2);
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
    }
    else if (datos == 2){
      ledcWrite(INT3_CHANNEL, VAL);
      ledcWrite(INT1_CHANNEL, VAL);
      ledcWrite(INT2_CHANNEL, VAL2);
      ledcWrite(INT4_CHANNEL, VAL2);
      Serial.println(comando2);
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
    }
    else if (datos == 3){
      ledcWrite(INT2_CHANNEL, VAL);
      ledcWrite(INT4_CHANNEL, VAL);
      ledcWrite(INT1_CHANNEL, VAL2);
      ledcWrite(INT3_CHANNEL , VAL2);
      Serial.println(comando2);
      Serial.println("en el 11");
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
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
if(SerialBT.available())
driverMotor();

}