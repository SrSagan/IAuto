#include <Arduino.h>
#include <Arduino.h>
#include <WiFi.h>
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
#define VAL 900
#define VAL2 0
#define ENABLE 0

//------------------Servidor Web en puerto 80---------------------

WiFiServer server(80);

//---------------------Credenciales de WiFi-----------------------

const char* ssid     = "Telecentro-1308";
const char* password = "NTZ2MGZKZJN2";

//---------------------VARIABLES GLOBALES-------------------------
byte contconexion = 0;
byte moving = 0;
String header; // Variable para guardar el HTTP request

//------------------------CODIGO HTML-----------------------------

String pagina = "<!DOCTYPE html>"
"<html>"
"<head>"
"<meta charset='utf-8' />"
"<title>Servidor Web ESP32</title>"
"</head>"
"<body>"
"<center>"
"<h1>Servidor Web ESP32</h1>"
"<p><a href='/forward'><button style='height:200px;width:100px'>FORWARD</button></a></p>"
"<p><a href='/left'><button style='height:100px;width:200px'>LEFT</button></a>"
"<a href='/stop'><button style='height:100px;width:100px'>STOP</button></a>"
"<a href='/right'><button style='height:100px;width:200px'>RIGHT</button></a></p>"
"<p><a href='/reverse'><button style='height:200px;width:100px'>REVERSE</button></a></p>"
"</center>"
"</body>"
"</html>";

//-------------------------FUNCIONES------------------------------

byte wifiControl(){
  static byte direction;
  WiFiClient client = server.available();   // Escucha a los clientes entrantes

  if (client) {                             // Si se conecta un nuevo cliente
    Serial.println("New Client.");          // 
    String currentLine = "";                //
    while (client.connected()) {            // loop mientras el cliente está conectado
      if (client.available()) {             // si hay bytes para leer desde el cliente
        char c = client.read();             // lee un byte
        Serial.write(c);                    // imprime ese byte en el monitor serial
        header += c;
        if (c == '\n') {                    // si el byte es un caracter de salto de linea
          // si la nueva linea está en blanco significa que es el fin del 
          // HTTP request del cliente, entonces respondemos:
          if (currentLine.length() == 0) {
            client.println("HTTP/1.1 200 OK");
            client.println("Content-type:text/html");
            client.println("Connection: close");
            client.println();
            
            // establese la dirección del auto
            if (header.indexOf("GET /forward") >= 0) {
              direction = 0;
            } 
            else if (header.indexOf("GET /reverse") >= 0) {
              direction = 1;
            } 
            else if (header.indexOf("GET /left") >= 0) {
              direction = 2;
            }
            else if (header.indexOf("GET /right") >= 0) {
              direction = 3;
            }
            else if (header.indexOf("GET /stop") >= 0) {
              direction = 4;
            }
            
            // Muestra la página web
            client.println(pagina);
            
            // la respuesta HTTP termina con una linea en blanco
            client.println();
            break;
          } else { // si tenemos una nueva linea limpiamos currentLine
            currentLine = "";
          }
        } else if (c != '\r') {  // si C es distinto al caracter de retorno de carro
          currentLine += c;      // lo agrega al final de currentLine
        }
      }
    }
    // Limpiamos la variable header
    header = "";
    // Cerramos la conexión
    client.stop();
//    Serial.println("Client disconnected.");
//    Serial.println("");
  }
  return direction;
}
void driverMotor(int valor){ //setea el valor de los motores segun el valor que recibe 
  if(valor == 0){
    ledcWrite(INT1_CHANNEL, VAL);
    ledcWrite(INT2_CHANNEL, VAL2);
    ledcWrite(INT3_CHANNEL, VAL);
    ledcWrite(INT4_CHANNEL, VAL2);
     if(ENABLE){
      Serial.println(valor); //imprime el valor de la variable
      Serial.println(digitalRead(INT1), digitalRead(INT2));//imprime el estado de los motores
      Serial.println(digitalRead(INT3), digitalRead(INT4));// solo funciona si el valor es mayor que el umbral 
    }
  }
  else if (valor == 1){
    ledcWrite(INT3_CHANNEL, VAL2);
    ledcWrite(INT2_CHANNEL, VAL);
    ledcWrite(INT1_CHANNEL, VAL2);
    ledcWrite(INT4_CHANNEL, VAL);
    if(ENABLE){
      Serial.println(valor);
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
    }
  }
  else if (valor == 2){
    ledcWrite(INT3_CHANNEL, VAL);
    ledcWrite(INT1_CHANNEL, VAL2);
    ledcWrite(INT2_CHANNEL, VAL2);
    ledcWrite(INT4_CHANNEL, VAL2);
    if(ENABLE){
      Serial.println(valor);
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
    }
  }
  else if (valor == 3){
    ledcWrite(INT2_CHANNEL, VAL2);
    ledcWrite(INT4_CHANNEL, VAL2);
    ledcWrite(INT1_CHANNEL, VAL);
    ledcWrite(INT3_CHANNEL , VAL2);
    if(ENABLE){
      Serial.println(valor);
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
    }
  }
    else if (valor == 4){
    ledcWrite(INT2_CHANNEL, VAL2);
    ledcWrite(INT4_CHANNEL, VAL2);
    ledcWrite(INT1_CHANNEL, VAL2);
    ledcWrite(INT3_CHANNEL , VAL2);
    if(ENABLE){
      Serial.println(valor);
      Serial.println(digitalRead(INT1), digitalRead(INT2));
      Serial.println(digitalRead(INT3), digitalRead(INT4));
    }
  }
}

