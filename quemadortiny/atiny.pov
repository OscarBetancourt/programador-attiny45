//Archivo POVRay creado por 3d41.ulp v1.05
//C:/Users/Oscar/Documents/eagle/quemadortiny/atiny.brd
//29/01/2013 8:45:45 p. m.

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare environment = on;

#local cam_x = 0;
#local cam_y = 158;
#local cam_z = -70;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -3;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 18;
#local lgt1_pos_y = 28;
#local lgt1_pos_z = 16;
#local lgt1_intense = 0.721824;
#local lgt2_pos_x = -18;
#local lgt2_pos_y = 28;
#local lgt2_pos_z = 16;
#local lgt2_intense = 0.721824;
#local lgt3_pos_x = 18;
#local lgt3_pos_y = 28;
#local lgt3_pos_z = -11;
#local lgt3_intense = 0.721824;
#local lgt4_pos_x = -18;
#local lgt4_pos_y = 28;
#local lgt4_pos_z = -11;
#local lgt4_intense = 0.721824;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 49.600000;
#declare pcb_y_size = 30.800000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(848);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;
#include "e3d_tools.inc"
#include "e3d_user.inc"
global_settings{charset utf8}

#if(environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Datos de animaci�n
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 puntos) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 puntos) (Ver carpeta)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-24.800000,0,-15.400000>
}
#end

background{col_bgr}


//Axis uncomment to activate
//object{TOOLS_AXIS_XYZ(100,100,100 //texture{ pigment{rgb<1,0,0>} finish{diffuse 0.8 phong 1}}, //texture{ pigment{rgb<1,1,1>} finish{diffuse 0.8 phong 1}})}

