/* DIODE_LIB_LED_7SEG_19x13x8mm by Cesar Updated April 30-2009 */
//#macro DIODE_LIB_LED_7SEG_19x13x8mm() /* Inicio del macro solo EAGLE3D*/
/* Definición de las dimensiones del paquete en mm como variables locales
Según el datasheet del display de 7 segmentos */
// Datasheet values
// Box   
#local L=12.7;                    /* (1) Length_mm (Longitud del paquete) */
#local W=19;                      /* (2) Width_mm  (Ancho del paquete) */
#local H=8;                       /* (3) Hight_mm  (Alto del paquete) */
    // Pin
#local pinDiameter = 0.5;         /* (4) Diameter of pins (Diámetro de los pines) */
#local pinSep = 2.54;             /* (5) Separation between pins (Separación entre pines) */
#local pinHight = 6;              /* (6) Total height of the pin (Altura total del pin)   */
#local pin1x = -5.08;             /* (7) X position of the first pin (Posición X del primer pin) */
#local pin1z = -7.62;             /* (7) Z position of the first pin (Posición Y del primer pin) */
    // Support
#local hSupport = 1.2;            /* (8) Height of Support (Altura del soporte) */
#local lSuppTop = 1.88;           /* (9) Length Support Top (longitud de la tapa del soporte) */
#local l1SuppBase = 1;            /* (10) Length1 Support Base (longitud1 de la base del soporte) */
#local l2SuppBase = 0.5;          /* (11) Length2 Support Base (longitud2 de la base del soporte) */