//---------------------------SETUP--------------------------------

void setup() {
  Serial.begin(115200);
  Serial.println("");
  

  // Conexión WIFI
  WiFi.begin(ssid, password);
  //Cuenta hasta 50 si no se puede conectar lo cancela
  while (WiFi.status() != WL_CONNECTED and contconexion <50) { 
    ++contconexion;
    delay(500);
    Serial.print(".");
  }
  if (contconexion <50) {
      //para usar con ip fija
      //IPAddress ip(192,168,1,180); 
      //IPAddress gateway(192,168,1,1); 
      //IPAddress subnet(255,255,255,0); 
      //WiFi.config(ip, gateway, subnet); 
      
      Serial.println("");
      Serial.println("WiFi conectado");
      Serial.println(WiFi.localIP());
      server.begin(); // iniciamos el servidor
  }
  else { 
      Serial.println("");
      Serial.println("Error de conexion");
  }
  ledcSetup(INT1_CHANNEL, FREQUENCY, RESOLUTION);// declara el canal pwm, la frecuencia y la resolucion
  ledcAttachPin(INT1, INT1_CHANNEL); // seteamos el GPIO que va a estar conectado a uno de los canales
  ledcSetup(INT2_CHANNEL, FREQUENCY, RESOLUTION);
  ledcAttachPin(INT2, INT2_CHANNEL);
  ledcSetup(INT3_CHANNEL, FREQUENCY, RESOLUTION);
  ledcAttachPin(INT3, INT3_CHANNEL);
  ledcSetup(INT4_CHANNEL, FREQUENCY, RESOLUTION);
  ledcAttachPin(INT4, INT4_CHANNEL);
  pinMode(INT1, OUTPUT); // comfiguramos los GPIO como salidas
  pinMode(INT2, OUTPUT);
  pinMode(INT3, OUTPUT);
  pinMode(INT4, OUTPUT);
  digitalWrite(INT1, 0); //iniciamos a todos los GPIO en estado bajo
  digitalWrite(INT2, 0);
  digitalWrite(INT3, 0);
  digitalWrite(INT4, 0);
}

//----------------------------LOOP----------------------------------

void loop(){
  moving = wifiControl();
  driverMotor(moving);
}