light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro ATINY(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Circuito Impreso
prism{-1.500000,0.000000,8
<-0.800000,-0.800000><48.800000,-0.800000>
<48.800000,-0.800000><48.800000,30.000000>
<48.800000,30.000000><-0.800000,30.000000>
<-0.800000,30.000000><-0.800000,-0.800000>
texture{col_brd}}
}//End union(Platine)
//Taladros(real)/Componentes
cylinder{<10.430000,1,20.540000><10.430000,-5,20.540000>1.150000 texture{col_hls}}
cylinder{<10.430000,1,8.500000><10.430000,-5,8.500000>1.150000 texture{col_hls}}
//Taladros(real)/Circuito Impreso
//Taladros(real)/Vias
}//End difference(reale Bohrungen/Durchbr�che)
#end
#if(pcb_parts=on)//Componentes
union{
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO34_076MM_H("3.3v",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<23.660000,0.000000,14.430000>}#end		//Diode DO34 7mm hor. D1 3.3v DO34Z7
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_DIS_DO34_076MM_H("3.3v",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.550000,0.000000,2.480000>}#end		//Diode DO34 7mm hor. D2 3.3v DO34Z7
#ifndef(pack_LED1) #declare global_pack_LED1=yes; object {DIODE_DIS_LED_3MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<6.950000,0.000000,25.520000>}#end		//Diskrete 3MM LED LED1  LED3MM
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<18.010000,0.000000,13.770000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R1 1.5k 0204/7
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<37.780000,0.000000,19.640000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R2 1.5k 0204/7
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0204_075MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<21.240000,0.000000,14.460000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R3 27 0204/7
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0204_075MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Violet*1.2}finish{phong 0.2}},texture{pigment{Black}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<18.100000,0.000000,6.040000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R4 27 0204/7
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0204_075MM(texture{pigment{DarkBrown}finish{phong 0.2}},texture{pigment{Green*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<43.380000,0.000000,23.830000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R5 1.5k 0204/7
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0204_075MM(texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{Red*0.7}finish{phong 0.2}},texture{pigment{DarkBrown}finish{phong 0.2}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<15.260000,0.000000,26.570000>}#end		//Discrete Resistor 0,15W 7,5MM Grid R6 220 0204/7
#ifndef(pack_SV1) #declare global_pack_SV1=yes; object {PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<30.390000,0.000000,23.870000>}#end		//Header 2,54mm Grid 6Pin 1Row (jumper.lib) SV1  MA06-1
#ifndef(pack_U_1) #declare global_pack_U_1=yes; object {IC_DIS_DIP8("ATTINY45DIP8","PHILIPS",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<38.680000,0.000000,9.300000>translate<0,3.000000,0> }#end		//DIP8 U$1 ATTINY45DIP8 DIP08
#ifndef(pack_U_1) object{SOCKET_DIP8()rotate<0,-270.000000,0> rotate<0,0,0> translate<38.680000,0.000000,9.300000>}#end					//IC-Sockel 8Pin U$1 ATTINY45DIP8
#ifndef(pack_X1) #declare global_pack_X1=yes; object {CON_USB_B_001()translate<0,0,0> rotate<0,0,0>rotate<0,180.000000,0> rotate<0,180,0> translate<0.430000,0.000000,14.520000>}#end		//USB-B Stecker X1  PN61729
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Componentes
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<23.660000,0,10.620000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<23.660000,0,18.240000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<26.360000,0,2.480000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<18.740000,0,2.480000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<8.220000,0,25.520000> texture{col_thl}}
#ifndef(global_pack_LED1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<5.680000,0,25.520000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<18.010000,0,17.580000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<18.010000,0,9.960000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<41.590000,0,19.640000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<33.970000,0,19.640000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.240000,0,10.650000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<21.240000,0,18.270000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<21.910000,0,6.040000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<14.290000,0,6.040000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<47.190000,0,23.830000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<39.570000,0,23.830000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<11.450000,0,26.570000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<19.070000,0,26.570000> texture{col_thl}}
#ifndef(global_pack_SV1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<36.740000,0,23.870000> texture{col_thl}}
#ifndef(global_pack_SV1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<34.200000,0,23.870000> texture{col_thl}}
#ifndef(global_pack_SV1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<31.660000,0,23.870000> texture{col_thl}}
#ifndef(global_pack_SV1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<29.120000,0,23.870000> texture{col_thl}}
#ifndef(global_pack_SV1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<26.580000,0,23.870000> texture{col_thl}}
#ifndef(global_pack_SV1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-270.000000,0>translate<24.040000,0,23.870000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<34.870000,0,13.110000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<34.870000,0,10.570000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<34.870000,0,8.030000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<34.870000,0,5.490000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<42.490000,0,5.490000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<42.490000,0,8.030000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<42.490000,0,10.570000> texture{col_thl}}
#ifndef(global_pack_U_1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<42.490000,0,13.110000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<15.140000,0,13.270000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<15.140000,0,15.770000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.140000,0,15.770000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.140000,0,13.270000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,1,0) translate<0.800000,0,28.800000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,1,0) translate<47.200000,0,28.800000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,1,0) translate<0.800000,0,0.000000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.270000,0.500000,1,16,1,0) translate<47.200000,0,0.000000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Se�ales
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.010000,-1.535000,18.250000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.010000,-1.535000,26.200000>}
box{<0,0,-0.304800><7.950000,0.035000,0.304800> rotate<0,90.000000,0> translate<3.010000,-1.535000,26.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,-1.535000,25.400000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<5.080000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.680000,-1.535000,25.520000>}
box{<0,0,-0.304800><0.611882,0.035000,0.304800> rotate<0,-11.309186,0> translate<5.080000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.010000,-1.535000,26.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.350000,-1.535000,28.740000>}
box{<0,0,-0.304800><4.196093,0.035000,0.304800> rotate<0,-37.249769,0> translate<3.010000,-1.535000,26.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.220000,-1.535000,25.520000>}
box{<0,0,-0.304800><0.611882,0.035000,0.304800> rotate<0,-11.309186,0> translate<7.620000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,25.400000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<7.620000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.160000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,-1.535000,26.670000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.160000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.430000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.450000,-1.535000,26.570000>}
box{<0,0,-0.304800><0.101980,0.035000,0.304800> rotate<0,78.684874,0> translate<11.430000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,12.700000>}
box{<0,0,-0.304800><10.776307,0.035000,0.304800> rotate<0,44.997030,0> translate<5.080000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,12.700000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<12.700000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,15.240000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,-90.000000,0> translate<12.700000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.140000,-1.535000,13.270000>}
box{<0,0,-0.304800><0.720069,0.035000,0.304800> rotate<0,-52.330925,0> translate<12.700000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.140000,-1.535000,15.770000>}
box{<0,0,-0.304800><0.688840,0.035000,0.304800> rotate<0,-50.297607,0> translate<12.700000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.350000,-1.535000,28.740000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.500000,-1.535000,28.740000>}
box{<0,0,-0.304800><7.150000,0.035000,0.304800> rotate<0,0.000000,0> translate<6.350000,-1.535000,28.740000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.010000,-1.535000,18.250000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,8.090000>}
box{<0,0,-0.304800><14.944805,0.035000,0.304800> rotate<0,42.827916,0> translate<3.010000,-1.535000,18.250000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,8.090000>}
box{<0,0,-0.304800><1.740000,0.035000,0.304800> rotate<0,90.000000,0> translate<13.970000,-1.535000,8.090000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,20.320000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.700000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,20.320000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.970000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.500000,-1.535000,28.740000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,26.670000>}
box{<0,0,-0.304800><2.122687,0.035000,0.304800> rotate<0,77.202603,0> translate<13.500000,-1.535000,28.740000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.290000,-1.535000,6.040000>}
box{<0,0,-0.304800><0.445533,0.035000,0.304800> rotate<0,44.087710,0> translate<13.970000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.140000,-1.535000,13.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.200000,-1.535000,13.270000>}
box{<0,0,-0.304800><0.060000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.140000,-1.535000,13.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.200000,-1.535000,10.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.200000,-1.535000,13.270000>}
box{<0,0,-0.304800><2.870000,0.035000,0.304800> rotate<0,90.000000,0> translate<15.200000,-1.535000,13.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.140000,-1.535000,13.270000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,13.970000>}
box{<0,0,-0.304800><0.707107,0.035000,0.304800> rotate<0,-81.864495,0> translate<15.140000,-1.535000,13.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.140000,-1.535000,15.770000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,15.240000>}
box{<0,0,-0.304800><0.539351,0.035000,0.304800> rotate<0,79.309853,0> translate<15.140000,-1.535000,15.770000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.200000,-1.535000,10.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.570000,-1.535000,10.400000>}
box{<0,0,-0.304800><2.370000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.200000,-1.535000,10.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.970000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,2.540000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,44.997030,0> translate<13.970000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,17.780000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.240000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.570000,-1.535000,10.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.010000,-1.535000,9.960000>}
box{<0,0,-0.304800><0.622254,0.035000,0.304800> rotate<0,44.997030,0> translate<17.570000,-1.535000,10.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.010000,-1.535000,17.580000>}
box{<0,0,-0.304800><0.304795,0.035000,0.304800> rotate<0,41.006380,0> translate<17.780000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.740000,-1.535000,2.480000>}
box{<0,0,-0.304800><0.961873,0.035000,0.304800> rotate<0,3.576098,0> translate<17.780000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.700000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,4.280000>}
box{<0,0,-0.304800><9.562688,0.035000,0.304800> rotate<0,48.388146,0> translate<12.700000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,4.280000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.850000,-1.535000,12.560000>}
box{<0,0,-0.304800><8.318558,0.035000,0.304800> rotate<0,-84.475730,0> translate<19.050000,-1.535000,4.280000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,6.350000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<20.320000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.070000,-1.535000,26.570000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.260000,-1.535000,26.570000>}
box{<0,0,-0.304800><2.190000,0.035000,0.304800> rotate<0,0.000000,0> translate<19.070000,-1.535000,26.570000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.260000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.260000,-1.535000,26.570000>}
box{<0,0,-0.304800><4.980000,0.035000,0.304800> rotate<0,90.000000,0> translate<21.260000,-1.535000,26.570000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.050000,-1.535000,4.280000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,2.540000>}
box{<0,0,-0.304800><3.078831,0.035000,0.304800> rotate<0,34.410408,0> translate<19.050000,-1.535000,4.280000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,3.810000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<20.320000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.320000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.590000,-1.535000,7.620000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<20.320000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.240000,-1.535000,10.650000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,10.160000>}
box{<0,0,-0.127000><0.602163,0.035000,0.127000> rotate<0,54.458728,0> translate<21.240000,-1.535000,10.650000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,10.160000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<21.590000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.850000,-1.535000,12.560000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,12.700000>}
box{<0,0,-0.304800><1.745623,0.035000,0.304800> rotate<0,-4.599792,0> translate<19.850000,-1.535000,12.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,17.780000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.780000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.240000,-1.535000,18.270000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,17.780000>}
box{<0,0,-0.127000><0.602163,0.035000,0.127000> rotate<0,54.458728,0> translate<21.240000,-1.535000,18.270000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.910000,-1.535000,6.040000>}
box{<0,0,-0.304800><0.445533,0.035000,0.304800> rotate<0,44.087710,0> translate<21.590000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,11.430000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<21.590000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.260000,-1.535000,26.570000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,-1.535000,26.670000>}
box{<0,0,-0.304800><1.603122,0.035000,0.304800> rotate<0,-3.576098,0> translate<21.260000,-1.535000,26.570000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.260000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.330000,-1.535000,21.590000>}
box{<0,0,-0.304800><2.070000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.260000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,11.430000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.860000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.660000,-1.535000,10.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,11.430000>}
box{<0,0,-0.304800><0.936483,0.035000,0.304800> rotate<0,-59.871730,0> translate<23.660000,-1.535000,10.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.240000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,13.970000>}
box{<0,0,-0.304800><8.890000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.240000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,17.780000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<21.590000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.660000,-1.535000,18.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,17.780000>}
box{<0,0,-0.127000><0.657647,0.035000,0.127000> rotate<0,44.381011,0> translate<23.660000,-1.535000,18.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.040000,-1.535000,23.870000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,22.860000>}
box{<0,0,-0.304800><1.014002,0.035000,0.304800> rotate<0,84.902281,0> translate<24.040000,-1.535000,23.870000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,2.540000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.590000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.330000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.870000,-1.535000,19.050000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,44.997030,0> translate<23.330000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.360000,-1.535000,2.480000>}
box{<0,0,-0.304800><0.961873,0.035000,0.304800> rotate<0,3.576098,0> translate<25.400000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.580000,-1.535000,26.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.580000,-1.535000,23.870000>}
box{<0,0,-0.304800><2.530000,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.580000,-1.535000,23.870000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.580000,-1.535000,26.570000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.580000,-1.535000,26.400000>}
box{<0,0,-0.304800><0.170000,0.035000,0.304800> rotate<0,-90.000000,0> translate<26.580000,-1.535000,26.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.260000,-1.535000,26.570000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.580000,-1.535000,26.570000>}
box{<0,0,-0.304800><5.320000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.260000,-1.535000,26.570000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.360000,-1.535000,2.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,2.540000>}
box{<0,0,-0.304800><0.315753,0.035000,0.304800> rotate<0,-10.953340,0> translate<26.360000,-1.535000,2.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,16.510000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.130000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.870000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,16.510000>}
box{<0,0,-0.304800><2.663006,0.035000,0.304800> rotate<0,72.512839,0> translate<25.870000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,14.910000>}
box{<0,0,-0.304800><0.330000,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.940000,-1.535000,14.910000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,15.240000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.130000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,19.050000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,44.997030,0> translate<24.130000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.940000,-1.535000,19.050000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<27.940000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.120000,-1.535000,23.870000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,22.860000>}
box{<0,0,-0.304800><1.014002,0.035000,0.304800> rotate<0,84.902281,0> translate<29.120000,-1.535000,23.870000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,22.860000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<29.210000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,3.810000>}
box{<0,0,-0.304800><8.890000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.590000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.590000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,6.350000>}
box{<0,0,-0.304800><8.890000,0.035000,0.304800> rotate<0,0.000000,0> translate<21.590000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.670000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,2.540000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.670000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.660000,-1.535000,23.870000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,22.860000>}
box{<0,0,-0.304800><1.014002,0.035000,0.304800> rotate<0,84.902281,0> translate<31.660000,-1.535000,23.870000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,22.860000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<31.750000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,5.080000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<31.750000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,7.620000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.480000,-1.535000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,10.160000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.480000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.210000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,12.700000>}
box{<0,0,-0.304800><7.184205,0.035000,0.304800> rotate<0,44.997030,0> translate<29.210000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.750000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,19.050000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,44.997030,0> translate<31.750000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.970000,-1.535000,19.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,19.050000>}
box{<0,0,-0.304800><0.671193,0.035000,0.304800> rotate<0,61.521736,0> translate<33.970000,-1.535000,19.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.200000,-1.535000,23.870000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,22.860000>}
box{<0,0,-0.304800><1.014002,0.035000,0.304800> rotate<0,84.902281,0> translate<34.200000,-1.535000,23.870000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,22.860000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<34.290000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.870000,-1.535000,5.490000>}
box{<0,0,-0.304800><0.710282,0.035000,0.304800> rotate<0,-35.254032,0> translate<34.290000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.870000,-1.535000,8.030000>}
box{<0,0,-0.304800><0.710282,0.035000,0.304800> rotate<0,-35.254032,0> translate<34.290000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.870000,-1.535000,10.570000>}
box{<0,0,-0.304800><0.710282,0.035000,0.304800> rotate<0,-35.254032,0> translate<34.290000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.870000,-1.535000,13.110000>}
box{<0,0,-0.304800><0.710282,0.035000,0.304800> rotate<0,-35.254032,0> translate<34.290000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.740000,-1.535000,23.870000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.830000,-1.535000,24.130000>}
box{<0,0,-0.304800><0.275136,0.035000,0.304800> rotate<0,-70.901828,0> translate<36.740000,-1.535000,23.870000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.400000,-1.535000,21.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.400000,-1.535000,19.200000>}
box{<0,0,-0.304800><2.400000,0.035000,0.304800> rotate<0,-90.000000,0> translate<38.400000,-1.535000,19.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.830000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,24.130000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<36.830000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.370000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.570000,-1.535000,23.830000>}
box{<0,0,-0.304800><0.360555,0.035000,0.304800> rotate<0,56.306216,0> translate<39.370000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,15.240000>}
box{<0,0,-0.304800><8.980256,0.035000,0.304800> rotate<0,44.997030,0> translate<34.290000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,15.240000>}
box{<0,0,-0.304800><6.350000,0.035000,0.304800> rotate<0,90.000000,0> translate<40.640000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.640000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,7.620000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<40.640000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.490000,-1.535000,8.030000>}
box{<0,0,-0.304800><0.710282,0.035000,0.304800> rotate<0,-35.254032,0> translate<41.910000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.490000,-1.535000,15.110000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.490000,-1.535000,13.110000>}
box{<0,0,-0.304800><2.000000,0.035000,0.304800> rotate<0,-90.000000,0> translate<42.490000,-1.535000,13.110000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.400000,-1.535000,19.200000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.490000,-1.535000,15.110000>}
box{<0,0,-0.304800><5.784133,0.035000,0.304800> rotate<0,44.997030,0> translate<38.400000,-1.535000,19.200000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.490000,-1.535000,5.490000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,5.080000>}
box{<0,0,-0.304800><0.802621,0.035000,0.304800> rotate<0,30.716877,0> translate<42.490000,-1.535000,5.490000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.490000,-1.535000,10.570000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,10.160000>}
box{<0,0,-0.304800><0.802621,0.035000,0.304800> rotate<0,30.716877,0> translate<42.490000,-1.535000,10.570000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.400000,-1.535000,21.600000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,21.600000>}
box{<0,0,-0.304800><4.800000,0.035000,0.304800> rotate<0,0.000000,0> translate<38.400000,-1.535000,21.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,26.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,21.600000>}
box{<0,0,-0.304800><4.800000,0.035000,0.304800> rotate<0,-90.000000,0> translate<43.200000,-1.535000,21.600000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.580000,-1.535000,26.400000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.200000,-1.535000,26.400000>}
box{<0,0,-0.304800><16.620000,0.035000,0.304800> rotate<0,0.000000,0> translate<26.580000,-1.535000,26.400000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.590000,-1.535000,19.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.510000,-1.535000,19.850000>}
box{<0,0,-0.304800><1.931450,0.035000,0.304800> rotate<0,-6.241502,0> translate<41.590000,-1.535000,19.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.510000,-1.535000,19.850000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.310000,-1.535000,19.710000>}
box{<0,0,-0.304800><0.812158,0.035000,0.304800> rotate<0,9.925590,0> translate<43.510000,-1.535000,19.850000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,11.430000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.180000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.310000,-1.535000,19.710000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.250000,-1.535000,16.370000>}
box{<0,0,-0.304800><3.469755,0.035000,0.304800> rotate<0,74.276525,0> translate<44.310000,-1.535000,19.710000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.450000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.250000,-1.535000,16.370000>}
box{<0,0,-0.304800><5.004358,0.035000,0.304800> rotate<0,-80.795859,0> translate<44.450000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.180000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,8.890000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.180000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,24.130000>}
box{<0,0,-0.304800><15.240000,0.035000,0.304800> rotate<0,90.000000,0> translate<46.990000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.990000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.190000,-1.535000,23.830000>}
box{<0,0,-0.304800><0.360555,0.035000,0.304800> rotate<0,56.306216,0> translate<46.990000,-1.535000,24.130000> }
//Text
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.123800,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.123800,-1.535000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<11.123800,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.123800,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.852700,-1.535000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<10.852700,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.852700,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.852700,-1.535000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<10.852700,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.852700,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.123800,-1.535000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<10.852700,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.305300,-1.535000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.034200,-1.535000,5.160800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<10.034200,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.034200,-1.535000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.034200,-1.535000,4.889600>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<10.034200,-1.535000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.034200,-1.535000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.305300,-1.535000,4.889600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<10.034200,-1.535000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.305300,-1.535000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.305300,-1.535000,5.160800>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,90.000000,0> translate<10.305300,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.305300,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.034200,-1.535000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<10.034200,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.034200,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.034200,-1.535000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<10.034200,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.034200,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.305300,-1.535000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<10.034200,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.305300,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.305300,-1.535000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<10.305300,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.673400,-1.535000,5.703100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.215700,-1.535000,5.703100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<8.673400,-1.535000,5.703100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.215700,-1.535000,5.703100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.486800,-1.535000,5.432000>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<9.215700,-1.535000,5.703100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.486800,-1.535000,5.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.486800,-1.535000,4.347300>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<9.486800,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.486800,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.215700,-1.535000,4.076200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<9.215700,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.215700,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.673400,-1.535000,4.076200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<8.673400,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.673400,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.402200,-1.535000,4.347300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<8.402200,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.402200,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.402200,-1.535000,5.432000>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,90.000000,0> translate<8.402200,-1.535000,5.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.402200,-1.535000,5.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.673400,-1.535000,5.703100>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<8.402200,-1.535000,5.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.849700,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.036300,-1.535000,4.076200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<7.036300,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.036300,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.765100,-1.535000,4.347300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<6.765100,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.765100,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.036300,-1.535000,4.618500>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<6.765100,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.036300,-1.535000,4.618500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.578600,-1.535000,4.618500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<7.036300,-1.535000,4.618500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.578600,-1.535000,4.618500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.849700,-1.535000,4.889600>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<7.578600,-1.535000,4.618500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.849700,-1.535000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.578600,-1.535000,5.160800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<7.578600,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.578600,-1.535000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.765100,-1.535000,5.160800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<6.765100,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.128000,-1.535000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.941500,-1.535000,5.160800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<5.128000,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.941500,-1.535000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.212600,-1.535000,4.889600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<5.941500,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.212600,-1.535000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.212600,-1.535000,4.347300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<6.212600,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.212600,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.941500,-1.535000,4.076200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<5.941500,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.941500,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.128000,-1.535000,4.076200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<5.128000,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.304400,-1.535000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.762100,-1.535000,5.160800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<3.762100,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.762100,-1.535000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.490900,-1.535000,4.889600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<3.490900,-1.535000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.490900,-1.535000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.490900,-1.535000,4.076200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.490900,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.490900,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.304400,-1.535000,4.076200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<3.490900,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.304400,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.575500,-1.535000,4.347300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<4.304400,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.575500,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.304400,-1.535000,4.618500>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<4.304400,-1.535000,4.618500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.304400,-1.535000,4.618500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.490900,-1.535000,4.618500>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<3.490900,-1.535000,4.618500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.938400,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.938400,-1.535000,5.160800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<2.938400,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.938400,-1.535000,4.618500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.396100,-1.535000,5.160800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,44.997030,0> translate<2.396100,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.396100,-1.535000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.125000,-1.535000,5.160800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<2.125000,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.574200,-1.535000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.303100,-1.535000,5.160800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<1.303100,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.303100,-1.535000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.303100,-1.535000,4.889600>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<1.303100,-1.535000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.303100,-1.535000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.574200,-1.535000,4.889600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<1.303100,-1.535000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.574200,-1.535000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.574200,-1.535000,5.160800>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,90.000000,0> translate<1.574200,-1.535000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.574200,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.303100,-1.535000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<1.303100,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.303100,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.303100,-1.535000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<1.303100,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.303100,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.574200,-1.535000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<1.303100,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.574200,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.574200,-1.535000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<1.574200,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.755700,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.755700,-1.535000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<0.755700,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.755700,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.484600,-1.535000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<0.484600,-1.535000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.484600,-1.535000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.484600,-1.535000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<0.484600,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.484600,-1.535000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.755700,-1.535000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<0.484600,-1.535000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.323800,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.323800,-1.535000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<14.323800,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.323800,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.052700,-1.535000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<14.052700,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.052700,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.052700,-1.535000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<14.052700,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.052700,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.323800,-1.535000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<14.052700,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.505300,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.234200,-1.535000,2.760800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<13.234200,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.234200,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.234200,-1.535000,2.489600>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.234200,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.234200,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.505300,-1.535000,2.489600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<13.234200,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.505300,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.505300,-1.535000,2.760800>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,90.000000,0> translate<13.505300,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.505300,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.234200,-1.535000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<13.234200,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.234200,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.234200,-1.535000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.234200,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.234200,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.505300,-1.535000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<13.234200,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.505300,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.505300,-1.535000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<13.505300,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.686800,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.686800,-1.535000,3.032000>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,90.000000,0> translate<12.686800,-1.535000,3.032000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.686800,-1.535000,3.032000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.415700,-1.535000,3.303100>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<12.415700,-1.535000,3.303100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.415700,-1.535000,3.303100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.873400,-1.535000,3.303100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<11.873400,-1.535000,3.303100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.873400,-1.535000,3.303100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.602200,-1.535000,3.032000>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<11.602200,-1.535000,3.032000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.602200,-1.535000,3.032000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.602200,-1.535000,1.947300>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<11.602200,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.602200,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.873400,-1.535000,1.676200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<11.602200,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.873400,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.415700,-1.535000,1.676200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<11.873400,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.415700,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.686800,-1.535000,1.947300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<12.415700,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.144500,-1.535000,2.218500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.602200,-1.535000,1.676200>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.602200,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.049700,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.049700,-1.535000,1.947300>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,-90.000000,0> translate<11.049700,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.049700,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.778600,-1.535000,1.676200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<10.778600,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.778600,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.965100,-1.535000,1.676200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<9.965100,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.965100,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.965100,-1.535000,2.760800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<9.965100,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.599200,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.141500,-1.535000,1.676200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<8.599200,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.141500,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.412600,-1.535000,1.947300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<9.141500,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.412600,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.412600,-1.535000,2.489600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<9.412600,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.412600,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.141500,-1.535000,2.760800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<9.141500,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.141500,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.599200,-1.535000,2.760800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<8.599200,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.599200,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.328000,-1.535000,2.489600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<8.328000,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.328000,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.328000,-1.535000,2.218500>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<8.328000,-1.535000,2.218500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.328000,-1.535000,2.218500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.412600,-1.535000,2.218500>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<8.328000,-1.535000,2.218500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.775500,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.775500,-1.535000,2.760800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<7.775500,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.775500,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.504400,-1.535000,2.760800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<7.504400,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.504400,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.233200,-1.535000,2.489600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<7.233200,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.233200,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.233200,-1.535000,1.676200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<7.233200,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.233200,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.962100,-1.535000,2.760800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<6.962100,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.962100,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.690900,-1.535000,2.489600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<6.690900,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.690900,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.690900,-1.535000,1.676200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<6.690900,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.867300,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.325000,-1.535000,2.760800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<5.325000,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.325000,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.053800,-1.535000,2.489600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<5.053800,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.053800,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.053800,-1.535000,1.676200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<5.053800,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.053800,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.867300,-1.535000,1.676200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<5.053800,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.867300,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.138400,-1.535000,1.947300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<5.867300,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.138400,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.867300,-1.535000,2.218500>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<5.867300,-1.535000,2.218500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.867300,-1.535000,2.218500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.053800,-1.535000,2.218500>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<5.053800,-1.535000,2.218500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.416700,-1.535000,3.303100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.416700,-1.535000,1.676200>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.416700,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.416700,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.230200,-1.535000,1.676200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<3.416700,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.230200,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.501300,-1.535000,1.947300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<4.230200,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.501300,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.501300,-1.535000,2.489600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<4.501300,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.501300,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.230200,-1.535000,2.760800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<4.230200,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.230200,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.416700,-1.535000,2.760800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<3.416700,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.593100,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.050800,-1.535000,1.676200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.050800,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.050800,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.779600,-1.535000,1.947300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<1.779600,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.779600,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.779600,-1.535000,2.489600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<1.779600,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.779600,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.050800,-1.535000,2.760800>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,-44.997030,0> translate<1.779600,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.050800,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.593100,-1.535000,2.760800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.050800,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.593100,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.864200,-1.535000,2.489600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,45.007595,0> translate<2.593100,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.864200,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.864200,-1.535000,1.947300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<2.864200,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.864200,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.593100,-1.535000,1.676200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<2.593100,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.227100,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.227100,-1.535000,2.760800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<1.227100,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.227100,-1.535000,2.218500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.684800,-1.535000,2.760800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,44.997030,0> translate<0.684800,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.684800,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.413700,-1.535000,2.760800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<0.413700,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.137100,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.408200,-1.535000,2.760800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<-0.408200,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.408200,-1.535000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.408200,-1.535000,2.489600>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<-0.408200,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.408200,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.137100,-1.535000,2.489600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<-0.408200,-1.535000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.137100,-1.535000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.137100,-1.535000,2.760800>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,90.000000,0> translate<-0.137100,-1.535000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.137100,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.408200,-1.535000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<-0.408200,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.408200,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.408200,-1.535000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<-0.408200,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.408200,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.137100,-1.535000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<-0.408200,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.137100,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.137100,-1.535000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<-0.137100,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.955600,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.955600,-1.535000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<-0.955600,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.955600,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-1.226700,-1.535000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<-1.226700,-1.535000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-1.226700,-1.535000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-1.226700,-1.535000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<-1.226700,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-1.226700,-1.535000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-0.955600,-1.535000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<-1.226700,-1.535000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.876200,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.876200,0.000000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<0.876200,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.876200,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.147300,0.000000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<0.876200,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.147300,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.147300,0.000000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<1.147300,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.147300,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.876200,0.000000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<0.876200,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.694700,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.965800,0.000000,2.760800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<1.694700,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.965800,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.965800,0.000000,2.489600>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<1.965800,0.000000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.965800,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.694700,0.000000,2.489600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<1.694700,0.000000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.694700,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.694700,0.000000,2.760800>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,90.000000,0> translate<1.694700,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.694700,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.965800,0.000000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<1.694700,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.965800,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.965800,0.000000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<1.965800,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.965800,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.694700,0.000000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<1.694700,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.694700,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.694700,0.000000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<1.694700,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.513200,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.513200,0.000000,3.032000>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,90.000000,0> translate<2.513200,0.000000,3.032000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.513200,0.000000,3.032000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.784300,0.000000,3.303100>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<2.513200,0.000000,3.032000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.784300,0.000000,3.303100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.326600,0.000000,3.303100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.784300,0.000000,3.303100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.326600,0.000000,3.303100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.597800,0.000000,3.032000>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<3.326600,0.000000,3.303100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.597800,0.000000,3.032000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.597800,0.000000,1.947300>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.597800,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.597800,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.326600,0.000000,1.676200>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<3.326600,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.326600,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.784300,0.000000,1.676200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<2.784300,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.784300,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<2.513200,0.000000,1.947300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<2.513200,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.055500,0.000000,2.218500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.597800,0.000000,1.676200>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,44.997030,0> translate<3.055500,0.000000,2.218500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.150300,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.150300,0.000000,1.947300>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,-90.000000,0> translate<4.150300,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.150300,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.421400,0.000000,1.676200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<4.150300,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.421400,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.234900,0.000000,1.676200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<4.421400,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.234900,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.234900,0.000000,2.760800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<5.234900,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.600800,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.058500,0.000000,1.676200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<6.058500,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.058500,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.787400,0.000000,1.947300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<5.787400,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.787400,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.787400,0.000000,2.489600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<5.787400,0.000000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.787400,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.058500,0.000000,2.760800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<5.787400,0.000000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.058500,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.600800,0.000000,2.760800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<6.058500,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.600800,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.872000,0.000000,2.489600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<6.600800,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.872000,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.872000,0.000000,2.218500>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<6.872000,0.000000,2.218500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.872000,0.000000,2.218500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.787400,0.000000,2.218500>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,0.000000,0> translate<5.787400,0.000000,2.218500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.424500,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.424500,0.000000,2.760800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<7.424500,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.424500,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.695600,0.000000,2.760800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<7.424500,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.695600,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.966800,0.000000,2.489600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<7.695600,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.966800,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.966800,0.000000,1.676200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<7.966800,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.966800,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.237900,0.000000,2.760800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<7.966800,0.000000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.237900,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.509100,0.000000,2.489600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<8.237900,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.509100,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.509100,0.000000,1.676200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<8.509100,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.332700,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.875000,0.000000,2.760800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<9.332700,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.875000,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.146200,0.000000,2.489600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<9.875000,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.146200,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.146200,0.000000,1.676200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<10.146200,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.146200,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.332700,0.000000,1.676200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<9.332700,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.332700,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.061600,0.000000,1.947300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<9.061600,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.061600,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.332700,0.000000,2.218500>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<9.061600,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.332700,0.000000,2.218500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.146200,0.000000,2.218500>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<9.332700,0.000000,2.218500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.783300,0.000000,3.303100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.783300,0.000000,1.676200>}
box{<0,0,-0.076200><1.626900,0.035000,0.076200> rotate<0,-90.000000,0> translate<11.783300,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.783300,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.969800,0.000000,1.676200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<10.969800,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.969800,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.698700,0.000000,1.947300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<10.698700,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.698700,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.698700,0.000000,2.489600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<10.698700,0.000000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.698700,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.969800,0.000000,2.760800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<10.698700,0.000000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.969800,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.783300,0.000000,2.760800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<10.969800,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.606900,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.149200,0.000000,1.676200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<12.606900,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.149200,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.420400,0.000000,1.947300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<13.149200,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.420400,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.420400,0.000000,2.489600>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,90.000000,0> translate<13.420400,0.000000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.420400,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.149200,0.000000,2.760800>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<13.149200,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.149200,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.606900,0.000000,2.760800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<12.606900,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.606900,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.335800,0.000000,2.489600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<12.335800,0.000000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.335800,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.335800,0.000000,1.947300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<12.335800,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.335800,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.606900,0.000000,1.676200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<12.335800,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.972900,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.972900,0.000000,2.760800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<13.972900,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.972900,0.000000,2.218500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.515200,0.000000,2.760800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<13.972900,0.000000,2.218500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.515200,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<14.786300,0.000000,2.760800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<14.515200,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.337100,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.608200,0.000000,2.760800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<15.337100,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.608200,0.000000,2.760800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.608200,0.000000,2.489600>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.608200,0.000000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.608200,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.337100,0.000000,2.489600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<15.337100,0.000000,2.489600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.337100,0.000000,2.489600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.337100,0.000000,2.760800>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,90.000000,0> translate<15.337100,0.000000,2.760800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.337100,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.608200,0.000000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<15.337100,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.608200,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.608200,0.000000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<15.608200,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.608200,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.337100,0.000000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<15.337100,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.337100,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<15.337100,0.000000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<15.337100,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.155600,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.155600,0.000000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<16.155600,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.155600,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.426700,0.000000,1.947300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<16.155600,0.000000,1.947300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.426700,0.000000,1.947300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.426700,0.000000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<16.426700,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.426700,0.000000,1.676200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<16.155600,0.000000,1.676200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<16.155600,0.000000,1.676200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.276200,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.276200,0.000000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<3.276200,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.276200,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.547300,0.000000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<3.276200,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.547300,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.547300,0.000000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<3.547300,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.547300,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<3.276200,0.000000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<3.276200,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.094700,0.000000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.365800,0.000000,5.160800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<4.094700,0.000000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.365800,0.000000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.365800,0.000000,4.889600>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<4.365800,0.000000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.365800,0.000000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.094700,0.000000,4.889600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<4.094700,0.000000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.094700,0.000000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.094700,0.000000,5.160800>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,90.000000,0> translate<4.094700,0.000000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.094700,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.365800,0.000000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<4.094700,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.365800,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.365800,0.000000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<4.365800,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.365800,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.094700,0.000000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<4.094700,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.094700,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.094700,0.000000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<4.094700,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.726600,0.000000,5.703100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.184300,0.000000,5.703100>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<5.184300,0.000000,5.703100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.184300,0.000000,5.703100>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.913200,0.000000,5.432000>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,-44.997030,0> translate<4.913200,0.000000,5.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.913200,0.000000,5.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.913200,0.000000,4.347300>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,-90.000000,0> translate<4.913200,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<4.913200,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.184300,0.000000,4.076200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<4.913200,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.184300,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.726600,0.000000,4.076200>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<5.184300,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.726600,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.997800,0.000000,4.347300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<5.726600,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.997800,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.997800,0.000000,5.432000>}
box{<0,0,-0.076200><1.084700,0.035000,0.076200> rotate<0,90.000000,0> translate<5.997800,0.000000,5.432000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.997800,0.000000,5.432000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<5.726600,0.000000,5.703100>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,44.986466,0> translate<5.726600,0.000000,5.703100> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.550300,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.363700,0.000000,4.076200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,0.000000,0> translate<6.550300,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.363700,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.634900,0.000000,4.347300>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-44.986466,0> translate<7.363700,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.634900,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.363700,0.000000,4.618500>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<7.363700,0.000000,4.618500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.363700,0.000000,4.618500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.821400,0.000000,4.618500>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<6.821400,0.000000,4.618500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.821400,0.000000,4.618500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.550300,0.000000,4.889600>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<6.550300,0.000000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.550300,0.000000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.821400,0.000000,5.160800>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<6.550300,0.000000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<6.821400,0.000000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<7.634900,0.000000,5.160800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<6.821400,0.000000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.272000,0.000000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.458500,0.000000,5.160800>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<8.458500,0.000000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.458500,0.000000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.187400,0.000000,4.889600>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<8.187400,0.000000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.187400,0.000000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.187400,0.000000,4.347300>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,-90.000000,0> translate<8.187400,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.187400,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.458500,0.000000,4.076200>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<8.187400,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<8.458500,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.272000,0.000000,4.076200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<8.458500,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.095600,0.000000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.637900,0.000000,5.160800>}
box{<0,0,-0.076200><0.542300,0.035000,0.076200> rotate<0,0.000000,0> translate<10.095600,0.000000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.637900,0.000000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.909100,0.000000,4.889600>}
box{<0,0,-0.076200><0.383535,0.035000,0.076200> rotate<0,44.997030,0> translate<10.637900,0.000000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.909100,0.000000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.909100,0.000000,4.076200>}
box{<0,0,-0.076200><0.813400,0.035000,0.076200> rotate<0,-90.000000,0> translate<10.909100,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.909100,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.095600,0.000000,4.076200>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<10.095600,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.095600,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.824500,0.000000,4.347300>}
box{<0,0,-0.076200><0.383393,0.035000,0.076200> rotate<0,44.997030,0> translate<9.824500,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<9.824500,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.095600,0.000000,4.618500>}
box{<0,0,-0.076200><0.383464,0.035000,0.076200> rotate<0,-45.007595,0> translate<9.824500,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.095600,0.000000,4.618500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<10.909100,0.000000,4.618500>}
box{<0,0,-0.076200><0.813500,0.035000,0.076200> rotate<0,0.000000,0> translate<10.095600,0.000000,4.618500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.461600,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.461600,0.000000,5.160800>}
box{<0,0,-0.076200><1.084600,0.035000,0.076200> rotate<0,90.000000,0> translate<11.461600,0.000000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<11.461600,0.000000,4.618500>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.003900,0.000000,5.160800>}
box{<0,0,-0.076200><0.766928,0.035000,0.076200> rotate<0,-44.997030,0> translate<11.461600,0.000000,4.618500> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.003900,0.000000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.275000,0.000000,5.160800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<12.003900,0.000000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.825800,0.000000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.096900,0.000000,5.160800>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<12.825800,0.000000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.096900,0.000000,5.160800>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.096900,0.000000,4.889600>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.096900,0.000000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.096900,0.000000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.825800,0.000000,4.889600>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<12.825800,0.000000,4.889600> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.825800,0.000000,4.889600>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.825800,0.000000,5.160800>}
box{<0,0,-0.076200><0.271200,0.035000,0.076200> rotate<0,90.000000,0> translate<12.825800,0.000000,5.160800> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.825800,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.096900,0.000000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<12.825800,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.096900,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.096900,0.000000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.096900,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.096900,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.825800,0.000000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<12.825800,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.825800,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<12.825800,0.000000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<12.825800,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.644300,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.644300,0.000000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,90.000000,0> translate<13.644300,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.644300,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.915400,0.000000,4.347300>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<13.644300,0.000000,4.347300> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.915400,0.000000,4.347300>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.915400,0.000000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,-90.000000,0> translate<13.915400,0.000000,4.076200> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.915400,0.000000,4.076200>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<13.644300,0.000000,4.076200>}
box{<0,0,-0.076200><0.271100,0.035000,0.076200> rotate<0,0.000000,0> translate<13.644300,0.000000,4.076200> }
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Pol�gonos
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,4.478500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,27.678600>}
box{<0,0,-0.304800><23.200100,0.035000,0.304800> rotate<0,90.000000,0> translate<0.520700,-1.535000,27.678600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,4.478500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.532700,-1.535000,4.478500>}
box{<0,0,-0.304800><0.012000,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,4.478500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.532700,-1.535000,4.876800>}
box{<0,0,-0.304800><0.012000,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.532700,-1.535000,5.486400>}
box{<0,0,-0.304800><0.012000,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.532700,-1.535000,6.096000>}
box{<0,0,-0.304800><0.012000,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.658200,-1.535000,6.705600>}
box{<0,0,-0.304800><0.137500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.246300,-1.535000,7.315200>}
box{<0,0,-0.304800><7.725600,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.993800,-1.535000,7.924800>}
box{<0,0,-0.304800><7.473100,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.959200,-1.535000,8.534400>}
box{<0,0,-0.304800><7.438500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.022400,-1.535000,9.144000>}
box{<0,0,-0.304800><7.501700,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.274900,-1.535000,9.753600>}
box{<0,0,-0.304800><7.754200,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.799000,-1.535000,10.363200>}
box{<0,0,-0.304800><8.278300,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.664600,-1.535000,10.972800>}
box{<0,0,-0.304800><9.143900,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.007000,-1.535000,11.582400>}
box{<0,0,-0.304800><8.486300,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.349400,-1.535000,12.192000>}
box{<0,0,-0.304800><7.828700,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.691700,-1.535000,12.801600>}
box{<0,0,-0.304800><7.171000,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.034100,-1.535000,13.411200>}
box{<0,0,-0.304800><6.513400,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.376500,-1.535000,14.020800>}
box{<0,0,-0.304800><5.855800,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.718900,-1.535000,14.630400>}
box{<0,0,-0.304800><5.198200,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.061300,-1.535000,15.240000>}
box{<0,0,-0.304800><4.540600,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.403700,-1.535000,15.849600>}
box{<0,0,-0.304800><3.883000,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.746100,-1.535000,16.459200>}
box{<0,0,-0.304800><3.225400,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.088500,-1.535000,17.068800>}
box{<0,0,-0.304800><2.567800,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.431000,-1.535000,17.678400>}
box{<0,0,-0.304800><1.910300,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.195200,-1.535000,18.288000>}
box{<0,0,-0.304800><1.674500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,18.897600>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,19.507200>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,20.116800>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,20.726400>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,21.336000>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,21.945600>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,22.555200>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,23.164800>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,23.774400>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,24.384000>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,24.993600>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,25.603200>}
box{<0,0,-0.304800><1.676500,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.191500,-1.535000,26.212800>}
box{<0,0,-0.304800><1.670800,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.483000,-1.535000,26.822400>}
box{<0,0,-0.304800><1.962300,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.287500,-1.535000,27.432000>}
box{<0,0,-0.304800><2.766800,0.035000,0.304800> rotate<0,0.000000,0> translate<0.520700,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.520700,-1.535000,27.678600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.572600,-1.535000,27.657000>}
box{<0,0,-0.304800><0.056215,0.035000,0.304800> rotate<0,22.594853,0> translate<0.520700,-1.535000,27.678600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.532700,-1.535000,6.399100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.532700,-1.535000,4.478500>}
box{<0,0,-0.304800><1.920600,0.035000,0.304800> rotate<0,-90.000000,0> translate<0.532700,-1.535000,4.478500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.532700,-1.535000,6.399100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.539100,-1.535000,6.455800>}
box{<0,0,-0.304800><0.057060,0.035000,0.304800> rotate<0,-83.554495,0> translate<0.532700,-1.535000,6.399100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.539100,-1.535000,6.455800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.551800,-1.535000,6.511400>}
box{<0,0,-0.304800><0.057032,0.035000,0.304800> rotate<0,-77.128303,0> translate<0.539100,-1.535000,6.455800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.551800,-1.535000,6.511400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.570600,-1.535000,6.565300>}
box{<0,0,-0.304800><0.057085,0.035000,0.304800> rotate<0,-70.766861,0> translate<0.551800,-1.535000,6.511400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.570600,-1.535000,6.565300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.595400,-1.535000,6.616700>}
box{<0,0,-0.304800><0.057070,0.035000,0.304800> rotate<0,-64.238903,0> translate<0.570600,-1.535000,6.565300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.572600,-1.535000,27.657000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.027300,-1.535000,27.657000>}
box{<0,0,-0.304800><0.454700,0.035000,0.304800> rotate<0,0.000000,0> translate<0.572600,-1.535000,27.657000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.595400,-1.535000,6.616700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.625700,-1.535000,6.665000>}
box{<0,0,-0.304800><0.057017,0.035000,0.304800> rotate<0,-57.894930,0> translate<0.595400,-1.535000,6.616700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.625700,-1.535000,6.665000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.661300,-1.535000,6.709600>}
box{<0,0,-0.304800><0.057066,0.035000,0.304800> rotate<0,-51.399520,0> translate<0.625700,-1.535000,6.665000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.661300,-1.535000,6.709600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.701600,-1.535000,6.749900>}
box{<0,0,-0.304800><0.056993,0.035000,0.304800> rotate<0,-44.997030,0> translate<0.661300,-1.535000,6.709600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.701600,-1.535000,6.749900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.746200,-1.535000,6.785500>}
box{<0,0,-0.304800><0.057066,0.035000,0.304800> rotate<0,-38.594540,0> translate<0.701600,-1.535000,6.749900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.746200,-1.535000,6.785500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.794500,-1.535000,6.815800>}
box{<0,0,-0.304800><0.057017,0.035000,0.304800> rotate<0,-32.099130,0> translate<0.746200,-1.535000,6.785500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.794500,-1.535000,6.815800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.845900,-1.535000,6.840600>}
box{<0,0,-0.304800><0.057070,0.035000,0.304800> rotate<0,-25.755157,0> translate<0.794500,-1.535000,6.815800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.845900,-1.535000,6.840600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.899800,-1.535000,6.859400>}
box{<0,0,-0.304800><0.057085,0.035000,0.304800> rotate<0,-19.227199,0> translate<0.845900,-1.535000,6.840600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.899800,-1.535000,6.859400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.955400,-1.535000,6.872100>}
box{<0,0,-0.304800><0.057032,0.035000,0.304800> rotate<0,-12.865758,0> translate<0.899800,-1.535000,6.859400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<0.955400,-1.535000,6.872100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.012100,-1.535000,6.878500>}
box{<0,0,-0.304800><0.057060,0.035000,0.304800> rotate<0,-6.439566,0> translate<0.955400,-1.535000,6.872100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.012100,-1.535000,6.878500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.557300,-1.535000,6.878500>}
box{<0,0,-0.304800><7.545200,0.035000,0.304800> rotate<0,0.000000,0> translate<1.012100,-1.535000,6.878500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.027300,-1.535000,27.657000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.447400,-1.535000,27.831000>}
box{<0,0,-0.304800><0.454709,0.035000,0.304800> rotate<0,-22.497221,0> translate<1.027300,-1.535000,27.657000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.447400,-1.535000,27.831000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.768900,-1.535000,28.152500>}
box{<0,0,-0.304800><0.454670,0.035000,0.304800> rotate<0,-44.997030,0> translate<1.447400,-1.535000,27.831000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.658000,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.089100,-1.535000,28.041600>}
box{<0,0,-0.304800><2.431100,0.035000,0.304800> rotate<0,0.000000,0> translate<1.658000,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.768900,-1.535000,28.152500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.942900,-1.535000,28.572600>}
box{<0,0,-0.304800><0.454709,0.035000,0.304800> rotate<0,-67.496839,0> translate<1.768900,-1.535000,28.152500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.942900,-1.535000,28.572600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.942900,-1.535000,28.679200>}
box{<0,0,-0.304800><0.106600,0.035000,0.304800> rotate<0,90.000000,0> translate<1.942900,-1.535000,28.679200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.942900,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.890700,-1.535000,28.651200>}
box{<0,0,-0.304800><2.947800,0.035000,0.304800> rotate<0,0.000000,0> translate<1.942900,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.942900,-1.535000,28.679200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.927500,-1.535000,28.679200>}
box{<0,0,-0.304800><2.984600,0.035000,0.304800> rotate<0,0.000000,0> translate<1.942900,-1.535000,28.679200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.182800,-1.535000,26.149300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,26.094700>}
box{<0,0,-0.304800><0.056467,0.035000,0.304800> rotate<0,75.220485,0> translate<2.182800,-1.535000,26.149300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.182800,-1.535000,26.149300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,26.255100>}
box{<0,0,-0.304800><0.106775,0.035000,0.304800> rotate<0,-82.243906,0> translate<2.182800,-1.535000,26.149300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.191700,-1.535000,18.380800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,18.235100>}
box{<0,0,-0.304800><0.145804,0.035000,0.304800> rotate<0,87.832383,0> translate<2.191700,-1.535000,18.380800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.191700,-1.535000,18.380800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,18.395600>}
box{<0,0,-0.304800><0.015789,0.035000,0.304800> rotate<0,-69.609251,0> translate<2.191700,-1.535000,18.380800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,18.088200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.203300,-1.535000,18.073500>}
box{<0,0,-0.304800><0.015915,0.035000,0.304800> rotate<0,67.458760,0> translate<2.197200,-1.535000,18.088200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,18.235100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,18.088200>}
box{<0,0,-0.304800><0.146900,0.035000,0.304800> rotate<0,-90.000000,0> translate<2.197200,-1.535000,18.088200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,26.094700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,18.395600>}
box{<0,0,-0.304800><7.699100,0.035000,0.304800> rotate<0,-90.000000,0> translate<2.197200,-1.535000,18.395600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,26.361700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,26.255100>}
box{<0,0,-0.304800><0.106600,0.035000,0.304800> rotate<0,-90.000000,0> translate<2.197200,-1.535000,26.255100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.197200,-1.535000,26.361700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.218800,-1.535000,26.413800>}
box{<0,0,-0.304800><0.056400,0.035000,0.304800> rotate<0,-67.477270,0> translate<2.197200,-1.535000,26.361700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.203300,-1.535000,18.073500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.203900,-1.535000,18.057600>}
box{<0,0,-0.304800><0.015911,0.035000,0.304800> rotate<0,87.833123,0> translate<2.203300,-1.535000,18.073500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.203900,-1.535000,18.057600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.264800,-1.535000,17.925000>}
box{<0,0,-0.304800><0.145916,0.035000,0.304800> rotate<0,65.327504,0> translate<2.203900,-1.535000,18.057600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.218800,-1.535000,26.413800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.226400,-1.535000,26.469700>}
box{<0,0,-0.304800><0.056414,0.035000,0.304800> rotate<0,-82.252276,0> translate<2.218800,-1.535000,26.413800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.226400,-1.535000,26.469700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.280000,-1.535000,26.561500>}
box{<0,0,-0.304800><0.106302,0.035000,0.304800> rotate<0,-59.716343,0> translate<2.226400,-1.535000,26.469700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.264800,-1.535000,17.925000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.320900,-1.535000,17.789500>}
box{<0,0,-0.304800><0.146654,0.035000,0.304800> rotate<0,67.504907,0> translate<2.264800,-1.535000,17.925000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.280000,-1.535000,26.561500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.320900,-1.535000,26.660400>}
box{<0,0,-0.304800><0.107023,0.035000,0.304800> rotate<0,-67.528049,0> translate<2.280000,-1.535000,26.561500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.320900,-1.535000,17.789500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.332200,-1.535000,17.778300>}
box{<0,0,-0.304800><0.015910,0.035000,0.304800> rotate<0,44.742401,0> translate<2.320900,-1.535000,17.789500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.320900,-1.535000,26.660400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.361100,-1.535000,26.700500>}
box{<0,0,-0.304800><0.056781,0.035000,0.304800> rotate<0,-44.925683,0> translate<2.320900,-1.535000,26.660400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.332200,-1.535000,17.778300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.338800,-1.535000,17.763800>}
box{<0,0,-0.304800><0.015931,0.035000,0.304800> rotate<0,65.521957,0> translate<2.332200,-1.535000,17.778300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.338800,-1.535000,17.763800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.445700,-1.535000,17.664800>}
box{<0,0,-0.304800><0.145700,0.035000,0.304800> rotate<0,42.799920,0> translate<2.338800,-1.535000,17.763800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.361100,-1.535000,26.700500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.389300,-1.535000,26.749000>}
box{<0,0,-0.304800><0.056102,0.035000,0.304800> rotate<0,-59.820479,0> translate<2.361100,-1.535000,26.700500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.389300,-1.535000,26.749000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.473700,-1.535000,26.813100>}
box{<0,0,-0.304800><0.105982,0.035000,0.304800> rotate<0,-37.213439,0> translate<2.389300,-1.535000,26.749000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.445700,-1.535000,17.664800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.549500,-1.535000,17.560900>}
box{<0,0,-0.304800><0.146866,0.035000,0.304800> rotate<0,45.024614,0> translate<2.445700,-1.535000,17.664800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.473700,-1.535000,26.813100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.549500,-1.535000,26.889000>}
box{<0,0,-0.304800><0.107268,0.035000,0.304800> rotate<0,-45.034797,0> translate<2.473700,-1.535000,26.813100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.549500,-1.535000,17.560900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.564300,-1.535000,17.554800>}
box{<0,0,-0.304800><0.016008,0.035000,0.304800> rotate<0,22.398125,0> translate<2.549500,-1.535000,17.560900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.549500,-1.535000,26.889000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.602000,-1.535000,26.910700>}
box{<0,0,-0.304800><0.056808,0.035000,0.304800> rotate<0,-22.455457,0> translate<2.549500,-1.535000,26.889000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.564300,-1.535000,17.554800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.750800,-1.535000,10.892900>}
box{<0,0,-0.304800><9.799321,0.035000,0.304800> rotate<0,42.827753,0> translate<2.564300,-1.535000,17.554800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.602000,-1.535000,26.910700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.927500,-1.535000,28.679200>}
box{<0,0,-0.304800><2.921565,0.035000,0.304800> rotate<0,-37.249863,0> translate<2.602000,-1.535000,26.910700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,18.604700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,25.797000>}
box{<0,0,-0.304800><7.192300,0.035000,0.304800> rotate<0,90.000000,0> translate<3.822700,-1.535000,25.797000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,18.604700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.971100,-1.535000,11.051100>}
box{<0,0,-0.304800><11.110954,0.035000,0.304800> rotate<0,42.827816,0> translate<3.822700,-1.535000,18.604700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.352800,-1.535000,18.897600>}
box{<0,0,-0.304800><1.530100,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.743200,-1.535000,19.507200>}
box{<0,0,-0.304800><0.920500,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.284300,-1.535000,20.116800>}
box{<0,0,-0.304800><0.461600,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,20.726400>}
box{<0,0,-0.304800><0.444500,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,21.336000>}
box{<0,0,-0.304800><0.444500,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,21.945600>}
box{<0,0,-0.304800><0.444500,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,22.555200>}
box{<0,0,-0.304800><0.444500,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,23.164800>}
box{<0,0,-0.304800><0.444500,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,23.774400>}
box{<0,0,-0.304800><0.444500,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,24.384000>}
box{<0,0,-0.304800><0.444500,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,24.993600>}
box{<0,0,-0.304800><0.444500,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.284500,-1.535000,25.603200>}
box{<0,0,-0.304800><0.461800,0.035000,0.304800> rotate<0,0.000000,0> translate<3.822700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.822700,-1.535000,25.797000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.623800,-1.535000,27.927200>}
box{<0,0,-0.304800><3.519078,0.035000,0.304800> rotate<0,-37.250057,0> translate<3.822700,-1.535000,25.797000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.164400,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.962400,-1.535000,18.288000>}
box{<0,0,-0.304800><1.798000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.164400,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.251300,-1.535000,25.399000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,25.319500>}
box{<0,0,-0.304800><0.081074,0.035000,0.304800> rotate<0,78.684874,0> translate<4.251300,-1.535000,25.399000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.251300,-1.535000,25.399000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,25.479500>}
box{<0,0,-0.304800><0.082055,0.035000,0.304800> rotate<0,-78.821805,0> translate<4.251300,-1.535000,25.399000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,20.158200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.390900,-1.535000,19.859500>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,67.499735,0> translate<4.267200,-1.535000,20.158200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,20.481700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,20.158200>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,-90.000000,0> translate<4.267200,-1.535000,20.158200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,25.319500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,20.481700>}
box{<0,0,-0.304800><4.837800,0.035000,0.304800> rotate<0,-90.000000,0> translate<4.267200,-1.535000,20.481700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,25.561700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,25.479500>}
box{<0,0,-0.304800><0.082200,0.035000,0.304800> rotate<0,-90.000000,0> translate<4.267200,-1.535000,25.479500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.267200,-1.535000,25.561700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.298300,-1.535000,25.636700>}
box{<0,0,-0.304800><0.081192,0.035000,0.304800> rotate<0,-67.473391,0> translate<4.267200,-1.535000,25.561700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.298300,-1.535000,25.636700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.314000,-1.535000,25.716300>}
box{<0,0,-0.304800><0.081134,0.035000,0.304800> rotate<0,-78.837209,0> translate<4.298300,-1.535000,25.636700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.314000,-1.535000,25.716300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.359500,-1.535000,25.784400>}
box{<0,0,-0.304800><0.081902,0.035000,0.304800> rotate<0,-56.248012,0> translate<4.314000,-1.535000,25.716300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.359500,-1.535000,25.784400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.390900,-1.535000,25.860400>}
box{<0,0,-0.304800><0.082231,0.035000,0.304800> rotate<0,-67.547189,0> translate<4.359500,-1.535000,25.784400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.369400,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.720500,-1.535000,26.212800>}
box{<0,0,-0.304800><0.351100,0.035000,0.304800> rotate<0,0.000000,0> translate<4.369400,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.390900,-1.535000,19.859500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,12.363200>}
box{<0,0,-0.304800><10.601369,0.035000,0.304800> rotate<0,44.997030,0> translate<4.390900,-1.535000,19.859500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.390900,-1.535000,25.860400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.448600,-1.535000,25.918000>}
box{<0,0,-0.304800><0.081529,0.035000,0.304800> rotate<0,-44.947341,0> translate<4.390900,-1.535000,25.860400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.448600,-1.535000,25.918000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.493400,-1.535000,25.985300>}
box{<0,0,-0.304800><0.080848,0.035000,0.304800> rotate<0,-56.345525,0> translate<4.448600,-1.535000,25.918000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.493400,-1.535000,25.985300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.511600,-1.535000,25.997500>}
box{<0,0,-0.304800><0.021911,0.035000,0.304800> rotate<0,-33.832887,0> translate<4.493400,-1.535000,25.985300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.511600,-1.535000,26.003900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.511600,-1.535000,25.997500>}
box{<0,0,-0.304800><0.006400,0.035000,0.304800> rotate<0,-90.000000,0> translate<4.511600,-1.535000,25.997500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.511600,-1.535000,26.003900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.196000,-1.535000,26.688300>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,-44.997030,0> translate<4.511600,-1.535000,26.003900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.822000,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.572000,-1.535000,17.678400>}
box{<0,0,-0.304800><1.750000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.822000,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.171000,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.281600,-1.535000,26.822400>}
box{<0,0,-0.304800><5.110600,0.035000,0.304800> rotate<0,0.000000,0> translate<5.171000,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.196000,-1.535000,26.688300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.163900,-1.535000,26.688300>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<5.196000,-1.535000,26.688300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.479600,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.181600,-1.535000,17.068800>}
box{<0,0,-0.304800><1.702000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.479600,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.892700,-1.535000,20.656700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.892700,-1.535000,24.351600>}
box{<0,0,-0.304800><3.694900,0.035000,0.304800> rotate<0,90.000000,0> translate<5.892700,-1.535000,24.351600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.892700,-1.535000,20.656700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.335100,-1.535000,14.214300>}
box{<0,0,-0.304800><9.110929,0.035000,0.304800> rotate<0,44.997030,0> translate<5.892700,-1.535000,20.656700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.892700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.959200,-1.535000,20.726400>}
box{<0,0,-0.304800><2.066500,0.035000,0.304800> rotate<0,0.000000,0> translate<5.892700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.892700,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.085400,-1.535000,21.336000>}
box{<0,0,-0.304800><2.192700,0.035000,0.304800> rotate<0,0.000000,0> translate<5.892700,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.892700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.341400,-1.535000,21.945600>}
box{<0,0,-0.304800><2.448700,0.035000,0.304800> rotate<0,0.000000,0> translate<5.892700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.892700,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.951000,-1.535000,22.555200>}
box{<0,0,-0.304800><3.058300,0.035000,0.304800> rotate<0,0.000000,0> translate<5.892700,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.892700,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,23.164800>}
box{<0,0,-0.304800><7.264500,0.035000,0.304800> rotate<0,0.000000,0> translate<5.892700,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.892700,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,23.774400>}
box{<0,0,-0.304800><7.264500,0.035000,0.304800> rotate<0,0.000000,0> translate<5.892700,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.892700,-1.535000,24.351600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.163900,-1.535000,24.351600>}
box{<0,0,-0.304800><0.271200,0.035000,0.304800> rotate<0,0.000000,0> translate<5.892700,-1.535000,24.351600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.972600,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.659700,-1.535000,27.432000>}
box{<0,0,-0.304800><4.687100,0.035000,0.304800> rotate<0,0.000000,0> translate<5.972600,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.137200,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.791200,-1.535000,16.459200>}
box{<0,0,-0.304800><1.654000,0.035000,0.304800> rotate<0,0.000000,0> translate<6.137200,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.163900,-1.535000,24.351600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.848300,-1.535000,25.036000>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,-44.997030,0> translate<6.163900,-1.535000,24.351600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.163900,-1.535000,26.688300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.848300,-1.535000,26.003900>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,44.997030,0> translate<6.163900,-1.535000,26.688300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.196300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.703600,-1.535000,24.384000>}
box{<0,0,-0.304800><1.507300,0.035000,0.304800> rotate<0,0.000000,0> translate<6.196300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.432600,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.959200,-1.535000,20.116800>}
box{<0,0,-0.304800><1.526600,0.035000,0.304800> rotate<0,0.000000,0> translate<6.432600,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.623800,-1.535000,27.927200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.851100,-1.535000,27.927200>}
box{<0,0,-0.304800><6.227300,0.035000,0.304800> rotate<0,0.000000,0> translate<6.623800,-1.535000,27.927200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.639400,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.260500,-1.535000,26.212800>}
box{<0,0,-0.304800><0.621100,0.035000,0.304800> rotate<0,0.000000,0> translate<6.639400,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.794800,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.400800,-1.535000,15.849600>}
box{<0,0,-0.304800><1.606000,0.035000,0.304800> rotate<0,0.000000,0> translate<6.794800,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.805900,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.908500,-1.535000,24.993600>}
box{<0,0,-0.304800><0.102600,0.035000,0.304800> rotate<0,0.000000,0> translate<6.805900,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.848300,-1.535000,25.036000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.848300,-1.535000,25.114500>}
box{<0,0,-0.304800><0.078500,0.035000,0.304800> rotate<0,90.000000,0> translate<6.848300,-1.535000,25.114500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.848300,-1.535000,25.114500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.854700,-1.535000,25.082000>}
box{<0,0,-0.304800><0.033124,0.035000,0.304800> rotate<0,78.854477,0> translate<6.848300,-1.535000,25.114500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.848300,-1.535000,25.687000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.848300,-1.535000,26.003900>}
box{<0,0,-0.304800><0.316900,0.035000,0.304800> rotate<0,90.000000,0> translate<6.848300,-1.535000,26.003900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.848300,-1.535000,25.687000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.854000,-1.535000,25.716300>}
box{<0,0,-0.304800><0.029849,0.035000,0.304800> rotate<0,-78.986012,0> translate<6.848300,-1.535000,25.687000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.854000,-1.535000,25.716300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.899500,-1.535000,25.784400>}
box{<0,0,-0.304800><0.081902,0.035000,0.304800> rotate<0,-56.248012,0> translate<6.854000,-1.535000,25.716300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.854700,-1.535000,25.082000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.899800,-1.535000,25.014800>}
box{<0,0,-0.304800><0.080931,0.035000,0.304800> rotate<0,56.129511,0> translate<6.854700,-1.535000,25.082000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.899500,-1.535000,25.784400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.930900,-1.535000,25.860400>}
box{<0,0,-0.304800><0.082231,0.035000,0.304800> rotate<0,-67.547189,0> translate<6.899500,-1.535000,25.784400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.899800,-1.535000,25.014800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.930900,-1.535000,24.939500>}
box{<0,0,-0.304800><0.081470,0.035000,0.304800> rotate<0,67.554201,0> translate<6.899800,-1.535000,25.014800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.930900,-1.535000,24.939500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.989200,-1.535000,24.881300>}
box{<0,0,-0.304800><0.082378,0.035000,0.304800> rotate<0,44.947853,0> translate<6.930900,-1.535000,24.939500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.930900,-1.535000,25.860400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.988600,-1.535000,25.918000>}
box{<0,0,-0.304800><0.081529,0.035000,0.304800> rotate<0,-44.947341,0> translate<6.930900,-1.535000,25.860400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.988600,-1.535000,25.918000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.033400,-1.535000,25.985300>}
box{<0,0,-0.304800><0.080848,0.035000,0.304800> rotate<0,-56.345525,0> translate<6.988600,-1.535000,25.918000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.989200,-1.535000,24.881300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.034600,-1.535000,24.813400>}
box{<0,0,-0.304800><0.081680,0.035000,0.304800> rotate<0,56.228400,0> translate<6.989200,-1.535000,24.881300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.033400,-1.535000,25.985300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.051600,-1.535000,25.997400>}
box{<0,0,-0.304800><0.021855,0.035000,0.304800> rotate<0,-33.615139,0> translate<7.033400,-1.535000,25.985300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.034600,-1.535000,24.813400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.101900,-1.535000,24.768600>}
box{<0,0,-0.304800><0.080848,0.035000,0.304800> rotate<0,33.648536,0> translate<7.034600,-1.535000,24.813400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.042200,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.183300,-1.535000,19.507200>}
box{<0,0,-0.304800><1.141100,0.035000,0.304800> rotate<0,0.000000,0> translate<7.042200,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.051600,-1.535000,26.003900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.051600,-1.535000,25.997400>}
box{<0,0,-0.304800><0.006500,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.051600,-1.535000,25.997400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.051600,-1.535000,26.003900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.736000,-1.535000,26.688300>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,-44.997030,0> translate<7.051600,-1.535000,26.003900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.101900,-1.535000,24.768600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.159500,-1.535000,24.710900>}
box{<0,0,-0.304800><0.081529,0.035000,0.304800> rotate<0,45.046720,0> translate<7.101900,-1.535000,24.768600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.159500,-1.535000,24.710900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.235500,-1.535000,24.679500>}
box{<0,0,-0.304800><0.082231,0.035000,0.304800> rotate<0,22.446872,0> translate<7.159500,-1.535000,24.710900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.235500,-1.535000,24.679500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.303600,-1.535000,24.634000>}
box{<0,0,-0.304800><0.081902,0.035000,0.304800> rotate<0,33.746048,0> translate<7.235500,-1.535000,24.679500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.303600,-1.535000,24.634000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.383200,-1.535000,24.618300>}
box{<0,0,-0.304800><0.081134,0.035000,0.304800> rotate<0,11.156851,0> translate<7.303600,-1.535000,24.634000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.383200,-1.535000,24.618300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.458200,-1.535000,24.587200>}
box{<0,0,-0.304800><0.081192,0.035000,0.304800> rotate<0,22.520669,0> translate<7.383200,-1.535000,24.618300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.452400,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.010400,-1.535000,15.240000>}
box{<0,0,-0.304800><1.558000,0.035000,0.304800> rotate<0,0.000000,0> translate<7.452400,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.458200,-1.535000,24.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.500400,-1.535000,24.587200>}
box{<0,0,-0.304800><0.042200,0.035000,0.304800> rotate<0,0.000000,0> translate<7.458200,-1.535000,24.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.500400,-1.535000,24.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.736000,-1.535000,24.351600>}
box{<0,0,-0.304800><0.333189,0.035000,0.304800> rotate<0,44.997030,0> translate<7.500400,-1.535000,24.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.651800,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.578100,-1.535000,18.897600>}
box{<0,0,-0.304800><0.926300,0.035000,0.304800> rotate<0,0.000000,0> translate<7.651800,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.736000,-1.535000,24.351600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.703900,-1.535000,24.351600>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<7.736000,-1.535000,24.351600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.736000,-1.535000,26.688300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.703900,-1.535000,26.688300>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<7.736000,-1.535000,26.688300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.959200,-1.535000,8.008400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.335300,-1.535000,7.100400>}
box{<0,0,-0.304800><0.982810,0.035000,0.304800> rotate<0,67.495864,0> translate<7.959200,-1.535000,8.008400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.959200,-1.535000,8.991500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.959200,-1.535000,8.008400>}
box{<0,0,-0.304800><0.983100,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.959200,-1.535000,8.008400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.959200,-1.535000,8.991500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.335300,-1.535000,9.899500>}
box{<0,0,-0.304800><0.982810,0.035000,0.304800> rotate<0,-67.495864,0> translate<7.959200,-1.535000,8.991500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.959200,-1.535000,20.048400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.335300,-1.535000,19.140400>}
box{<0,0,-0.304800><0.982810,0.035000,0.304800> rotate<0,67.495864,0> translate<7.959200,-1.535000,20.048400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.959200,-1.535000,21.031500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.959200,-1.535000,20.048400>}
box{<0,0,-0.304800><0.983100,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.959200,-1.535000,20.048400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.959200,-1.535000,21.031500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.335300,-1.535000,21.939500>}
box{<0,0,-0.304800><0.982810,0.035000,0.304800> rotate<0,-67.495864,0> translate<7.959200,-1.535000,21.031500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.110000,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.620000,-1.535000,14.630400>}
box{<0,0,-0.304800><1.510000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.110000,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.261400,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.410100,-1.535000,18.288000>}
box{<0,0,-0.304800><1.148700,0.035000,0.304800> rotate<0,0.000000,0> translate<8.261400,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.335300,-1.535000,7.100400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.557300,-1.535000,6.878500>}
box{<0,0,-0.304800><0.313885,0.035000,0.304800> rotate<0,44.984124,0> translate<8.335300,-1.535000,7.100400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.335300,-1.535000,9.899500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.030400,-1.535000,10.594600>}
box{<0,0,-0.304800><0.983020,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.335300,-1.535000,9.899500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.335300,-1.535000,19.140400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.030400,-1.535000,18.445300>}
box{<0,0,-0.304800><0.983020,0.035000,0.304800> rotate<0,44.997030,0> translate<8.335300,-1.535000,19.140400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.335300,-1.535000,21.939500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.030400,-1.535000,22.634600>}
box{<0,0,-0.304800><0.983020,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.335300,-1.535000,21.939500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.703900,-1.535000,24.351600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.939500,-1.535000,24.587200>}
box{<0,0,-0.304800><0.333189,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.703900,-1.535000,24.351600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.703900,-1.535000,26.688300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.179500,-1.535000,26.212700>}
box{<0,0,-0.304800><0.672600,0.035000,0.304800> rotate<0,44.997030,0> translate<8.703900,-1.535000,26.688300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.736300,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,24.384000>}
box{<0,0,-0.304800><4.420900,0.035000,0.304800> rotate<0,0.000000,0> translate<8.736300,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.767600,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.229600,-1.535000,14.020800>}
box{<0,0,-0.304800><1.462000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.767600,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.871000,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,17.678400>}
box{<0,0,-0.304800><3.016200,0.035000,0.304800> rotate<0,0.000000,0> translate<8.871000,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.939500,-1.535000,24.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.998200,-1.535000,24.587200>}
box{<0,0,-0.304800><1.058700,0.035000,0.304800> rotate<0,0.000000,0> translate<8.939500,-1.535000,24.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.030400,-1.535000,10.594600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.750800,-1.535000,10.892900>}
box{<0,0,-0.304800><0.779717,0.035000,0.304800> rotate<0,-22.491764,0> translate<9.030400,-1.535000,10.594600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.030400,-1.535000,18.445300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.938400,-1.535000,18.069200>}
box{<0,0,-0.304800><0.982810,0.035000,0.304800> rotate<0,22.498197,0> translate<9.030400,-1.535000,18.445300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.030400,-1.535000,22.634600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.938400,-1.535000,23.010700>}
box{<0,0,-0.304800><0.982810,0.035000,0.304800> rotate<0,-22.498197,0> translate<9.030400,-1.535000,22.634600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.179400,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.823300,-1.535000,26.212800>}
box{<0,0,-0.304800><0.643900,0.035000,0.304800> rotate<0,0.000000,0> translate<9.179400,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.179500,-1.535000,26.212700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.823200,-1.535000,26.212700>}
box{<0,0,-0.304800><0.643700,0.035000,0.304800> rotate<0,0.000000,0> translate<9.179500,-1.535000,26.212700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.425200,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.839200,-1.535000,13.411200>}
box{<0,0,-0.304800><1.414000,0.035000,0.304800> rotate<0,0.000000,0> translate<9.425200,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.480600,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,17.068800>}
box{<0,0,-0.304800><2.406600,0.035000,0.304800> rotate<0,0.000000,0> translate<9.480600,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.823200,-1.535000,26.212700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.281600,-1.535000,26.671100>}
box{<0,0,-0.304800><0.648275,0.035000,0.304800> rotate<0,-44.997030,0> translate<9.823200,-1.535000,26.212700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.938400,-1.535000,18.069200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.921500,-1.535000,18.069200>}
box{<0,0,-0.304800><0.983100,0.035000,0.304800> rotate<0,0.000000,0> translate<9.938400,-1.535000,18.069200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.938400,-1.535000,23.010700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.921500,-1.535000,23.010700>}
box{<0,0,-0.304800><0.983100,0.035000,0.304800> rotate<0,0.000000,0> translate<9.938400,-1.535000,23.010700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<9.998200,-1.535000,24.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.321700,-1.535000,24.587200>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,0.000000,0> translate<9.998200,-1.535000,24.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.082800,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.448800,-1.535000,12.801600>}
box{<0,0,-0.304800><1.366000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.082800,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.090200,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,16.459200>}
box{<0,0,-0.304800><1.797000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.090200,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.281600,-1.535000,27.053900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.281600,-1.535000,26.671100>}
box{<0,0,-0.304800><0.382800,0.035000,0.304800> rotate<0,-90.000000,0> translate<10.281600,-1.535000,26.671100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.281600,-1.535000,27.053900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.966000,-1.535000,27.738300>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.281600,-1.535000,27.053900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.321700,-1.535000,24.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.620400,-1.535000,24.710900>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,-22.494325,0> translate<10.321700,-1.535000,24.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.620400,-1.535000,24.710900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.311100,-1.535000,25.401600>}
box{<0,0,-0.304800><0.976797,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.620400,-1.535000,24.710900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.699800,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,15.849600>}
box{<0,0,-0.304800><1.187400,0.035000,0.304800> rotate<0,0.000000,0> translate<10.699800,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.740400,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,12.192000>}
box{<0,0,-0.304800><1.146800,0.035000,0.304800> rotate<0,0.000000,0> translate<10.740400,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.903100,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,24.993600>}
box{<0,0,-0.304800><2.254100,0.035000,0.304800> rotate<0,0.000000,0> translate<10.903100,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.921500,-1.535000,18.069200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.829500,-1.535000,18.445300>}
box{<0,0,-0.304800><0.982810,0.035000,0.304800> rotate<0,-22.498197,0> translate<10.921500,-1.535000,18.069200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.921500,-1.535000,23.010700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.829500,-1.535000,22.634600>}
box{<0,0,-0.304800><0.982810,0.035000,0.304800> rotate<0,22.498197,0> translate<10.921500,-1.535000,23.010700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.966000,-1.535000,27.738300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.933900,-1.535000,27.738300>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<10.966000,-1.535000,27.738300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.309400,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.883600,-1.535000,15.240000>}
box{<0,0,-0.304800><0.574200,0.035000,0.304800> rotate<0,0.000000,0> translate<11.309400,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.311100,-1.535000,25.401600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.933900,-1.535000,25.401600>}
box{<0,0,-0.304800><0.622800,0.035000,0.304800> rotate<0,0.000000,0> translate<11.311100,-1.535000,25.401600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.398000,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,11.582400>}
box{<0,0,-0.304800><0.489200,0.035000,0.304800> rotate<0,0.000000,0> translate<11.398000,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.449700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,18.288000>}
box{<0,0,-0.304800><0.437500,0.035000,0.304800> rotate<0,0.000000,0> translate<11.449700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.829500,-1.535000,18.445300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,18.503100>}
box{<0,0,-0.304800><0.081671,0.035000,0.304800> rotate<0,-45.046634,0> translate<11.829500,-1.535000,18.445300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.829500,-1.535000,22.634600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.524600,-1.535000,21.939500>}
box{<0,0,-0.304800><0.983020,0.035000,0.304800> rotate<0,44.997030,0> translate<11.829500,-1.535000,22.634600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.875700,-1.535000,15.325900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,15.201900>}
box{<0,0,-0.304800><0.124532,0.035000,0.304800> rotate<0,84.695845,0> translate<11.875700,-1.535000,15.325900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.875700,-1.535000,15.325900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,15.363000>}
box{<0,0,-0.304800><0.038841,0.035000,0.304800> rotate<0,-72.773170,0> translate<11.875700,-1.535000,15.325900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.879100,-1.535000,11.316600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,11.293300>}
box{<0,0,-0.304800><0.024668,0.035000,0.304800> rotate<0,70.825856,0> translate<11.879100,-1.535000,11.316600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.879100,-1.535000,11.316600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,11.453500>}
box{<0,0,-0.304800><0.137139,0.035000,0.304800> rotate<0,-86.608196,0> translate<11.879100,-1.535000,11.316600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,11.268200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.940200,-1.535000,11.140500>}
box{<0,0,-0.304800><0.138262,0.035000,0.304800> rotate<0,67.455376,0> translate<11.887200,-1.535000,11.268200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,11.293300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,11.268200>}
box{<0,0,-0.304800><0.025100,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.887200,-1.535000,11.268200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,12.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,11.453500>}
box{<0,0,-0.304800><0.909700,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.887200,-1.535000,11.453500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,15.078200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.902000,-1.535000,15.042500>}
box{<0,0,-0.304800><0.038646,0.035000,0.304800> rotate<0,67.478321,0> translate<11.887200,-1.535000,15.078200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,15.201900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,15.078200>}
box{<0,0,-0.304800><0.123700,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.887200,-1.535000,15.078200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,18.503100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.887200,-1.535000,15.363000>}
box{<0,0,-0.304800><3.140100,0.035000,0.304800> rotate<0,-90.000000,0> translate<11.887200,-1.535000,15.363000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.902000,-1.535000,15.042500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.905600,-1.535000,15.003900>}
box{<0,0,-0.304800><0.038768,0.035000,0.304800> rotate<0,84.666177,0> translate<11.902000,-1.535000,15.042500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.905600,-1.535000,15.003900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.963300,-1.535000,14.894500>}
box{<0,0,-0.304800><0.123684,0.035000,0.304800> rotate<0,62.187731,0> translate<11.905600,-1.535000,15.003900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.908900,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,22.555200>}
box{<0,0,-0.304800><1.248300,0.035000,0.304800> rotate<0,0.000000,0> translate<11.908900,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.919000,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.160000,-1.535000,14.630400>}
box{<0,0,-0.304800><0.241000,0.035000,0.304800> rotate<0,0.000000,0> translate<11.919000,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.933900,-1.535000,25.401600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.618300,-1.535000,26.086000>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,-44.997030,0> translate<11.933900,-1.535000,25.401600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.933900,-1.535000,27.738300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.618300,-1.535000,27.053900>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,44.997030,0> translate<11.933900,-1.535000,27.738300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.940200,-1.535000,11.140500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.971100,-1.535000,11.051100>}
box{<0,0,-0.304800><0.094589,0.035000,0.304800> rotate<0,70.928246,0> translate<11.940200,-1.535000,11.140500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.963300,-1.535000,14.894500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.010900,-1.535000,14.779500>}
box{<0,0,-0.304800><0.124462,0.035000,0.304800> rotate<0,67.510243,0> translate<11.963300,-1.535000,14.894500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.010900,-1.535000,14.779500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.038500,-1.535000,14.752000>}
box{<0,0,-0.304800><0.038962,0.035000,0.304800> rotate<0,44.893052,0> translate<12.010900,-1.535000,14.779500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.038500,-1.535000,14.752000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.056400,-1.535000,14.717900>}
box{<0,0,-0.304800><0.038513,0.035000,0.304800> rotate<0,62.299708,0> translate<12.038500,-1.535000,14.752000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.056400,-1.535000,14.717900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.151400,-1.535000,14.639000>}
box{<0,0,-0.304800><0.123492,0.035000,0.304800> rotate<0,39.707903,0> translate<12.056400,-1.535000,14.717900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.135500,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,25.603200>}
box{<0,0,-0.304800><1.021700,0.035000,0.304800> rotate<0,0.000000,0> translate<12.135500,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.151400,-1.535000,14.639000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.239500,-1.535000,14.550900>}
box{<0,0,-0.304800><0.124592,0.035000,0.304800> rotate<0,44.997030,0> translate<12.151400,-1.535000,14.639000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.152700,-1.535000,6.728600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.171800,-1.535000,6.709600>}
box{<0,0,-0.304800><0.026941,0.035000,0.304800> rotate<0,44.846658,0> translate<12.152700,-1.535000,6.728600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.152700,-1.535000,6.728600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.524600,-1.535000,7.100400>}
box{<0,0,-0.304800><0.525875,0.035000,0.304800> rotate<0,-44.989327,0> translate<12.152700,-1.535000,6.728600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.171800,-1.535000,6.709600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.207400,-1.535000,6.665000>}
box{<0,0,-0.304800><0.057066,0.035000,0.304800> rotate<0,51.399520,0> translate<12.171800,-1.535000,6.709600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.175000,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,6.705600>}
box{<0,0,-0.304800><0.982200,0.035000,0.304800> rotate<0,0.000000,0> translate<12.175000,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.207400,-1.535000,6.665000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.237700,-1.535000,6.616700>}
box{<0,0,-0.304800><0.057017,0.035000,0.304800> rotate<0,57.894930,0> translate<12.207400,-1.535000,6.665000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.237700,-1.535000,6.616700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.262500,-1.535000,6.565300>}
box{<0,0,-0.304800><0.057070,0.035000,0.304800> rotate<0,64.238903,0> translate<12.237700,-1.535000,6.616700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.239500,-1.535000,14.550900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.275400,-1.535000,14.536100>}
box{<0,0,-0.304800><0.038831,0.035000,0.304800> rotate<0,22.402734,0> translate<12.239500,-1.535000,14.550900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.240200,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.963500,-1.535000,27.432000>}
box{<0,0,-0.304800><0.723300,0.035000,0.304800> rotate<0,0.000000,0> translate<12.240200,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.262500,-1.535000,6.565300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.281300,-1.535000,6.511400>}
box{<0,0,-0.304800><0.057085,0.035000,0.304800> rotate<0,70.766861,0> translate<12.262500,-1.535000,6.565300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.275400,-1.535000,14.536100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.305200,-1.535000,14.511300>}
box{<0,0,-0.304800><0.038770,0.035000,0.304800> rotate<0,39.765103,0> translate<12.275400,-1.535000,14.536100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.281300,-1.535000,6.511400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.294000,-1.535000,6.455800>}
box{<0,0,-0.304800><0.057032,0.035000,0.304800> rotate<0,77.128303,0> translate<12.281300,-1.535000,6.511400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.294000,-1.535000,6.455800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.300400,-1.535000,6.399100>}
box{<0,0,-0.304800><0.057060,0.035000,0.304800> rotate<0,83.554495,0> translate<12.294000,-1.535000,6.455800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.300400,-1.535000,4.478500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.300400,-1.535000,6.399100>}
box{<0,0,-0.304800><1.920600,0.035000,0.304800> rotate<0,90.000000,0> translate<12.300400,-1.535000,6.399100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.300400,-1.535000,4.478500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.692000,-1.535000,4.478500>}
box{<0,0,-0.304800><2.391600,0.035000,0.304800> rotate<0,0.000000,0> translate<12.300400,-1.535000,4.478500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.300400,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.800800,-1.535000,4.876800>}
box{<0,0,-0.304800><1.500400,0.035000,0.304800> rotate<0,0.000000,0> translate<12.300400,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.300400,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.191200,-1.535000,5.486400>}
box{<0,0,-0.304800><0.890800,0.035000,0.304800> rotate<0,0.000000,0> translate<12.300400,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.300400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.121600,-1.535000,6.096000>}
box{<0,0,-0.304800><0.821200,0.035000,0.304800> rotate<0,0.000000,0> translate<12.300400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.305200,-1.535000,14.511300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.423900,-1.535000,14.474600>}
box{<0,0,-0.304800><0.124244,0.035000,0.304800> rotate<0,17.179576,0> translate<12.305200,-1.535000,14.511300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.335100,-1.535000,14.214300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.548000,-1.535000,14.427200>}
box{<0,0,-0.304800><0.301086,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.335100,-1.535000,14.214300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.423900,-1.535000,14.474600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.538200,-1.535000,14.427200>}
box{<0,0,-0.304800><0.123739,0.035000,0.304800> rotate<0,22.522209,0> translate<12.423900,-1.535000,14.474600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.518500,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,21.945600>}
box{<0,0,-0.304800><0.638700,0.035000,0.304800> rotate<0,0.000000,0> translate<12.518500,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.524600,-1.535000,7.100400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.890100,-1.535000,7.982800>}
box{<0,0,-0.304800><0.955102,0.035000,0.304800> rotate<0,-67.495659,0> translate<12.524600,-1.535000,7.100400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.524600,-1.535000,21.939500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.900700,-1.535000,21.031500>}
box{<0,0,-0.304800><0.982810,0.035000,0.304800> rotate<0,67.495864,0> translate<12.524600,-1.535000,21.939500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.538200,-1.535000,14.427200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.548000,-1.535000,14.427200>}
box{<0,0,-0.304800><0.009800,0.035000,0.304800> rotate<0,0.000000,0> translate<12.538200,-1.535000,14.427200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.613500,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,7.315200>}
box{<0,0,-0.304800><0.543700,0.035000,0.304800> rotate<0,0.000000,0> translate<12.613500,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.618300,-1.535000,26.086000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.618300,-1.535000,27.053900>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,90.000000,0> translate<12.618300,-1.535000,27.053900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.618300,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,26.212800>}
box{<0,0,-0.304800><0.538900,0.035000,0.304800> rotate<0,0.000000,0> translate<12.618300,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.618300,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.101900,-1.535000,26.822400>}
box{<0,0,-0.304800><0.483600,0.035000,0.304800> rotate<0,0.000000,0> translate<12.618300,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.774600,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,21.336000>}
box{<0,0,-0.304800><0.382600,0.035000,0.304800> rotate<0,0.000000,0> translate<12.774600,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.851100,-1.535000,27.927200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,26.579000>}
box{<0,0,-0.304800><1.382512,0.035000,0.304800> rotate<0,77.203130,0> translate<12.851100,-1.535000,27.927200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.866000,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.952600,-1.535000,7.924800>}
box{<0,0,-0.304800><0.086600,0.035000,0.304800> rotate<0,0.000000,0> translate<12.866000,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.890100,-1.535000,7.982800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,7.735200>}
box{<0,0,-0.304800><0.364209,0.035000,0.304800> rotate<0,42.827495,0> translate<12.890100,-1.535000,7.982800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.900700,-1.535000,20.400100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.900700,-1.535000,21.031500>}
box{<0,0,-0.304800><0.631400,0.035000,0.304800> rotate<0,90.000000,0> translate<12.900700,-1.535000,21.031500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.900700,-1.535000,20.400100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,20.656700>}
box{<0,0,-0.304800><0.362816,0.035000,0.304800> rotate<0,-45.008196,0> translate<12.900700,-1.535000,20.400100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.900700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,20.726400>}
box{<0,0,-0.304800><0.256500,0.035000,0.304800> rotate<0,0.000000,0> translate<12.900700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.054000,-1.535000,14.506900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.117100,-1.535000,14.533000>}
box{<0,0,-0.304800><0.068285,0.035000,0.304800> rotate<0,-22.469931,0> translate<13.054000,-1.535000,14.506900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.054000,-1.535000,14.506900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.652300,-1.535000,14.506900>}
box{<0,0,-0.304800><0.598300,0.035000,0.304800> rotate<0,0.000000,0> translate<13.054000,-1.535000,14.506900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.117100,-1.535000,14.533000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.652300,-1.535000,14.533000>}
box{<0,0,-0.304800><0.535200,0.035000,0.304800> rotate<0,0.000000,0> translate<13.117100,-1.535000,14.533000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.121600,-1.535000,5.556000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.806000,-1.535000,4.871600>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,44.997030,0> translate<13.121600,-1.535000,5.556000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.121600,-1.535000,6.523900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.121600,-1.535000,5.556000>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.121600,-1.535000,5.556000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.121600,-1.535000,6.523900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,6.559500>}
box{<0,0,-0.304800><0.050346,0.035000,0.304800> rotate<0,-44.997030,0> translate<13.121600,-1.535000,6.523900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,7.735200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,6.559500>}
box{<0,0,-0.304800><1.175700,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.157200,-1.535000,6.559500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,26.579000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.157200,-1.535000,20.656700>}
box{<0,0,-0.304800><5.922300,0.035000,0.304800> rotate<0,-90.000000,0> translate<13.157200,-1.535000,20.656700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.512700,-1.535000,11.738700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.512700,-1.535000,12.033000>}
box{<0,0,-0.304800><0.294300,0.035000,0.304800> rotate<0,90.000000,0> translate<13.512700,-1.535000,12.033000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.512700,-1.535000,11.738700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.387200,-1.535000,10.754000>}
box{<0,0,-0.304800><1.316960,0.035000,0.304800> rotate<0,48.388919,0> translate<13.512700,-1.535000,11.738700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.512700,-1.535000,12.033000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.652300,-1.535000,12.033000>}
box{<0,0,-0.304800><0.139600,0.035000,0.304800> rotate<0,0.000000,0> translate<13.512700,-1.535000,12.033000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.512700,-1.535000,17.006900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.512700,-1.535000,18.713200>}
box{<0,0,-0.304800><1.706300,0.035000,0.304800> rotate<0,90.000000,0> translate<13.512700,-1.535000,18.713200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.512700,-1.535000,17.006900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.652300,-1.535000,17.006900>}
box{<0,0,-0.304800><0.139600,0.035000,0.304800> rotate<0,0.000000,0> translate<13.512700,-1.535000,17.006900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.512700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.919400,-1.535000,17.068800>}
box{<0,0,-0.304800><2.406700,0.035000,0.304800> rotate<0,0.000000,0> translate<13.512700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.512700,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.529000,-1.535000,17.678400>}
box{<0,0,-0.304800><3.016300,0.035000,0.304800> rotate<0,0.000000,0> translate<13.512700,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.512700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.065700,-1.535000,18.288000>}
box{<0,0,-0.304800><3.553000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.512700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.512700,-1.535000,18.713200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.430400,-1.535000,19.630900>}
box{<0,0,-0.304800><1.297824,0.035000,0.304800> rotate<0,-44.997030,0> translate<13.512700,-1.535000,18.713200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.651600,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.387200,-1.535000,11.582400>}
box{<0,0,-0.304800><0.735600,0.035000,0.304800> rotate<0,0.000000,0> translate<13.651600,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.652300,-1.535000,12.033000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.140000,-1.535000,12.520700>}
box{<0,0,-0.304800><0.689712,0.035000,0.304800> rotate<0,-44.997030,0> translate<13.652300,-1.535000,12.033000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.652300,-1.535000,14.506900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.140000,-1.535000,14.019200>}
box{<0,0,-0.304800><0.689712,0.035000,0.304800> rotate<0,44.997030,0> translate<13.652300,-1.535000,14.506900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.652300,-1.535000,14.533000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.140000,-1.535000,15.020700>}
box{<0,0,-0.304800><0.689712,0.035000,0.304800> rotate<0,-44.997030,0> translate<13.652300,-1.535000,14.533000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.652300,-1.535000,17.006900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.140000,-1.535000,16.519200>}
box{<0,0,-0.304800><0.689712,0.035000,0.304800> rotate<0,44.997030,0> translate<13.652300,-1.535000,17.006900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.697100,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.215300,-1.535000,18.897600>}
box{<0,0,-0.304800><6.518200,0.035000,0.304800> rotate<0,0.000000,0> translate<13.697100,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.749700,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.530200,-1.535000,14.630400>}
box{<0,0,-0.304800><0.780500,0.035000,0.304800> rotate<0,0.000000,0> translate<13.749700,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.806000,-1.535000,4.871600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.298900,-1.535000,4.871600>}
box{<0,0,-0.304800><0.492900,0.035000,0.304800> rotate<0,0.000000,0> translate<13.806000,-1.535000,4.871600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.811300,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.387200,-1.535000,12.192000>}
box{<0,0,-0.304800><0.575900,0.035000,0.304800> rotate<0,0.000000,0> translate<13.811300,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.138400,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.141600,-1.535000,14.020800>}
box{<0,0,-0.304800><0.003200,0.035000,0.304800> rotate<0,0.000000,0> translate<14.138400,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.140000,-1.535000,12.520700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.387200,-1.535000,12.273500>}
box{<0,0,-0.304800><0.349594,0.035000,0.304800> rotate<0,44.997030,0> translate<14.140000,-1.535000,12.520700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.140000,-1.535000,14.019200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.550800,-1.535000,14.430000>}
box{<0,0,-0.304800><0.580959,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.140000,-1.535000,14.019200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.140000,-1.535000,15.020700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.627600,-1.535000,14.533000>}
box{<0,0,-0.304800><0.689641,0.035000,0.304800> rotate<0,45.002904,0> translate<14.140000,-1.535000,15.020700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.140000,-1.535000,16.519200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.627600,-1.535000,17.006900>}
box{<0,0,-0.304800><0.689641,0.035000,0.304800> rotate<0,-45.002904,0> translate<14.140000,-1.535000,16.519200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.192900,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.387200,-1.535000,10.972800>}
box{<0,0,-0.304800><0.194300,0.035000,0.304800> rotate<0,0.000000,0> translate<14.192900,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.298900,-1.535000,4.871600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.692000,-1.535000,4.478500>}
box{<0,0,-0.304800><0.555927,0.035000,0.304800> rotate<0,44.997030,0> translate<14.298900,-1.535000,4.871600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.306700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.646800,-1.535000,19.507200>}
box{<0,0,-0.304800><8.340100,0.035000,0.304800> rotate<0,0.000000,0> translate<14.306700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.347100,-1.535000,28.679200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.747100,-1.535000,26.917500>}
box{<0,0,-0.304800><1.806540,0.035000,0.304800> rotate<0,77.202588,0> translate<14.347100,-1.535000,28.679200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.347100,-1.535000,28.679200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.057000,-1.535000,28.679200>}
box{<0,0,-0.304800><31.709900,0.035000,0.304800> rotate<0,0.000000,0> translate<14.347100,-1.535000,28.679200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.353500,-1.535000,28.651200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.057000,-1.535000,28.651200>}
box{<0,0,-0.304800><31.703500,0.035000,0.304800> rotate<0,0.000000,0> translate<14.353500,-1.535000,28.651200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.387200,-1.535000,12.273500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.387200,-1.535000,10.754000>}
box{<0,0,-0.304800><1.519500,0.035000,0.304800> rotate<0,-90.000000,0> translate<14.387200,-1.535000,10.754000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.430400,-1.535000,19.630900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.659000,-1.535000,19.859500>}
box{<0,0,-0.304800><0.323289,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.430400,-1.535000,19.630900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.491900,-1.535000,28.041600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.341900,-1.535000,28.041600>}
box{<0,0,-0.304800><31.850000,0.035000,0.304800> rotate<0,0.000000,0> translate<14.491900,-1.535000,28.041600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.550800,-1.535000,14.430000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.550900,-1.535000,14.430400>}
box{<0,0,-0.304800><0.000412,0.035000,0.304800> rotate<0,-75.958743,0> translate<14.550800,-1.535000,14.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.550900,-1.535000,14.430400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.592900,-1.535000,14.472400>}
box{<0,0,-0.304800><0.059397,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.550900,-1.535000,14.430400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.592900,-1.535000,14.472400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.623000,-1.535000,14.523200>}
box{<0,0,-0.304800><0.059048,0.035000,0.304800> rotate<0,-59.348507,0> translate<14.592900,-1.535000,14.472400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.623000,-1.535000,14.523200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.636200,-1.535000,14.533000>}
box{<0,0,-0.304800><0.016440,0.035000,0.304800> rotate<0,-36.588673,0> translate<14.623000,-1.535000,14.523200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.627600,-1.535000,14.533000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.636200,-1.535000,14.533000>}
box{<0,0,-0.304800><0.008600,0.035000,0.304800> rotate<0,0.000000,0> translate<14.627600,-1.535000,14.533000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.627600,-1.535000,17.006900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.652300,-1.535000,17.006900>}
box{<0,0,-0.304800><1.024700,0.035000,0.304800> rotate<0,0.000000,0> translate<14.627600,-1.535000,17.006900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.630300,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.279700,-1.535000,27.432000>}
box{<0,0,-0.304800><3.649400,0.035000,0.304800> rotate<0,0.000000,0> translate<14.630300,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.659000,-1.535000,19.859500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,20.158200>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,-67.499735,0> translate<14.659000,-1.535000,19.859500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.747100,-1.535000,26.917500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,26.831700>}
box{<0,0,-0.304800><0.092892,0.035000,0.304800> rotate<0,67.461085,0> translate<14.747100,-1.535000,26.917500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.765500,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.653600,-1.535000,20.116800>}
box{<0,0,-0.304800><8.888100,0.035000,0.304800> rotate<0,0.000000,0> translate<14.765500,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,7.199500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,7.861000>}
box{<0,0,-0.304800><0.661500,0.035000,0.304800> rotate<0,90.000000,0> translate<14.782700,-1.535000,7.861000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,7.199500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.458300,-1.535000,6.523900>}
box{<0,0,-0.304800><0.955443,0.035000,0.304800> rotate<0,44.997030,0> translate<14.782700,-1.535000,7.199500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.267400,-1.535000,7.315200>}
box{<0,0,-0.304800><0.484700,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,7.861000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.401900,-1.535000,3.785800>}
box{<0,0,-0.304800><5.450309,0.035000,0.304800> rotate<0,48.388410,0> translate<14.782700,-1.535000,7.861000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,20.158200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,26.601000>}
box{<0,0,-0.304800><6.442800,0.035000,0.304800> rotate<0,90.000000,0> translate<14.782700,-1.535000,26.601000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.044000,-1.535000,20.726400>}
box{<0,0,-0.304800><8.261300,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.485300,-1.535000,21.336000>}
box{<0,0,-0.304800><5.702600,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447200,-1.535000,21.945600>}
box{<0,0,-0.304800><5.664500,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447200,-1.535000,22.555200>}
box{<0,0,-0.304800><5.664500,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447200,-1.535000,23.164800>}
box{<0,0,-0.304800><5.664500,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447200,-1.535000,23.774400>}
box{<0,0,-0.304800><5.664500,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447200,-1.535000,24.384000>}
box{<0,0,-0.304800><5.664500,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447200,-1.535000,24.993600>}
box{<0,0,-0.304800><5.664500,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.384400,-1.535000,25.603200>}
box{<0,0,-0.304800><3.601700,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.901600,-1.535000,26.212800>}
box{<0,0,-0.304800><3.118900,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,26.601000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.798300,-1.535000,26.692300>}
box{<0,0,-0.304800><0.092623,0.035000,0.304800> rotate<0,-80.298478,0> translate<14.782700,-1.535000,26.601000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,26.761000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,26.831700>}
box{<0,0,-0.304800><0.070700,0.035000,0.304800> rotate<0,90.000000,0> translate<14.782700,-1.535000,26.831700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,26.761000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.798300,-1.535000,26.692300>}
box{<0,0,-0.304800><0.070449,0.035000,0.304800> rotate<0,77.201453,0> translate<14.782700,-1.535000,26.761000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.782700,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.901600,-1.535000,26.822400>}
box{<0,0,-0.304800><3.118900,0.035000,0.304800> rotate<0,0.000000,0> translate<14.782700,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.139400,-1.535000,0.520700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.187300,-1.535000,0.537300>}
box{<0,0,-0.304800><0.050695,0.035000,0.304800> rotate<0,-19.112770,0> translate<15.139400,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.139400,-1.535000,0.520700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.178600,-1.535000,0.520700>}
box{<0,0,-0.304800><31.039200,0.035000,0.304800> rotate<0,0.000000,0> translate<15.139400,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.187300,-1.535000,0.537300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.238700,-1.535000,0.562100>}
box{<0,0,-0.304800><0.057070,0.035000,0.304800> rotate<0,-25.755157,0> translate<15.187300,-1.535000,0.537300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.238700,-1.535000,0.562100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.287000,-1.535000,0.592400>}
box{<0,0,-0.304800><0.057017,0.035000,0.304800> rotate<0,-32.099130,0> translate<15.238700,-1.535000,0.562100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.276600,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.808800,-1.535000,6.705600>}
box{<0,0,-0.304800><0.532200,0.035000,0.304800> rotate<0,0.000000,0> translate<15.276600,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.287000,-1.535000,0.592400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.331600,-1.535000,0.628000>}
box{<0,0,-0.304800><0.057066,0.035000,0.304800> rotate<0,-38.594540,0> translate<15.287000,-1.535000,0.592400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.308500,-1.535000,0.609600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.215400,-1.535000,0.609600>}
box{<0,0,-0.304800><30.906900,0.035000,0.304800> rotate<0,0.000000,0> translate<15.308500,-1.535000,0.609600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.331600,-1.535000,0.628000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.371900,-1.535000,0.668300>}
box{<0,0,-0.304800><0.056993,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.331600,-1.535000,0.628000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.371900,-1.535000,0.668300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.407500,-1.535000,0.712900>}
box{<0,0,-0.304800><0.057066,0.035000,0.304800> rotate<0,-51.399520,0> translate<15.371900,-1.535000,0.668300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.407500,-1.535000,0.712900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.437800,-1.535000,0.761200>}
box{<0,0,-0.304800><0.057017,0.035000,0.304800> rotate<0,-57.894930,0> translate<15.407500,-1.535000,0.712900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.423400,-1.535000,9.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.841600,-1.535000,9.587200>}
box{<0,0,-0.304800><1.418200,0.035000,0.304800> rotate<0,0.000000,0> translate<15.423400,-1.535000,9.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.423400,-1.535000,9.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.420200,-1.535000,6.212900>}
box{<0,0,-0.304800><4.512949,0.035000,0.304800> rotate<0,48.387728,0> translate<15.423400,-1.535000,9.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.437800,-1.535000,0.761200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.462600,-1.535000,0.812600>}
box{<0,0,-0.304800><0.057070,0.035000,0.304800> rotate<0,-64.238903,0> translate<15.437800,-1.535000,0.761200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.458300,-1.535000,6.011000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.458300,-1.535000,6.523900>}
box{<0,0,-0.304800><0.512900,0.035000,0.304800> rotate<0,90.000000,0> translate<15.458300,-1.535000,6.523900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.458300,-1.535000,6.011000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.828700,-1.535000,3.640600>}
box{<0,0,-0.304800><3.352252,0.035000,0.304800> rotate<0,44.997030,0> translate<15.458300,-1.535000,6.011000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.458300,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.350200,-1.535000,6.096000>}
box{<0,0,-0.304800><0.891900,0.035000,0.304800> rotate<0,0.000000,0> translate<15.458300,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.462600,-1.535000,0.812600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.481400,-1.535000,0.866500>}
box{<0,0,-0.304800><0.057085,0.035000,0.304800> rotate<0,-70.766861,0> translate<15.462600,-1.535000,0.812600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.481400,-1.535000,0.866500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.494100,-1.535000,0.922100>}
box{<0,0,-0.304800><0.057032,0.035000,0.304800> rotate<0,-77.128303,0> translate<15.481400,-1.535000,0.866500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.494100,-1.535000,0.922100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.500500,-1.535000,0.978800>}
box{<0,0,-0.304800><0.057060,0.035000,0.304800> rotate<0,-83.554495,0> translate<15.494100,-1.535000,0.922100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.500500,-1.535000,0.978800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.500500,-1.535000,3.670000>}
box{<0,0,-0.304800><2.691200,0.035000,0.304800> rotate<0,90.000000,0> translate<15.500500,-1.535000,3.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.500500,-1.535000,1.219200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,1.219200>}
box{<0,0,-0.304800><31.978700,0.035000,0.304800> rotate<0,0.000000,0> translate<15.500500,-1.535000,1.219200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.500500,-1.535000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.084600,-1.535000,1.828800>}
box{<0,0,-0.304800><1.584100,0.035000,0.304800> rotate<0,0.000000,0> translate<15.500500,-1.535000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.500500,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.732100,-1.535000,2.438400>}
box{<0,0,-0.304800><1.231600,0.035000,0.304800> rotate<0,0.000000,0> translate<15.500500,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.500500,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.122500,-1.535000,3.048000>}
box{<0,0,-0.304800><0.622000,0.035000,0.304800> rotate<0,0.000000,0> translate<15.500500,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.500500,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.512900,-1.535000,3.657600>}
box{<0,0,-0.304800><0.012400,0.035000,0.304800> rotate<0,0.000000,0> translate<15.500500,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.500500,-1.535000,3.670000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.911200,-1.535000,2.259300>}
box{<0,0,-0.304800><1.995031,0.035000,0.304800> rotate<0,44.997030,0> translate<15.500500,-1.535000,3.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.652300,-1.535000,17.006900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.754900,-1.535000,16.904300>}
box{<0,0,-0.304800><0.145098,0.035000,0.304800> rotate<0,44.997030,0> translate<15.652300,-1.535000,17.006900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.754900,-1.535000,16.904300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.841600,-1.535000,17.991000>}
box{<0,0,-0.304800><1.536826,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.754900,-1.535000,16.904300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.817100,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.173600,-1.535000,9.144000>}
box{<0,0,-0.304800><1.356500,0.035000,0.304800> rotate<0,0.000000,0> translate<15.817100,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.932100,-1.535000,14.782700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.561000,-1.535000,16.411600>}
box{<0,0,-0.304800><2.303612,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.932100,-1.535000,14.782700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.932100,-1.535000,14.782700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.793200,-1.535000,14.782700>}
box{<0,0,-0.304800><7.861100,0.035000,0.304800> rotate<0,0.000000,0> translate<15.932100,-1.535000,14.782700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.982900,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.891500,-1.535000,5.486400>}
box{<0,0,-0.304800><0.908600,0.035000,0.304800> rotate<0,0.000000,0> translate<15.982900,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.012700,-1.535000,11.212700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.012700,-1.535000,12.393500>}
box{<0,0,-0.304800><1.180800,0.035000,0.304800> rotate<0,90.000000,0> translate<16.012700,-1.535000,12.393500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.012700,-1.535000,11.212700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.408200,-1.535000,11.212700>}
box{<0,0,-0.304800><1.395500,0.035000,0.304800> rotate<0,0.000000,0> translate<16.012700,-1.535000,11.212700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.012700,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.939100,-1.535000,11.582400>}
box{<0,0,-0.304800><2.926400,0.035000,0.304800> rotate<0,0.000000,0> translate<16.012700,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.012700,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.997900,-1.535000,12.192000>}
box{<0,0,-0.304800><2.985200,0.035000,0.304800> rotate<0,0.000000,0> translate<16.012700,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.012700,-1.535000,12.393500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.376900,-1.535000,12.757600>}
box{<0,0,-0.304800><0.514986,0.035000,0.304800> rotate<0,-44.989164,0> translate<16.012700,-1.535000,12.393500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.358500,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.644500,-1.535000,8.534400>}
box{<0,0,-0.304800><2.286000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.358500,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.376900,-1.535000,12.757600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.376900,-1.535000,13.157200>}
box{<0,0,-0.304800><0.399600,0.035000,0.304800> rotate<0,90.000000,0> translate<16.376900,-1.535000,13.157200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.376900,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.057900,-1.535000,12.801600>}
box{<0,0,-0.304800><2.681000,0.035000,0.304800> rotate<0,0.000000,0> translate<16.376900,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.376900,-1.535000,13.157200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.291100,-1.535000,13.157200>}
box{<0,0,-0.304800><2.914200,0.035000,0.304800> rotate<0,0.000000,0> translate<16.376900,-1.535000,13.157200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.389400,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.250500,-1.535000,15.240000>}
box{<0,0,-0.304800><7.861100,0.035000,0.304800> rotate<0,0.000000,0> translate<16.389400,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.592500,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.432900,-1.535000,4.876800>}
box{<0,0,-0.304800><0.840400,0.035000,0.304800> rotate<0,0.000000,0> translate<16.592500,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.841600,-1.535000,9.476000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,-1.535000,8.791600>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,44.997030,0> translate<16.841600,-1.535000,9.476000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.841600,-1.535000,9.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.841600,-1.535000,9.476000>}
box{<0,0,-0.304800><0.111200,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.841600,-1.535000,9.476000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.841600,-1.535000,18.063900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.841600,-1.535000,17.991000>}
box{<0,0,-0.304800><0.072900,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.841600,-1.535000,17.991000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.841600,-1.535000,18.063900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,-1.535000,18.748300>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,-44.997030,0> translate<16.841600,-1.535000,18.063900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.899900,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.585600,-1.535000,7.924800>}
box{<0,0,-0.304800><1.685700,0.035000,0.304800> rotate<0,0.000000,0> translate<16.899900,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.911200,-1.535000,2.247500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.089100,-1.535000,1.818100>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,67.491366,0> translate<16.911200,-1.535000,2.247500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.911200,-1.535000,2.259300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.911200,-1.535000,2.247500>}
box{<0,0,-0.304800><0.011800,0.035000,0.304800> rotate<0,-90.000000,0> translate<16.911200,-1.535000,2.247500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.999000,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.860100,-1.535000,15.849600>}
box{<0,0,-0.304800><7.861100,0.035000,0.304800> rotate<0,0.000000,0> translate<16.999000,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.089100,-1.535000,1.818100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.417700,-1.535000,1.489500>}
box{<0,0,-0.304800><0.464711,0.035000,0.304800> rotate<0,44.997030,0> translate<17.089100,-1.535000,1.818100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.202100,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.974300,-1.535000,4.267200>}
box{<0,0,-0.304800><0.772200,0.035000,0.304800> rotate<0,0.000000,0> translate<17.202100,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.408200,-1.535000,11.212700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.731700,-1.535000,11.212700>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,0.000000,0> translate<17.408200,-1.535000,11.212700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.417700,-1.535000,1.489500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.847100,-1.535000,1.311600>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,22.502694,0> translate<17.417700,-1.535000,1.489500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.441300,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.526700,-1.535000,7.315200>}
box{<0,0,-0.304800><1.085400,0.035000,0.304800> rotate<0,0.000000,0> translate<17.441300,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,-1.535000,8.791600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.493900,-1.535000,8.791600>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<17.526000,-1.535000,8.791600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.526000,-1.535000,18.748300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.493900,-1.535000,18.748300>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<17.526000,-1.535000,18.748300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.561000,-1.535000,16.411600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.493900,-1.535000,16.411600>}
box{<0,0,-0.304800><0.932900,0.035000,0.304800> rotate<0,0.000000,0> translate<17.561000,-1.535000,16.411600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.731700,-1.535000,11.212700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.935500,-1.535000,11.128300>}
box{<0,0,-0.304800><0.220585,0.035000,0.304800> rotate<0,22.494502,0> translate<17.731700,-1.535000,11.212700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.811700,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.509600,-1.535000,3.657600>}
box{<0,0,-0.304800><0.697900,0.035000,0.304800> rotate<0,0.000000,0> translate<17.811700,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.828700,-1.535000,3.640600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.847100,-1.535000,3.648300>}
box{<0,0,-0.304800><0.019946,0.035000,0.304800> rotate<0,-22.706752,0> translate<17.828700,-1.535000,3.640600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.847100,-1.535000,1.311600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.632800,-1.535000,1.311600>}
box{<0,0,-0.304800><1.785700,0.035000,0.304800> rotate<0,0.000000,0> translate<17.847100,-1.535000,1.311600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.847100,-1.535000,3.648300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.517300,-1.535000,3.648300>}
box{<0,0,-0.304800><0.670200,0.035000,0.304800> rotate<0,0.000000,0> translate<17.847100,-1.535000,3.648300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.901600,-1.535000,26.086000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.586000,-1.535000,25.401600>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,44.997030,0> translate<17.901600,-1.535000,26.086000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.901600,-1.535000,27.053900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.901600,-1.535000,26.086000>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,-90.000000,0> translate<17.901600,-1.535000,26.086000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.901600,-1.535000,27.053900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.586000,-1.535000,27.738300>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,-44.997030,0> translate<17.901600,-1.535000,27.053900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.935500,-1.535000,11.128300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.493900,-1.535000,11.128300>}
box{<0,0,-0.304800><0.558400,0.035000,0.304800> rotate<0,0.000000,0> translate<17.935500,-1.535000,11.128300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.982700,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.467800,-1.535000,6.705600>}
box{<0,0,-0.304800><0.485100,0.035000,0.304800> rotate<0,0.000000,0> translate<17.982700,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.401900,-1.535000,3.785800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.457200,-1.535000,3.700800>}
box{<0,0,-0.304800><0.101406,0.035000,0.304800> rotate<0,56.948687,0> translate<18.401900,-1.535000,3.785800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.420200,-1.535000,6.212900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.688100,-1.535000,8.985900>}
box{<0,0,-0.304800><2.785911,0.035000,0.304800> rotate<0,-84.476195,0> translate<18.420200,-1.535000,6.212900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.457200,-1.535000,3.700800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.495700,-1.535000,3.674500>}
box{<0,0,-0.304800><0.046626,0.035000,0.304800> rotate<0,34.335376,0> translate<18.457200,-1.535000,3.700800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.493900,-1.535000,8.791600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.688100,-1.535000,8.985900>}
box{<0,0,-0.304800><0.274711,0.035000,0.304800> rotate<0,-45.011777,0> translate<18.493900,-1.535000,8.791600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.493900,-1.535000,11.128300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.859800,-1.535000,10.762400>}
box{<0,0,-0.304800><0.517461,0.035000,0.304800> rotate<0,44.997030,0> translate<18.493900,-1.535000,11.128300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.493900,-1.535000,16.411600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.178300,-1.535000,17.096000>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,-44.997030,0> translate<18.493900,-1.535000,16.411600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.493900,-1.535000,18.748300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.827300,-1.535000,18.414900>}
box{<0,0,-0.304800><0.471499,0.035000,0.304800> rotate<0,44.997030,0> translate<18.493900,-1.535000,18.748300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.495700,-1.535000,3.674500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.517300,-1.535000,3.648300>}
box{<0,0,-0.304800><0.033956,0.035000,0.304800> rotate<0,50.493560,0> translate<18.495700,-1.535000,3.674500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.541500,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.311600,-1.535000,16.459200>}
box{<0,0,-0.304800><4.770100,0.035000,0.304800> rotate<0,0.000000,0> translate<18.541500,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.586000,-1.535000,25.401600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.553900,-1.535000,25.401600>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<18.586000,-1.535000,25.401600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.586000,-1.535000,27.738300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.553900,-1.535000,27.738300>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<18.586000,-1.535000,27.738300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.649400,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.880200,-1.535000,10.972800>}
box{<0,0,-0.304800><0.230800,0.035000,0.304800> rotate<0,0.000000,0> translate<18.649400,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.827300,-1.535000,18.414900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.071600,-1.535000,18.414900>}
box{<0,0,-0.304800><1.244300,0.035000,0.304800> rotate<0,0.000000,0> translate<18.827300,-1.535000,18.414900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.859800,-1.535000,10.762400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.034100,-1.535000,12.566800>}
box{<0,0,-0.304800><1.812799,0.035000,0.304800> rotate<0,-84.476931,0> translate<18.859800,-1.535000,10.762400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.026900,-1.535000,12.656000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.034100,-1.535000,12.566800>}
box{<0,0,-0.304800><0.089490,0.035000,0.304800> rotate<0,85.379598,0> translate<19.026900,-1.535000,12.656000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.026900,-1.535000,12.656000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.049400,-1.535000,12.725700>}
box{<0,0,-0.304800><0.073242,0.035000,0.304800> rotate<0,-72.104536,0> translate<19.026900,-1.535000,12.656000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.049400,-1.535000,12.725700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.056500,-1.535000,12.799100>}
box{<0,0,-0.304800><0.073743,0.035000,0.304800> rotate<0,-84.469380,0> translate<19.049400,-1.535000,12.725700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.056500,-1.535000,12.799100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.098700,-1.535000,12.878300>}
box{<0,0,-0.304800><0.089741,0.035000,0.304800> rotate<0,-61.945958,0> translate<19.056500,-1.535000,12.799100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.098700,-1.535000,12.878300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.126200,-1.535000,12.963600>}
box{<0,0,-0.304800><0.089623,0.035000,0.304800> rotate<0,-72.126356,0> translate<19.098700,-1.535000,12.878300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.126200,-1.535000,12.963600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.173900,-1.535000,13.019500>}
box{<0,0,-0.304800><0.073485,0.035000,0.304800> rotate<0,-49.522291,0> translate<19.126200,-1.535000,12.963600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.151100,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.606900,-1.535000,17.068800>}
box{<0,0,-0.304800><3.455800,0.035000,0.304800> rotate<0,0.000000,0> translate<19.151100,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.173900,-1.535000,13.019500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.208400,-1.535000,13.084500>}
box{<0,0,-0.304800><0.073588,0.035000,0.304800> rotate<0,-62.037918,0> translate<19.173900,-1.535000,13.019500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.178300,-1.535000,17.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.178300,-1.535000,17.145000>}
box{<0,0,-0.304800><0.049000,0.035000,0.304800> rotate<0,90.000000,0> translate<19.178300,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.178300,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.712600,-1.535000,17.145000>}
box{<0,0,-0.304800><1.534300,0.035000,0.304800> rotate<0,0.000000,0> translate<19.178300,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.208400,-1.535000,13.084500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.277900,-1.535000,13.141700>}
box{<0,0,-0.304800><0.090012,0.035000,0.304800> rotate<0,-39.452514,0> translate<19.208400,-1.535000,13.084500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.277900,-1.535000,13.141700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.291100,-1.535000,13.157200>}
box{<0,0,-0.304800><0.020359,0.035000,0.304800> rotate<0,-49.578584,0> translate<19.277900,-1.535000,13.141700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.553900,-1.535000,25.401600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.909400,-1.535000,25.757200>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,-45.005087,0> translate<19.553900,-1.535000,25.401600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.553900,-1.535000,27.738300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.909400,-1.535000,27.382700>}
box{<0,0,-0.304800><0.502824,0.035000,0.304800> rotate<0,45.005087,0> translate<19.553900,-1.535000,27.738300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.632800,-1.535000,1.311600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.062200,-1.535000,1.489500>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,-22.502694,0> translate<19.632800,-1.535000,1.311600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.755400,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447200,-1.535000,25.603200>}
box{<0,0,-0.304800><0.691800,0.035000,0.304800> rotate<0,0.000000,0> translate<19.755400,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.860200,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.023700,-1.535000,27.432000>}
box{<0,0,-0.304800><2.163500,0.035000,0.304800> rotate<0,0.000000,0> translate<19.860200,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.909400,-1.535000,25.757200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447200,-1.535000,25.757200>}
box{<0,0,-0.304800><0.537800,0.035000,0.304800> rotate<0,0.000000,0> translate<19.909400,-1.535000,25.757200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.909400,-1.535000,27.382700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.098200,-1.535000,27.382700>}
box{<0,0,-0.304800><1.188800,0.035000,0.304800> rotate<0,0.000000,0> translate<19.909400,-1.535000,27.382700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.062200,-1.535000,1.489500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.390800,-1.535000,1.818100>}
box{<0,0,-0.304800><0.464711,0.035000,0.304800> rotate<0,-44.997030,0> translate<20.062200,-1.535000,1.489500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.071600,-1.535000,18.753900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.071600,-1.535000,18.414900>}
box{<0,0,-0.304800><0.339000,0.035000,0.304800> rotate<0,-90.000000,0> translate<20.071600,-1.535000,18.414900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.071600,-1.535000,18.753900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.756000,-1.535000,19.438300>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,-44.997030,0> translate<20.071600,-1.535000,18.753900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.146900,-1.535000,7.182500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.403100,-1.535000,9.834500>}
box{<0,0,-0.304800><2.664347,0.035000,0.304800> rotate<0,-84.476413,0> translate<20.146900,-1.535000,7.182500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.146900,-1.535000,7.182500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.777200,-1.535000,7.812900>}
box{<0,0,-0.304800><0.891450,0.035000,0.304800> rotate<0,-45.001575,0> translate<20.146900,-1.535000,7.182500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.159700,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.279600,-1.535000,7.315200>}
box{<0,0,-0.304800><0.119900,0.035000,0.304800> rotate<0,0.000000,0> translate<20.159700,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.218600,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.777200,-1.535000,7.924800>}
box{<0,0,-0.304800><0.558600,0.035000,0.304800> rotate<0,0.000000,0> translate<20.218600,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.277500,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.777200,-1.535000,8.534400>}
box{<0,0,-0.304800><0.499700,0.035000,0.304800> rotate<0,0.000000,0> translate<20.277500,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.336300,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.777200,-1.535000,9.144000>}
box{<0,0,-0.304800><0.440900,0.035000,0.304800> rotate<0,0.000000,0> translate<20.336300,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.390800,-1.535000,1.818100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.568700,-1.535000,2.247500>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,-67.491366,0> translate<20.390800,-1.535000,1.818100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.395200,-1.535000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.182900,-1.535000,1.828800>}
box{<0,0,-0.304800><0.787700,0.035000,0.304800> rotate<0,0.000000,0> translate<20.395200,-1.535000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.395200,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.484000,-1.535000,9.753600>}
box{<0,0,-0.304800><0.088800,0.035000,0.304800> rotate<0,0.000000,0> translate<20.395200,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.403100,-1.535000,9.834500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.756000,-1.535000,9.481600>}
box{<0,0,-0.304800><0.499076,0.035000,0.304800> rotate<0,44.997030,0> translate<20.403100,-1.535000,9.834500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447200,-1.535000,21.428200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.570900,-1.535000,21.129500>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,67.499735,0> translate<20.447200,-1.535000,21.428200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447200,-1.535000,25.757200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.447200,-1.535000,21.428200>}
box{<0,0,-0.304800><4.329000,0.035000,0.304800> rotate<0,-90.000000,0> translate<20.447200,-1.535000,21.428200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.568700,-1.535000,2.247500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.568700,-1.535000,2.254500>}
box{<0,0,-0.304800><0.007000,0.035000,0.304800> rotate<0,90.000000,0> translate<20.568700,-1.535000,2.254500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.568700,-1.535000,2.254500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.068200,-1.535000,1.912300>}
box{<0,0,-0.304800><0.605476,0.035000,0.304800> rotate<0,34.412190,0> translate<20.568700,-1.535000,2.254500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.570900,-1.535000,21.129500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.799500,-1.535000,20.900900>}
box{<0,0,-0.304800><0.323289,0.035000,0.304800> rotate<0,44.997030,0> translate<20.570900,-1.535000,21.129500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.577600,-1.535000,11.639800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.593500,-1.535000,11.804500>}
box{<0,0,-0.304800><0.165466,0.035000,0.304800> rotate<0,-84.480226,0> translate<20.577600,-1.535000,11.639800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.577600,-1.535000,11.639800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.755200,-1.535000,11.817500>}
box{<0,0,-0.304800><0.251235,0.035000,0.304800> rotate<0,-45.013155,0> translate<20.577600,-1.535000,11.639800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.593500,-1.535000,11.804500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.755200,-1.535000,11.817500>}
box{<0,0,-0.304800><0.162222,0.035000,0.304800> rotate<0,-4.596150,0> translate<20.593500,-1.535000,11.804500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.712600,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.756000,-1.535000,17.101600>}
box{<0,0,-0.304800><0.061377,0.035000,0.304800> rotate<0,44.997030,0> translate<20.712600,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.756000,-1.535000,9.481600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.777200,-1.535000,9.481600>}
box{<0,0,-0.304800><0.021200,0.035000,0.304800> rotate<0,0.000000,0> translate<20.756000,-1.535000,9.481600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.756000,-1.535000,17.101600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.723900,-1.535000,17.101600>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<20.756000,-1.535000,17.101600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.756000,-1.535000,19.438300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.723900,-1.535000,19.438300>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<20.756000,-1.535000,19.438300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.765100,-1.535000,11.818300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.280700,-1.535000,11.859800>}
box{<0,0,-0.304800><0.517267,0.035000,0.304800> rotate<0,-4.601442,0> translate<20.765100,-1.535000,11.818300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.765100,-1.535000,11.818300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.322200,-1.535000,11.818300>}
box{<0,0,-0.304800><0.557100,0.035000,0.304800> rotate<0,0.000000,0> translate<20.765100,-1.535000,11.818300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.777200,-1.535000,9.481600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.777200,-1.535000,7.812900>}
box{<0,0,-0.304800><1.668700,0.035000,0.304800> rotate<0,-90.000000,0> translate<20.777200,-1.535000,7.812900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.799500,-1.535000,20.900900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.098200,-1.535000,20.777200>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,22.494325,0> translate<20.799500,-1.535000,20.900900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.068200,-1.535000,1.912300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.129500,-1.535000,1.850900>}
box{<0,0,-0.304800><0.086762,0.035000,0.304800> rotate<0,45.043723,0> translate<21.068200,-1.535000,1.912300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.098200,-1.535000,20.777200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.421700,-1.535000,20.777200>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,0.000000,0> translate<21.098200,-1.535000,20.777200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.098200,-1.535000,27.382700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.235100,-1.535000,27.382700>}
box{<0,0,-0.304800><0.136900,0.035000,0.304800> rotate<0,0.000000,0> translate<21.098200,-1.535000,27.382700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.129500,-1.535000,1.850900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.200900,-1.535000,1.821400>}
box{<0,0,-0.304800><0.077254,0.035000,0.304800> rotate<0,22.447233,0> translate<21.129500,-1.535000,1.850900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.200900,-1.535000,1.821400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.264000,-1.535000,1.778100>}
box{<0,0,-0.304800><0.076528,0.035000,0.304800> rotate<0,34.456121,0> translate<21.200900,-1.535000,1.821400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.235100,-1.535000,27.382700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.970600,-1.535000,27.491200>}
box{<0,0,-0.304800><1.738888,0.035000,0.304800> rotate<0,-3.577126,0> translate<21.235100,-1.535000,27.382700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.264000,-1.535000,1.778100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.348300,-1.535000,1.760300>}
box{<0,0,-0.304800><0.086159,0.035000,0.304800> rotate<0,11.922121,0> translate<21.264000,-1.535000,1.778100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.280700,-1.535000,11.859800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.322200,-1.535000,11.818300>}
box{<0,0,-0.304800><0.058690,0.035000,0.304800> rotate<0,44.997030,0> translate<21.280700,-1.535000,11.859800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.348300,-1.535000,1.760300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.428200,-1.535000,1.727200>}
box{<0,0,-0.304800><0.086485,0.035000,0.304800> rotate<0,22.501169,0> translate<21.348300,-1.535000,1.760300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.421700,-1.535000,20.777200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.993200,-1.535000,20.777200>}
box{<0,0,-0.304800><1.571500,0.035000,0.304800> rotate<0,0.000000,0> translate<21.421700,-1.535000,20.777200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.428200,-1.535000,1.727200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.505100,-1.535000,1.727200>}
box{<0,0,-0.304800><0.076900,0.035000,0.304800> rotate<0,0.000000,0> translate<21.428200,-1.535000,1.727200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.505100,-1.535000,1.727200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.580300,-1.535000,1.711300>}
box{<0,0,-0.304800><0.076863,0.035000,0.304800> rotate<0,11.937779,0> translate<21.505100,-1.535000,1.727200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.580300,-1.535000,1.711300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.665400,-1.535000,1.727200>}
box{<0,0,-0.304800><0.086573,0.035000,0.304800> rotate<0,-10.582367,0> translate<21.580300,-1.535000,1.711300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.665400,-1.535000,1.727200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.800000,-1.535000,1.727200>}
box{<0,0,-0.304800><3.134600,0.035000,0.304800> rotate<0,0.000000,0> translate<21.665400,-1.535000,1.727200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.677700,-1.535000,4.871600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.926700,-1.535000,4.622700>}
box{<0,0,-0.304800><0.352068,0.035000,0.304800> rotate<0,44.985523,0> translate<21.677700,-1.535000,4.871600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.677700,-1.535000,4.871600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.393900,-1.535000,4.871600>}
box{<0,0,-0.304800><0.716200,0.035000,0.304800> rotate<0,0.000000,0> translate<21.677700,-1.535000,4.871600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.723900,-1.535000,17.101600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.767300,-1.535000,17.145000>}
box{<0,0,-0.304800><0.061377,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.723900,-1.535000,17.101600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.723900,-1.535000,19.438300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.408300,-1.535000,18.753900>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,44.997030,0> translate<21.723900,-1.535000,19.438300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.767300,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.575400,-1.535000,17.145000>}
box{<0,0,-0.304800><0.808100,0.035000,0.304800> rotate<0,0.000000,0> translate<21.767300,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.926700,-1.535000,4.622700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.143200,-1.535000,4.622700>}
box{<0,0,-0.304800><8.216500,0.035000,0.304800> rotate<0,0.000000,0> translate<21.926700,-1.535000,4.622700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.072700,-1.535000,22.402700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.072700,-1.535000,25.757200>}
box{<0,0,-0.304800><3.354500,0.035000,0.304800> rotate<0,90.000000,0> translate<22.072700,-1.535000,25.757200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.072700,-1.535000,22.402700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.957500,-1.535000,22.402700>}
box{<0,0,-0.304800><0.884800,0.035000,0.304800> rotate<0,0.000000,0> translate<22.072700,-1.535000,22.402700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.072700,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.894300,-1.535000,22.555200>}
box{<0,0,-0.304800><0.821600,0.035000,0.304800> rotate<0,0.000000,0> translate<22.072700,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.072700,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.770000,-1.535000,23.164800>}
box{<0,0,-0.304800><0.697300,0.035000,0.304800> rotate<0,0.000000,0> translate<22.072700,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.072700,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.770000,-1.535000,23.774400>}
box{<0,0,-0.304800><0.697300,0.035000,0.304800> rotate<0,0.000000,0> translate<22.072700,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.072700,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.770000,-1.535000,24.384000>}
box{<0,0,-0.304800><0.697300,0.035000,0.304800> rotate<0,0.000000,0> translate<22.072700,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.072700,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.815200,-1.535000,24.993600>}
box{<0,0,-0.304800><0.742500,0.035000,0.304800> rotate<0,0.000000,0> translate<22.072700,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.072700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.215200,-1.535000,25.603200>}
box{<0,0,-0.304800><1.142500,0.035000,0.304800> rotate<0,0.000000,0> translate<22.072700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.072700,-1.535000,25.757200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.438200,-1.535000,25.757200>}
box{<0,0,-0.304800><1.365500,0.035000,0.304800> rotate<0,0.000000,0> translate<22.072700,-1.535000,25.757200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.264600,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491600,-1.535000,18.897600>}
box{<0,0,-0.304800><0.227000,0.035000,0.304800> rotate<0,0.000000,0> translate<22.264600,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.282100,-1.535000,13.157200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.118600,-1.535000,12.320700>}
box{<0,0,-0.304800><1.182990,0.035000,0.304800> rotate<0,44.997030,0> translate<22.282100,-1.535000,13.157200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.282100,-1.535000,13.157200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.968200,-1.535000,13.157200>}
box{<0,0,-0.304800><1.686100,0.035000,0.304800> rotate<0,0.000000,0> translate<22.282100,-1.535000,13.157200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.299100,-1.535000,7.208300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.393900,-1.535000,7.208300>}
box{<0,0,-0.304800><0.094800,0.035000,0.304800> rotate<0,0.000000,0> translate<22.299100,-1.535000,7.208300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.299100,-1.535000,7.208300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.402700,-1.535000,7.458200>}
box{<0,0,-0.304800><0.270524,0.035000,0.304800> rotate<0,-67.478321,0> translate<22.299100,-1.535000,7.208300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.343400,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.295800,-1.535000,7.315200>}
box{<0,0,-0.304800><7.952400,0.035000,0.304800> rotate<0,0.000000,0> translate<22.343400,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.393900,-1.535000,4.871600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.059500,-1.535000,5.537200>}
box{<0,0,-0.304800><0.941301,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.393900,-1.535000,4.871600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.393900,-1.535000,7.208300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.439500,-1.535000,7.162700>}
box{<0,0,-0.304800><0.064488,0.035000,0.304800> rotate<0,44.997030,0> translate<22.393900,-1.535000,7.208300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.399100,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.397300,-1.535000,4.876800>}
box{<0,0,-0.304800><7.998200,0.035000,0.304800> rotate<0,0.000000,0> translate<22.399100,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.402700,-1.535000,7.458200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.402700,-1.535000,10.160400>}
box{<0,0,-0.304800><2.702200,0.035000,0.304800> rotate<0,90.000000,0> translate<22.402700,-1.535000,10.160400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.402700,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.905400,-1.535000,7.924800>}
box{<0,0,-0.304800><8.502700,0.035000,0.304800> rotate<0,0.000000,0> translate<22.402700,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.402700,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.515000,-1.535000,8.534400>}
box{<0,0,-0.304800><9.112300,0.035000,0.304800> rotate<0,0.000000,0> translate<22.402700,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.402700,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.823200,-1.535000,9.144000>}
box{<0,0,-0.304800><0.420500,0.035000,0.304800> rotate<0,0.000000,0> translate<22.402700,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.402700,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491600,-1.535000,9.753600>}
box{<0,0,-0.304800><0.088900,0.035000,0.304800> rotate<0,0.000000,0> translate<22.402700,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.402700,-1.535000,10.160400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.408300,-1.535000,10.166000>}
box{<0,0,-0.304800><0.007920,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.402700,-1.535000,10.160400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.408300,-1.535000,10.166000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.408300,-1.535000,10.737300>}
box{<0,0,-0.304800><0.571300,0.035000,0.304800> rotate<0,90.000000,0> translate<22.408300,-1.535000,10.737300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.408300,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491600,-1.535000,10.363200>}
box{<0,0,-0.304800><0.083300,0.035000,0.304800> rotate<0,0.000000,0> translate<22.408300,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.408300,-1.535000,10.737300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491600,-1.535000,10.702800>}
box{<0,0,-0.304800><0.090162,0.035000,0.304800> rotate<0,22.496173,0> translate<22.408300,-1.535000,10.737300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.408300,-1.535000,18.414900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.408300,-1.535000,18.753900>}
box{<0,0,-0.304800><0.339000,0.035000,0.304800> rotate<0,90.000000,0> translate<22.408300,-1.535000,18.753900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.408300,-1.535000,18.414900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491600,-1.535000,18.414900>}
box{<0,0,-0.304800><0.083300,0.035000,0.304800> rotate<0,0.000000,0> translate<22.408300,-1.535000,18.414900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.439500,-1.535000,7.162700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.143200,-1.535000,7.162700>}
box{<0,0,-0.304800><7.703700,0.035000,0.304800> rotate<0,0.000000,0> translate<22.439500,-1.535000,7.162700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491600,-1.535000,9.727100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.669500,-1.535000,9.297700>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,67.491366,0> translate<22.491600,-1.535000,9.727100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491600,-1.535000,10.702800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491600,-1.535000,9.727100>}
box{<0,0,-0.304800><0.975700,0.035000,0.304800> rotate<0,-90.000000,0> translate<22.491600,-1.535000,9.727100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491600,-1.535000,19.132800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491600,-1.535000,18.414900>}
box{<0,0,-0.304800><0.717900,0.035000,0.304800> rotate<0,-90.000000,0> translate<22.491600,-1.535000,18.414900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.491600,-1.535000,19.132800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.669500,-1.535000,19.562200>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,-67.491366,0> translate<22.491600,-1.535000,19.132800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.575400,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.669500,-1.535000,16.917700>}
box{<0,0,-0.304800><0.246008,0.035000,0.304800> rotate<0,67.506463,0> translate<22.575400,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.637700,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.352200,-1.535000,12.801600>}
box{<0,0,-0.304800><1.714500,0.035000,0.304800> rotate<0,0.000000,0> translate<22.637700,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.669500,-1.535000,9.297700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.998100,-1.535000,8.969100>}
box{<0,0,-0.304800><0.464711,0.035000,0.304800> rotate<0,44.997030,0> translate<22.669500,-1.535000,9.297700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.669500,-1.535000,16.917700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.998100,-1.535000,16.589100>}
box{<0,0,-0.304800><0.464711,0.035000,0.304800> rotate<0,44.997030,0> translate<22.669500,-1.535000,16.917700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.669500,-1.535000,19.562200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.998100,-1.535000,19.890800>}
box{<0,0,-0.304800><0.464711,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.669500,-1.535000,19.562200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.770000,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.957500,-1.535000,22.402700>}
box{<0,0,-0.304800><0.489901,0.035000,0.304800> rotate<0,67.492634,0> translate<22.770000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.770000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.770000,-1.535000,22.855300>}
box{<0,0,-0.304800><2.029300,0.035000,0.304800> rotate<0,-90.000000,0> translate<22.770000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.770000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.963300,-1.535000,25.351300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-67.496957,0> translate<22.770000,-1.535000,24.884600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.963300,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.320600,-1.535000,25.708600>}
box{<0,0,-0.304800><0.505299,0.035000,0.304800> rotate<0,-44.997030,0> translate<22.963300,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.970600,-1.535000,27.491200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.276500,-1.535000,27.386300>}
box{<0,0,-0.304800><0.323386,0.035000,0.304800> rotate<0,18.926747,0> translate<22.970600,-1.535000,27.491200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.993200,-1.535000,20.777200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.701800,-1.535000,20.068700>}
box{<0,0,-0.304800><1.002041,0.035000,0.304800> rotate<0,44.992987,0> translate<22.993200,-1.535000,20.777200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.998100,-1.535000,8.969100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.427500,-1.535000,8.791200>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,22.502694,0> translate<22.998100,-1.535000,8.969100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.998100,-1.535000,16.589100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.427500,-1.535000,16.411200>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,22.502694,0> translate<22.998100,-1.535000,16.589100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.998100,-1.535000,19.890800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.427500,-1.535000,20.068700>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,-22.502694,0> translate<22.998100,-1.535000,19.890800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.008700,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.006900,-1.535000,5.486400>}
box{<0,0,-0.304800><7.998200,0.035000,0.304800> rotate<0,0.000000,0> translate<23.008700,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.059500,-1.535000,5.537200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.318200,-1.535000,5.537200>}
box{<0,0,-0.304800><7.258700,0.035000,0.304800> rotate<0,0.000000,0> translate<23.059500,-1.535000,5.537200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.118600,-1.535000,12.320700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.427500,-1.535000,12.448700>}
box{<0,0,-0.304800><0.334370,0.035000,0.304800> rotate<0,-22.506340,0> translate<23.118600,-1.535000,12.320700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.143300,-1.535000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,27.432000>}
box{<0,0,-0.304800><24.335900,0.035000,0.304800> rotate<0,0.000000,0> translate<23.143300,-1.535000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.276500,-1.535000,27.386300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.280600,-1.535000,27.382700>}
box{<0,0,-0.304800><0.005456,0.035000,0.304800> rotate<0,41.281986,0> translate<23.276500,-1.535000,27.386300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.280600,-1.535000,27.382700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.418200,-1.535000,27.382700>}
box{<0,0,-0.304800><3.137600,0.035000,0.304800> rotate<0,0.000000,0> translate<23.280600,-1.535000,27.382700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.320600,-1.535000,25.708600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.438200,-1.535000,25.757200>}
box{<0,0,-0.304800><0.127247,0.035000,0.304800> rotate<0,-22.452128,0> translate<23.320600,-1.535000,25.708600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.427500,-1.535000,8.791200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.892400,-1.535000,8.791200>}
box{<0,0,-0.304800><0.464900,0.035000,0.304800> rotate<0,0.000000,0> translate<23.427500,-1.535000,8.791200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.427500,-1.535000,12.448700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.892400,-1.535000,12.448700>}
box{<0,0,-0.304800><0.464900,0.035000,0.304800> rotate<0,0.000000,0> translate<23.427500,-1.535000,12.448700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.427500,-1.535000,16.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.892400,-1.535000,16.411200>}
box{<0,0,-0.304800><0.464900,0.035000,0.304800> rotate<0,0.000000,0> translate<23.427500,-1.535000,16.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.427500,-1.535000,20.068700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.701800,-1.535000,20.068700>}
box{<0,0,-0.304800><0.274300,0.035000,0.304800> rotate<0,0.000000,0> translate<23.427500,-1.535000,20.068700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.793200,-1.535000,14.782700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.746600,-1.535000,16.736100>}
box{<0,0,-0.304800><2.762525,0.035000,0.304800> rotate<0,-44.997030,0> translate<23.793200,-1.535000,14.782700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.892400,-1.535000,8.791200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.321800,-1.535000,8.969100>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,-22.502694,0> translate<23.892400,-1.535000,8.791200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.892400,-1.535000,12.448700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.967900,-1.535000,12.417400>}
box{<0,0,-0.304800><0.081731,0.035000,0.304800> rotate<0,22.515921,0> translate<23.892400,-1.535000,12.448700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.892400,-1.535000,16.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.321800,-1.535000,16.589100>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,-22.502694,0> translate<23.892400,-1.535000,16.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.967900,-1.535000,12.417400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.127200,-1.535000,15.576600>}
box{<0,0,-0.304800><4.467854,0.035000,0.304800> rotate<0,-44.996123,0> translate<23.967900,-1.535000,12.417400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<23.968200,-1.535000,13.157200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.291700,-1.535000,13.157200>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,0.000000,0> translate<23.968200,-1.535000,13.157200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.008200,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.469700,-1.535000,16.459200>}
box{<0,0,-0.304800><1.461500,0.035000,0.304800> rotate<0,0.000000,0> translate<24.008200,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.291700,-1.535000,13.157200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.590400,-1.535000,13.280900>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,-22.494325,0> translate<24.291700,-1.535000,13.157200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.321800,-1.535000,8.969100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.650400,-1.535000,9.297700>}
box{<0,0,-0.304800><0.464711,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.321800,-1.535000,8.969100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.321800,-1.535000,16.589100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.650400,-1.535000,16.917700>}
box{<0,0,-0.304800><0.464711,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.321800,-1.535000,16.589100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.496700,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.124600,-1.535000,9.144000>}
box{<0,0,-0.304800><7.627900,0.035000,0.304800> rotate<0,0.000000,0> translate<24.496700,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.590400,-1.535000,13.280900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.127200,-1.535000,15.817800>}
box{<0,0,-0.304800><3.587648,0.035000,0.304800> rotate<0,-44.998159,0> translate<24.590400,-1.535000,13.280900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.641700,-1.535000,25.757200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.759300,-1.535000,25.708600>}
box{<0,0,-0.304800><0.127247,0.035000,0.304800> rotate<0,22.452128,0> translate<24.641700,-1.535000,25.757200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.641700,-1.535000,25.757200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.767200,-1.535000,25.757200>}
box{<0,0,-0.304800><1.125500,0.035000,0.304800> rotate<0,0.000000,0> translate<24.641700,-1.535000,25.757200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.650400,-1.535000,9.297700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,9.727100>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,-67.491366,0> translate<24.650400,-1.535000,9.297700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.650400,-1.535000,16.917700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,17.347100>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,-67.491366,0> translate<24.650400,-1.535000,16.917700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.713000,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.641800,-1.535000,17.068800>}
box{<0,0,-0.304800><0.928800,0.035000,0.304800> rotate<0,0.000000,0> translate<24.713000,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.720600,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.961800,-1.535000,13.411200>}
box{<0,0,-0.304800><0.241200,0.035000,0.304800> rotate<0,0.000000,0> translate<24.720600,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.759300,-1.535000,25.708600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.116600,-1.535000,25.351300>}
box{<0,0,-0.304800><0.505299,0.035000,0.304800> rotate<0,44.997030,0> translate<24.759300,-1.535000,25.708600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.800000,-1.535000,1.727200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.037700,-1.535000,1.489500>}
box{<0,0,-0.304800><0.336159,0.035000,0.304800> rotate<0,44.997030,0> translate<24.800000,-1.535000,1.727200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,9.727100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,10.978900>}
box{<0,0,-0.304800><1.251800,0.035000,0.304800> rotate<0,90.000000,0> translate<24.828300,-1.535000,10.978900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.734200,-1.535000,9.753600>}
box{<0,0,-0.304800><7.905900,0.035000,0.304800> rotate<0,0.000000,0> translate<24.828300,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.343800,-1.535000,10.363200>}
box{<0,0,-0.304800><8.515500,0.035000,0.304800> rotate<0,0.000000,0> translate<24.828300,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,10.972800>}
box{<0,0,-0.304800><8.733600,0.035000,0.304800> rotate<0,0.000000,0> translate<24.828300,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,10.978900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.946600,-1.535000,14.097200>}
box{<0,0,-0.304800><4.409942,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.828300,-1.535000,10.978900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,17.347100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,18.942200>}
box{<0,0,-0.304800><1.595100,0.035000,0.304800> rotate<0,90.000000,0> translate<24.828300,-1.535000,18.942200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.449800,-1.535000,17.678400>}
box{<0,0,-0.304800><0.621500,0.035000,0.304800> rotate<0,0.000000,0> translate<24.828300,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.257800,-1.535000,18.288000>}
box{<0,0,-0.304800><0.429500,0.035000,0.304800> rotate<0,0.000000,0> translate<24.828300,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.872900,-1.535000,18.897600>}
box{<0,0,-0.304800><0.044600,0.035000,0.304800> rotate<0,0.000000,0> translate<24.828300,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.828300,-1.535000,18.942200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.154600,-1.535000,18.615900>}
box{<0,0,-0.304800><0.461458,0.035000,0.304800> rotate<0,44.997030,0> translate<24.828300,-1.535000,18.942200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.864700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.755200,-1.535000,25.603200>}
box{<0,0,-0.304800><0.890500,0.035000,0.304800> rotate<0,0.000000,0> translate<24.864700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.037700,-1.535000,1.489500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.467100,-1.535000,1.311600>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,22.502694,0> translate<25.037700,-1.535000,1.489500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.116600,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.309900,-1.535000,24.884600>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,67.496957,0> translate<25.116600,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.154600,-1.535000,18.615900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.746600,-1.535000,16.736100>}
box{<0,0,-0.304800><1.970815,0.035000,0.304800> rotate<0,72.514586,0> translate<25.154600,-1.535000,18.615900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.264800,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.355200,-1.535000,24.993600>}
box{<0,0,-0.304800><0.090400,0.035000,0.304800> rotate<0,0.000000,0> translate<25.264800,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.302300,-1.535000,22.837000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.309900,-1.535000,22.855300>}
box{<0,0,-0.304800><0.019815,0.035000,0.304800> rotate<0,-67.442410,0> translate<25.302300,-1.535000,22.837000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.302300,-1.535000,22.837000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.328400,-1.535000,22.810900>}
box{<0,0,-0.304800><0.036911,0.035000,0.304800> rotate<0,44.997030,0> translate<25.302300,-1.535000,22.837000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.309900,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.309900,-1.535000,24.884600>}
box{<0,0,-0.304800><2.029300,0.035000,0.304800> rotate<0,90.000000,0> translate<25.309900,-1.535000,24.884600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.309900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.310000,-1.535000,23.164800>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<25.309900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.309900,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.310000,-1.535000,23.774400>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<25.309900,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.309900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.310000,-1.535000,24.384000>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<25.309900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.310000,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.328400,-1.535000,22.810900>}
box{<0,0,-0.304800><0.048062,0.035000,0.304800> rotate<0,67.485724,0> translate<25.310000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.310000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.310000,-1.535000,22.855300>}
box{<0,0,-0.304800><2.029300,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.310000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.310000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.503300,-1.535000,25.351300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-67.496957,0> translate<25.310000,-1.535000,24.884600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.330200,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.571400,-1.535000,14.020800>}
box{<0,0,-0.304800><0.241200,0.035000,0.304800> rotate<0,0.000000,0> translate<25.330200,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.431800,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.032600,-1.535000,11.582400>}
box{<0,0,-0.304800><8.600800,0.035000,0.304800> rotate<0,0.000000,0> translate<25.431800,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.467100,-1.535000,1.311600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.252800,-1.535000,1.311600>}
box{<0,0,-0.304800><1.785700,0.035000,0.304800> rotate<0,0.000000,0> translate<25.467100,-1.535000,1.311600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.503300,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.767200,-1.535000,25.615200>}
box{<0,0,-0.304800><0.373211,0.035000,0.304800> rotate<0,-44.997030,0> translate<25.503300,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.767200,-1.535000,25.757200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.767200,-1.535000,25.615200>}
box{<0,0,-0.304800><0.142000,0.035000,0.304800> rotate<0,-90.000000,0> translate<25.767200,-1.535000,25.615200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.939800,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.181000,-1.535000,14.630400>}
box{<0,0,-0.304800><0.241200,0.035000,0.304800> rotate<0,0.000000,0> translate<25.939800,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.041400,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.648500,-1.535000,12.192000>}
box{<0,0,-0.304800><7.607100,0.035000,0.304800> rotate<0,0.000000,0> translate<26.041400,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.282900,-1.535000,21.856400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.327300,-1.535000,21.838000>}
box{<0,0,-0.304800><0.048062,0.035000,0.304800> rotate<0,22.508336,0> translate<26.282900,-1.535000,21.856400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.282900,-1.535000,21.856400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.397200,-1.535000,19.742100>}
box{<0,0,-0.304800><2.990072,0.035000,0.304800> rotate<0,44.997030,0> translate<26.282900,-1.535000,21.856400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.327300,-1.535000,21.838000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.832600,-1.535000,21.838000>}
box{<0,0,-0.304800><0.505300,0.035000,0.304800> rotate<0,0.000000,0> translate<26.327300,-1.535000,21.838000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.418200,-1.535000,27.382700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.741700,-1.535000,27.382700>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,0.000000,0> translate<26.418200,-1.535000,27.382700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.549400,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.790600,-1.535000,15.240000>}
box{<0,0,-0.304800><0.241200,0.035000,0.304800> rotate<0,0.000000,0> translate<26.549400,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.651000,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.038900,-1.535000,12.801600>}
box{<0,0,-0.304800><6.387900,0.035000,0.304800> rotate<0,0.000000,0> translate<26.651000,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690500,-1.535000,19.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.127200,-1.535000,17.763500>}
box{<0,0,-0.304800><1.453647,0.035000,0.304800> rotate<0,72.512573,0> translate<26.690500,-1.535000,19.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.690500,-1.535000,19.150000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.127200,-1.535000,18.713300>}
box{<0,0,-0.304800><0.617587,0.035000,0.304800> rotate<0,44.997030,0> translate<26.690500,-1.535000,19.150000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.741700,-1.535000,27.382700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.040400,-1.535000,27.259000>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,22.494325,0> translate<26.741700,-1.535000,27.382700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.770000,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.942900,-1.535000,18.897600>}
box{<0,0,-0.304800><0.172900,0.035000,0.304800> rotate<0,0.000000,0> translate<26.770000,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.803300,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.397200,-1.535000,21.336000>}
box{<0,0,-0.304800><1.593900,0.035000,0.304800> rotate<0,0.000000,0> translate<26.803300,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.832600,-1.535000,21.838000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.299300,-1.535000,22.031300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-22.497104,0> translate<26.832600,-1.535000,21.838000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.962100,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.127200,-1.535000,18.288000>}
box{<0,0,-0.304800><0.165100,0.035000,0.304800> rotate<0,0.000000,0> translate<26.962100,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.040400,-1.535000,27.259000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.086700,-1.535000,27.212700>}
box{<0,0,-0.304800><0.065478,0.035000,0.304800> rotate<0,44.997030,0> translate<27.040400,-1.535000,27.259000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.086700,-1.535000,27.212700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.361700,-1.535000,27.212700>}
box{<0,0,-0.304800><16.275000,0.035000,0.304800> rotate<0,0.000000,0> translate<27.086700,-1.535000,27.212700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.092300,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.397200,-1.535000,21.945600>}
box{<0,0,-0.304800><1.304900,0.035000,0.304800> rotate<0,0.000000,0> translate<27.092300,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.127200,-1.535000,15.817800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.127200,-1.535000,15.576600>}
box{<0,0,-0.304800><0.241200,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.127200,-1.535000,15.576600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.127200,-1.535000,18.713300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.127200,-1.535000,17.763500>}
box{<0,0,-0.304800><0.949800,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.127200,-1.535000,17.763500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.252800,-1.535000,1.311600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.682200,-1.535000,1.489500>}
box{<0,0,-0.304800><0.464793,0.035000,0.304800> rotate<0,-22.502694,0> translate<27.252800,-1.535000,1.311600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.260600,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.429300,-1.535000,13.411200>}
box{<0,0,-0.304800><5.168700,0.035000,0.304800> rotate<0,0.000000,0> translate<27.260600,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.299300,-1.535000,22.031300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.656600,-1.535000,22.388600>}
box{<0,0,-0.304800><0.505299,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.299300,-1.535000,22.031300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.412900,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.397200,-1.535000,20.726400>}
box{<0,0,-0.304800><0.984300,0.035000,0.304800> rotate<0,0.000000,0> translate<27.412900,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.420600,-1.535000,25.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.656600,-1.535000,25.351300>}
box{<0,0,-0.304800><0.333684,0.035000,0.304800> rotate<0,44.984889,0> translate<27.420600,-1.535000,25.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.420600,-1.535000,25.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.279300,-1.535000,25.587200>}
box{<0,0,-0.304800><0.858700,0.035000,0.304800> rotate<0,0.000000,0> translate<27.420600,-1.535000,25.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.656600,-1.535000,22.388600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.849900,-1.535000,22.855300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-67.496957,0> translate<27.656600,-1.535000,22.388600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.656600,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.849900,-1.535000,24.884600>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,67.496957,0> translate<27.656600,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.682200,-1.535000,1.489500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.919900,-1.535000,1.727200>}
box{<0,0,-0.304800><0.336159,0.035000,0.304800> rotate<0,-44.997030,0> translate<27.682200,-1.535000,1.489500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.725600,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.974200,-1.535000,22.555200>}
box{<0,0,-0.304800><0.248600,0.035000,0.304800> rotate<0,0.000000,0> translate<27.725600,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.804800,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.895200,-1.535000,24.993600>}
box{<0,0,-0.304800><0.090400,0.035000,0.304800> rotate<0,0.000000,0> translate<27.804800,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.849900,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.849900,-1.535000,24.884600>}
box{<0,0,-0.304800><2.029300,0.035000,0.304800> rotate<0,90.000000,0> translate<27.849900,-1.535000,24.884600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.849900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.850000,-1.535000,23.164800>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<27.849900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.849900,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.850000,-1.535000,23.774400>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<27.849900,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.849900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.850000,-1.535000,24.384000>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<27.849900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.850000,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.043300,-1.535000,22.388600>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,67.496957,0> translate<27.850000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.850000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.850000,-1.535000,22.855300>}
box{<0,0,-0.304800><2.029300,0.035000,0.304800> rotate<0,-90.000000,0> translate<27.850000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.850000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.043300,-1.535000,25.351300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-67.496957,0> translate<27.850000,-1.535000,24.884600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.870200,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.819700,-1.535000,14.020800>}
box{<0,0,-0.304800><3.949500,0.035000,0.304800> rotate<0,0.000000,0> translate<27.870200,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.919900,-1.535000,1.727200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.588200,-1.535000,1.727200>}
box{<0,0,-0.304800><3.668300,0.035000,0.304800> rotate<0,0.000000,0> translate<27.919900,-1.535000,1.727200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<27.946600,-1.535000,14.097200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.101700,-1.535000,14.097200>}
box{<0,0,-0.304800><0.155100,0.035000,0.304800> rotate<0,0.000000,0> translate<27.946600,-1.535000,14.097200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.022500,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.397200,-1.535000,20.116800>}
box{<0,0,-0.304800><0.374700,0.035000,0.304800> rotate<0,0.000000,0> translate<28.022500,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.043300,-1.535000,22.388600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.397200,-1.535000,22.034700>}
box{<0,0,-0.304800><0.500490,0.035000,0.304800> rotate<0,44.997030,0> translate<28.043300,-1.535000,22.388600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.043300,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.279300,-1.535000,25.587200>}
box{<0,0,-0.304800><0.333684,0.035000,0.304800> rotate<0,-44.984889,0> translate<28.043300,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.101700,-1.535000,14.097200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.400400,-1.535000,14.220900>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,-22.494325,0> translate<28.101700,-1.535000,14.097200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.397200,-1.535000,22.034700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.397200,-1.535000,19.742100>}
box{<0,0,-0.304800><2.292600,0.035000,0.304800> rotate<0,-90.000000,0> translate<28.397200,-1.535000,19.742100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.400400,-1.535000,14.220900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.629000,-1.535000,14.449500>}
box{<0,0,-0.304800><0.323289,0.035000,0.304800> rotate<0,-44.997030,0> translate<28.400400,-1.535000,14.220900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.629000,-1.535000,14.449500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.752700,-1.535000,14.748200>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,-67.499735,0> translate<28.629000,-1.535000,14.449500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.703900,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.210100,-1.535000,14.630400>}
box{<0,0,-0.304800><2.506200,0.035000,0.304800> rotate<0,0.000000,0> translate<28.703900,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.752700,-1.535000,14.748200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.752700,-1.535000,15.078200>}
box{<0,0,-0.304800><0.330000,0.035000,0.304800> rotate<0,90.000000,0> translate<28.752700,-1.535000,15.078200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.752700,-1.535000,15.078200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.752700,-1.535000,17.087800>}
box{<0,0,-0.304800><2.009600,0.035000,0.304800> rotate<0,90.000000,0> translate<28.752700,-1.535000,17.087800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.752700,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.600500,-1.535000,15.240000>}
box{<0,0,-0.304800><1.847800,0.035000,0.304800> rotate<0,0.000000,0> translate<28.752700,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.752700,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.990900,-1.535000,15.849600>}
box{<0,0,-0.304800><1.238200,0.035000,0.304800> rotate<0,0.000000,0> translate<28.752700,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.752700,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.381300,-1.535000,16.459200>}
box{<0,0,-0.304800><0.628600,0.035000,0.304800> rotate<0,0.000000,0> translate<28.752700,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.752700,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.771700,-1.535000,17.068800>}
box{<0,0,-0.304800><0.019000,0.035000,0.304800> rotate<0,0.000000,0> translate<28.752700,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<28.752700,-1.535000,17.087800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.666600,-1.535000,12.173900>}
box{<0,0,-0.304800><6.949304,0.035000,0.304800> rotate<0,44.997030,0> translate<28.752700,-1.535000,17.087800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.960600,-1.535000,25.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.196600,-1.535000,25.351300>}
box{<0,0,-0.304800><0.333684,0.035000,0.304800> rotate<0,44.984889,0> translate<29.960600,-1.535000,25.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<29.960600,-1.535000,25.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.819300,-1.535000,25.587200>}
box{<0,0,-0.304800><0.858700,0.035000,0.304800> rotate<0,0.000000,0> translate<29.960600,-1.535000,25.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.022700,-1.535000,18.116600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.022700,-1.535000,22.214700>}
box{<0,0,-0.304800><4.098100,0.035000,0.304800> rotate<0,90.000000,0> translate<30.022700,-1.535000,22.214700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.022700,-1.535000,18.116600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.024800,-1.535000,14.114500>}
box{<0,0,-0.304800><5.659824,0.035000,0.304800> rotate<0,44.997030,0> translate<30.022700,-1.535000,18.116600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.022700,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.000900,-1.535000,18.288000>}
box{<0,0,-0.304800><3.978200,0.035000,0.304800> rotate<0,0.000000,0> translate<30.022700,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.022700,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.060000,-1.535000,18.897600>}
box{<0,0,-0.304800><3.037300,0.035000,0.304800> rotate<0,0.000000,0> translate<30.022700,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.022700,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.683200,-1.535000,19.507200>}
box{<0,0,-0.304800><2.660500,0.035000,0.304800> rotate<0,0.000000,0> translate<30.022700,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.022700,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.073600,-1.535000,20.116800>}
box{<0,0,-0.304800><2.050900,0.035000,0.304800> rotate<0,0.000000,0> translate<30.022700,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.022700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.464000,-1.535000,20.726400>}
box{<0,0,-0.304800><1.441300,0.035000,0.304800> rotate<0,0.000000,0> translate<30.022700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.022700,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.975300,-1.535000,21.336000>}
box{<0,0,-0.304800><0.952600,0.035000,0.304800> rotate<0,0.000000,0> translate<30.022700,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.022700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.937200,-1.535000,21.945600>}
box{<0,0,-0.304800><0.914500,0.035000,0.304800> rotate<0,0.000000,0> translate<30.022700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.022700,-1.535000,22.214700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.196600,-1.535000,22.388600>}
box{<0,0,-0.304800><0.245932,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.022700,-1.535000,22.214700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.143200,-1.535000,4.622700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,8.041400>}
box{<0,0,-0.304800><4.834772,0.035000,0.304800> rotate<0,-44.997030,0> translate<30.143200,-1.535000,4.622700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.143200,-1.535000,7.162700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,10.581300>}
box{<0,0,-0.304800><4.834701,0.035000,0.304800> rotate<0,-44.996192,0> translate<30.143200,-1.535000,7.162700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.196600,-1.535000,22.388600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.389900,-1.535000,22.855300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-67.496957,0> translate<30.196600,-1.535000,22.388600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.196600,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.389900,-1.535000,24.884600>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,67.496957,0> translate<30.196600,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.265600,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.514200,-1.535000,22.555200>}
box{<0,0,-0.304800><0.248600,0.035000,0.304800> rotate<0,0.000000,0> translate<30.265600,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.318200,-1.535000,5.537200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.641700,-1.535000,5.537200>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,0.000000,0> translate<30.318200,-1.535000,5.537200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.344800,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.435200,-1.535000,24.993600>}
box{<0,0,-0.304800><0.090400,0.035000,0.304800> rotate<0,0.000000,0> translate<30.344800,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.389900,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.389900,-1.535000,24.884600>}
box{<0,0,-0.304800><2.029300,0.035000,0.304800> rotate<0,90.000000,0> translate<30.389900,-1.535000,24.884600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.389900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.390000,-1.535000,23.164800>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<30.389900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.389900,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.390000,-1.535000,23.774400>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<30.389900,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.389900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.390000,-1.535000,24.384000>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<30.389900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.390000,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.583300,-1.535000,22.388600>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,67.496957,0> translate<30.390000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.390000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.390000,-1.535000,22.855300>}
box{<0,0,-0.304800><2.029300,0.035000,0.304800> rotate<0,-90.000000,0> translate<30.390000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.390000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.583300,-1.535000,25.351300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-67.496957,0> translate<30.390000,-1.535000,24.884600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.460900,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.052000,-1.535000,17.678400>}
box{<0,0,-0.304800><6.591100,0.035000,0.304800> rotate<0,0.000000,0> translate<30.460900,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.583300,-1.535000,22.388600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.937200,-1.535000,22.034700>}
box{<0,0,-0.304800><0.500490,0.035000,0.304800> rotate<0,44.997030,0> translate<30.583300,-1.535000,22.388600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.583300,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.819300,-1.535000,25.587200>}
box{<0,0,-0.304800><0.333684,0.035000,0.304800> rotate<0,-44.984889,0> translate<30.583300,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.641700,-1.535000,5.537200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.940400,-1.535000,5.660900>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,-22.494325,0> translate<30.641700,-1.535000,5.537200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.937200,-1.535000,21.428200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.060900,-1.535000,21.129500>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,67.499735,0> translate<30.937200,-1.535000,21.428200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.937200,-1.535000,22.034700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.937200,-1.535000,21.428200>}
box{<0,0,-0.304800><0.606500,0.035000,0.304800> rotate<0,-90.000000,0> translate<30.937200,-1.535000,21.428200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.940400,-1.535000,5.660900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,8.282500>}
box{<0,0,-0.304800><3.707432,0.035000,0.304800> rotate<0,-44.998123,0> translate<30.940400,-1.535000,5.660900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.060900,-1.535000,21.129500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.289500,-1.535000,20.900900>}
box{<0,0,-0.304800><0.323289,0.035000,0.304800> rotate<0,44.997030,0> translate<31.060900,-1.535000,21.129500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.070500,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.661600,-1.535000,17.068800>}
box{<0,0,-0.304800><6.591100,0.035000,0.304800> rotate<0,0.000000,0> translate<31.070500,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.172100,-1.535000,3.352700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.413200,-1.535000,3.352700>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,0.000000,0> translate<31.172100,-1.535000,3.352700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.172100,-1.535000,3.352700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,5.742500>}
box{<0,0,-0.304800><3.379688,0.035000,0.304800> rotate<0,-44.997030,0> translate<31.172100,-1.535000,3.352700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.289500,-1.535000,20.900900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.801600,-1.535000,19.388800>}
box{<0,0,-0.304800><2.138432,0.035000,0.304800> rotate<0,44.997030,0> translate<31.289500,-1.535000,20.900900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.375400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.616500,-1.535000,6.096000>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,0.000000,0> translate<31.375400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.413200,-1.535000,3.352700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,5.501400>}
box{<0,0,-0.304800><3.038721,0.035000,0.304800> rotate<0,-44.997030,0> translate<31.413200,-1.535000,3.352700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.477000,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.718100,-1.535000,3.657600>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,0.000000,0> translate<31.477000,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.588200,-1.535000,1.727200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.911700,-1.535000,1.727200>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,0.000000,0> translate<31.588200,-1.535000,1.727200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.680100,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.271200,-1.535000,16.459200>}
box{<0,0,-0.304800><6.591100,0.035000,0.304800> rotate<0,0.000000,0> translate<31.680100,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.911700,-1.535000,1.727200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.210400,-1.535000,1.850900>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,-22.494325,0> translate<31.911700,-1.535000,1.727200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<31.985000,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.226100,-1.535000,6.705600>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,0.000000,0> translate<31.985000,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.086600,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.327700,-1.535000,4.267200>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,0.000000,0> translate<32.086600,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.157000,-1.535000,1.828800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,1.828800>}
box{<0,0,-0.304800><15.322200,0.035000,0.304800> rotate<0,0.000000,0> translate<32.157000,-1.535000,1.828800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.210400,-1.535000,1.850900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.541400,-1.535000,4.181900>}
box{<0,0,-0.304800><3.296532,0.035000,0.304800> rotate<0,-44.997030,0> translate<32.210400,-1.535000,1.850900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.289700,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.880800,-1.535000,15.849600>}
box{<0,0,-0.304800><6.591100,0.035000,0.304800> rotate<0,0.000000,0> translate<32.289700,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.500600,-1.535000,25.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.736600,-1.535000,25.351300>}
box{<0,0,-0.304800><0.333684,0.035000,0.304800> rotate<0,44.984889,0> translate<32.500600,-1.535000,25.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.500600,-1.535000,25.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.359300,-1.535000,25.587200>}
box{<0,0,-0.304800><0.858700,0.035000,0.304800> rotate<0,0.000000,0> translate<32.500600,-1.535000,25.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.562700,-1.535000,21.926700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.562700,-1.535000,22.214700>}
box{<0,0,-0.304800><0.288000,0.035000,0.304800> rotate<0,90.000000,0> translate<32.562700,-1.535000,22.214700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.562700,-1.535000,21.926700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.681100,-1.535000,20.808300>}
box{<0,0,-0.304800><1.581656,0.035000,0.304800> rotate<0,44.997030,0> translate<32.562700,-1.535000,21.926700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.562700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.477200,-1.535000,21.945600>}
box{<0,0,-0.304800><0.914500,0.035000,0.304800> rotate<0,0.000000,0> translate<32.562700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.562700,-1.535000,22.214700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.736600,-1.535000,22.388600>}
box{<0,0,-0.304800><0.245932,0.035000,0.304800> rotate<0,-44.997030,0> translate<32.562700,-1.535000,22.214700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.594600,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.835700,-1.535000,7.315200>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,0.000000,0> translate<32.594600,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.696200,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.937300,-1.535000,4.876800>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,0.000000,0> translate<32.696200,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.736600,-1.535000,22.388600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.929900,-1.535000,22.855300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-67.496957,0> translate<32.736600,-1.535000,22.388600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.736600,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.929900,-1.535000,24.884600>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,67.496957,0> translate<32.736600,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.797900,-1.535000,2.438400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,2.438400>}
box{<0,0,-0.304800><14.681300,0.035000,0.304800> rotate<0,0.000000,0> translate<32.797900,-1.535000,2.438400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.801600,-1.535000,19.156000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.486000,-1.535000,18.471600>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,44.997030,0> translate<32.801600,-1.535000,19.156000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.801600,-1.535000,19.388800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.801600,-1.535000,19.156000>}
box{<0,0,-0.304800><0.232800,0.035000,0.304800> rotate<0,-90.000000,0> translate<32.801600,-1.535000,19.156000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.805600,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.054200,-1.535000,22.555200>}
box{<0,0,-0.304800><0.248600,0.035000,0.304800> rotate<0,0.000000,0> translate<32.805600,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.884800,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.975200,-1.535000,24.993600>}
box{<0,0,-0.304800><0.090400,0.035000,0.304800> rotate<0,0.000000,0> translate<32.884800,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.899300,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.490400,-1.535000,15.240000>}
box{<0,0,-0.304800><6.591100,0.035000,0.304800> rotate<0,0.000000,0> translate<32.899300,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.929900,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.929900,-1.535000,24.884600>}
box{<0,0,-0.304800><2.029300,0.035000,0.304800> rotate<0,90.000000,0> translate<32.929900,-1.535000,24.884600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.929900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.930000,-1.535000,23.164800>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<32.929900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.929900,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.930000,-1.535000,23.774400>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<32.929900,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.929900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.930000,-1.535000,24.384000>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<32.929900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.930000,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.123300,-1.535000,22.388600>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,67.496957,0> translate<32.930000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.930000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.930000,-1.535000,22.855300>}
box{<0,0,-0.304800><2.029300,0.035000,0.304800> rotate<0,-90.000000,0> translate<32.930000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<32.930000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.123300,-1.535000,25.351300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-67.496957,0> translate<32.930000,-1.535000,24.884600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.123300,-1.535000,22.388600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.477200,-1.535000,22.034700>}
box{<0,0,-0.304800><0.500490,0.035000,0.304800> rotate<0,44.997030,0> translate<33.123300,-1.535000,22.388600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.123300,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.359300,-1.535000,25.587200>}
box{<0,0,-0.304800><0.333684,0.035000,0.304800> rotate<0,-44.984889,0> translate<33.123300,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.153400,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.515300,-1.535000,21.336000>}
box{<0,0,-0.304800><0.361900,0.035000,0.304800> rotate<0,0.000000,0> translate<33.153400,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.204200,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.445300,-1.535000,7.924800>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,0.000000,0> translate<33.204200,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.305800,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.546900,-1.535000,5.486400>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,0.000000,0> translate<33.305800,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.407500,-1.535000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,3.048000>}
box{<0,0,-0.304800><14.071700,0.035000,0.304800> rotate<0,0.000000,0> translate<33.407500,-1.535000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.477200,-1.535000,21.428200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.600900,-1.535000,21.129500>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,67.499735,0> translate<33.477200,-1.535000,21.428200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.477200,-1.535000,21.751700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.477200,-1.535000,21.428200>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,-90.000000,0> translate<33.477200,-1.535000,21.428200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.477200,-1.535000,22.034700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.477200,-1.535000,21.751700>}
box{<0,0,-0.304800><0.283000,0.035000,0.304800> rotate<0,-90.000000,0> translate<33.477200,-1.535000,21.751700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.486000,-1.535000,18.471600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.712700,-1.535000,18.471600>}
box{<0,0,-0.304800><0.226700,0.035000,0.304800> rotate<0,0.000000,0> translate<33.486000,-1.535000,18.471600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.508900,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,14.630400>}
box{<0,0,-0.304800><6.318300,0.035000,0.304800> rotate<0,0.000000,0> translate<33.508900,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,5.742500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,5.501400>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,-90.000000,0> translate<33.561900,-1.535000,5.501400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,8.282500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,8.041400>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,-90.000000,0> translate<33.561900,-1.535000,8.041400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,11.111700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,10.581300>}
box{<0,0,-0.304800><0.530400,0.035000,0.304800> rotate<0,-90.000000,0> translate<33.561900,-1.535000,10.581300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.561900,-1.535000,11.111700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290200,-1.535000,11.840000>}
box{<0,0,-0.304800><1.029972,0.035000,0.304800> rotate<0,-44.997030,0> translate<33.561900,-1.535000,11.111700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.600900,-1.535000,21.129500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.922200,-1.535000,20.808300>}
box{<0,0,-0.304800><0.454316,0.035000,0.304800> rotate<0,44.988113,0> translate<33.600900,-1.535000,21.129500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.666600,-1.535000,12.173900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.719600,-1.535000,12.098800>}
box{<0,0,-0.304800><0.091918,0.035000,0.304800> rotate<0,54.784782,0> translate<33.666600,-1.535000,12.173900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.681100,-1.535000,20.808300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.922200,-1.535000,20.808300>}
box{<0,0,-0.304800><0.241100,0.035000,0.304800> rotate<0,0.000000,0> translate<33.681100,-1.535000,20.808300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.712700,-1.535000,18.471600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.744800,-1.535000,18.445600>}
box{<0,0,-0.304800><0.041309,0.035000,0.304800> rotate<0,39.003820,0> translate<33.712700,-1.535000,18.471600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.719600,-1.535000,12.098800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.779300,-1.535000,12.061200>}
box{<0,0,-0.304800><0.070554,0.035000,0.304800> rotate<0,32.201244,0> translate<33.719600,-1.535000,12.098800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.744800,-1.535000,18.445600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.829500,-1.535000,18.360900>}
box{<0,0,-0.304800><0.119784,0.035000,0.304800> rotate<0,44.997030,0> translate<33.744800,-1.535000,18.445600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.779300,-1.535000,12.061200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.829500,-1.535000,12.010900>}
box{<0,0,-0.304800><0.071064,0.035000,0.304800> rotate<0,45.054037,0> translate<33.779300,-1.535000,12.061200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.829500,-1.535000,12.010900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.915100,-1.535000,11.975500>}
box{<0,0,-0.304800><0.092631,0.035000,0.304800> rotate<0,22.466127,0> translate<33.829500,-1.535000,12.010900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.829500,-1.535000,18.360900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.870200,-1.535000,18.344100>}
box{<0,0,-0.304800><0.044031,0.035000,0.304800> rotate<0,22.428200,0> translate<33.829500,-1.535000,18.360900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.870200,-1.535000,18.344100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.903800,-1.535000,18.316800>}
box{<0,0,-0.304800><0.043293,0.035000,0.304800> rotate<0,39.091279,0> translate<33.870200,-1.535000,18.344100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.903800,-1.535000,18.316800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.017500,-1.535000,18.283100>}
box{<0,0,-0.304800><0.118589,0.035000,0.304800> rotate<0,16.508419,0> translate<33.903800,-1.535000,18.316800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.915100,-1.535000,11.975500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.993000,-1.535000,11.926300>}
box{<0,0,-0.304800><0.092136,0.035000,0.304800> rotate<0,32.273514,0> translate<33.915100,-1.535000,11.975500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<33.993000,-1.535000,11.926300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.062700,-1.535000,11.914400>}
box{<0,0,-0.304800><0.070709,0.035000,0.304800> rotate<0,9.688147,0> translate<33.993000,-1.535000,11.926300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.017100,-1.535000,3.657600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,3.657600>}
box{<0,0,-0.304800><13.462100,0.035000,0.304800> rotate<0,0.000000,0> translate<34.017100,-1.535000,3.657600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.017500,-1.535000,18.283100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.128200,-1.535000,18.237200>}
box{<0,0,-0.304800><0.119839,0.035000,0.304800> rotate<0,22.519079,0> translate<34.017500,-1.535000,18.283100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.024800,-1.535000,14.114500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.328200,-1.535000,14.418000>}
box{<0,0,-0.304800><0.429143,0.035000,0.304800> rotate<0,-45.006470,0> translate<34.024800,-1.535000,14.114500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.062700,-1.535000,11.914400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.128200,-1.535000,11.887200>}
box{<0,0,-0.304800><0.070923,0.035000,0.304800> rotate<0,22.550019,0> translate<34.062700,-1.535000,11.914400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.128200,-1.535000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.220800,-1.535000,11.887200>}
box{<0,0,-0.304800><0.092600,0.035000,0.304800> rotate<0,0.000000,0> translate<34.128200,-1.535000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.128200,-1.535000,18.237200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.172000,-1.535000,18.237200>}
box{<0,0,-0.304800><0.043800,0.035000,0.304800> rotate<0,0.000000,0> translate<34.128200,-1.535000,18.237200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.172000,-1.535000,18.237200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.213700,-1.535000,18.224800>}
box{<0,0,-0.304800><0.043505,0.035000,0.304800> rotate<0,16.559390,0> translate<34.172000,-1.535000,18.237200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.213700,-1.535000,18.224800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.332500,-1.535000,18.237200>}
box{<0,0,-0.304800><0.119445,0.035000,0.304800> rotate<0,-5.958397,0> translate<34.213700,-1.535000,18.224800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.220800,-1.535000,11.887200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.247500,-1.535000,11.882700>}
box{<0,0,-0.304800><0.027077,0.035000,0.304800> rotate<0,9.566055,0> translate<34.220800,-1.535000,11.887200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.247500,-1.535000,11.882700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.290200,-1.535000,11.840000>}
box{<0,0,-0.304800><0.060387,0.035000,0.304800> rotate<0,44.997030,0> translate<34.247500,-1.535000,11.882700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.328200,-1.535000,14.418000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.411700,-1.535000,14.418000>}
box{<0,0,-0.304800><1.083500,0.035000,0.304800> rotate<0,0.000000,0> translate<34.328200,-1.535000,14.418000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.332500,-1.535000,18.237200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.451700,-1.535000,18.237200>}
box{<0,0,-0.304800><0.119200,0.035000,0.304800> rotate<0,0.000000,0> translate<34.332500,-1.535000,18.237200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.451700,-1.535000,18.237200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.491900,-1.535000,18.253900>}
box{<0,0,-0.304800><0.043531,0.035000,0.304800> rotate<0,-22.557628,0> translate<34.451700,-1.535000,18.237200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.491900,-1.535000,18.253900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.535400,-1.535000,18.258400>}
box{<0,0,-0.304800><0.043732,0.035000,0.304800> rotate<0,-5.905751,0> translate<34.491900,-1.535000,18.253900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.535400,-1.535000,18.258400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.640200,-1.535000,18.315300>}
box{<0,0,-0.304800><0.119250,0.035000,0.304800> rotate<0,-28.497377,0> translate<34.535400,-1.535000,18.258400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.541400,-1.535000,4.181900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.411700,-1.535000,4.181900>}
box{<0,0,-0.304800><0.870300,0.035000,0.304800> rotate<0,0.000000,0> translate<34.541400,-1.535000,4.181900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.589900,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.442400,-1.535000,18.288000>}
box{<0,0,-0.304800><1.852500,0.035000,0.304800> rotate<0,0.000000,0> translate<34.589900,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.640200,-1.535000,18.315300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.750400,-1.535000,18.360900>}
box{<0,0,-0.304800><0.119262,0.035000,0.304800> rotate<0,-22.477951,0> translate<34.640200,-1.535000,18.315300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.750400,-1.535000,18.360900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.781300,-1.535000,18.391900>}
box{<0,0,-0.304800><0.043770,0.035000,0.304800> rotate<0,-45.089586,0> translate<34.750400,-1.535000,18.360900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.781300,-1.535000,18.391900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.819600,-1.535000,18.412600>}
box{<0,0,-0.304800><0.043536,0.035000,0.304800> rotate<0,-28.388017,0> translate<34.781300,-1.535000,18.391900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.819600,-1.535000,18.412600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.894300,-1.535000,18.504800>}
box{<0,0,-0.304800><0.118663,0.035000,0.304800> rotate<0,-50.982409,0> translate<34.819600,-1.535000,18.412600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.894300,-1.535000,18.504800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.979000,-1.535000,18.589500>}
box{<0,0,-0.304800><0.119784,0.035000,0.304800> rotate<0,-44.997030,0> translate<34.894300,-1.535000,18.504800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.979000,-1.535000,18.589500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.995800,-1.535000,18.630200>}
box{<0,0,-0.304800><0.044031,0.035000,0.304800> rotate<0,-67.565860,0> translate<34.979000,-1.535000,18.589500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.995800,-1.535000,18.630200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.023100,-1.535000,18.663800>}
box{<0,0,-0.304800><0.043293,0.035000,0.304800> rotate<0,-50.902782,0> translate<34.995800,-1.535000,18.630200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.023100,-1.535000,18.663800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.056800,-1.535000,18.777500>}
box{<0,0,-0.304800><0.118589,0.035000,0.304800> rotate<0,-73.485641,0> translate<35.023100,-1.535000,18.663800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.040600,-1.535000,25.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.276600,-1.535000,25.351300>}
box{<0,0,-0.304800><0.333684,0.035000,0.304800> rotate<0,44.984889,0> translate<35.040600,-1.535000,25.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.040600,-1.535000,25.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.899300,-1.535000,25.587200>}
box{<0,0,-0.304800><0.858700,0.035000,0.304800> rotate<0,0.000000,0> translate<35.040600,-1.535000,25.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.056800,-1.535000,18.777500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,18.888200>}
box{<0,0,-0.304800><0.119839,0.035000,0.304800> rotate<0,-67.474981,0> translate<35.056800,-1.535000,18.777500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,18.888200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,18.932000>}
box{<0,0,-0.304800><0.043800,0.035000,0.304800> rotate<0,90.000000,0> translate<35.102700,-1.535000,18.932000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.832800,-1.535000,18.897600>}
box{<0,0,-0.304800><0.730100,0.035000,0.304800> rotate<0,0.000000,0> translate<35.102700,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,18.932000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.115100,-1.535000,18.973700>}
box{<0,0,-0.304800><0.043505,0.035000,0.304800> rotate<0,-73.434670,0> translate<35.102700,-1.535000,18.932000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,19.092500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,19.120500>}
box{<0,0,-0.304800><0.028000,0.035000,0.304800> rotate<0,90.000000,0> translate<35.102700,-1.535000,19.120500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,19.092500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.115100,-1.535000,18.973700>}
box{<0,0,-0.304800><0.119445,0.035000,0.304800> rotate<0,84.035663,0> translate<35.102700,-1.535000,19.092500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,19.120500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.138300,-1.535000,19.156000>}
box{<0,0,-0.304800><0.050275,0.035000,0.304800> rotate<0,-44.916451,0> translate<35.102700,-1.535000,19.120500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,21.926700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,22.214700>}
box{<0,0,-0.304800><0.288000,0.035000,0.304800> rotate<0,90.000000,0> translate<35.102700,-1.535000,22.214700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,21.926700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.587200,-1.535000,19.442100>}
box{<0,0,-0.304800><3.513684,0.035000,0.304800> rotate<0,44.998183,0> translate<35.102700,-1.535000,21.926700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.227500,-1.535000,21.945600>}
box{<0,0,-0.304800><1.124800,0.035000,0.304800> rotate<0,0.000000,0> translate<35.102700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.102700,-1.535000,22.214700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.276600,-1.535000,22.388600>}
box{<0,0,-0.304800><0.245932,0.035000,0.304800> rotate<0,-44.997030,0> translate<35.102700,-1.535000,22.214700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.138300,-1.535000,19.156000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.138300,-1.535000,19.592200>}
box{<0,0,-0.304800><0.436200,0.035000,0.304800> rotate<0,90.000000,0> translate<35.138300,-1.535000,19.592200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.138300,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.223200,-1.535000,19.507200>}
box{<0,0,-0.304800><0.084900,0.035000,0.304800> rotate<0,0.000000,0> translate<35.138300,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.138300,-1.535000,19.592200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,14.903200>}
box{<0,0,-0.304800><6.631177,0.035000,0.304800> rotate<0,44.997641,0> translate<35.138300,-1.535000,19.592200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.276600,-1.535000,22.388600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.469900,-1.535000,22.855300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-67.496957,0> translate<35.276600,-1.535000,22.388600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.276600,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.469900,-1.535000,24.884600>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,67.496957,0> translate<35.276600,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.345600,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.594200,-1.535000,22.555200>}
box{<0,0,-0.304800><0.248600,0.035000,0.304800> rotate<0,0.000000,0> translate<35.345600,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.411700,-1.535000,4.181900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,4.948200>}
box{<0,0,-0.304800><1.083712,0.035000,0.304800> rotate<0,-44.997030,0> translate<35.411700,-1.535000,4.181900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.411700,-1.535000,14.418000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,13.651700>}
box{<0,0,-0.304800><1.083712,0.035000,0.304800> rotate<0,44.997030,0> translate<35.411700,-1.535000,14.418000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.424800,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.515200,-1.535000,24.993600>}
box{<0,0,-0.304800><0.090400,0.035000,0.304800> rotate<0,0.000000,0> translate<35.424800,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.449700,-1.535000,6.760000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,6.031700>}
box{<0,0,-0.304800><1.029972,0.035000,0.304800> rotate<0,44.997030,0> translate<35.449700,-1.535000,6.760000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.449700,-1.535000,6.760000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,7.488200>}
box{<0,0,-0.304800><1.029901,0.035000,0.304800> rotate<0,-44.993097,0> translate<35.449700,-1.535000,6.760000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.449700,-1.535000,9.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,8.571700>}
box{<0,0,-0.304800><1.029972,0.035000,0.304800> rotate<0,44.997030,0> translate<35.449700,-1.535000,9.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.449700,-1.535000,9.300000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,10.028200>}
box{<0,0,-0.304800><1.029901,0.035000,0.304800> rotate<0,-44.993097,0> translate<35.449700,-1.535000,9.300000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.449700,-1.535000,11.840000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,11.111700>}
box{<0,0,-0.304800><1.029972,0.035000,0.304800> rotate<0,44.997030,0> translate<35.449700,-1.535000,11.840000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.449700,-1.535000,11.840000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,12.568200>}
box{<0,0,-0.304800><1.029901,0.035000,0.304800> rotate<0,-44.993097,0> translate<35.449700,-1.535000,11.840000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.469900,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.469900,-1.535000,24.884600>}
box{<0,0,-0.304800><2.029300,0.035000,0.304800> rotate<0,90.000000,0> translate<35.469900,-1.535000,24.884600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.469900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.470000,-1.535000,23.164800>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<35.469900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.469900,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.470000,-1.535000,23.774400>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<35.469900,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.469900,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.470000,-1.535000,24.384000>}
box{<0,0,-0.304800><0.000100,0.035000,0.304800> rotate<0,0.000000,0> translate<35.469900,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.470000,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.663300,-1.535000,22.388600>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,67.496957,0> translate<35.470000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.470000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.470000,-1.535000,22.855300>}
box{<0,0,-0.304800><2.029300,0.035000,0.304800> rotate<0,-90.000000,0> translate<35.470000,-1.535000,22.855300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.470000,-1.535000,24.884600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.663300,-1.535000,25.351300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-67.496957,0> translate<35.470000,-1.535000,24.884600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.497000,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.862900,-1.535000,4.267200>}
box{<0,0,-0.304800><6.365900,0.035000,0.304800> rotate<0,0.000000,0> translate<35.497000,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.504100,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.855900,-1.535000,6.705600>}
box{<0,0,-0.304800><6.351800,0.035000,0.304800> rotate<0,0.000000,0> translate<35.504100,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.605700,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,9.144000>}
box{<0,0,-0.304800><4.221500,0.035000,0.304800> rotate<0,0.000000,0> translate<35.605700,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.663300,-1.535000,22.388600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.020600,-1.535000,22.031300>}
box{<0,0,-0.304800><0.505299,0.035000,0.304800> rotate<0,44.997030,0> translate<35.663300,-1.535000,22.388600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.663300,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.899300,-1.535000,25.587200>}
box{<0,0,-0.304800><0.333684,0.035000,0.304800> rotate<0,-44.984889,0> translate<35.663300,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.693400,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.587200,-1.535000,21.336000>}
box{<0,0,-0.304800><1.893800,0.035000,0.304800> rotate<0,0.000000,0> translate<35.693400,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.707300,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,11.582400>}
box{<0,0,-0.304800><4.119900,0.035000,0.304800> rotate<0,0.000000,0> translate<35.707300,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.801700,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,12.192000>}
box{<0,0,-0.304800><4.025500,0.035000,0.304800> rotate<0,0.000000,0> translate<35.801700,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.808900,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,14.020800>}
box{<0,0,-0.304800><4.018300,0.035000,0.304800> rotate<0,0.000000,0> translate<35.808900,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<35.903300,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,9.753600>}
box{<0,0,-0.304800><3.923900,0.035000,0.304800> rotate<0,0.000000,0> translate<35.903300,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.004900,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.065200,-1.535000,7.315200>}
box{<0,0,-0.304800><5.060300,0.035000,0.304800> rotate<0,0.000000,0> translate<36.004900,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.020600,-1.535000,22.031300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.487300,-1.535000,21.838000>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,22.497104,0> translate<36.020600,-1.535000,22.031300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.106600,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.253300,-1.535000,4.876800>}
box{<0,0,-0.304800><5.146700,0.035000,0.304800> rotate<0,0.000000,0> translate<36.106600,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.113700,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.246300,-1.535000,6.096000>}
box{<0,0,-0.304800><5.132600,0.035000,0.304800> rotate<0,0.000000,0> translate<36.113700,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,4.948200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,6.031700>}
box{<0,0,-0.304800><1.083500,0.035000,0.304800> rotate<0,90.000000,0> translate<36.178000,-1.535000,6.031700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.181900,-1.535000,5.486400>}
box{<0,0,-0.304800><5.003900,0.035000,0.304800> rotate<0,0.000000,0> translate<36.178000,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,7.488200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,8.571700>}
box{<0,0,-0.304800><1.083500,0.035000,0.304800> rotate<0,90.000000,0> translate<36.178000,-1.535000,8.571700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.455600,-1.535000,7.924800>}
box{<0,0,-0.304800><4.277600,0.035000,0.304800> rotate<0,0.000000,0> translate<36.178000,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.907400,-1.535000,8.534400>}
box{<0,0,-0.304800><3.729400,0.035000,0.304800> rotate<0,0.000000,0> translate<36.178000,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,10.028200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,11.111700>}
box{<0,0,-0.304800><1.083500,0.035000,0.304800> rotate<0,90.000000,0> translate<36.178000,-1.535000,11.111700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,10.363200>}
box{<0,0,-0.304800><3.649200,0.035000,0.304800> rotate<0,0.000000,0> translate<36.178000,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,10.972800>}
box{<0,0,-0.304800><3.649200,0.035000,0.304800> rotate<0,0.000000,0> translate<36.178000,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,12.568200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,13.651700>}
box{<0,0,-0.304800><1.083500,0.035000,0.304800> rotate<0,90.000000,0> translate<36.178000,-1.535000,13.651700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,12.801600>}
box{<0,0,-0.304800><3.649200,0.035000,0.304800> rotate<0,0.000000,0> translate<36.178000,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.178000,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,13.411200>}
box{<0,0,-0.304800><3.649200,0.035000,0.304800> rotate<0,0.000000,0> translate<36.178000,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.303000,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.587200,-1.535000,20.726400>}
box{<0,0,-0.304800><1.284200,0.035000,0.304800> rotate<0,0.000000,0> translate<36.303000,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.487300,-1.535000,21.838000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.992600,-1.535000,21.838000>}
box{<0,0,-0.304800><0.505300,0.035000,0.304800> rotate<0,0.000000,0> translate<36.487300,-1.535000,21.838000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.912600,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.587200,-1.535000,20.116800>}
box{<0,0,-0.304800><0.674600,0.035000,0.304800> rotate<0,0.000000,0> translate<36.912600,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<36.992600,-1.535000,21.838000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.459300,-1.535000,22.031300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-22.497104,0> translate<36.992600,-1.535000,21.838000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.252300,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.663400,-1.535000,21.945600>}
box{<0,0,-0.304800><0.411100,0.035000,0.304800> rotate<0,0.000000,0> translate<37.252300,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.459300,-1.535000,22.031300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.816600,-1.535000,22.388600>}
box{<0,0,-0.304800><0.505299,0.035000,0.304800> rotate<0,-44.997030,0> translate<37.459300,-1.535000,22.031300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.522200,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.587200,-1.535000,19.507200>}
box{<0,0,-0.304800><0.065000,0.035000,0.304800> rotate<0,0.000000,0> translate<37.522200,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.580600,-1.535000,25.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.816600,-1.535000,25.351300>}
box{<0,0,-0.304800><0.333684,0.035000,0.304800> rotate<0,44.984889,0> translate<37.580600,-1.535000,25.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.580600,-1.535000,25.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.387200,-1.535000,25.587200>}
box{<0,0,-0.304800><4.806600,0.035000,0.304800> rotate<0,0.000000,0> translate<37.580600,-1.535000,25.587200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.587200,-1.535000,21.438200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.587200,-1.535000,19.442100>}
box{<0,0,-0.304800><1.996100,0.035000,0.304800> rotate<0,-90.000000,0> translate<37.587200,-1.535000,19.442100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.587200,-1.535000,21.761700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.587200,-1.535000,21.438200>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,-90.000000,0> translate<37.587200,-1.535000,21.438200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.587200,-1.535000,21.761700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.710900,-1.535000,22.060400>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,-67.499735,0> translate<37.587200,-1.535000,21.761700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.710900,-1.535000,22.060400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.939500,-1.535000,22.289000>}
box{<0,0,-0.304800><0.323289,0.035000,0.304800> rotate<0,-44.997030,0> translate<37.710900,-1.535000,22.060400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.816600,-1.535000,22.388600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.009900,-1.535000,22.855300>}
box{<0,0,-0.304800><0.505147,0.035000,0.304800> rotate<0,-67.496957,0> translate<37.816600,-1.535000,22.388600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.816600,-1.535000,25.351300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.985800,-1.535000,24.942700>}
box{<0,0,-0.304800><0.442247,0.035000,0.304800> rotate<0,67.501250,0> translate<37.816600,-1.535000,25.351300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.885600,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.387200,-1.535000,22.555200>}
box{<0,0,-0.304800><4.501600,0.035000,0.304800> rotate<0,0.000000,0> translate<37.885600,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.939500,-1.535000,22.289000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.238200,-1.535000,22.412700>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,-22.494325,0> translate<37.939500,-1.535000,22.289000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.964800,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.081400,-1.535000,24.993600>}
box{<0,0,-0.304800><1.116600,0.035000,0.304800> rotate<0,0.000000,0> translate<37.964800,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<37.985800,-1.535000,24.942700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.030500,-1.535000,24.942700>}
box{<0,0,-0.304800><1.044700,0.035000,0.304800> rotate<0,0.000000,0> translate<37.985800,-1.535000,24.942700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.009900,-1.535000,22.855300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.009900,-1.535000,23.317200>}
box{<0,0,-0.304800><0.461900,0.035000,0.304800> rotate<0,90.000000,0> translate<38.009900,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.009900,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.582800,-1.535000,23.164800>}
box{<0,0,-0.304800><0.572900,0.035000,0.304800> rotate<0,0.000000,0> translate<38.009900,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.009900,-1.535000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.430500,-1.535000,23.317200>}
box{<0,0,-0.304800><0.420600,0.035000,0.304800> rotate<0,0.000000,0> translate<38.009900,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.238200,-1.535000,22.412700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.387200,-1.535000,22.412700>}
box{<0,0,-0.304800><4.149000,0.035000,0.304800> rotate<0,0.000000,0> translate<38.238200,-1.535000,22.412700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.430500,-1.535000,23.317200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.086000,-1.535000,22.661600>}
box{<0,0,-0.304800><0.927088,0.035000,0.304800> rotate<0,45.001400,0> translate<38.430500,-1.535000,23.317200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.030500,-1.535000,24.942700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.086000,-1.535000,24.998300>}
box{<0,0,-0.304800><0.078560,0.035000,0.304800> rotate<0,-45.048598,0> translate<39.030500,-1.535000,24.942700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.086000,-1.535000,22.661600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.053900,-1.535000,22.661600>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<39.086000,-1.535000,22.661600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.086000,-1.535000,24.998300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.053900,-1.535000,24.998300>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<39.086000,-1.535000,24.998300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.212700,-1.535000,19.536700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.212700,-1.535000,20.787200>}
box{<0,0,-0.304800><1.250500,0.035000,0.304800> rotate<0,90.000000,0> translate<39.212700,-1.535000,20.787200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.212700,-1.535000,19.536700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.179000,-1.535000,15.570400>}
box{<0,0,-0.304800><5.609195,0.035000,0.304800> rotate<0,44.997030,0> translate<39.212700,-1.535000,19.536700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.212700,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.421600,-1.535000,20.116800>}
box{<0,0,-0.304800><1.208900,0.035000,0.304800> rotate<0,0.000000,0> translate<39.212700,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.212700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.024200,-1.535000,20.726400>}
box{<0,0,-0.304800><1.811500,0.035000,0.304800> rotate<0,0.000000,0> translate<39.212700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.212700,-1.535000,20.787200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.085000,-1.535000,20.787200>}
box{<0,0,-0.304800><1.872300,0.035000,0.304800> rotate<0,0.000000,0> translate<39.212700,-1.535000,20.787200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.242200,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.421600,-1.535000,19.507200>}
box{<0,0,-0.304800><1.179400,0.035000,0.304800> rotate<0,0.000000,0> translate<39.242200,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,8.728200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.950900,-1.535000,8.429500>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,67.499735,0> translate<39.827200,-1.535000,8.728200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,9.051700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,8.728200>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,-90.000000,0> translate<39.827200,-1.535000,8.728200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,14.903200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.827200,-1.535000,9.051700>}
box{<0,0,-0.304800><5.851500,0.035000,0.304800> rotate<0,-90.000000,0> translate<39.827200,-1.535000,9.051700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.851800,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.680000,-1.535000,18.897600>}
box{<0,0,-0.304800><0.828200,0.035000,0.304800> rotate<0,0.000000,0> translate<39.851800,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<39.950900,-1.535000,8.429500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.286600,-1.535000,7.093900>}
box{<0,0,-0.304800><1.888894,0.035000,0.304800> rotate<0,44.994885,0> translate<39.950900,-1.535000,8.429500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.053900,-1.535000,22.661600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.738300,-1.535000,23.346000>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,-44.997030,0> translate<40.053900,-1.535000,22.661600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.053900,-1.535000,24.998300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.738300,-1.535000,24.313900>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,44.997030,0> translate<40.053900,-1.535000,24.998300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.058600,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.387200,-1.535000,24.993600>}
box{<0,0,-0.304800><2.328600,0.035000,0.304800> rotate<0,0.000000,0> translate<40.058600,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.421600,-1.535000,19.156000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.106000,-1.535000,18.471600>}
box{<0,0,-0.304800><0.967888,0.035000,0.304800> rotate<0,44.997030,0> translate<40.421600,-1.535000,19.156000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.421600,-1.535000,20.123900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.421600,-1.535000,19.156000>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,-90.000000,0> translate<40.421600,-1.535000,19.156000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.421600,-1.535000,20.123900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.085000,-1.535000,20.787200>}
box{<0,0,-0.304800><0.938119,0.035000,0.304800> rotate<0,-44.992712,0> translate<40.421600,-1.535000,20.123900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.461400,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.865800,-1.535000,18.288000>}
box{<0,0,-0.304800><3.404400,0.035000,0.304800> rotate<0,0.000000,0> translate<40.461400,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.557100,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.387200,-1.535000,23.164800>}
box{<0,0,-0.304800><1.830100,0.035000,0.304800> rotate<0,0.000000,0> translate<40.557100,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.668200,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.387200,-1.535000,24.384000>}
box{<0,0,-0.304800><1.719000,0.035000,0.304800> rotate<0,0.000000,0> translate<40.668200,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.738300,-1.535000,23.346000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.738300,-1.535000,24.313900>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,90.000000,0> translate<40.738300,-1.535000,24.313900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<40.738300,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.387200,-1.535000,23.774400>}
box{<0,0,-0.304800><1.648900,0.035000,0.304800> rotate<0,0.000000,0> translate<40.738300,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.071000,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.037300,-1.535000,17.678400>}
box{<0,0,-0.304800><2.966300,0.035000,0.304800> rotate<0,0.000000,0> translate<41.071000,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.106000,-1.535000,18.471600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.073900,-1.535000,18.471600>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,0.000000,0> translate<41.106000,-1.535000,18.471600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.181900,-1.535000,4.948200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.948200,-1.535000,4.181900>}
box{<0,0,-0.304800><1.083712,0.035000,0.304800> rotate<0,44.997030,0> translate<41.181900,-1.535000,4.948200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.181900,-1.535000,6.031700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.181900,-1.535000,4.948200>}
box{<0,0,-0.304800><1.083500,0.035000,0.304800> rotate<0,-90.000000,0> translate<41.181900,-1.535000,4.948200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.181900,-1.535000,6.031700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910200,-1.535000,6.759900>}
box{<0,0,-0.304800><1.029901,0.035000,0.304800> rotate<0,-44.993097,0> translate<41.181900,-1.535000,6.031700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.286600,-1.535000,7.093900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.339600,-1.535000,7.018800>}
box{<0,0,-0.304800><0.091918,0.035000,0.304800> rotate<0,54.784782,0> translate<41.286600,-1.535000,7.093900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.339600,-1.535000,7.018800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.399300,-1.535000,6.981200>}
box{<0,0,-0.304800><0.070554,0.035000,0.304800> rotate<0,32.201244,0> translate<41.339600,-1.535000,7.018800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.399300,-1.535000,6.981200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.449500,-1.535000,6.930900>}
box{<0,0,-0.304800><0.071064,0.035000,0.304800> rotate<0,45.054037,0> translate<41.399300,-1.535000,6.981200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.449500,-1.535000,6.930900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.535100,-1.535000,6.895500>}
box{<0,0,-0.304800><0.092631,0.035000,0.304800> rotate<0,22.466127,0> translate<41.449500,-1.535000,6.930900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,9.226700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,9.757500>}
box{<0,0,-0.304800><0.530800,0.035000,0.304800> rotate<0,90.000000,0> translate<41.452700,-1.535000,9.757500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,9.226700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.644800,-1.535000,9.034500>}
box{<0,0,-0.304800><0.271741,0.035000,0.304800> rotate<0,45.011938,0> translate<41.452700,-1.535000,9.226700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.456500,-1.535000,9.753600>}
box{<0,0,-0.304800><0.003800,0.035000,0.304800> rotate<0,0.000000,0> translate<41.452700,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,9.757500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910200,-1.535000,9.299900>}
box{<0,0,-0.304800><0.647073,0.035000,0.304800> rotate<0,45.003291,0> translate<41.452700,-1.535000,9.757500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,11.382400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,12.297500>}
box{<0,0,-0.304800><0.915100,0.035000,0.304800> rotate<0,90.000000,0> translate<41.452700,-1.535000,12.297500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,11.382400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910200,-1.535000,11.839900>}
box{<0,0,-0.304800><0.647003,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.452700,-1.535000,11.382400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.652700,-1.535000,11.582400>}
box{<0,0,-0.304800><0.200000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.452700,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.558100,-1.535000,12.192000>}
box{<0,0,-0.304800><0.105400,0.035000,0.304800> rotate<0,0.000000,0> translate<41.452700,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,12.297500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910200,-1.535000,11.839900>}
box{<0,0,-0.304800><0.647073,0.035000,0.304800> rotate<0,45.003291,0> translate<41.452700,-1.535000,12.297500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,13.922400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,14.997800>}
box{<0,0,-0.304800><1.075400,0.035000,0.304800> rotate<0,90.000000,0> translate<41.452700,-1.535000,14.997800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,13.922400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.677200,-1.535000,14.147000>}
box{<0,0,-0.304800><0.317562,0.035000,0.304800> rotate<0,-45.009787,0> translate<41.452700,-1.535000,13.922400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.551100,-1.535000,14.020800>}
box{<0,0,-0.304800><0.098400,0.035000,0.304800> rotate<0,0.000000,0> translate<41.452700,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.677200,-1.535000,14.630400>}
box{<0,0,-0.304800><0.224500,0.035000,0.304800> rotate<0,0.000000,0> translate<41.452700,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.452700,-1.535000,14.997800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.677200,-1.535000,14.773200>}
box{<0,0,-0.304800><0.317562,0.035000,0.304800> rotate<0,45.009787,0> translate<41.452700,-1.535000,14.997800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.535100,-1.535000,6.895500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.613000,-1.535000,6.846300>}
box{<0,0,-0.304800><0.092136,0.035000,0.304800> rotate<0,32.273514,0> translate<41.535100,-1.535000,6.895500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.535400,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.754300,-1.535000,9.144000>}
box{<0,0,-0.304800><0.218900,0.035000,0.304800> rotate<0,0.000000,0> translate<41.535400,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.613000,-1.535000,6.846300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.682700,-1.535000,6.834400>}
box{<0,0,-0.304800><0.070709,0.035000,0.304800> rotate<0,9.688147,0> translate<41.613000,-1.535000,6.846300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.644800,-1.535000,9.034500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910200,-1.535000,9.299900>}
box{<0,0,-0.304800><0.375332,0.035000,0.304800> rotate<0,-44.997030,0> translate<41.644800,-1.535000,9.034500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.677200,-1.535000,14.773200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.677200,-1.535000,14.147000>}
box{<0,0,-0.304800><0.626200,0.035000,0.304800> rotate<0,-90.000000,0> translate<41.677200,-1.535000,14.147000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.680600,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.208900,-1.535000,17.068800>}
box{<0,0,-0.304800><2.528300,0.035000,0.304800> rotate<0,0.000000,0> translate<41.680600,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.682700,-1.535000,6.834400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.748200,-1.535000,6.807200>}
box{<0,0,-0.304800><0.070923,0.035000,0.304800> rotate<0,22.550019,0> translate<41.682700,-1.535000,6.834400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.748200,-1.535000,6.807200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.840800,-1.535000,6.807200>}
box{<0,0,-0.304800><0.092600,0.035000,0.304800> rotate<0,0.000000,0> translate<41.748200,-1.535000,6.807200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.840800,-1.535000,6.807200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.867500,-1.535000,6.802600>}
box{<0,0,-0.304800><0.027093,0.035000,0.304800> rotate<0,9.774576,0> translate<41.840800,-1.535000,6.807200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.867500,-1.535000,6.802600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910200,-1.535000,6.759900>}
box{<0,0,-0.304800><0.060387,0.035000,0.304800> rotate<0,44.997030,0> translate<41.867500,-1.535000,6.802600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.948200,-1.535000,4.181900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.031700,-1.535000,4.181900>}
box{<0,0,-0.304800><1.083500,0.035000,0.304800> rotate<0,0.000000,0> translate<41.948200,-1.535000,4.181900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.073900,-1.535000,18.471600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.527100,-1.535000,18.924800>}
box{<0,0,-0.304800><0.640922,0.035000,0.304800> rotate<0,-44.997030,0> translate<42.073900,-1.535000,18.471600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.094900,-1.535000,20.787200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.342300,-1.535000,20.539800>}
box{<0,0,-0.304800><0.349876,0.035000,0.304800> rotate<0,44.997030,0> translate<42.094900,-1.535000,20.787200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.094900,-1.535000,20.787200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.038200,-1.535000,20.787200>}
box{<0,0,-0.304800><0.943300,0.035000,0.304800> rotate<0,0.000000,0> translate<42.094900,-1.535000,20.787200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.155700,-1.535000,20.726400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,20.726400>}
box{<0,0,-0.304800><4.021500,0.035000,0.304800> rotate<0,0.000000,0> translate<42.155700,-1.535000,20.726400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.290200,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.380500,-1.535000,16.459200>}
box{<0,0,-0.304800><2.090300,0.035000,0.304800> rotate<0,0.000000,0> translate<42.290200,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.342300,-1.535000,20.539800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.377400,-1.535000,20.653100>}
box{<0,0,-0.304800><1.041282,0.035000,0.304800> rotate<0,-6.246203,0> translate<42.342300,-1.535000,20.539800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.387200,-1.535000,25.587200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.387200,-1.535000,22.412700>}
box{<0,0,-0.304800><3.174500,0.035000,0.304800> rotate<0,-90.000000,0> translate<42.387200,-1.535000,22.412700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.499900,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.694200,-1.535000,18.897600>}
box{<0,0,-0.304800><1.194300,0.035000,0.304800> rotate<0,0.000000,0> translate<42.499900,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.527100,-1.535000,18.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.483500,-1.535000,19.029500>}
box{<0,0,-0.304800><0.962114,0.035000,0.304800> rotate<0,-6.247052,0> translate<42.527100,-1.535000,18.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<42.899800,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.342400,-1.535000,15.849600>}
box{<0,0,-0.304800><1.442600,0.035000,0.304800> rotate<0,0.000000,0> translate<42.899800,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.031700,-1.535000,4.181900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.116900,-1.535000,4.267200>}
box{<0,0,-0.304800><0.120562,0.035000,0.304800> rotate<0,-45.030633,0> translate<43.031700,-1.535000,4.181900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.038200,-1.535000,20.787200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.361700,-1.535000,20.787200>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,0.000000,0> translate<43.038200,-1.535000,20.787200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.069700,-1.535000,6.759900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.390100,-1.535000,6.439500>}
box{<0,0,-0.304800><0.453114,0.035000,0.304800> rotate<0,44.997030,0> translate<43.069700,-1.535000,6.759900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.069700,-1.535000,6.759900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,7.488200>}
box{<0,0,-0.304800><1.029972,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.069700,-1.535000,6.759900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.069700,-1.535000,9.299900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.116900,-1.535000,9.347200>}
box{<0,0,-0.304800><0.066822,0.035000,0.304800> rotate<0,-45.057657,0> translate<43.069700,-1.535000,9.299900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.069700,-1.535000,9.299900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,8.571700>}
box{<0,0,-0.304800><1.029901,0.035000,0.304800> rotate<0,44.993097,0> translate<43.069700,-1.535000,9.299900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.069700,-1.535000,11.839900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.390100,-1.535000,11.519500>}
box{<0,0,-0.304800><0.453114,0.035000,0.304800> rotate<0,44.997030,0> translate<43.069700,-1.535000,11.839900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.069700,-1.535000,11.839900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,12.568200>}
box{<0,0,-0.304800><1.029972,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.069700,-1.535000,11.839900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.116900,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.121400,-1.535000,4.267200>}
box{<0,0,-0.304800><0.004500,0.035000,0.304800> rotate<0,0.000000,0> translate<43.116900,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.116900,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.121400,-1.535000,9.347200>}
box{<0,0,-0.304800><0.004500,0.035000,0.304800> rotate<0,0.000000,0> translate<43.116900,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.121400,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.223800,-1.535000,4.252400>}
box{<0,0,-0.304800><0.103464,0.035000,0.304800> rotate<0,8.223538,0> translate<43.121400,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.121400,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.223800,-1.535000,9.332400>}
box{<0,0,-0.304800><0.103464,0.035000,0.304800> rotate<0,8.223538,0> translate<43.121400,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.124000,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.656200,-1.535000,6.705600>}
box{<0,0,-0.304800><0.532200,0.035000,0.304800> rotate<0,0.000000,0> translate<43.124000,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.179000,-1.535000,15.570400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.302700,-1.535000,15.271700>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,67.499735,0> translate<43.179000,-1.535000,15.570400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.223800,-1.535000,4.252400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.281900,-1.535000,4.267200>}
box{<0,0,-0.304800><0.059955,0.035000,0.304800> rotate<0,-14.290256,0> translate<43.223800,-1.535000,4.252400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.223800,-1.535000,9.332400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.281900,-1.535000,9.347200>}
box{<0,0,-0.304800><0.059955,0.035000,0.304800> rotate<0,-14.290256,0> translate<43.223800,-1.535000,9.332400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.225700,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.094600,-1.535000,9.144000>}
box{<0,0,-0.304800><2.868900,0.035000,0.304800> rotate<0,0.000000,0> translate<43.225700,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.281900,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.341700,-1.535000,4.267200>}
box{<0,0,-0.304800><0.059800,0.035000,0.304800> rotate<0,0.000000,0> translate<43.281900,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.281900,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.341700,-1.535000,9.347200>}
box{<0,0,-0.304800><0.059800,0.035000,0.304800> rotate<0,0.000000,0> translate<43.281900,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.302700,-1.535000,14.147000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.302700,-1.535000,14.948200>}
box{<0,0,-0.304800><0.801200,0.035000,0.304800> rotate<0,90.000000,0> translate<43.302700,-1.535000,14.948200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.302700,-1.535000,14.147000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,13.651700>}
box{<0,0,-0.304800><0.700460,0.035000,0.304800> rotate<0,44.997030,0> translate<43.302700,-1.535000,14.147000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.302700,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.145000,-1.535000,14.630400>}
box{<0,0,-0.304800><0.842300,0.035000,0.304800> rotate<0,0.000000,0> translate<43.302700,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.302700,-1.535000,14.948200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.302700,-1.535000,15.271700>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,90.000000,0> translate<43.302700,-1.535000,15.271700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.302700,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.243700,-1.535000,15.240000>}
box{<0,0,-0.304800><0.941000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.302700,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.327200,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.453000,-1.535000,11.582400>}
box{<0,0,-0.304800><0.125800,0.035000,0.304800> rotate<0,0.000000,0> translate<43.327200,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.341700,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.437200,-1.535000,4.306800>}
box{<0,0,-0.304800><0.103385,0.035000,0.304800> rotate<0,-22.520328,0> translate<43.341700,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.341700,-1.535000,4.267200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,4.267200>}
box{<0,0,-0.304800><4.137500,0.035000,0.304800> rotate<0,0.000000,0> translate<43.341700,-1.535000,4.267200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.341700,-1.535000,9.347200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.437200,-1.535000,9.386800>}
box{<0,0,-0.304800><0.103385,0.035000,0.304800> rotate<0,-22.520328,0> translate<43.341700,-1.535000,9.347200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.361700,-1.535000,20.787200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.660400,-1.535000,20.910900>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,-22.494325,0> translate<43.361700,-1.535000,20.787200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.361700,-1.535000,27.212700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.660400,-1.535000,27.089000>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,22.494325,0> translate<43.361700,-1.535000,27.212700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.377400,-1.535000,20.653100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.490800,-1.535000,20.678400>}
box{<0,0,-0.304800><0.116188,0.035000,0.304800> rotate<0,-12.576116,0> translate<43.377400,-1.535000,20.653100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.390100,-1.535000,6.439500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,9.226700>}
box{<0,0,-0.304800><3.941625,0.035000,0.304800> rotate<0,-44.998058,0> translate<43.390100,-1.535000,6.439500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.390100,-1.535000,11.519500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.689600,-1.535000,11.819100>}
box{<0,0,-0.304800><0.423628,0.035000,0.304800> rotate<0,-45.006593,0> translate<43.390100,-1.535000,11.519500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.421800,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.750000,-1.535000,12.192000>}
box{<0,0,-0.304800><0.328200,0.035000,0.304800> rotate<0,0.000000,0> translate<43.421800,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.428900,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.046200,-1.535000,14.020800>}
box{<0,0,-0.304800><0.617300,0.035000,0.304800> rotate<0,0.000000,0> translate<43.428900,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.437200,-1.535000,4.306800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.537100,-1.535000,4.332200>}
box{<0,0,-0.304800><0.103078,0.035000,0.304800> rotate<0,-14.264484,0> translate<43.437200,-1.535000,4.306800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.437200,-1.535000,9.386800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.537100,-1.535000,9.412200>}
box{<0,0,-0.304800><0.103078,0.035000,0.304800> rotate<0,-14.264484,0> translate<43.437200,-1.535000,9.386800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.483500,-1.535000,19.029500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.666100,-1.535000,18.997500>}
box{<0,0,-0.304800><0.185383,0.035000,0.304800> rotate<0,9.939289,0> translate<43.483500,-1.535000,19.029500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.490800,-1.535000,20.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.536200,-1.535000,20.670400>}
box{<0,0,-0.304800><0.046099,0.035000,0.304800> rotate<0,9.992921,0> translate<43.490800,-1.535000,20.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.536200,-1.535000,20.670400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.582300,-1.535000,20.675500>}
box{<0,0,-0.304800><0.046381,0.035000,0.304800> rotate<0,-6.312491,0> translate<43.536200,-1.535000,20.670400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.537100,-1.535000,4.332200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.584800,-1.535000,4.367900>}
box{<0,0,-0.304800><0.059580,0.035000,0.304800> rotate<0,-36.809769,0> translate<43.537100,-1.535000,4.332200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.537100,-1.535000,9.412200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.584800,-1.535000,9.447900>}
box{<0,0,-0.304800><0.059580,0.035000,0.304800> rotate<0,-36.809769,0> translate<43.537100,-1.535000,9.412200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.582300,-1.535000,20.675500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.694300,-1.535000,20.642800>}
box{<0,0,-0.304800><0.116676,0.035000,0.304800> rotate<0,16.274845,0> translate<43.582300,-1.535000,20.675500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.584800,-1.535000,4.367900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.640400,-1.535000,4.390900>}
box{<0,0,-0.304800><0.060169,0.035000,0.304800> rotate<0,-22.471883,0> translate<43.584800,-1.535000,4.367900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.584800,-1.535000,9.447900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.640400,-1.535000,9.470900>}
box{<0,0,-0.304800><0.060169,0.035000,0.304800> rotate<0,-22.471883,0> translate<43.584800,-1.535000,9.447900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.625000,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.265800,-1.535000,7.315200>}
box{<0,0,-0.304800><0.640800,0.035000,0.304800> rotate<0,0.000000,0> translate<43.625000,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.640400,-1.535000,4.390900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.713700,-1.535000,4.464300>}
box{<0,0,-0.304800><0.103733,0.035000,0.304800> rotate<0,-45.036084,0> translate<43.640400,-1.535000,4.390900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.640400,-1.535000,9.470900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.713700,-1.535000,9.544200>}
box{<0,0,-0.304800><0.103662,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.640400,-1.535000,9.470900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.660400,-1.535000,20.910900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.889000,-1.535000,21.139500>}
box{<0,0,-0.304800><0.323289,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.660400,-1.535000,20.910900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.660400,-1.535000,27.089000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.889000,-1.535000,26.860400>}
box{<0,0,-0.304800><0.323289,0.035000,0.304800> rotate<0,44.997030,0> translate<43.660400,-1.535000,27.089000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.666100,-1.535000,18.997500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.419000,-1.535000,16.322600>}
box{<0,0,-0.304800><2.778839,0.035000,0.304800> rotate<0,74.274861,0> translate<43.666100,-1.535000,18.997500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.689600,-1.535000,11.819100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.419000,-1.535000,16.322600>}
box{<0,0,-0.304800><4.562186,0.035000,0.304800> rotate<0,-80.794765,0> translate<43.689600,-1.535000,11.819100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.694300,-1.535000,20.642800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.428800,-1.535000,20.514300>}
box{<0,0,-0.304800><0.745656,0.035000,0.304800> rotate<0,9.922752,0> translate<43.694300,-1.535000,20.642800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.713700,-1.535000,4.464300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.796100,-1.535000,4.525800>}
box{<0,0,-0.304800><0.102820,0.035000,0.304800> rotate<0,-36.733735,0> translate<43.713700,-1.535000,4.464300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.713700,-1.535000,9.544200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.796100,-1.535000,9.605800>}
box{<0,0,-0.304800><0.102880,0.035000,0.304800> rotate<0,-36.778363,0> translate<43.713700,-1.535000,9.544200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.796100,-1.535000,4.525800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.826500,-1.535000,4.577100>}
box{<0,0,-0.304800><0.059631,0.035000,0.304800> rotate<0,-59.345415,0> translate<43.796100,-1.535000,4.525800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.796100,-1.535000,9.605800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.826500,-1.535000,9.657100>}
box{<0,0,-0.304800><0.059631,0.035000,0.304800> rotate<0,-59.345415,0> translate<43.796100,-1.535000,9.605800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,7.488200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,8.571700>}
box{<0,0,-0.304800><1.083500,0.035000,0.304800> rotate<0,90.000000,0> translate<43.798000,-1.535000,8.571700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.875400,-1.535000,7.924800>}
box{<0,0,-0.304800><1.077400,0.035000,0.304800> rotate<0,0.000000,0> translate<43.798000,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,8.534400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.485000,-1.535000,8.534400>}
box{<0,0,-0.304800><1.687000,0.035000,0.304800> rotate<0,0.000000,0> translate<43.798000,-1.535000,8.534400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,12.568200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,13.651700>}
box{<0,0,-0.304800><1.083500,0.035000,0.304800> rotate<0,90.000000,0> translate<43.798000,-1.535000,13.651700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.848800,-1.535000,12.801600>}
box{<0,0,-0.304800><0.050800,0.035000,0.304800> rotate<0,0.000000,0> translate<43.798000,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.798000,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.947500,-1.535000,13.411200>}
box{<0,0,-0.304800><0.149500,0.035000,0.304800> rotate<0,0.000000,0> translate<43.798000,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.826500,-1.535000,4.577100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,8.229800>}
box{<0,0,-0.304800><5.165698,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.826500,-1.535000,4.577100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.826500,-1.535000,9.657100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.978600,-1.535000,10.809200>}
box{<0,0,-0.304800><1.629315,0.035000,0.304800> rotate<0,-44.997030,0> translate<43.826500,-1.535000,9.657100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.889000,-1.535000,21.139500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,21.438200>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,-67.499735,0> translate<43.889000,-1.535000,21.139500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.889000,-1.535000,26.860400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,26.561700>}
box{<0,0,-0.304800><0.323301,0.035000,0.304800> rotate<0,67.499735,0> translate<43.889000,-1.535000,26.860400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.904800,-1.535000,26.822400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,26.822400>}
box{<0,0,-0.304800><3.574400,0.035000,0.304800> rotate<0,0.000000,0> translate<43.904800,-1.535000,26.822400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.923000,-1.535000,9.753600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,9.753600>}
box{<0,0,-0.304800><2.254200,0.035000,0.304800> rotate<0,0.000000,0> translate<43.923000,-1.535000,9.753600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<43.970300,-1.535000,21.336000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,21.336000>}
box{<0,0,-0.304800><2.206900,0.035000,0.304800> rotate<0,0.000000,0> translate<43.970300,-1.535000,21.336000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,21.438200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,26.238200>}
box{<0,0,-0.304800><4.800000,0.035000,0.304800> rotate<0,90.000000,0> translate<44.012700,-1.535000,26.238200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,21.945600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,21.945600>}
box{<0,0,-0.304800><2.164500,0.035000,0.304800> rotate<0,0.000000,0> translate<44.012700,-1.535000,21.945600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,22.555200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,22.555200>}
box{<0,0,-0.304800><2.164500,0.035000,0.304800> rotate<0,0.000000,0> translate<44.012700,-1.535000,22.555200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,23.164800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,23.164800>}
box{<0,0,-0.304800><2.164500,0.035000,0.304800> rotate<0,0.000000,0> translate<44.012700,-1.535000,23.164800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,23.774400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.021600,-1.535000,23.774400>}
box{<0,0,-0.304800><2.008900,0.035000,0.304800> rotate<0,0.000000,0> translate<44.012700,-1.535000,23.774400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.091800,-1.535000,24.384000>}
box{<0,0,-0.304800><2.079100,0.035000,0.304800> rotate<0,0.000000,0> translate<44.012700,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,24.993600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.701400,-1.535000,24.993600>}
box{<0,0,-0.304800><2.688700,0.035000,0.304800> rotate<0,0.000000,0> translate<44.012700,-1.535000,24.993600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,25.603200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,25.603200>}
box{<0,0,-0.304800><3.466500,0.035000,0.304800> rotate<0,0.000000,0> translate<44.012700,-1.535000,25.603200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,26.212800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,26.212800>}
box{<0,0,-0.304800><3.466500,0.035000,0.304800> rotate<0,0.000000,0> translate<44.012700,-1.535000,26.212800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,26.238200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.012700,-1.535000,26.561700>}
box{<0,0,-0.304800><0.323500,0.035000,0.304800> rotate<0,90.000000,0> translate<44.012700,-1.535000,26.561700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.126200,-1.535000,4.876800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,4.876800>}
box{<0,0,-0.304800><3.353000,0.035000,0.304800> rotate<0,0.000000,0> translate<44.126200,-1.535000,4.876800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.428800,-1.535000,20.514300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.566500,-1.535000,20.497900>}
box{<0,0,-0.304800><0.138673,0.035000,0.304800> rotate<0,6.791457,0> translate<44.428800,-1.535000,20.514300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.532600,-1.535000,10.363200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,10.363200>}
box{<0,0,-0.304800><1.644600,0.035000,0.304800> rotate<0,0.000000,0> translate<44.532600,-1.535000,10.363200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.566500,-1.535000,20.497900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.586500,-1.535000,20.486700>}
box{<0,0,-0.304800><0.022922,0.035000,0.304800> rotate<0,29.246896,0> translate<44.566500,-1.535000,20.497900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.586500,-1.535000,20.486700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.609300,-1.535000,20.482700>}
box{<0,0,-0.304800><0.023148,0.035000,0.304800> rotate<0,9.949970,0> translate<44.586500,-1.535000,20.486700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.609300,-1.535000,20.482700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.726900,-1.535000,20.407900>}
box{<0,0,-0.304800><0.139373,0.035000,0.304800> rotate<0,32.456438,0> translate<44.609300,-1.535000,20.482700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.726900,-1.535000,20.407900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.848500,-1.535000,20.339800>}
box{<0,0,-0.304800><0.139371,0.035000,0.304800> rotate<0,29.248331,0> translate<44.726900,-1.535000,20.407900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.735800,-1.535000,5.486400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,5.486400>}
box{<0,0,-0.304800><2.743400,0.035000,0.304800> rotate<0,0.000000,0> translate<44.735800,-1.535000,5.486400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.848500,-1.535000,20.339800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.862800,-1.535000,20.321600>}
box{<0,0,-0.304800><0.023146,0.035000,0.304800> rotate<0,51.839352,0> translate<44.848500,-1.535000,20.339800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.862800,-1.535000,20.321600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.882200,-1.535000,20.309300>}
box{<0,0,-0.304800><0.022971,0.035000,0.304800> rotate<0,32.373403,0> translate<44.862800,-1.535000,20.321600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.882200,-1.535000,20.309300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.962000,-1.535000,20.195600>}
box{<0,0,-0.304800><0.138909,0.035000,0.304800> rotate<0,54.933393,0> translate<44.882200,-1.535000,20.309300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.962000,-1.535000,20.195600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.048500,-1.535000,20.085800>}
box{<0,0,-0.304800><0.139779,0.035000,0.304800> rotate<0,51.765685,0> translate<44.962000,-1.535000,20.195600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<44.978600,-1.535000,10.809200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.056500,-1.535000,10.865300>}
box{<0,0,-0.304800><0.095998,0.035000,0.304800> rotate<0,-35.757340,0> translate<44.978600,-1.535000,10.809200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.024100,-1.535000,20.116800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,20.116800>}
box{<0,0,-0.304800><1.153100,0.035000,0.304800> rotate<0,0.000000,0> translate<45.024100,-1.535000,20.116800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.048500,-1.535000,20.085800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.054700,-1.535000,20.063500>}
box{<0,0,-0.304800><0.023146,0.035000,0.304800> rotate<0,74.457724,0> translate<45.048500,-1.535000,20.085800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.054700,-1.535000,20.063500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.068000,-1.535000,20.044700>}
box{<0,0,-0.304800><0.023029,0.035000,0.304800> rotate<0,54.719013,0> translate<45.054700,-1.535000,20.063500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.056500,-1.535000,10.865300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.091500,-1.535000,10.922100>}
box{<0,0,-0.304800><0.066718,0.035000,0.304800> rotate<0,-58.354890,0> translate<45.056500,-1.535000,10.865300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.068000,-1.535000,20.044700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.098300,-1.535000,19.908800>}
box{<0,0,-0.304800><0.139237,0.035000,0.304800> rotate<0,77.425912,0> translate<45.068000,-1.535000,20.044700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.091500,-1.535000,10.922100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.139000,-1.535000,10.969500>}
box{<0,0,-0.304800><0.067104,0.035000,0.304800> rotate<0,-44.936659,0> translate<45.091500,-1.535000,10.922100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.098300,-1.535000,19.908800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.993300,-1.535000,16.728600>}
box{<0,0,-0.304800><3.303740,0.035000,0.304800> rotate<0,74.276965,0> translate<45.098300,-1.535000,19.908800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.139000,-1.535000,10.969500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.175900,-1.535000,11.058700>}
box{<0,0,-0.304800><0.096531,0.035000,0.304800> rotate<0,-67.521783,0> translate<45.139000,-1.535000,10.969500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.140300,-1.535000,10.972800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,10.972800>}
box{<0,0,-0.304800><1.036900,0.035000,0.304800> rotate<0,0.000000,0> translate<45.140300,-1.535000,10.972800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.175900,-1.535000,11.058700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.226400,-1.535000,11.140400>}
box{<0,0,-0.304800><0.096048,0.035000,0.304800> rotate<0,-58.275319,0> translate<45.175900,-1.535000,11.058700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.211400,-1.535000,19.507200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,19.507200>}
box{<0,0,-0.304800><0.965800,0.035000,0.304800> rotate<0,0.000000,0> translate<45.211400,-1.535000,19.507200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.226400,-1.535000,11.140400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.237100,-1.535000,11.206400>}
box{<0,0,-0.304800><0.066862,0.035000,0.304800> rotate<0,-80.785928,0> translate<45.226400,-1.535000,11.140400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.237100,-1.535000,11.206400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.262700,-1.535000,11.268200>}
box{<0,0,-0.304800><0.066892,0.035000,0.304800> rotate<0,-67.494278,0> translate<45.237100,-1.535000,11.206400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.262700,-1.535000,11.268200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.262700,-1.535000,11.364600>}
box{<0,0,-0.304800><0.096400,0.035000,0.304800> rotate<0,90.000000,0> translate<45.262700,-1.535000,11.364600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.262700,-1.535000,11.364600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.029200,-1.535000,16.098000>}
box{<0,0,-0.304800><4.795060,0.035000,0.304800> rotate<0,-80.796360,0> translate<45.262700,-1.535000,11.364600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.297900,-1.535000,11.582400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,11.582400>}
box{<0,0,-0.304800><0.879300,0.035000,0.304800> rotate<0,0.000000,0> translate<45.297900,-1.535000,11.582400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.345400,-1.535000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,6.096000>}
box{<0,0,-0.304800><2.133800,0.035000,0.304800> rotate<0,0.000000,0> translate<45.345400,-1.535000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.382900,-1.535000,18.897600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,18.897600>}
box{<0,0,-0.304800><0.794300,0.035000,0.304800> rotate<0,0.000000,0> translate<45.382900,-1.535000,18.897600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.396600,-1.535000,12.192000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,12.192000>}
box{<0,0,-0.304800><0.780600,0.035000,0.304800> rotate<0,0.000000,0> translate<45.396600,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.495300,-1.535000,12.801600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,12.801600>}
box{<0,0,-0.304800><0.681900,0.035000,0.304800> rotate<0,0.000000,0> translate<45.495300,-1.535000,12.801600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.554500,-1.535000,18.288000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,18.288000>}
box{<0,0,-0.304800><0.622700,0.035000,0.304800> rotate<0,0.000000,0> translate<45.554500,-1.535000,18.288000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.594100,-1.535000,13.411200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,13.411200>}
box{<0,0,-0.304800><0.583100,0.035000,0.304800> rotate<0,0.000000,0> translate<45.594100,-1.535000,13.411200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.692800,-1.535000,14.020800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,14.020800>}
box{<0,0,-0.304800><0.484400,0.035000,0.304800> rotate<0,0.000000,0> translate<45.692800,-1.535000,14.020800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.726000,-1.535000,17.678400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,17.678400>}
box{<0,0,-0.304800><0.451200,0.035000,0.304800> rotate<0,0.000000,0> translate<45.726000,-1.535000,17.678400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.791500,-1.535000,14.630400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,14.630400>}
box{<0,0,-0.304800><0.385700,0.035000,0.304800> rotate<0,0.000000,0> translate<45.791500,-1.535000,14.630400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.890200,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,15.240000>}
box{<0,0,-0.304800><0.287000,0.035000,0.304800> rotate<0,0.000000,0> translate<45.890200,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.897600,-1.535000,17.068800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,17.068800>}
box{<0,0,-0.304800><0.279600,0.035000,0.304800> rotate<0,0.000000,0> translate<45.897600,-1.535000,17.068800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.955000,-1.535000,6.705600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,6.705600>}
box{<0,0,-0.304800><1.524200,0.035000,0.304800> rotate<0,0.000000,0> translate<45.955000,-1.535000,6.705600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.988900,-1.535000,15.849600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,15.849600>}
box{<0,0,-0.304800><0.188300,0.035000,0.304800> rotate<0,0.000000,0> translate<45.988900,-1.535000,15.849600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<45.993300,-1.535000,16.728600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.003700,-1.535000,16.714300>}
box{<0,0,-0.304800><0.017682,0.035000,0.304800> rotate<0,53.969065,0> translate<45.993300,-1.535000,16.728600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.003700,-1.535000,16.714300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.036900,-1.535000,16.573700>}
box{<0,0,-0.304800><0.144467,0.035000,0.304800> rotate<0,76.708998,0> translate<46.003700,-1.535000,16.714300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.021600,-1.535000,23.346000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,23.190500>}
box{<0,0,-0.304800><0.219981,0.035000,0.304800> rotate<0,44.978614,0> translate<46.021600,-1.535000,23.346000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.021600,-1.535000,24.313900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.021600,-1.535000,23.346000>}
box{<0,0,-0.304800><0.967900,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.021600,-1.535000,23.346000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.021600,-1.535000,24.313900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.364800,-1.535000,24.657000>}
box{<0,0,-0.304800><0.485287,0.035000,0.304800> rotate<0,-44.988682,0> translate<46.021600,-1.535000,24.313900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.029200,-1.535000,16.098000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.037900,-1.535000,16.113400>}
box{<0,0,-0.304800><0.017688,0.035000,0.304800> rotate<0,-60.532377,0> translate<46.029200,-1.535000,16.098000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.036900,-1.535000,16.573700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.076100,-1.535000,16.434600>}
box{<0,0,-0.304800><0.144518,0.035000,0.304800> rotate<0,74.256644,0> translate<46.036900,-1.535000,16.573700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.037900,-1.535000,16.113400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.054900,-1.535000,16.256500>}
box{<0,0,-0.304800><0.144106,0.035000,0.304800> rotate<0,-83.219633,0> translate<46.037900,-1.535000,16.113400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.054900,-1.535000,16.256500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.078100,-1.535000,16.399700>}
box{<0,0,-0.304800><0.145067,0.035000,0.304800> rotate<0,-80.792071,0> translate<46.054900,-1.535000,16.256500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.057000,-1.535000,28.572600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.231000,-1.535000,28.152500>}
box{<0,0,-0.304800><0.454709,0.035000,0.304800> rotate<0,67.496839,0> translate<46.057000,-1.535000,28.572600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.057000,-1.535000,28.679200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.057000,-1.535000,28.572600>}
box{<0,0,-0.304800><0.106600,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.057000,-1.535000,28.572600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.069200,-1.535000,16.459200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,16.459200>}
box{<0,0,-0.304800><0.108000,0.035000,0.304800> rotate<0,0.000000,0> translate<46.069200,-1.535000,16.459200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.074000,-1.535000,16.417000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.076100,-1.535000,16.434600>}
box{<0,0,-0.304800><0.017725,0.035000,0.304800> rotate<0,-83.190250,0> translate<46.074000,-1.535000,16.417000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.074000,-1.535000,16.417000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.078100,-1.535000,16.399700>}
box{<0,0,-0.304800><0.017779,0.035000,0.304800> rotate<0,76.662157,0> translate<46.074000,-1.535000,16.417000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,23.190500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.177200,-1.535000,9.226700>}
box{<0,0,-0.304800><13.963800,0.035000,0.304800> rotate<0,-90.000000,0> translate<46.177200,-1.535000,9.226700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.178600,-1.535000,0.520700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.231000,-1.535000,0.647400>}
box{<0,0,-0.304800><0.137108,0.035000,0.304800> rotate<0,-67.526761,0> translate<46.178600,-1.535000,0.520700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.231000,-1.535000,0.647400>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.552500,-1.535000,0.968900>}
box{<0,0,-0.304800><0.454670,0.035000,0.304800> rotate<0,-44.997030,0> translate<46.231000,-1.535000,0.647400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.231000,-1.535000,28.152500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.552500,-1.535000,27.831000>}
box{<0,0,-0.304800><0.454670,0.035000,0.304800> rotate<0,44.997030,0> translate<46.231000,-1.535000,28.152500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.364800,-1.535000,24.657000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.404600,-1.535000,24.716500>}
box{<0,0,-0.304800><0.071584,0.035000,0.304800> rotate<0,-56.217426,0> translate<46.364800,-1.535000,24.657000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.404600,-1.535000,24.716500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.463500,-1.535000,24.755700>}
box{<0,0,-0.304800><0.070752,0.035000,0.304800> rotate<0,-33.642927,0> translate<46.404600,-1.535000,24.716500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.463500,-1.535000,24.755700>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.706000,-1.535000,24.998300>}
box{<0,0,-0.304800><0.343018,0.035000,0.304800> rotate<0,-45.008841,0> translate<46.463500,-1.535000,24.755700> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.552500,-1.535000,0.968900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.972600,-1.535000,1.142900>}
box{<0,0,-0.304800><0.454709,0.035000,0.304800> rotate<0,-22.497221,0> translate<46.552500,-1.535000,0.968900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.552500,-1.535000,27.831000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.972600,-1.535000,27.657000>}
box{<0,0,-0.304800><0.454709,0.035000,0.304800> rotate<0,22.497221,0> translate<46.552500,-1.535000,27.831000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.564600,-1.535000,7.315200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,7.315200>}
box{<0,0,-0.304800><0.914600,0.035000,0.304800> rotate<0,0.000000,0> translate<46.564600,-1.535000,7.315200> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.706000,-1.535000,24.998300>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,24.998300>}
box{<0,0,-0.304800><0.773200,0.035000,0.304800> rotate<0,0.000000,0> translate<46.706000,-1.535000,24.998300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.972600,-1.535000,1.142900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.427300,-1.535000,1.142900>}
box{<0,0,-0.304800><0.454700,0.035000,0.304800> rotate<0,0.000000,0> translate<46.972600,-1.535000,1.142900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.972600,-1.535000,27.657000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.427300,-1.535000,27.657000>}
box{<0,0,-0.304800><0.454700,0.035000,0.304800> rotate<0,0.000000,0> translate<46.972600,-1.535000,27.657000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.174200,-1.535000,7.924800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,7.924800>}
box{<0,0,-0.304800><0.305000,0.035000,0.304800> rotate<0,0.000000,0> translate<47.174200,-1.535000,7.924800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.427300,-1.535000,1.142900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,1.121300>}
box{<0,0,-0.304800><0.056215,0.035000,0.304800> rotate<0,22.594853,0> translate<47.427300,-1.535000,1.142900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.427300,-1.535000,27.657000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,27.678600>}
box{<0,0,-0.304800><0.056215,0.035000,0.304800> rotate<0,-22.594853,0> translate<47.427300,-1.535000,27.657000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,8.229800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,1.121300>}
box{<0,0,-0.304800><7.108500,0.035000,0.304800> rotate<0,-90.000000,0> translate<47.479200,-1.535000,1.121300> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,27.678600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<47.479200,-1.535000,24.998300>}
box{<0,0,-0.304800><2.680300,0.035000,0.304800> rotate<0,-90.000000,0> translate<47.479200,-1.535000,24.998300> }
texture{col_pol}
}
#end
union{
cylinder{<23.660000,0.038000,10.620000><23.660000,-1.538000,10.620000>0.406400}
cylinder{<23.660000,0.038000,18.240000><23.660000,-1.538000,18.240000>0.406400}
cylinder{<26.360000,0.038000,2.480000><26.360000,-1.538000,2.480000>0.406400}
cylinder{<18.740000,0.038000,2.480000><18.740000,-1.538000,2.480000>0.406400}
cylinder{<8.220000,0.038000,25.520000><8.220000,-1.538000,25.520000>0.406400}
cylinder{<5.680000,0.038000,25.520000><5.680000,-1.538000,25.520000>0.406400}
cylinder{<18.010000,0.038000,17.580000><18.010000,-1.538000,17.580000>0.406400}
cylinder{<18.010000,0.038000,9.960000><18.010000,-1.538000,9.960000>0.406400}
cylinder{<41.590000,0.038000,19.640000><41.590000,-1.538000,19.640000>0.406400}
cylinder{<33.970000,0.038000,19.640000><33.970000,-1.538000,19.640000>0.406400}
cylinder{<21.240000,0.038000,10.650000><21.240000,-1.538000,10.650000>0.406400}
cylinder{<21.240000,0.038000,18.270000><21.240000,-1.538000,18.270000>0.406400}
cylinder{<21.910000,0.038000,6.040000><21.910000,-1.538000,6.040000>0.406400}
cylinder{<14.290000,0.038000,6.040000><14.290000,-1.538000,6.040000>0.406400}
cylinder{<47.190000,0.038000,23.830000><47.190000,-1.538000,23.830000>0.406400}
cylinder{<39.570000,0.038000,23.830000><39.570000,-1.538000,23.830000>0.406400}
cylinder{<11.450000,0.038000,26.570000><11.450000,-1.538000,26.570000>0.406400}
cylinder{<19.070000,0.038000,26.570000><19.070000,-1.538000,26.570000>0.406400}
cylinder{<36.740000,0.038000,23.870000><36.740000,-1.538000,23.870000>0.508000}
cylinder{<34.200000,0.038000,23.870000><34.200000,-1.538000,23.870000>0.508000}
cylinder{<31.660000,0.038000,23.870000><31.660000,-1.538000,23.870000>0.508000}
cylinder{<29.120000,0.038000,23.870000><29.120000,-1.538000,23.870000>0.508000}
cylinder{<26.580000,0.038000,23.870000><26.580000,-1.538000,23.870000>0.508000}
cylinder{<24.040000,0.038000,23.870000><24.040000,-1.538000,23.870000>0.508000}
cylinder{<34.870000,0.038000,13.110000><34.870000,-1.538000,13.110000>0.406400}
cylinder{<34.870000,0.038000,10.570000><34.870000,-1.538000,10.570000>0.406400}
cylinder{<34.870000,0.038000,8.030000><34.870000,-1.538000,8.030000>0.406400}
cylinder{<34.870000,0.038000,5.490000><34.870000,-1.538000,5.490000>0.406400}
cylinder{<42.490000,0.038000,5.490000><42.490000,-1.538000,5.490000>0.406400}
cylinder{<42.490000,0.038000,8.030000><42.490000,-1.538000,8.030000>0.406400}
cylinder{<42.490000,0.038000,10.570000><42.490000,-1.538000,10.570000>0.406400}
cylinder{<42.490000,0.038000,13.110000><42.490000,-1.538000,13.110000>0.406400}
cylinder{<15.140000,0.038000,13.270000><15.140000,-1.538000,13.270000>0.475000}
cylinder{<15.140000,0.038000,15.770000><15.140000,-1.538000,15.770000>0.475000}
cylinder{<13.140000,0.038000,15.770000><13.140000,-1.538000,15.770000>0.475000}
cylinder{<13.140000,0.038000,13.270000><13.140000,-1.538000,13.270000>0.475000}
//Taladros(r�pido)/Vias
cylinder{<0.800000,0.038000,28.800000><0.800000,-1.538000,28.800000>0.250000 }
cylinder{<47.200000,0.038000,28.800000><47.200000,-1.538000,28.800000>0.250000 }
cylinder{<0.800000,0.038000,0.000000><0.800000,-1.538000,0.000000>0.250000 }
cylinder{<47.200000,0.038000,0.000000><47.200000,-1.538000,0.000000>0.250000 }
//Taladros(r�pido)/Circuito Impreso
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Pantalla artificial
union{
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,26.438100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.421300,0.000000,26.438100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<37.421300,0.000000,26.438100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.421300,0.000000,26.438100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,26.751600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<37.421300,0.000000,26.438100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,26.751600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.421300,0.000000,27.065100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<37.421300,0.000000,27.065100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.421300,0.000000,27.065100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,27.065100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<37.421300,0.000000,27.065100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,27.530300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,27.843900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<38.361900,0.000000,27.843900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,27.843900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.205200,0.000000,28.000600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<38.205200,0.000000,28.000600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.205200,0.000000,28.000600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.891600,0.000000,28.000600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<37.891600,0.000000,28.000600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.891600,0.000000,28.000600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,27.843900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<37.734900,0.000000,27.843900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,27.843900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,27.530300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<37.734900,0.000000,27.530300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,27.530300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.891600,0.000000,27.373600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<37.734900,0.000000,27.530300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.891600,0.000000,27.373600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.205200,0.000000,27.373600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<37.891600,0.000000,27.373600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.205200,0.000000,27.373600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,27.530300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<38.205200,0.000000,27.373600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,28.309100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,28.779400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<38.361900,0.000000,28.779400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,28.779400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.205200,0.000000,28.936100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<38.205200,0.000000,28.936100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.205200,0.000000,28.936100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.048400,0.000000,28.779400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<38.048400,0.000000,28.779400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.048400,0.000000,28.779400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.048400,0.000000,28.465800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<38.048400,0.000000,28.465800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.048400,0.000000,28.465800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.891600,0.000000,28.309100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<37.891600,0.000000,28.309100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.891600,0.000000,28.309100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,28.465800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<37.734900,0.000000,28.465800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,28.465800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,28.936100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<37.734900,0.000000,28.936100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,29.244600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,29.401300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<37.734900,0.000000,29.401300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.734900,0.000000,29.401300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,29.401300>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<37.734900,0.000000,29.401300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,29.244600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<38.361900,0.000000,29.558100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<38.361900,0.000000,29.558100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.264600,0.000000,29.401300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<37.421300,0.000000,29.401300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<37.264600,0.000000,29.401300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,26.438100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.421300,-1.536000,26.438100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.421300,-1.536000,26.438100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.421300,-1.536000,26.438100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,26.751600>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<33.421300,-1.536000,26.438100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,26.751600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.421300,-1.536000,27.065100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,44.987894,0> translate<33.421300,-1.536000,27.065100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.421300,-1.536000,27.065100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,27.065100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.421300,-1.536000,27.065100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,27.373600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,27.530300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,90.000000,0> translate<33.734900,-1.536000,27.530300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,27.530300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,27.530300>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<33.734900,-1.536000,27.530300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,27.373600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,27.687100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,90.000000,0> translate<34.361900,-1.536000,27.687100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.264600,-1.536000,27.530300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.421300,-1.536000,27.530300>}
box{<0,0,-0.038100><0.156700,0.036000,0.038100> rotate<0,0.000000,0> translate<33.264600,-1.536000,27.530300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,27.997200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,28.467500>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<34.361900,-1.536000,28.467500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,28.467500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.205200,-1.536000,28.624200>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.205200,-1.536000,28.624200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.205200,-1.536000,28.624200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.048400,-1.536000,28.467500>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<34.048400,-1.536000,28.467500> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.048400,-1.536000,28.467500>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.048400,-1.536000,28.153900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<34.048400,-1.536000,28.153900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.048400,-1.536000,28.153900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.891600,-1.536000,27.997200>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<33.891600,-1.536000,27.997200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.891600,-1.536000,27.997200>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,28.153900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<33.734900,-1.536000,28.153900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,28.153900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,28.624200>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<33.734900,-1.536000,28.624200> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,29.089400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,29.403000>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<34.361900,-1.536000,29.403000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,29.403000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.205200,-1.536000,29.559700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<34.205200,-1.536000,29.559700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.205200,-1.536000,29.559700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.891600,-1.536000,29.559700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.891600,-1.536000,29.559700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.891600,-1.536000,29.559700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,29.403000>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<33.734900,-1.536000,29.403000> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,29.403000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,29.089400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<33.734900,-1.536000,29.089400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.734900,-1.536000,29.089400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.891600,-1.536000,28.932700>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<33.734900,-1.536000,29.089400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<33.891600,-1.536000,28.932700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.205200,-1.536000,28.932700>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<33.891600,-1.536000,28.932700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.205200,-1.536000,28.932700>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<34.361900,-1.536000,29.089400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<34.205200,-1.536000,28.932700> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.178100,0.000000,27.065100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.021300,0.000000,26.908400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<31.021300,0.000000,26.908400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.021300,0.000000,26.908400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.021300,0.000000,26.594800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.021300,0.000000,26.594800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.021300,0.000000,26.594800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.178100,0.000000,26.438100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<31.021300,0.000000,26.594800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.178100,0.000000,26.438100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.334900,0.000000,26.438100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.178100,0.000000,26.438100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.334900,0.000000,26.438100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.491600,0.000000,26.594800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.334900,0.000000,26.438100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.491600,0.000000,26.594800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.491600,0.000000,26.908400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<31.491600,0.000000,26.908400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.491600,0.000000,26.908400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.648400,0.000000,27.065100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<31.491600,0.000000,26.908400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.648400,0.000000,27.065100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.805200,0.000000,27.065100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.648400,0.000000,27.065100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.805200,0.000000,27.065100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.961900,0.000000,26.908400>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.805200,0.000000,27.065100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.961900,0.000000,26.908400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.961900,0.000000,26.594800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.961900,0.000000,26.594800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.961900,0.000000,26.594800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.805200,0.000000,26.438100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.805200,0.000000,26.438100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.334900,0.000000,28.000600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.334900,0.000000,27.530300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.334900,0.000000,27.530300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.334900,0.000000,27.530300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.491600,0.000000,27.373600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<31.334900,0.000000,27.530300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.491600,0.000000,27.373600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.805200,0.000000,27.373600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<31.491600,0.000000,27.373600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.805200,0.000000,27.373600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.961900,0.000000,27.530300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<31.805200,0.000000,27.373600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.961900,0.000000,27.530300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.961900,0.000000,28.000600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<31.961900,0.000000,28.000600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.961900,0.000000,28.309100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.021300,0.000000,28.309100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<31.021300,0.000000,28.309100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.961900,0.000000,28.779400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.648400,0.000000,28.309100>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,-56.309028,0> translate<31.648400,0.000000,28.309100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.648400,0.000000,28.309100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.334900,0.000000,28.779400>}
box{<0,0,-0.038100><0.565212,0.036000,0.038100> rotate<0,56.309028,0> translate<31.334900,0.000000,28.779400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.561900,0.000000,26.438100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.621300,0.000000,26.438100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<28.621300,0.000000,26.438100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.621300,0.000000,26.438100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.621300,0.000000,26.908400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<28.621300,0.000000,26.908400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.621300,0.000000,26.908400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.778100,0.000000,27.065100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<28.621300,0.000000,26.908400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.778100,0.000000,27.065100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.091600,0.000000,27.065100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,0.000000,0> translate<28.778100,0.000000,27.065100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.091600,0.000000,27.065100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.248400,0.000000,26.908400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<29.091600,0.000000,27.065100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.248400,0.000000,26.908400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.248400,0.000000,26.438100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.248400,0.000000,26.438100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.248400,0.000000,26.751600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.561900,0.000000,27.065100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.248400,0.000000,26.751600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.561900,0.000000,27.843900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.561900,0.000000,27.530300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.561900,0.000000,27.530300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.561900,0.000000,27.530300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.405200,0.000000,27.373600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<29.405200,0.000000,27.373600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.405200,0.000000,27.373600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.091600,0.000000,27.373600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<29.091600,0.000000,27.373600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.091600,0.000000,27.373600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.934900,0.000000,27.530300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<28.934900,0.000000,27.530300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.934900,0.000000,27.530300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.934900,0.000000,27.843900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<28.934900,0.000000,27.843900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.934900,0.000000,27.843900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.091600,0.000000,28.000600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<28.934900,0.000000,27.843900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.091600,0.000000,28.000600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.248400,0.000000,28.000600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<29.091600,0.000000,28.000600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.248400,0.000000,28.000600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.248400,0.000000,27.373600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.248400,0.000000,27.373600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.561900,0.000000,28.309100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.561900,0.000000,28.779400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<29.561900,0.000000,28.779400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.561900,0.000000,28.779400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.405200,0.000000,28.936100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<29.405200,0.000000,28.936100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.405200,0.000000,28.936100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.248400,0.000000,28.779400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<29.248400,0.000000,28.779400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.248400,0.000000,28.779400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.248400,0.000000,28.465800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<29.248400,0.000000,28.465800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.248400,0.000000,28.465800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.091600,0.000000,28.309100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<29.091600,0.000000,28.309100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<29.091600,0.000000,28.309100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.934900,0.000000,28.465800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<28.934900,0.000000,28.465800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.934900,0.000000,28.465800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<28.934900,0.000000,28.936100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<28.934900,0.000000,28.936100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.421300,0.000000,26.438100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.048400,0.000000,26.438100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<25.421300,0.000000,26.438100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.048400,0.000000,26.438100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.361900,0.000000,26.751600>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.048400,0.000000,26.438100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.361900,0.000000,26.751600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.048400,0.000000,27.065100>}
box{<0,0,-0.038100><0.443356,0.036000,0.038100> rotate<0,44.997030,0> translate<26.048400,0.000000,27.065100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.048400,0.000000,27.065100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.421300,0.000000,27.065100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<25.421300,0.000000,27.065100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.734900,0.000000,28.000600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.734900,0.000000,27.530300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.734900,0.000000,27.530300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.734900,0.000000,27.530300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.891600,0.000000,27.373600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<25.734900,0.000000,27.530300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.891600,0.000000,27.373600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.205200,0.000000,27.373600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.891600,0.000000,27.373600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.205200,0.000000,27.373600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.361900,0.000000,27.530300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.205200,0.000000,27.373600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.361900,0.000000,27.530300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.361900,0.000000,28.000600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<26.361900,0.000000,28.000600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.734900,0.000000,28.936100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.734900,0.000000,28.465800>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<25.734900,0.000000,28.465800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.734900,0.000000,28.465800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.891600,0.000000,28.309100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<25.734900,0.000000,28.465800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<25.891600,0.000000,28.309100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.205200,0.000000,28.309100>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<25.891600,0.000000,28.309100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.205200,0.000000,28.309100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.361900,0.000000,28.465800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<26.205200,0.000000,28.309100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.361900,0.000000,28.465800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<26.361900,0.000000,28.936100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<26.361900,0.000000,28.936100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.594100,0.000000,26.658600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.437300,0.000000,26.501900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<22.437300,0.000000,26.501900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.437300,0.000000,26.501900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.437300,0.000000,26.188300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.437300,0.000000,26.188300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.437300,0.000000,26.188300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.594100,0.000000,26.031600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<22.437300,0.000000,26.188300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.594100,0.000000,26.031600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.221200,0.000000,26.031600>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<22.594100,0.000000,26.031600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.221200,0.000000,26.031600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.377900,0.000000,26.188300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.221200,0.000000,26.031600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.377900,0.000000,26.188300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.377900,0.000000,26.501900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<23.377900,0.000000,26.501900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.377900,0.000000,26.501900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.221200,0.000000,26.658600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<23.221200,0.000000,26.658600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.221200,0.000000,26.658600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.907600,0.000000,26.658600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.907600,0.000000,26.658600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.907600,0.000000,26.658600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.907600,0.000000,26.345100>}
box{<0,0,-0.038100><0.313500,0.036000,0.038100> rotate<0,-90.000000,0> translate<22.907600,0.000000,26.345100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.377900,0.000000,26.967100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.750900,0.000000,26.967100>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,0.000000,0> translate<22.750900,0.000000,26.967100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.750900,0.000000,26.967100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.750900,0.000000,27.437400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<22.750900,0.000000,27.437400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.750900,0.000000,27.437400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.907600,0.000000,27.594100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<22.750900,0.000000,27.437400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.907600,0.000000,27.594100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.377900,0.000000,27.594100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<22.907600,0.000000,27.594100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.437300,0.000000,28.529600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.377900,0.000000,28.529600>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.437300,0.000000,28.529600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.377900,0.000000,28.529600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.377900,0.000000,28.059300>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<23.377900,0.000000,28.059300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.377900,0.000000,28.059300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.221200,0.000000,27.902600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<23.221200,0.000000,27.902600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<23.221200,0.000000,27.902600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.907600,0.000000,27.902600>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,0.000000,0> translate<22.907600,0.000000,27.902600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.907600,0.000000,27.902600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.750900,0.000000,28.059300>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<22.750900,0.000000,28.059300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.750900,0.000000,28.059300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<22.750900,0.000000,28.529600>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<22.750900,0.000000,28.529600> }
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.771000,0.000000,15.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.771000,0.000000,12.906000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.771000,0.000000,12.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.549000,0.000000,12.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.549000,0.000000,15.954000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.549000,0.000000,15.954000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.771000,0.000000,12.906000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.549000,0.000000,12.906000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.771000,0.000000,12.906000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.549000,0.000000,15.954000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.771000,0.000000,15.954000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.771000,0.000000,15.954000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<23.660000,0.000000,10.620000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<23.660000,0.000000,11.509000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<23.660000,0.000000,11.509000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<23.660000,0.000000,18.240000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<23.660000,0.000000,17.351000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<23.660000,0.000000,17.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.660000,0.000000,14.938000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.660000,0.000000,14.557000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.660000,0.000000,14.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.168000,0.000000,13.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.152000,0.000000,13.541000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.152000,0.000000,13.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.152000,0.000000,13.541000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.660000,0.000000,14.557000>}
box{<0,0,-0.076200><1.135923,0.036000,0.076200> rotate<0,-63.430762,0> translate<23.152000,0.000000,13.541000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.660000,0.000000,14.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.660000,0.000000,13.160000>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.660000,0.000000,13.160000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.660000,0.000000,14.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.168000,0.000000,13.541000>}
box{<0,0,-0.076200><1.135923,0.036000,0.076200> rotate<0,63.430762,0> translate<23.660000,0.000000,14.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.660000,0.000000,14.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.152000,0.000000,14.557000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.152000,0.000000,14.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.168000,0.000000,14.303000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.168000,0.000000,14.557000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.168000,0.000000,14.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.168000,0.000000,14.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.660000,0.000000,14.557000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.660000,0.000000,14.557000> }
box{<-0.190500,0,-0.889000><0.190500,0.036000,0.889000> rotate<0,-270.000000,0> translate<23.660000,0.000000,15.382500>}
box{<-0.698500,0,-0.254000><0.698500,0.036000,0.254000> rotate<0,-270.000000,0> translate<23.660000,0.000000,12.207500>}
box{<-0.698500,0,-0.254000><0.698500,0.036000,0.254000> rotate<0,-270.000000,0> translate<23.660000,0.000000,16.652500>}
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.026000,0.000000,1.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.074000,0.000000,1.591000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.026000,0.000000,1.591000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.074000,0.000000,3.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.026000,0.000000,3.369000>}
box{<0,0,-0.076200><3.048000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.026000,0.000000,3.369000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.074000,0.000000,1.591000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.074000,0.000000,3.369000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<24.074000,0.000000,3.369000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.026000,0.000000,3.369000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.026000,0.000000,1.591000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.026000,0.000000,1.591000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<26.360000,0.000000,2.480000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<25.471000,0.000000,2.480000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<25.471000,0.000000,2.480000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.740000,0.000000,2.480000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<19.629000,0.000000,2.480000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<18.740000,0.000000,2.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.042000,0.000000,2.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.423000,0.000000,2.480000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.042000,0.000000,2.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.439000,0.000000,2.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.439000,0.000000,1.972000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.439000,0.000000,1.972000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.439000,0.000000,1.972000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.423000,0.000000,2.480000>}
box{<0,0,-0.076200><1.135923,0.036000,0.076200> rotate<0,26.563298,0> translate<22.423000,0.000000,2.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.423000,0.000000,2.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.820000,0.000000,2.480000>}
box{<0,0,-0.076200><1.397000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.423000,0.000000,2.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.423000,0.000000,2.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.439000,0.000000,2.988000>}
box{<0,0,-0.076200><1.135923,0.036000,0.076200> rotate<0,-26.563298,0> translate<22.423000,0.000000,2.480000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.423000,0.000000,2.480000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.423000,0.000000,1.972000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.423000,0.000000,1.972000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.677000,0.000000,2.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.423000,0.000000,2.988000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.423000,0.000000,2.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.423000,0.000000,2.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.423000,0.000000,2.480000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.423000,0.000000,2.480000> }
box{<-0.190500,0,-0.889000><0.190500,0.036000,0.889000> rotate<0,-0.000000,0> translate<21.597500,0.000000,2.480000>}
box{<-0.698500,0,-0.254000><0.698500,0.036000,0.254000> rotate<0,-0.000000,0> translate<24.772500,0.000000,2.480000>}
box{<-0.698500,0,-0.254000><0.698500,0.036000,0.254000> rotate<0,-0.000000,0> translate<20.327500,0.000000,2.480000>}
//LED1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.375200,0.000000,26.790000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.375200,0.000000,24.250000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<5.375200,0.000000,24.250000> }
object{ARC(1.524000,0.152400,320.196354,360.000000,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(1.524000,0.152400,359.996240,401.629793,0.036000) translate<6.950000,0.000000,25.520100>}
object{ARC(1.524000,0.152400,180.000000,220.601295,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(1.524000,0.152400,140.196354,180.000000,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(1.524000,0.152400,215.538115,270.000000,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(1.524000,0.152400,270.000000,323.130102,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(1.524000,0.152400,90.000000,142.126995,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(1.524000,0.152400,37.873005,90.000000,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(0.635000,0.152400,270.000000,360.000000,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(1.016000,0.152400,270.000000,360.000000,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(0.635000,0.152400,90.000000,180.000000,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(1.016000,0.152400,90.000000,180.000000,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(2.032000,0.254000,219.807015,270.000000,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(2.032000,0.254000,270.002820,331.929172,0.036000) translate<6.949900,0.000000,25.520000>}
object{ARC(2.032000,0.254000,90.000000,139.762648,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(2.032000,0.254000,29.746980,90.002820,0.036000) translate<6.950100,0.000000,25.520000>}
object{ARC(2.032000,0.254000,331.698289,360.000000,0.036000) translate<6.950000,0.000000,25.520000>}
object{ARC(2.032000,0.254000,359.997180,391.605470,0.036000) translate<6.950000,0.000000,25.520100>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.010000,0.000000,9.960000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.010000,0.000000,10.849000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<18.010000,0.000000,10.849000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.010000,0.000000,17.580000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.010000,0.000000,16.691000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<18.010000,0.000000,16.691000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<18.772000,0.000000,16.056000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<17.248000,0.000000,16.056000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<17.248000,0.000000,11.484000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<18.772000,0.000000,11.484000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.248000,0.000000,16.310000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.772000,0.000000,16.310000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.248000,0.000000,16.310000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.026000,0.000000,16.056000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.026000,0.000000,15.675000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.026000,0.000000,15.675000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.899000,0.000000,15.548000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.026000,0.000000,15.675000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<18.899000,0.000000,15.548000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.994000,0.000000,16.056000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.994000,0.000000,15.675000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.994000,0.000000,15.675000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.121000,0.000000,15.548000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.994000,0.000000,15.675000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<16.994000,0.000000,15.675000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.899000,0.000000,11.992000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.026000,0.000000,11.865000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<18.899000,0.000000,11.992000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.899000,0.000000,11.992000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.899000,0.000000,15.548000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<18.899000,0.000000,15.548000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.121000,0.000000,11.992000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.994000,0.000000,11.865000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.994000,0.000000,11.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.121000,0.000000,11.992000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.121000,0.000000,15.548000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.121000,0.000000,15.548000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.026000,0.000000,11.484000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.026000,0.000000,11.865000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.026000,0.000000,11.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.994000,0.000000,11.484000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.994000,0.000000,11.865000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.994000,0.000000,11.865000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.248000,0.000000,11.230000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.772000,0.000000,11.230000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.248000,0.000000,11.230000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<18.010000,0.000000,11.039500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<18.010000,0.000000,16.500500>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<33.970000,0.000000,19.640000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<34.859000,0.000000,19.640000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<33.970000,0.000000,19.640000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<41.590000,0.000000,19.640000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<40.701000,0.000000,19.640000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<40.701000,0.000000,19.640000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<40.066000,0.000000,18.878000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<40.066000,0.000000,20.402000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<35.494000,0.000000,20.402000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<35.494000,0.000000,18.878000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.320000,0.000000,20.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.320000,0.000000,18.878000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.320000,0.000000,18.878000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.066000,0.000000,18.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.685000,0.000000,18.624000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.685000,0.000000,18.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.558000,0.000000,18.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.685000,0.000000,18.624000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<39.558000,0.000000,18.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.066000,0.000000,20.656000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.685000,0.000000,20.656000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.685000,0.000000,20.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.558000,0.000000,20.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.685000,0.000000,20.656000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.558000,0.000000,20.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.002000,0.000000,18.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.875000,0.000000,18.624000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.875000,0.000000,18.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.002000,0.000000,18.751000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.558000,0.000000,18.751000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.002000,0.000000,18.751000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.002000,0.000000,20.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.875000,0.000000,20.656000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<35.875000,0.000000,20.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.002000,0.000000,20.529000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.558000,0.000000,20.529000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.002000,0.000000,20.529000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.494000,0.000000,18.624000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.875000,0.000000,18.624000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.494000,0.000000,18.624000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.494000,0.000000,20.656000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.875000,0.000000,20.656000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.494000,0.000000,20.656000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.240000,0.000000,20.402000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.240000,0.000000,18.878000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.240000,0.000000,18.878000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<35.049500,0.000000,19.640000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<40.510500,0.000000,19.640000>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.240000,0.000000,18.270000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.240000,0.000000,17.381000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,-90.000000,0> translate<21.240000,0.000000,17.381000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.240000,0.000000,10.650000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.240000,0.000000,11.539000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,90.000000,0> translate<21.240000,0.000000,11.539000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<20.478000,0.000000,12.174000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<22.002000,0.000000,12.174000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<22.002000,0.000000,16.746000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<20.478000,0.000000,16.746000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.002000,0.000000,11.920000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.478000,0.000000,11.920000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.478000,0.000000,11.920000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.224000,0.000000,12.174000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.224000,0.000000,12.555000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.224000,0.000000,12.555000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.351000,0.000000,12.682000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.224000,0.000000,12.555000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.224000,0.000000,12.555000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.256000,0.000000,12.174000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.256000,0.000000,12.555000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.256000,0.000000,12.555000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.129000,0.000000,12.682000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.256000,0.000000,12.555000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.129000,0.000000,12.682000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.351000,0.000000,16.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.224000,0.000000,16.365000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.224000,0.000000,16.365000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.351000,0.000000,16.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.351000,0.000000,12.682000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.351000,0.000000,12.682000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.129000,0.000000,16.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.256000,0.000000,16.365000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.129000,0.000000,16.238000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.129000,0.000000,16.238000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.129000,0.000000,12.682000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.129000,0.000000,12.682000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.224000,0.000000,16.746000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.224000,0.000000,16.365000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.224000,0.000000,16.365000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.256000,0.000000,16.746000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.256000,0.000000,16.365000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.256000,0.000000,16.365000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.002000,0.000000,17.000000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.478000,0.000000,17.000000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.478000,0.000000,17.000000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<21.240000,0.000000,17.190500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-90.000000,0> translate<21.240000,0.000000,11.729500>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<14.290000,0.000000,6.040000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<15.179000,0.000000,6.040000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<14.290000,0.000000,6.040000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.910000,0.000000,6.040000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<21.021000,0.000000,6.040000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<21.021000,0.000000,6.040000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<20.386000,0.000000,5.278000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<20.386000,0.000000,6.802000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<15.814000,0.000000,6.802000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<15.814000,0.000000,5.278000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.640000,0.000000,6.802000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.640000,0.000000,5.278000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.640000,0.000000,5.278000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.386000,0.000000,5.024000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.005000,0.000000,5.024000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.005000,0.000000,5.024000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.878000,0.000000,5.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.005000,0.000000,5.024000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<19.878000,0.000000,5.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.386000,0.000000,7.056000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.005000,0.000000,7.056000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.005000,0.000000,7.056000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.878000,0.000000,6.929000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.005000,0.000000,7.056000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.878000,0.000000,6.929000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.322000,0.000000,5.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.195000,0.000000,5.024000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<16.195000,0.000000,5.024000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.322000,0.000000,5.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.878000,0.000000,5.151000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.322000,0.000000,5.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.322000,0.000000,6.929000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.195000,0.000000,7.056000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<16.195000,0.000000,7.056000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.322000,0.000000,6.929000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.878000,0.000000,6.929000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<16.322000,0.000000,6.929000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.814000,0.000000,5.024000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.195000,0.000000,5.024000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.814000,0.000000,5.024000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.814000,0.000000,7.056000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.195000,0.000000,7.056000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.814000,0.000000,7.056000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.560000,0.000000,6.802000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.560000,0.000000,5.278000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.560000,0.000000,5.278000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<15.369500,0.000000,6.040000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<20.830500,0.000000,6.040000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<39.570000,0.000000,23.830000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<40.459000,0.000000,23.830000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<39.570000,0.000000,23.830000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<47.190000,0.000000,23.830000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<46.301000,0.000000,23.830000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<46.301000,0.000000,23.830000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<45.666000,0.000000,23.068000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<45.666000,0.000000,24.592000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<41.094000,0.000000,24.592000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<41.094000,0.000000,23.068000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.920000,0.000000,24.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.920000,0.000000,23.068000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.920000,0.000000,23.068000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.666000,0.000000,22.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.285000,0.000000,22.814000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.285000,0.000000,22.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.158000,0.000000,22.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.285000,0.000000,22.814000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<45.158000,0.000000,22.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.666000,0.000000,24.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.285000,0.000000,24.846000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.285000,0.000000,24.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.158000,0.000000,24.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.285000,0.000000,24.846000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.158000,0.000000,24.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.602000,0.000000,22.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.475000,0.000000,22.814000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.475000,0.000000,22.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.602000,0.000000,22.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.158000,0.000000,22.941000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.602000,0.000000,22.941000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.602000,0.000000,24.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.475000,0.000000,24.846000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<41.475000,0.000000,24.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.602000,0.000000,24.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.158000,0.000000,24.719000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.602000,0.000000,24.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.094000,0.000000,22.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.475000,0.000000,22.814000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.094000,0.000000,22.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.094000,0.000000,24.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.475000,0.000000,24.846000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.094000,0.000000,24.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.840000,0.000000,24.592000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.840000,0.000000,23.068000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,-90.000000,0> translate<40.840000,0.000000,23.068000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<40.649500,0.000000,23.830000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<46.110500,0.000000,23.830000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<19.070000,0.000000,26.570000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<18.181000,0.000000,26.570000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<18.181000,0.000000,26.570000> }
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<11.450000,0.000000,26.570000>}
cylinder{<0,0,0><0,0.036000,0>0.254000 translate<12.339000,0.000000,26.570000>}
box{<0,0,-0.254000><0.889000,0.036000,0.254000> rotate<0,0.000000,0> translate<11.450000,0.000000,26.570000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<12.974000,0.000000,27.332000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<12.974000,0.000000,25.808000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<17.546000,0.000000,25.808000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<17.546000,0.000000,27.332000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.720000,0.000000,25.808000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.720000,0.000000,27.332000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<12.720000,0.000000,27.332000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.974000,0.000000,27.586000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.355000,0.000000,27.586000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.974000,0.000000,27.586000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.482000,0.000000,27.459000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.355000,0.000000,27.586000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<13.355000,0.000000,27.586000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.974000,0.000000,25.554000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.355000,0.000000,25.554000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.974000,0.000000,25.554000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.482000,0.000000,25.681000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.355000,0.000000,25.554000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.355000,0.000000,25.554000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.038000,0.000000,27.459000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.165000,0.000000,27.586000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.038000,0.000000,27.459000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.038000,0.000000,27.459000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.482000,0.000000,27.459000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.482000,0.000000,27.459000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.038000,0.000000,25.681000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.165000,0.000000,25.554000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.038000,0.000000,25.681000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.038000,0.000000,25.681000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.482000,0.000000,25.681000>}
box{<0,0,-0.076200><3.556000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.482000,0.000000,25.681000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.546000,0.000000,27.586000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.165000,0.000000,27.586000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.165000,0.000000,27.586000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.546000,0.000000,25.554000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.165000,0.000000,25.554000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.165000,0.000000,25.554000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.800000,0.000000,25.808000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.800000,0.000000,27.332000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.800000,0.000000,27.332000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<17.990500,0.000000,26.570000>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<12.529500,0.000000,26.570000>}
//SV1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.375000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.105000,0.000000,22.600000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.105000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.105000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.470000,0.000000,23.235000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<35.470000,0.000000,23.235000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.470000,0.000000,24.505000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.105000,0.000000,25.140000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.470000,0.000000,24.505000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.470000,0.000000,23.235000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.835000,0.000000,22.600000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.835000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.835000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.565000,0.000000,22.600000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.565000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.565000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.930000,0.000000,23.235000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<32.930000,0.000000,23.235000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.930000,0.000000,24.505000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.565000,0.000000,25.140000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.930000,0.000000,24.505000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.565000,0.000000,25.140000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.835000,0.000000,25.140000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.565000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.835000,0.000000,25.140000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.470000,0.000000,24.505000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.835000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.010000,0.000000,23.235000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.010000,0.000000,24.505000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.010000,0.000000,24.505000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.375000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.010000,0.000000,23.235000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.375000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.010000,0.000000,24.505000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.375000,0.000000,25.140000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<37.375000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.105000,0.000000,25.140000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.375000,0.000000,25.140000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.105000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.930000,0.000000,23.235000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.295000,0.000000,22.600000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.295000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.295000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.025000,0.000000,22.600000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.025000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.025000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.390000,0.000000,23.235000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<30.390000,0.000000,23.235000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.390000,0.000000,24.505000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.025000,0.000000,25.140000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.390000,0.000000,24.505000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.025000,0.000000,25.140000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.295000,0.000000,25.140000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<31.025000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.295000,0.000000,25.140000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.930000,0.000000,24.505000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<32.295000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.755000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.485000,0.000000,22.600000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.485000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.485000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.850000,0.000000,23.235000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<27.850000,0.000000,23.235000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.850000,0.000000,24.505000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.485000,0.000000,25.140000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.850000,0.000000,24.505000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.850000,0.000000,23.235000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.215000,0.000000,22.600000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.215000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.215000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.945000,0.000000,22.600000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.945000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.945000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.310000,0.000000,23.235000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<25.310000,0.000000,23.235000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.310000,0.000000,24.505000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.945000,0.000000,25.140000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.310000,0.000000,24.505000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.945000,0.000000,25.140000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.215000,0.000000,25.140000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.945000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.215000,0.000000,25.140000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.850000,0.000000,24.505000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<27.215000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.755000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.390000,0.000000,23.235000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.755000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.390000,0.000000,24.505000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.755000,0.000000,25.140000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.755000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.485000,0.000000,25.140000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.755000,0.000000,25.140000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.485000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.310000,0.000000,23.235000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.675000,0.000000,22.600000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.675000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.675000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.405000,0.000000,22.600000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.405000,0.000000,22.600000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.405000,0.000000,22.600000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.770000,0.000000,23.235000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<22.770000,0.000000,23.235000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.770000,0.000000,24.505000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.405000,0.000000,25.140000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.770000,0.000000,24.505000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.405000,0.000000,25.140000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.675000,0.000000,25.140000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.405000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.675000,0.000000,25.140000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.310000,0.000000,24.505000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<24.675000,0.000000,25.140000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.770000,0.000000,23.235000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.770000,0.000000,24.505000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.770000,0.000000,24.505000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<34.200000,0.000000,23.870000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<36.740000,0.000000,23.870000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<31.660000,0.000000,23.870000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<26.580000,0.000000,23.870000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<29.120000,0.000000,23.870000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<24.040000,0.000000,23.870000>}
//U$1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.220000,0.000000,14.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.220000,0.000000,4.220000>}
box{<0,0,-0.101600><10.160000,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.220000,0.000000,4.220000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.220000,0.000000,14.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.156000,0.000000,14.380000>}
box{<0,0,-0.101600><4.064000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.156000,0.000000,14.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.220000,0.000000,4.220000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.140000,0.000000,4.220000>}
box{<0,0,-0.101600><5.080000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.140000,0.000000,4.220000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.140000,0.000000,14.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.140000,0.000000,4.220000>}
box{<0,0,-0.101600><10.160000,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.140000,0.000000,4.220000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.140000,0.000000,14.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.156000,0.000000,14.380000>}
box{<0,0,-0.101600><1.016000,0.036000,0.101600> rotate<0,0.000000,0> translate<36.140000,0.000000,14.380000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.156000,0.000000,14.380000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.664000,0.000000,14.380000>}
box{<0,0,-0.101600><0.508000,0.036000,0.101600> rotate<0,0.000000,0> translate<37.156000,0.000000,14.380000> }
difference{
cylinder{<37.410000,0,13.110000><37.410000,0.036000,13.110000>0.845400 translate<0,0.000000,0>}
cylinder{<37.410000,-0.1,13.110000><37.410000,0.135000,13.110000>0.591400 translate<0,0.000000,0>}}
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.030000,0.000000,20.420000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.280000,0.000000,20.420000>}
box{<0,0,-0.127000><15.750000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.280000,0.000000,20.420000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.280000,0.000000,20.420000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.280000,0.000000,8.620000>}
box{<0,0,-0.127000><11.800000,0.036000,0.127000> rotate<0,-90.000000,0> translate<0.280000,0.000000,8.620000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.280000,0.000000,8.620000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.030000,0.000000,8.620000>}
box{<0,0,-0.127000><15.750000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.280000,0.000000,8.620000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.030000,0.000000,8.620000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<16.030000,0.000000,20.420000>}
box{<0,0,-0.127000><11.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<16.030000,0.000000,20.420000> }
object{ARC(0.500000,0.050800,180.000000,360.000000,0.036000) translate<10.660000,0.000000,16.980000>}
object{ARC(0.500000,0.050800,180.000000,360.000000,0.036000) translate<9.660000,0.000000,16.980000>}
object{ARC(0.500000,0.050800,0.000000,180.000000,0.036000) translate<10.160000,0.000000,10.855000>}
object{ARC(1.000000,0.050800,0.000000,180.000000,0.036000) translate<10.160000,0.000000,11.105000>}
object{ARC(1.891600,0.050800,352.405357,367.594643,0.036000) translate<8.785000,0.000000,10.605000>}
object{ARC(3.627100,0.050800,349.830509,361.889628,0.036000) translate<7.534900,0.000000,10.985400>}
object{ARC(2.374900,0.050800,180.250904,198.673740,0.036000) translate<11.534900,0.000000,11.115400>}
object{ARC(0.625000,0.050800,180.000000,360.000000,0.036000) translate<10.535000,0.000000,12.855000>}
object{ARC(0.187500,0.050800,180.000000,360.000000,0.036000) translate<10.472500,0.000000,13.230000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,18.355000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,18.355000>}
box{<0,0,-0.025400><2.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.160000,0.000000,18.355000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,18.355000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,17.730000>}
box{<0,0,-0.025400><0.625000,0.036000,0.025400> rotate<0,-90.000000,0> translate<9.160000,0.000000,17.730000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,17.730000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.160000,0.000000,17.730000>}
box{<0,0,-0.025400><1.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.160000,0.000000,17.730000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.160000,0.000000,17.730000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,17.730000>}
box{<0,0,-0.025400><1.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<10.160000,0.000000,17.730000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,17.730000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,18.355000>}
box{<0,0,-0.025400><0.625000,0.036000,0.025400> rotate<0,90.000000,0> translate<11.160000,0.000000,18.355000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,17.730000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.660000,0.000000,16.980000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-56.306216,0> translate<10.660000,0.000000,16.980000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.660000,0.000000,16.980000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.160000,0.000000,17.730000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,56.306216,0> translate<10.160000,0.000000,17.730000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.160000,0.000000,17.730000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.660000,0.000000,16.980000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-56.306216,0> translate<9.660000,0.000000,16.980000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.660000,0.000000,16.980000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,17.730000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,56.306216,0> translate<9.160000,0.000000,17.730000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,16.980000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,17.730000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,90.000000,0> translate<9.160000,0.000000,17.730000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,16.980000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,17.730000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,90.000000,0> translate<11.160000,0.000000,17.730000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,16.230000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,16.230000>}
box{<0,0,-0.025400><2.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.160000,0.000000,16.230000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,16.230000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,14.480000>}
box{<0,0,-0.025400><1.750000,0.036000,0.025400> rotate<0,-90.000000,0> translate<9.160000,0.000000,14.480000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,14.480000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.660000,0.000000,14.480000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.160000,0.000000,14.480000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.660000,0.000000,14.480000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.660000,0.000000,15.605000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,90.000000,0> translate<9.660000,0.000000,15.605000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.660000,0.000000,15.605000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.910000,0.000000,15.605000>}
box{<0,0,-0.025400><0.250000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.660000,0.000000,15.605000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.910000,0.000000,15.605000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.910000,0.000000,14.480000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,-90.000000,0> translate<9.910000,0.000000,14.480000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.910000,0.000000,14.480000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.410000,0.000000,14.480000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.910000,0.000000,14.480000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.410000,0.000000,14.480000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.410000,0.000000,15.605000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,90.000000,0> translate<10.410000,0.000000,15.605000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.410000,0.000000,15.605000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.660000,0.000000,15.605000>}
box{<0,0,-0.025400><0.250000,0.036000,0.025400> rotate<0,0.000000,0> translate<10.410000,0.000000,15.605000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.660000,0.000000,15.605000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.660000,0.000000,14.480000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.660000,0.000000,14.480000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.660000,0.000000,14.480000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,14.480000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<10.660000,0.000000,14.480000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,14.480000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,16.230000>}
box{<0,0,-0.025400><1.750000,0.036000,0.025400> rotate<0,90.000000,0> translate<11.160000,0.000000,16.230000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,14.230000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,14.230000>}
box{<0,0,-0.025400><2.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.160000,0.000000,14.230000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,14.230000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,13.605000>}
box{<0,0,-0.025400><0.625000,0.036000,0.025400> rotate<0,-90.000000,0> translate<9.160000,0.000000,13.605000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,13.605000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.910000,0.000000,13.605000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.160000,0.000000,13.605000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.910000,0.000000,13.605000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,13.105000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-33.687844,0> translate<9.160000,0.000000,13.105000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,13.105000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,12.355000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,-90.000000,0> translate<9.160000,0.000000,12.355000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.160000,0.000000,12.355000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.910000,0.000000,12.855000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-33.687844,0> translate<9.160000,0.000000,12.355000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.660000,0.000000,13.605000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.285000,0.000000,13.605000>}
box{<0,0,-0.025400><0.375000,0.036000,0.025400> rotate<0,0.000000,0> translate<10.285000,0.000000,13.605000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,14.230000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.160000,0.000000,12.855000>}
box{<0,0,-0.025400><1.375000,0.036000,0.025400> rotate<0,-90.000000,0> translate<11.160000,0.000000,12.855000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.660000,0.000000,13.605000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.660000,0.000000,13.230000>}
box{<0,0,-0.025400><0.375000,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.660000,0.000000,13.230000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.285000,0.000000,13.605000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.285000,0.000000,13.230000>}
box{<0,0,-0.025400><0.375000,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.285000,0.000000,13.230000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.160000,0.000000,10.855000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.160000,0.000000,10.355000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,-90.000000,0> translate<10.160000,0.000000,10.355000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.160000,0.000000,10.855000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.660000,0.000000,10.855000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.660000,0.000000,10.855000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.660000,0.000000,10.360000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.105000,0.000000,10.360000>}
box{<0,0,-0.025400><0.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<10.660000,0.000000,10.360000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<10.160000,0.000000,10.355000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<9.285000,0.000000,10.355000>}
box{<0,0,-0.025400><0.875000,0.036000,0.025400> rotate<0,0.000000,0> translate<9.285000,0.000000,10.355000> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  ATINY(-24.000000,0,-14.600000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
