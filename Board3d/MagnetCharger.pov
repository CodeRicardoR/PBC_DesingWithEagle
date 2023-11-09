//Archivo POVRay creado por 3d41.ulp v20110101
//C:/Users/Usuario/Documents/eagle/MagnetCharger/MagnetCharger.brd
//20/11/2021 08:33:15

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

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 291;
#local cam_z = -151;  

#local cam_a = 20;    

#local cam_look_x = 0;
#local cam_look_y = -6;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 90;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
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

#local lgt1_pos_x = 34;
#local lgt1_pos_y = 51;
#local lgt1_pos_z = 35;
#local lgt1_intense = 0.785965;
#local lgt2_pos_x = -34;
#local lgt2_pos_y = 51;
#local lgt2_pos_z = 35;
#local lgt2_intense = 0.785965;
#local lgt3_pos_x = 34;
#local lgt3_pos_y = 51;
#local lgt3_pos_z = -23;
#local lgt3_intense = 0.785965;
#local lgt4_pos_x = -34;
#local lgt4_pos_y = 51;
#local lgt4_pos_z = -23;
#local lgt4_intense = 0.785965;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 91.120000;
#declare pcb_y_size = 66.040000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(288);
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

#if(e3d_environment=on)
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

//Datos de animación
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
	//translate<-45.560000,0,-33.020000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro MAGNETCHARGER(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Circuito Impreso
prism{-1.500000,0.000000,8
<0.000000,0.000000><0.000000,66.040000>
<0.000000,66.040000><91.120000,66.040000>
<91.120000,66.040000><91.120000,0.000000>
<91.120000,0.000000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Taladros(real)/Componentes
//Taladros(real)/Circuito Impreso
//Taladros(real)/Vias
cylinder{<2.540000,0.095000,2.540000><2.540000,-1.595000,2.540000>1.143000 texture{col_hls}}
cylinder{<2.540000,0.095000,63.500000><2.540000,-1.595000,63.500000>1.143000 texture{col_hls}}
cylinder{<68.580000,0.095000,2.540000><68.580000,-1.595000,2.540000>1.143000 texture{col_hls}}
cylinder{<68.580000,0.095000,63.500000><68.580000,-1.595000,63.500000>1.143000 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Componentes
union{
#ifndef(pack_BAT) #declare global_pack_BAT=yes; object {CON_ARK_5MM_2()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<64.262000,0.000000,48.641000>}#end		//Screw Terminal conn. 2Pin (con-ptr500.lib) BAT  W237-102
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_ELKO_PANASONIC_E("47uF",)translate<0,-0,0> rotate<0,180.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<20.574000,-1.500000,59.309000>translate<0,-0.035000,0> }#end		//SMD Elko Panasonic E (rcl.lib) C1 47uF PANASONIC_E
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_ELKO_PANASONIC_E("100uF",)translate<0,-0,0> rotate<0,180.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<32.893000,-1.500000,47.244000>translate<0,-0.035000,0> }#end		//SMD Elko Panasonic E (rcl.lib) C2 100uF PANASONIC_E
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_SMD_ELKO_PANASONIC_E("47uF",)translate<0,-0,0> rotate<0,180.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<10.414000,-1.500000,59.309000>translate<0,-0.035000,0> }#end		//SMD Elko Panasonic E (rcl.lib) C3 47uF PANASONIC_E
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0603()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<14.224000,-1.500000,50.546000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0603 C4 0.1uF C0603
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0603()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<21.971000,-1.500000,50.546000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0603 C5 0.1uF C0603
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_0603()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<34.417000,-1.500000,54.737000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0603 C6 0.1uF C0603
#ifndef(pack_C8) #declare global_pack_C8=yes; object {CAP_SMD_CHIP_TT_SCT_A("",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<51.689000,-1.500000,41.910000>translate<0,-0.035000,0> }#end		//SMD Tantal Chip Bauform A  C8  A/3216-18W
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO201_152MM_H("1N5400",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<13.462000,0.000000,25.908000>}#end		//Diode DO201 15mm hor. D1 1N5400 DO201-15
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_DIS_DO201_152MM_H("1N5400",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<6.096000,0.000000,25.654000>}#end		//Diode DO201 15mm hor. D2 1N5400 DO201-15
#ifndef(pack_D3) #declare global_pack_D3=yes; object {DIODE_DIS_DO35_102MM_H("1N4148",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<39.751000,0.000000,29.210000>}#end		//Diode DO35 10mm hor. D3 1N4148 DO35-10
#ifndef(pack_F1) #declare global_pack_F1=yes; object {SPC_MURATA_NFE61P()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<26.289000,-1.500000,47.244000>}#end		//MURATA EMI FILTER F1  NFE-2706
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SO8("LT1121-5","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<18.161000,-1.500000,45.847000>translate<0,-0.035000,0> }#end		//SMD IC SO8 Package IC1 LT1121-5 SO08
#ifndef(pack_IC2) #declare global_pack_IC2=yes; object {IC_SMD_SO8("PIC12F675SN","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<37.846000,-1.500000,59.055000>translate<0,-0.035000,0> }#end		//SMD IC SO8 Package (microchip.lib) IC2 PIC12F675SN SO-08
#ifndef(pack_IC3) #declare global_pack_IC3=yes; object {IC_SMD_SO8("OP07CR","",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<50.927000,-1.500000,48.641000>translate<0,-0.035000,0> }#end		//SMD IC SO8 Package IC3 OP07CR SO08
#ifndef(pack_OK1) #declare global_pack_OK1=yes; object {IC_DIS_DIP6("4N45","",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<26.416000,0.000000,29.337000>translate<0,3.000000,0> }#end		//DIP6 OK1 4N45 DIL06
#ifndef(pack_OK1) object{SOCKET_DIP6()rotate<0,-180.000000,0> rotate<0,0,0> translate<26.416000,0.000000,29.337000>}#end					//IC-Sockel 6Pin OK1 4N45
#ifndef(pack_ON_OFF) #declare global_pack_ON_OFF=yes; object {DIODE_DIS_LED_3MM(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<27.940000,0.000000,60.071000>}#end		//Diskrete 3MM LED ON/OFF  LED3MM
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_CERAMIC_AXIAL_PW20_812MM_H("",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<42.130000,0.000000,5.913000>}#end		//resistor R1  R10W_48MM
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0603("102",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<26.543000,-1.500000,29.337000>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 R2 1K R0603
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0603("102",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<41.275000,-1.500000,54.737000>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 R3 1K R0603
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0805("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<56.261000,-1.500000,48.641000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R4 10K R0805
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0805("100",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<46.736000,-1.500000,41.910000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R5 10 R0805
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_0805("322",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<52.197000,-1.500000,54.610000>translate<0,-0.035000,0> }#end		//SMD Resistor 0805 R6 3.24K R0805
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_0603("102",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<31.877000,-1.500000,60.452000>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 R7 1K R0603
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_SMD_CHIP_0603("301",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<37.846000,-1.500000,63.373000>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 R8 300 R0603
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_SMD_CHIP_0603("301",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<44.323000,-1.500000,60.960000>translate<0,-0.035000,0> }#end		//SMD Resistor 0603 R9 300 R0603
#ifndef(pack_SERIAL) #declare global_pack_SERIAL=yes; object {CON_PHW_1X3()translate<0,0,-3.8> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<51.689000,0.000000,64.516000>}#end		//Header 2,54MM Grid 90deg (con-lstb.lib) SERIAL  1X03/90
#ifndef(pack_T1) #declare global_pack_T1=yes; object {TR_TO92_G("BC337",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<34.798000,0.000000,29.210000>}#end		//TO92 bend vertical T1 BC337 TO92
#ifndef(pack_VDC_IN) #declare global_pack_VDC_IN=yes; object {CON_ARK_5MM_3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<7.112000,0.000000,45.466000>}#end		//Screw Terminal conn. 3Pin (con-ptr500.lib) VDC_IN  W237-103
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Componentes
#ifndef(global_pack_BAT) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.790800,1.193800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<64.643000,0,46.141000> texture{col_thl}}
#ifndef(global_pack_BAT) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.790800,1.193800,1,16,3+global_tmp,100) rotate<0,-180.000000,0>translate<64.643000,0,51.141000> texture{col_thl}}
object{TOOLS_PCB_SMD(3.800000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.574000,-1.537000,56.309000>}
object{TOOLS_PCB_SMD(3.800000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<20.574000,-1.537000,62.309000>}
object{TOOLS_PCB_SMD(3.800000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<32.893000,-1.537000,44.244000>}
object{TOOLS_PCB_SMD(3.800000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<32.893000,-1.537000,50.244000>}
object{TOOLS_PCB_SMD(3.800000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.414000,-1.537000,56.309000>}
object{TOOLS_PCB_SMD(3.800000,1.400000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<10.414000,-1.537000,62.309000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<13.374000,-1.537000,50.546000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<15.074000,-1.537000,50.546000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<22.821000,-1.537000,50.546000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<21.121000,-1.537000,50.546000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<35.267000,-1.537000,54.737000>}
object{TOOLS_PCB_SMD(1.100000,1.000000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<33.567000,-1.537000,54.737000>}
object{TOOLS_PCB_SMD(2.150000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<50.214000,-1.537000,41.910000>}
object{TOOLS_PCB_SMD(2.150000,1.800000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<53.164000,-1.537000,41.910000>}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.248000,1.498600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<13.462000,0,33.528000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.248000,1.498600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<13.462000,0,18.288000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.248000,1.498600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<6.096000,0,33.274000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.248000,1.498600,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<6.096000,0,18.034000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<39.751000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_D3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<39.751000,0,24.130000> texture{col_thl}}
object{TOOLS_PCB_SMD(2.000000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.289000,-1.537000,50.644000>}
object{TOOLS_PCB_SMD(2.000000,2.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.289000,-1.537000,47.244000>}
object{TOOLS_PCB_SMD(2.000000,1.600000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<26.289000,-1.537000,43.844000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.234400,-1.537000,47.752000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.234400,-1.537000,46.482000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.234400,-1.537000,45.212000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<21.234400,-1.537000,43.942000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.087600,-1.537000,43.942000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.087600,-1.537000,45.212000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.087600,-1.537000,46.482000>}
object{TOOLS_PCB_SMD(0.660400,2.032000,0.037000,0) rotate<0,-270.000000,0> texture{col_pds} translate<15.087600,-1.537000,47.752000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.246000,-1.537000,57.150000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.246000,-1.537000,58.420000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.246000,-1.537000,59.690000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<35.246000,-1.537000,60.960000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.446000,-1.537000,60.960000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.446000,-1.537000,59.690000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.446000,-1.537000,58.420000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<40.446000,-1.537000,57.150000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.022000,-1.537000,51.241000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<50.292000,-1.537000,51.241000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.562000,-1.537000,51.241000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.832000,-1.537000,51.241000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<52.832000,-1.537000,46.041000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.562000,-1.537000,46.041000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<50.292000,-1.537000,46.041000>}
object{TOOLS_PCB_SMD(0.600000,2.200000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<49.022000,-1.537000,46.041000>}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<51.085000,0,23.210000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<51.085000,0,35.210000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<49.085000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<63.285000,0,35.210000> texture{col_thl}}
#ifndef(global_pack_K1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<63.285000,0,23.210000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-90.000000,0>translate<28.956000,0,33.147000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-90.000000,0>translate<26.416000,0,33.147000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-90.000000,0>translate<23.876000,0,33.147000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-270.000000,0>translate<23.876000,0,25.527000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-270.000000,0>translate<26.416000,0,25.527000> texture{col_thl}}
#ifndef(global_pack_OK1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,4+global_tmp,100) rotate<0,-270.000000,0>translate<28.956000,0,25.527000> texture{col_thl}}
#ifndef(global_pack_ON_OFF) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.940000,0,61.341000> texture{col_thl}}
#ifndef(global_pack_ON_OFF) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<27.940000,0,58.801000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.500000,1.100000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<11.630000,0,5.913000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(2.500000,1.100000,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<72.630000,0,5.913000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<25.693000,-1.537000,29.337000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<27.393000,-1.537000,29.337000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<40.425000,-1.537000,54.737000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<42.125000,-1.537000,54.737000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.261000,-1.537000,47.691000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<56.261000,-1.537000,49.591000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<47.686000,-1.537000,41.910000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<45.786000,-1.537000,41.910000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<51.247000,-1.537000,54.610000>}
object{TOOLS_PCB_SMD(1.300000,1.500000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<53.147000,-1.537000,54.610000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.877000,-1.537000,59.602000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-90.000000,0> texture{col_pds} translate<31.877000,-1.537000,61.302000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<38.696000,-1.537000,63.373000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-180.000000,0> texture{col_pds} translate<36.996000,-1.537000,63.373000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<43.473000,-1.537000,60.960000>}
object{TOOLS_PCB_SMD(1.000000,1.100000,0.037000,0) rotate<0,-0.000000,0> texture{col_pds} translate<45.173000,-1.537000,60.960000>}
#ifndef(global_pack_SERIAL) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<49.149000,0,60.706000> texture{col_thl}}
#ifndef(global_pack_SERIAL) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<51.689000,0,60.706000> texture{col_thl}}
#ifndef(global_pack_SERIAL) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,3+global_tmp,100) rotate<0,-90.000000,0>translate<54.229000,0,60.706000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<34.798000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<32.893000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_T1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<34.798000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_VDC_IN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.790800,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<5.822000,0,50.466000> texture{col_thl}}
#ifndef(global_pack_VDC_IN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.790800,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<5.822000,0,45.466000> texture{col_thl}}
#ifndef(global_pack_VDC_IN) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.790800,1.193800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<5.822000,0,40.466000> texture{col_thl}}
//Pads/Vias
object{TOOLS_PCB_VIA(1.422400,0.700000,1,16,1,0) translate<41.529000,0,44.323000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.700000,1,16,1,0) translate<45.720000,0,44.323000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.700000,1,16,1,0) translate<38.989000,0,48.768000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.422400,0.700000,1,16,1,0) translate<38.989000,0,39.751000> texture{col_thl}}
object{TOOLS_PCB_VIA(3.810000,2.286000,1,16,1,0) translate<2.540000,0,2.540000> texture{col_thl}}
object{TOOLS_PCB_VIA(3.810000,2.286000,1,16,1,0) translate<68.580000,0,2.540000> texture{col_thl}}
object{TOOLS_PCB_VIA(3.810000,2.286000,1,16,1,0) translate<2.540000,0,63.500000> texture{col_thl}}
object{TOOLS_PCB_VIA(3.810000,2.286000,1,16,1,0) translate<68.580000,0,63.500000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Senales
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.822000,-1.535000,50.466000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.822000,-1.535000,52.558000>}
box{<0,0,-0.406400><2.092000,0.035000,0.406400> rotate<0,90.000000,0> translate<5.822000,-1.535000,52.558000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<6.096000,-1.535000,8.529000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<6.096000,-1.535000,18.034000>}
box{<0,0,-0.889000><9.505000,0.035000,0.889000> rotate<0,90.000000,0> translate<6.096000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<5.822000,-1.535000,40.466000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<6.096000,-1.535000,40.192000>}
box{<0,0,-0.889000><0.387495,0.035000,0.889000> rotate<0,44.997030,0> translate<5.822000,-1.535000,40.466000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<6.096000,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<6.096000,-1.535000,40.192000>}
box{<0,0,-0.889000><6.918000,0.035000,0.889000> rotate<0,90.000000,0> translate<6.096000,-1.535000,40.192000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<6.096000,-1.535000,33.274000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<6.350000,-1.535000,33.528000>}
box{<0,0,-0.889000><0.359210,0.035000,0.889000> rotate<0,-44.997030,0> translate<6.096000,-1.535000,33.274000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<5.822000,-1.535000,52.558000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.573000,-1.535000,56.309000>}
box{<0,0,-0.406400><5.304715,0.035000,0.406400> rotate<0,-44.997030,0> translate<5.822000,-1.535000,52.558000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<9.573000,-1.535000,56.309000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.414000,-1.535000,56.309000>}
box{<0,0,-0.406400><0.841000,0.035000,0.406400> rotate<0,0.000000,0> translate<9.573000,-1.535000,56.309000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<6.096000,-1.535000,8.529000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<11.630000,-1.535000,5.913000>}
box{<0,0,-0.889000><6.121161,0.035000,0.889000> rotate<0,25.299093,0> translate<6.096000,-1.535000,8.529000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<6.096000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<13.208000,-1.535000,18.034000>}
box{<0,0,-0.889000><7.112000,0.035000,0.889000> rotate<0,0.000000,0> translate<6.096000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.335000,-1.535000,56.309000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.335000,-1.535000,50.585000>}
box{<0,0,-0.406400><5.724000,0.035000,0.406400> rotate<0,-90.000000,0> translate<13.335000,-1.535000,50.585000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.414000,-1.535000,56.309000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.335000,-1.535000,56.309000>}
box{<0,0,-0.406400><2.921000,0.035000,0.406400> rotate<0,0.000000,0> translate<10.414000,-1.535000,56.309000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.374000,-1.535000,50.546000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.374000,-1.535000,48.348000>}
box{<0,0,-0.203200><2.198000,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.374000,-1.535000,48.348000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.374000,-1.535000,50.546000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.374000,-1.535000,50.466000>}
box{<0,0,-0.203200><0.080000,0.035000,0.203200> rotate<0,-90.000000,0> translate<13.374000,-1.535000,50.466000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.335000,-1.535000,50.585000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.374000,-1.535000,50.546000>}
box{<0,0,-0.406400><0.055154,0.035000,0.406400> rotate<0,44.997030,0> translate<13.335000,-1.535000,50.585000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<13.208000,-1.535000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<13.462000,-1.535000,18.288000>}
box{<0,0,-0.889000><0.359210,0.035000,0.889000> rotate<0,-44.997030,0> translate<13.208000,-1.535000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<6.350000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<13.462000,-1.535000,33.528000>}
box{<0,0,-0.889000><7.112000,0.035000,0.889000> rotate<0,0.000000,0> translate<6.350000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.374000,-1.535000,48.348000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,-1.535000,47.752000>}
box{<0,0,-0.203200><0.842871,0.035000,0.203200> rotate<0,44.997030,0> translate<13.374000,-1.535000,48.348000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.087600,-1.535000,47.752000>}
box{<0,0,-0.203200><1.117600,0.035000,0.203200> rotate<0,0.000000,0> translate<13.970000,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.161000,-1.535000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.161000,-1.535000,46.355000>}
box{<0,0,-0.406400><21.844000,0.035000,0.406400> rotate<0,90.000000,0> translate<18.161000,-1.535000,46.355000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.161000,-1.535000,46.355000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.304000,-1.535000,47.498000>}
box{<0,0,-0.406400><1.616446,0.035000,0.406400> rotate<0,-44.997030,0> translate<18.161000,-1.535000,46.355000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.304000,-1.535000,47.498000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.558000,-1.535000,47.752000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.304000,-1.535000,47.498000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.335000,-1.535000,56.309000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<20.574000,-1.535000,56.309000>}
box{<0,0,-0.406400><7.239000,0.035000,0.406400> rotate<0,0.000000,0> translate<13.335000,-1.535000,56.309000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.558000,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,-1.535000,47.752000>}
box{<0,0,-0.203200><1.676400,0.035000,0.203200> rotate<0,0.000000,0> translate<19.558000,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.161000,-1.535000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.225000,-1.535000,20.447000>}
box{<0,0,-0.406400><5.747364,0.035000,0.406400> rotate<0,44.997030,0> translate<18.161000,-1.535000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<21.234400,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,47.752000>}
box{<0,0,-0.203200><1.117600,0.035000,0.203200> rotate<0,0.000000,0> translate<21.234400,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.352000,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.821000,-1.535000,48.221000>}
box{<0,0,-0.203200><0.663266,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.352000,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.821000,-1.535000,48.221000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.821000,-1.535000,50.546000>}
box{<0,0,-0.203200><2.325000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.821000,-1.535000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.821000,-1.535000,50.546000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.919000,-1.535000,50.644000>}
box{<0,0,-0.203200><0.138593,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.821000,-1.535000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.876000,-1.535000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.876000,-1.535000,27.940000>}
box{<0,0,-0.406400><2.413000,0.035000,0.406400> rotate<0,90.000000,0> translate<23.876000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.225000,-1.535000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.765000,-1.535000,20.447000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<22.225000,-1.535000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<23.876000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<25.273000,-1.535000,29.337000>}
box{<0,0,-0.406400><1.975656,0.035000,0.406400> rotate<0,-44.997030,0> translate<23.876000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.273000,-1.535000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.693000,-1.535000,29.337000>}
box{<0,0,-0.203200><0.420000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.273000,-1.535000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.919000,-1.535000,50.644000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.289000,-1.535000,50.644000>}
box{<0,0,-0.203200><3.370000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.919000,-1.535000,50.644000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.765000,-1.535000,20.447000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.416000,-1.535000,22.098000>}
box{<0,0,-0.406400><2.334867,0.035000,0.406400> rotate<0,-44.997030,0> translate<24.765000,-1.535000,20.447000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.416000,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.416000,-1.535000,25.527000>}
box{<0,0,-0.406400><3.429000,0.035000,0.406400> rotate<0,90.000000,0> translate<26.416000,-1.535000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.289000,-1.535000,43.844000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.689000,-1.535000,44.244000>}
box{<0,0,-0.203200><0.565685,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.289000,-1.535000,43.844000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.393000,-1.535000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.520000,-1.535000,29.210000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<27.393000,-1.535000,29.337000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,-1.535000,61.341000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979000,-1.535000,61.302000>}
box{<0,0,-0.203200><0.055154,0.035000,0.203200> rotate<0,44.997030,0> translate<27.940000,-1.535000,61.341000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<26.416000,-1.535000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.956000,-1.535000,25.527000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,0.000000,0> translate<26.416000,-1.535000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,-1.535000,33.147000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,-1.535000,35.941000>}
box{<0,0,-0.203200><2.794000,0.035000,0.203200> rotate<0,90.000000,0> translate<28.956000,-1.535000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.979000,-1.535000,61.302000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.877000,-1.535000,61.302000>}
box{<0,0,-0.203200><3.898000,0.035000,0.203200> rotate<0,0.000000,0> translate<27.979000,-1.535000,61.302000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.877000,-1.535000,59.602000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.965000,-1.535000,59.690000>}
box{<0,0,-0.203200><0.124451,0.035000,0.203200> rotate<0,-44.997030,0> translate<31.877000,-1.535000,59.602000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.956000,-1.535000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.766000,-1.535000,39.751000>}
box{<0,0,-0.203200><5.388154,0.035000,0.203200> rotate<0,-44.997030,0> translate<28.956000,-1.535000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<27.520000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<32.893000,-1.535000,29.210000>}
box{<0,0,-0.406400><5.373000,0.035000,0.406400> rotate<0,0.000000,0> translate<27.520000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.689000,-1.535000,44.244000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.893000,-1.535000,44.244000>}
box{<0,0,-0.203200><6.204000,0.035000,0.203200> rotate<0,0.000000,0> translate<26.689000,-1.535000,44.244000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.893000,-1.535000,44.244000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,44.244000>}
box{<0,0,-0.203200><2.159000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.893000,-1.535000,44.244000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.965000,-1.535000,59.690000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.246000,-1.535000,59.690000>}
box{<0,0,-0.203200><3.281000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.965000,-1.535000,59.690000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.246000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.246000,-1.535000,62.170000>}
box{<0,0,-0.203200><1.210000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.246000,-1.535000,62.170000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,44.244000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.267000,-1.535000,44.459000>}
box{<0,0,-0.203200><0.304056,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.052000,-1.535000,44.244000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.267000,-1.535000,44.459000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.267000,-1.535000,54.737000>}
box{<0,0,-0.203200><10.278000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.267000,-1.535000,54.737000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.246000,-1.535000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.267000,-1.535000,57.129000>}
box{<0,0,-0.203200><0.029698,0.035000,0.203200> rotate<0,44.997030,0> translate<35.246000,-1.535000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.267000,-1.535000,54.737000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.267000,-1.535000,57.129000>}
box{<0,0,-0.203200><2.392000,0.035000,0.203200> rotate<0,90.000000,0> translate<35.267000,-1.535000,57.129000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.798000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.941000,-1.535000,27.940000>}
box{<0,0,-0.406400><1.143000,0.035000,0.406400> rotate<0,0.000000,0> translate<34.798000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.246000,-1.535000,62.170000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.449000,-1.535000,63.373000>}
box{<0,0,-0.203200><1.701299,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.246000,-1.535000,62.170000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.246000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.957000,-1.535000,58.420000>}
box{<0,0,-0.203200><1.711000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.246000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.449000,-1.535000,63.373000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.996000,-1.535000,63.373000>}
box{<0,0,-0.203200><0.547000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.449000,-1.535000,63.373000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.227000,-1.535000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.227000,-1.535000,55.753000>}
box{<0,0,-0.203200><1.397000,0.035000,0.203200> rotate<0,-90.000000,0> translate<38.227000,-1.535000,55.753000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.957000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.227000,-1.535000,57.150000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<36.957000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<28.956000,-1.535000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.354000,-1.535000,25.527000>}
box{<0,0,-0.406400><9.398000,0.035000,0.406400> rotate<0,0.000000,0> translate<28.956000,-1.535000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<32.766000,-1.535000,39.751000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.989000,-1.535000,39.751000>}
box{<0,0,-0.203200><6.223000,0.035000,0.203200> rotate<0,0.000000,0> translate<32.766000,-1.535000,39.751000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.989000,0.000000,39.751000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.989000,0.000000,48.768000>}
box{<0,0,-0.203200><9.017000,0.035000,0.203200> rotate<0,90.000000,0> translate<38.989000,0.000000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.227000,-1.535000,55.753000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.243000,-1.535000,54.737000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<38.227000,-1.535000,55.753000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<38.354000,-1.535000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.751000,-1.535000,24.130000>}
box{<0,0,-0.406400><1.975656,0.035000,0.406400> rotate<0,44.997030,0> translate<38.354000,-1.535000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<35.941000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.751000,-1.535000,31.750000>}
box{<0,0,-0.406400><5.388154,0.035000,0.406400> rotate<0,-44.997030,0> translate<35.941000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.751000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.751000,-1.535000,34.290000>}
box{<0,0,-0.406400><2.540000,0.035000,0.406400> rotate<0,90.000000,0> translate<39.751000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.243000,-1.535000,54.737000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.425000,-1.535000,54.737000>}
box{<0,0,-0.203200><1.182000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.243000,-1.535000,54.737000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.751000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.671000,-1.535000,23.210000>}
box{<0,0,-0.406400><1.301076,0.035000,0.406400> rotate<0,44.997030,0> translate<39.751000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<39.751000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.671000,-1.535000,35.210000>}
box{<0,0,-0.406400><1.301076,0.035000,0.406400> rotate<0,-44.997030,0> translate<39.751000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.052000,-1.535000,44.244000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.450000,-1.535000,44.244000>}
box{<0,0,-0.203200><6.398000,0.035000,0.203200> rotate<0,0.000000,0> translate<35.052000,-1.535000,44.244000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.450000,-1.535000,44.244000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.529000,-1.535000,44.323000>}
box{<0,0,-0.203200><0.111723,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.450000,-1.535000,44.244000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.989000,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.125000,-1.535000,51.904000>}
box{<0,0,-0.203200><4.434974,0.035000,0.203200> rotate<0,-44.997030,0> translate<38.989000,-1.535000,48.768000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.125000,-1.535000,51.904000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.125000,-1.535000,54.737000>}
box{<0,0,-0.203200><2.833000,0.035000,0.203200> rotate<0,90.000000,0> translate<42.125000,-1.535000,54.737000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.446000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,-1.535000,58.420000>}
box{<0,0,-0.203200><2.480000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.446000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<40.446000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<43.473000,-1.535000,60.960000>}
box{<0,0,-0.203200><3.027000,0.035000,0.203200> rotate<0,0.000000,0> translate<40.446000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.926000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.466000,-1.535000,55.880000>}
box{<0,0,-0.203200><3.592102,0.035000,0.203200> rotate<0,44.997030,0> translate<42.926000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.466000,-1.535000,49.911000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.466000,-1.535000,55.880000>}
box{<0,0,-0.203200><5.969000,0.035000,0.203200> rotate<0,90.000000,0> translate<45.466000,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,-1.535000,44.323000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,-1.535000,41.976000>}
box{<0,0,-0.203200><2.347000,0.035000,0.203200> rotate<0,-90.000000,0> translate<45.720000,-1.535000,41.976000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.529000,0.000000,44.323000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,0.000000,44.323000>}
box{<0,0,-0.203200><4.191000,0.035000,0.203200> rotate<0,0.000000,0> translate<41.529000,0.000000,44.323000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.720000,-1.535000,41.976000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.786000,-1.535000,41.910000>}
box{<0,0,-0.203200><0.093338,0.035000,0.203200> rotate<0,44.997030,0> translate<45.720000,-1.535000,41.976000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.466000,-1.535000,49.911000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,-1.535000,49.022000>}
box{<0,0,-0.203200><1.257236,0.035000,0.203200> rotate<0,44.997030,0> translate<45.466000,-1.535000,49.911000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<45.173000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.895000,-1.535000,60.960000>}
box{<0,0,-0.203200><3.722000,0.035000,0.203200> rotate<0,0.000000,0> translate<45.173000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<48.895000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.149000,-1.535000,60.706000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<48.895000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<47.686000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.214000,-1.535000,41.910000>}
box{<0,0,-0.203200><2.528000,0.035000,0.203200> rotate<0,0.000000,0> translate<47.686000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.214000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,41.910000>}
box{<0,0,-0.203200><0.078000,0.035000,0.203200> rotate<0,0.000000,0> translate<50.214000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,46.041000>}
box{<0,0,-0.203200><4.131000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.292000,-1.535000,46.041000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,48.895000>}
box{<0,0,-0.203200><0.127000,0.035000,0.203200> rotate<0,-90.000000,0> translate<50.292000,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<46.355000,-1.535000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,49.022000>}
box{<0,0,-0.203200><3.937000,0.035000,0.203200> rotate<0,0.000000,0> translate<46.355000,-1.535000,49.022000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,51.241000>}
box{<0,0,-0.203200><2.219000,0.035000,0.203200> rotate<0,90.000000,0> translate<50.292000,-1.535000,51.241000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.696000,-1.535000,63.373000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.927000,-1.535000,63.373000>}
box{<0,0,-0.203200><12.231000,0.035000,0.203200> rotate<0,0.000000,0> translate<38.696000,-1.535000,63.373000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.671000,-1.535000,23.210000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.085000,-1.535000,23.210000>}
box{<0,0,-0.406400><10.414000,0.035000,0.406400> rotate<0,0.000000,0> translate<40.671000,-1.535000,23.210000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<40.671000,-1.535000,35.210000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<51.085000,-1.535000,35.210000>}
box{<0,0,-0.406400><10.414000,0.035000,0.406400> rotate<0,0.000000,0> translate<40.671000,-1.535000,35.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,47.625000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,46.041000>}
box{<0,0,-0.203200><1.584000,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.562000,-1.535000,46.041000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.292000,-1.535000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,47.625000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<50.292000,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,49.276000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,51.241000>}
box{<0,0,-0.203200><1.965000,0.035000,0.203200> rotate<0,90.000000,0> translate<51.562000,-1.535000,51.241000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.247000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,54.295000>}
box{<0,0,-0.203200><0.445477,0.035000,0.203200> rotate<0,44.997030,0> translate<51.247000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,51.241000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,54.295000>}
box{<0,0,-0.203200><3.054000,0.035000,0.203200> rotate<0,90.000000,0> translate<51.562000,-1.535000,54.295000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.689000,-1.535000,62.611000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.689000,-1.535000,60.706000>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,-90.000000,0> translate<51.689000,-1.535000,60.706000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.927000,-1.535000,63.373000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.689000,-1.535000,62.611000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<50.927000,-1.535000,63.373000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.562000,-1.535000,49.276000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.197000,-1.535000,48.641000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,44.997030,0> translate<51.562000,-1.535000,49.276000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,-1.535000,51.241000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,-1.535000,54.295000>}
box{<0,0,-0.203200><3.054000,0.035000,0.203200> rotate<0,90.000000,0> translate<52.832000,-1.535000,54.295000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.832000,-1.535000,54.295000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.147000,-1.535000,54.610000>}
box{<0,0,-0.203200><0.445477,0.035000,0.203200> rotate<0,-44.997030,0> translate<52.832000,-1.535000,54.295000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.197000,-1.535000,48.641000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.975000,-1.535000,48.641000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.197000,-1.535000,48.641000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<49.085000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<54.483000,-1.535000,29.210000>}
box{<0,0,-0.889000><5.398000,0.035000,0.889000> rotate<0,0.000000,0> translate<49.085000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.975000,-1.535000,48.641000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.925000,-1.535000,49.591000>}
box{<0,0,-0.203200><1.343503,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.975000,-1.535000,48.641000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.261000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.261000,-1.535000,47.691000>}
box{<0,0,-0.203200><0.955000,0.035000,0.203200> rotate<0,90.000000,0> translate<56.261000,-1.535000,47.691000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.925000,-1.535000,49.591000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.261000,-1.535000,49.591000>}
box{<0,0,-0.203200><1.336000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.925000,-1.535000,49.591000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<54.483000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<56.896000,-1.535000,26.797000>}
box{<0,0,-0.889000><3.412497,0.035000,0.889000> rotate<0,44.997030,0> translate<54.483000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<56.896000,-1.535000,16.657000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<56.896000,-1.535000,26.797000>}
box{<0,0,-0.889000><10.140000,0.035000,0.889000> rotate<0,90.000000,0> translate<56.896000,-1.535000,26.797000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<57.912000,-1.535000,34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<57.912000,-1.535000,43.688000>}
box{<0,0,-0.889000><9.271000,0.035000,0.889000> rotate<0,90.000000,0> translate<57.912000,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.261000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.610500,-1.535000,44.386500>}
box{<0,0,-0.203200><3.322695,0.035000,0.203200> rotate<0,44.997030,0> translate<56.261000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<57.912000,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<58.610500,-1.535000,44.386500>}
box{<0,0,-0.889000><0.987828,0.035000,0.889000> rotate<0,-44.997030,0> translate<57.912000,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<58.610500,-1.535000,44.386500>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<60.365000,-1.535000,46.141000>}
box{<0,0,-0.889000><2.481238,0.035000,0.889000> rotate<0,-44.997030,0> translate<58.610500,-1.535000,44.386500> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<57.912000,-1.535000,34.417000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<63.285000,-1.535000,29.044000>}
box{<0,0,-0.889000><7.598569,0.035000,0.889000> rotate<0,44.997030,0> translate<57.912000,-1.535000,34.417000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<63.285000,-1.535000,23.210000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<63.285000,-1.535000,29.044000>}
box{<0,0,-0.889000><5.834000,0.035000,0.889000> rotate<0,90.000000,0> translate<63.285000,-1.535000,29.044000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<60.365000,-1.535000,46.141000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<64.643000,-1.535000,46.141000>}
box{<0,0,-0.889000><4.278000,0.035000,0.889000> rotate<0,0.000000,0> translate<60.365000,-1.535000,46.141000> }
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<56.896000,-1.535000,16.657000>}
cylinder{<0,0,0><0,0.035000,0>0.889000 translate<72.630000,-1.535000,5.913000>}
box{<0,0,-0.889000><19.052357,0.035000,0.889000> rotate<0,34.325044,0> translate<56.896000,-1.535000,16.657000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polígonos
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-0.635000,-1.535000,-0.762000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-0.635000,-1.535000,66.548000>}
box{<0,0,-0.152400><67.310000,0.035000,0.152400> rotate<0,90.000000,0> translate<-0.635000,-1.535000,66.548000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-0.635000,-1.535000,-0.762000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.263000,-1.535000,-0.762000>}
box{<0,0,-0.152400><72.898000,0.035000,0.152400> rotate<0,0.000000,0> translate<-0.635000,-1.535000,-0.762000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<-0.635000,-1.535000,66.548000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.263000,-1.535000,66.548000>}
box{<0,0,-0.152400><72.898000,0.035000,0.152400> rotate<0,0.000000,0> translate<-0.635000,-1.535000,66.548000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.263000,-1.535000,66.548000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<72.263000,-1.535000,-0.762000>}
box{<0,0,-0.152400><67.310000,0.035000,0.152400> rotate<0,-90.000000,0> translate<72.263000,-1.535000,-0.762000> }
texture{col_pol}
}
#end
union{
cylinder{<64.643000,0.038000,46.141000><64.643000,-1.538000,46.141000>0.596900}
cylinder{<64.643000,0.038000,51.141000><64.643000,-1.538000,51.141000>0.596900}
cylinder{<13.462000,0.038000,33.528000><13.462000,-1.538000,33.528000>0.749300}
cylinder{<13.462000,0.038000,18.288000><13.462000,-1.538000,18.288000>0.749300}
cylinder{<6.096000,0.038000,33.274000><6.096000,-1.538000,33.274000>0.749300}
cylinder{<6.096000,0.038000,18.034000><6.096000,-1.538000,18.034000>0.749300}
cylinder{<39.751000,0.038000,34.290000><39.751000,-1.538000,34.290000>0.406400}
cylinder{<39.751000,0.038000,24.130000><39.751000,-1.538000,24.130000>0.406400}
cylinder{<51.085000,0.038000,23.210000><51.085000,-1.538000,23.210000>0.650000}
cylinder{<51.085000,0.038000,35.210000><51.085000,-1.538000,35.210000>0.650000}
cylinder{<49.085000,0.038000,29.210000><49.085000,-1.538000,29.210000>0.650000}
cylinder{<63.285000,0.038000,35.210000><63.285000,-1.538000,35.210000>0.650000}
cylinder{<63.285000,0.038000,23.210000><63.285000,-1.538000,23.210000>0.650000}
cylinder{<28.956000,0.038000,33.147000><28.956000,-1.538000,33.147000>0.406400}
cylinder{<26.416000,0.038000,33.147000><26.416000,-1.538000,33.147000>0.406400}
cylinder{<23.876000,0.038000,33.147000><23.876000,-1.538000,33.147000>0.406400}
cylinder{<23.876000,0.038000,25.527000><23.876000,-1.538000,25.527000>0.406400}
cylinder{<26.416000,0.038000,25.527000><26.416000,-1.538000,25.527000>0.406400}
cylinder{<28.956000,0.038000,25.527000><28.956000,-1.538000,25.527000>0.406400}
cylinder{<27.940000,0.038000,61.341000><27.940000,-1.538000,61.341000>0.406400}
cylinder{<27.940000,0.038000,58.801000><27.940000,-1.538000,58.801000>0.406400}
cylinder{<11.630000,0.038000,5.913000><11.630000,-1.538000,5.913000>0.550000}
cylinder{<72.630000,0.038000,5.913000><72.630000,-1.538000,5.913000>0.550000}
cylinder{<49.149000,0.038000,60.706000><49.149000,-1.538000,60.706000>0.508000}
cylinder{<51.689000,0.038000,60.706000><51.689000,-1.538000,60.706000>0.508000}
cylinder{<54.229000,0.038000,60.706000><54.229000,-1.538000,60.706000>0.508000}
cylinder{<34.798000,0.038000,30.480000><34.798000,-1.538000,30.480000>0.406400}
cylinder{<32.893000,0.038000,29.210000><32.893000,-1.538000,29.210000>0.406400}
cylinder{<34.798000,0.038000,27.940000><34.798000,-1.538000,27.940000>0.406400}
cylinder{<5.822000,0.038000,50.466000><5.822000,-1.538000,50.466000>0.596900}
cylinder{<5.822000,0.038000,45.466000><5.822000,-1.538000,45.466000>0.596900}
cylinder{<5.822000,0.038000,40.466000><5.822000,-1.538000,40.466000>0.596900}
//Taladros(rápido)/Vias
cylinder{<41.529000,0.038000,44.323000><41.529000,-1.538000,44.323000>0.350000 }
cylinder{<45.720000,0.038000,44.323000><45.720000,-1.538000,44.323000>0.350000 }
cylinder{<38.989000,0.038000,48.768000><38.989000,-1.538000,48.768000>0.350000 }
cylinder{<38.989000,0.038000,39.751000><38.989000,-1.538000,39.751000>0.350000 }
//Taladros(rápido)/Circuito Impreso
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Pantalla artificial
union{
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.159000,0.000000,40.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.497800,0.000000,40.717000>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<12.159000,0.000000,40.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.828400,0.000000,41.386400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.828400,0.000000,40.047600>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<12.828400,0.000000,40.047600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.170300,0.000000,41.051700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.839700,0.000000,41.721200>}
box{<0,0,-0.088900><0.946745,0.036000,0.088900> rotate<0,-45.001309,0> translate<14.170300,0.000000,41.051700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.839700,0.000000,41.721200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.839700,0.000000,39.712900>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,-90.000000,0> translate<14.839700,0.000000,39.712900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.170300,0.000000,39.712900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.509100,0.000000,39.712900>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<14.170300,0.000000,39.712900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.181600,0.000000,41.386400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.516300,0.000000,41.721200>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<16.181600,0.000000,41.386400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.516300,0.000000,41.721200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.185700,0.000000,41.721200>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<16.516300,0.000000,41.721200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.185700,0.000000,41.721200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.520400,0.000000,41.386400>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<17.185700,0.000000,41.721200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.520400,0.000000,41.386400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.520400,0.000000,41.051700>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<17.520400,0.000000,41.051700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.520400,0.000000,41.051700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.185700,0.000000,40.717000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<17.185700,0.000000,40.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.185700,0.000000,40.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.520400,0.000000,40.382300>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<17.185700,0.000000,40.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.520400,0.000000,40.382300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.520400,0.000000,40.047600>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<17.520400,0.000000,40.047600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.520400,0.000000,40.047600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.185700,0.000000,39.712900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<17.185700,0.000000,39.712900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.185700,0.000000,39.712900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.516300,0.000000,39.712900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<16.516300,0.000000,39.712900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.516300,0.000000,39.712900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.181600,0.000000,40.047600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<16.181600,0.000000,40.047600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.181600,0.000000,40.047600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.181600,0.000000,40.382300>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,90.000000,0> translate<16.181600,0.000000,40.382300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.181600,0.000000,40.382300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.516300,0.000000,40.717000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<16.181600,0.000000,40.382300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.516300,0.000000,40.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.181600,0.000000,41.051700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<16.181600,0.000000,41.051700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.181600,0.000000,41.051700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.181600,0.000000,41.386400>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,90.000000,0> translate<16.181600,0.000000,41.386400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.516300,0.000000,40.717000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.185700,0.000000,40.717000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<16.516300,0.000000,40.717000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.192900,0.000000,41.721200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.192900,0.000000,40.382300>}
box{<0,0,-0.088900><1.338900,0.036000,0.088900> rotate<0,-90.000000,0> translate<18.192900,0.000000,40.382300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.192900,0.000000,40.382300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.862300,0.000000,39.712900>}
box{<0,0,-0.088900><0.946675,0.036000,0.088900> rotate<0,44.997030,0> translate<18.192900,0.000000,40.382300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.862300,0.000000,39.712900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.531700,0.000000,40.382300>}
box{<0,0,-0.088900><0.946675,0.036000,0.088900> rotate<0,-44.997030,0> translate<18.862300,0.000000,39.712900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.531700,0.000000,40.382300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.531700,0.000000,41.721200>}
box{<0,0,-0.088900><1.338900,0.036000,0.088900> rotate<0,90.000000,0> translate<19.531700,0.000000,41.721200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.204200,0.000000,41.721200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.204200,0.000000,39.712900>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,-90.000000,0> translate<20.204200,0.000000,39.712900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.204200,0.000000,39.712900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.208300,0.000000,39.712900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<20.204200,0.000000,39.712900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.208300,0.000000,39.712900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.543000,0.000000,40.047600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<21.208300,0.000000,39.712900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.543000,0.000000,40.047600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.543000,0.000000,41.386400>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<21.543000,0.000000,41.386400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.543000,0.000000,41.386400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.208300,0.000000,41.721200>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<21.208300,0.000000,41.721200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.208300,0.000000,41.721200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.204200,0.000000,41.721200>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<20.204200,0.000000,41.721200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.554300,0.000000,41.386400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.219600,0.000000,41.721200>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<23.219600,0.000000,41.721200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.219600,0.000000,41.721200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.550200,0.000000,41.721200>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<22.550200,0.000000,41.721200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.550200,0.000000,41.721200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.215500,0.000000,41.386400>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<22.215500,0.000000,41.386400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.215500,0.000000,41.386400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.215500,0.000000,40.047600>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<22.215500,0.000000,40.047600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.215500,0.000000,40.047600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.550200,0.000000,39.712900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<22.215500,0.000000,40.047600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.550200,0.000000,39.712900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.219600,0.000000,39.712900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<22.550200,0.000000,39.712900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.219600,0.000000,39.712900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.554300,0.000000,40.047600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<23.219600,0.000000,39.712900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.204700,0.000000,50.623000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.543500,0.000000,50.623000>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<12.204700,0.000000,50.623000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.874100,0.000000,51.292400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.874100,0.000000,49.953600>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<12.874100,0.000000,49.953600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.216000,0.000000,50.957700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.885400,0.000000,51.627200>}
box{<0,0,-0.088900><0.946745,0.036000,0.088900> rotate<0,-45.001309,0> translate<14.216000,0.000000,50.957700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.885400,0.000000,51.627200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.885400,0.000000,49.618900>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,-90.000000,0> translate<14.885400,0.000000,49.618900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.216000,0.000000,49.618900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.554800,0.000000,49.618900>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<14.216000,0.000000,49.618900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.566100,0.000000,49.618900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.227300,0.000000,49.618900>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<16.227300,0.000000,49.618900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.227300,0.000000,49.618900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.566100,0.000000,50.957700>}
box{<0,0,-0.088900><1.893349,0.036000,0.088900> rotate<0,-44.997030,0> translate<16.227300,0.000000,49.618900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.566100,0.000000,50.957700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.566100,0.000000,51.292400>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,90.000000,0> translate<17.566100,0.000000,51.292400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.566100,0.000000,51.292400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.231400,0.000000,51.627200>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<17.231400,0.000000,51.627200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.231400,0.000000,51.627200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.562000,0.000000,51.627200>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<16.562000,0.000000,51.627200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.562000,0.000000,51.627200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.227300,0.000000,51.292400>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<16.227300,0.000000,51.292400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.238600,0.000000,51.627200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.238600,0.000000,50.288300>}
box{<0,0,-0.088900><1.338900,0.036000,0.088900> rotate<0,-90.000000,0> translate<18.238600,0.000000,50.288300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.238600,0.000000,50.288300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.908000,0.000000,49.618900>}
box{<0,0,-0.088900><0.946675,0.036000,0.088900> rotate<0,44.997030,0> translate<18.238600,0.000000,50.288300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.908000,0.000000,49.618900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.577400,0.000000,50.288300>}
box{<0,0,-0.088900><0.946675,0.036000,0.088900> rotate<0,-44.997030,0> translate<18.908000,0.000000,49.618900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.577400,0.000000,50.288300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.577400,0.000000,51.627200>}
box{<0,0,-0.088900><1.338900,0.036000,0.088900> rotate<0,90.000000,0> translate<19.577400,0.000000,51.627200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.249900,0.000000,51.627200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.249900,0.000000,49.618900>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,-90.000000,0> translate<20.249900,0.000000,49.618900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.249900,0.000000,49.618900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.254000,0.000000,49.618900>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<20.249900,0.000000,49.618900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.254000,0.000000,49.618900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.588700,0.000000,49.953600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<21.254000,0.000000,49.618900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.588700,0.000000,49.953600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.588700,0.000000,51.292400>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<21.588700,0.000000,51.292400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.588700,0.000000,51.292400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.254000,0.000000,51.627200>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<21.254000,0.000000,51.627200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.254000,0.000000,51.627200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.249900,0.000000,51.627200>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<20.249900,0.000000,51.627200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.600000,0.000000,51.292400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.265300,0.000000,51.627200>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<23.265300,0.000000,51.627200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.265300,0.000000,51.627200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.595900,0.000000,51.627200>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<22.595900,0.000000,51.627200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.595900,0.000000,51.627200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.261200,0.000000,51.292400>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<22.261200,0.000000,51.292400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.261200,0.000000,51.292400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.261200,0.000000,49.953600>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<22.261200,0.000000,49.953600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.261200,0.000000,49.953600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.595900,0.000000,49.618900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<22.261200,0.000000,49.953600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.595900,0.000000,49.618900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.265300,0.000000,49.618900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<22.595900,0.000000,49.618900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.265300,0.000000,49.618900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.600000,0.000000,49.953600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<23.265300,0.000000,49.618900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.589200,0.000000,46.710300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.254500,0.000000,47.045100>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<13.254500,0.000000,47.045100> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.254500,0.000000,47.045100>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.585100,0.000000,47.045100>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<12.585100,0.000000,47.045100> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.585100,0.000000,47.045100>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.250400,0.000000,46.710300>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<12.250400,0.000000,46.710300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.250400,0.000000,46.710300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.250400,0.000000,45.371500>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<12.250400,0.000000,45.371500> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.250400,0.000000,45.371500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.585100,0.000000,45.036800>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<12.250400,0.000000,45.371500> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.585100,0.000000,45.036800>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.254500,0.000000,45.036800>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<12.585100,0.000000,45.036800> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.254500,0.000000,45.036800>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.589200,0.000000,45.371500>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<13.254500,0.000000,45.036800> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.589200,0.000000,45.371500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.589200,0.000000,46.040900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,90.000000,0> translate<13.589200,0.000000,46.040900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.589200,0.000000,46.040900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.919800,0.000000,46.040900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<12.919800,0.000000,46.040900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.261700,0.000000,45.036800>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.261700,0.000000,47.045100>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,90.000000,0> translate<14.261700,0.000000,47.045100> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<14.261700,0.000000,47.045100>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.600500,0.000000,45.036800>}
box{<0,0,-0.088900><2.413639,0.036000,0.088900> rotate<0,56.307533,0> translate<14.261700,0.000000,47.045100> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.600500,0.000000,45.036800>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.600500,0.000000,47.045100>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,90.000000,0> translate<15.600500,0.000000,47.045100> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.273000,0.000000,47.045100>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.273000,0.000000,45.036800>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,-90.000000,0> translate<16.273000,0.000000,45.036800> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.273000,0.000000,45.036800>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.277100,0.000000,45.036800>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<16.273000,0.000000,45.036800> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.277100,0.000000,45.036800>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.611800,0.000000,45.371500>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<17.277100,0.000000,45.036800> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.611800,0.000000,45.371500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.611800,0.000000,46.710300>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<17.611800,0.000000,46.710300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.611800,0.000000,46.710300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.277100,0.000000,47.045100>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<17.277100,0.000000,47.045100> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.277100,0.000000,47.045100>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.273000,0.000000,47.045100>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<16.273000,0.000000,47.045100> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.777900,0.000000,45.173900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.777900,0.000000,47.182200>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,90.000000,0> translate<51.777900,0.000000,47.182200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.777900,0.000000,47.182200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.782000,0.000000,47.182200>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<51.777900,0.000000,47.182200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.782000,0.000000,47.182200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.116700,0.000000,46.847400>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<52.782000,0.000000,47.182200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.116700,0.000000,46.847400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.116700,0.000000,46.178000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,-90.000000,0> translate<53.116700,0.000000,46.178000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.116700,0.000000,46.178000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.782000,0.000000,45.843300>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<52.782000,0.000000,45.843300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.782000,0.000000,45.843300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.777900,0.000000,45.843300>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<51.777900,0.000000,45.843300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.793300,0.000000,47.182200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.123900,0.000000,47.182200>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<54.123900,0.000000,47.182200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.123900,0.000000,47.182200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.789200,0.000000,46.847400>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<53.789200,0.000000,46.847400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.789200,0.000000,46.847400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.789200,0.000000,45.508600>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<53.789200,0.000000,45.508600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.789200,0.000000,45.508600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.123900,0.000000,45.173900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<53.789200,0.000000,45.508600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.123900,0.000000,45.173900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.793300,0.000000,45.173900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<54.123900,0.000000,45.173900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.793300,0.000000,45.173900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.128000,0.000000,45.508600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<54.793300,0.000000,45.173900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.128000,0.000000,45.508600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.128000,0.000000,46.847400>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<55.128000,0.000000,46.847400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.128000,0.000000,46.847400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.793300,0.000000,47.182200>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<54.793300,0.000000,47.182200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.139300,0.000000,46.847400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.804600,0.000000,47.182200>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<56.804600,0.000000,47.182200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.804600,0.000000,47.182200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.135200,0.000000,47.182200>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<56.135200,0.000000,47.182200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.135200,0.000000,47.182200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.800500,0.000000,46.847400>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<55.800500,0.000000,46.847400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.800500,0.000000,46.847400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.800500,0.000000,46.512700>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<55.800500,0.000000,46.512700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.800500,0.000000,46.512700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.135200,0.000000,46.178000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<55.800500,0.000000,46.512700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.135200,0.000000,46.178000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.804600,0.000000,46.178000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<56.135200,0.000000,46.178000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.804600,0.000000,46.178000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.139300,0.000000,45.843300>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<56.804600,0.000000,46.178000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.139300,0.000000,45.843300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.139300,0.000000,45.508600>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,-90.000000,0> translate<57.139300,0.000000,45.508600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.139300,0.000000,45.508600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.804600,0.000000,45.173900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<56.804600,0.000000,45.173900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.804600,0.000000,45.173900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.135200,0.000000,45.173900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<56.135200,0.000000,45.173900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.135200,0.000000,45.173900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.800500,0.000000,45.508600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<55.800500,0.000000,45.508600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.811800,0.000000,46.178000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<59.150600,0.000000,46.178000>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<57.811800,0.000000,46.178000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<58.481200,0.000000,46.847400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<58.481200,0.000000,45.508600>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<58.481200,0.000000,45.508600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.142900,0.000000,50.253900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.142900,0.000000,52.262200>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,90.000000,0> translate<51.142900,0.000000,52.262200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.142900,0.000000,52.262200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.481700,0.000000,50.253900>}
box{<0,0,-0.088900><2.413639,0.036000,0.088900> rotate<0,56.307533,0> translate<51.142900,0.000000,52.262200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.481700,0.000000,50.253900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.481700,0.000000,52.262200>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,90.000000,0> translate<52.481700,0.000000,52.262200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.493000,0.000000,52.262200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.154200,0.000000,52.262200>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<53.154200,0.000000,52.262200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.154200,0.000000,52.262200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.154200,0.000000,50.253900>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,-90.000000,0> translate<53.154200,0.000000,50.253900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.154200,0.000000,50.253900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.493000,0.000000,50.253900>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<53.154200,0.000000,50.253900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.154200,0.000000,51.258000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.823600,0.000000,51.258000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<53.154200,0.000000,51.258000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.504300,0.000000,51.927400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.169600,0.000000,52.262200>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<56.169600,0.000000,52.262200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.169600,0.000000,52.262200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.500200,0.000000,52.262200>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<55.500200,0.000000,52.262200> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.500200,0.000000,52.262200>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.165500,0.000000,51.927400>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<55.165500,0.000000,51.927400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.165500,0.000000,51.927400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.165500,0.000000,50.588600>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<55.165500,0.000000,50.588600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.165500,0.000000,50.588600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.500200,0.000000,50.253900>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<55.165500,0.000000,50.588600> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.500200,0.000000,50.253900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.169600,0.000000,50.253900>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<55.500200,0.000000,50.253900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.169600,0.000000,50.253900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.504300,0.000000,50.588600>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<56.169600,0.000000,50.253900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.504300,0.000000,50.588600>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.504300,0.000000,51.258000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,90.000000,0> translate<56.504300,0.000000,51.258000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<56.504300,0.000000,51.258000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<55.834900,0.000000,51.258000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<55.834900,0.000000,51.258000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<57.176800,0.000000,51.258000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<58.515600,0.000000,51.258000>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<57.176800,0.000000,51.258000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<5.778500,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<5.778500,0.000000,65.028300>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,90.000000,0> translate<5.778500,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<5.778500,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<6.782600,0.000000,65.028300>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<5.778500,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<6.782600,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.117300,0.000000,64.693500>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<6.782600,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.117300,0.000000,64.693500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.117300,0.000000,64.024100>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,-90.000000,0> translate<7.117300,0.000000,64.024100> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.117300,0.000000,64.024100>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<6.782600,0.000000,63.689400>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<6.782600,0.000000,63.689400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<6.782600,0.000000,63.689400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<5.778500,0.000000,63.689400>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<5.778500,0.000000,63.689400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<6.447900,0.000000,63.689400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.117300,0.000000,63.020000>}
box{<0,0,-0.088900><0.946675,0.036000,0.088900> rotate<0,44.997030,0> translate<6.447900,0.000000,63.689400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.789800,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.789800,0.000000,63.689400>}
box{<0,0,-0.088900><1.338900,0.036000,0.088900> rotate<0,-90.000000,0> translate<7.789800,0.000000,63.689400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.789800,0.000000,63.689400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<8.459200,0.000000,63.020000>}
box{<0,0,-0.088900><0.946675,0.036000,0.088900> rotate<0,44.997030,0> translate<7.789800,0.000000,63.689400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<8.459200,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.128600,0.000000,63.689400>}
box{<0,0,-0.088900><0.946675,0.036000,0.088900> rotate<0,-44.997030,0> translate<8.459200,0.000000,63.020000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.128600,0.000000,63.689400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.128600,0.000000,65.028300>}
box{<0,0,-0.088900><1.338900,0.036000,0.088900> rotate<0,90.000000,0> translate<9.128600,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.801100,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.801100,0.000000,65.028300>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,90.000000,0> translate<9.801100,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.801100,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.805200,0.000000,65.028300>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<9.801100,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.805200,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.139900,0.000000,64.693500>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<10.805200,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.139900,0.000000,64.693500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.139900,0.000000,64.024100>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,-90.000000,0> translate<11.139900,0.000000,64.024100> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.139900,0.000000,64.024100>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.805200,0.000000,63.689400>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<10.805200,0.000000,63.689400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.805200,0.000000,63.689400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.801100,0.000000,63.689400>}
box{<0,0,-0.088900><1.004100,0.036000,0.088900> rotate<0,0.000000,0> translate<9.801100,0.000000,63.689400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.470500,0.000000,63.689400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.139900,0.000000,63.020000>}
box{<0,0,-0.088900><0.946675,0.036000,0.088900> rotate<0,44.997030,0> translate<10.470500,0.000000,63.689400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.812400,0.000000,63.354700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.812400,0.000000,64.693500>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<11.812400,0.000000,64.693500> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.812400,0.000000,64.693500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.147100,0.000000,65.028300>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<11.812400,0.000000,64.693500> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.147100,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.816500,0.000000,65.028300>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<12.147100,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.816500,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.151200,0.000000,64.693500>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<12.816500,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.151200,0.000000,64.693500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.151200,0.000000,63.354700>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<13.151200,0.000000,63.354700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.151200,0.000000,63.354700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.816500,0.000000,63.020000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<12.816500,0.000000,63.020000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.816500,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.147100,0.000000,63.020000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<12.147100,0.000000,63.020000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.147100,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<11.812400,0.000000,63.354700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<11.812400,0.000000,63.354700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<12.481800,0.000000,63.689400>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.151200,0.000000,63.020000>}
box{<0,0,-0.088900><0.946675,0.036000,0.088900> rotate<0,44.997030,0> translate<12.481800,0.000000,63.689400> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<13.823700,0.000000,64.024100>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.162500,0.000000,64.024100>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<13.823700,0.000000,64.024100> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.839100,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.169700,0.000000,65.028300>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<16.169700,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.169700,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.835000,0.000000,64.693500>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<15.835000,0.000000,64.693500> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.835000,0.000000,64.693500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.835000,0.000000,63.354700>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<15.835000,0.000000,63.354700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<15.835000,0.000000,63.354700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.169700,0.000000,63.020000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<15.835000,0.000000,63.354700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.169700,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.839100,0.000000,63.020000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<16.169700,0.000000,63.020000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.839100,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.173800,0.000000,63.354700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<16.839100,0.000000,63.020000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.173800,0.000000,63.354700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.173800,0.000000,64.693500>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,90.000000,0> translate<17.173800,0.000000,64.693500> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.173800,0.000000,64.693500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<16.839100,0.000000,65.028300>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<16.839100,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.185100,0.000000,64.693500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.850400,0.000000,65.028300>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<18.850400,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.850400,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.181000,0.000000,65.028300>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<18.181000,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.181000,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.846300,0.000000,64.693500>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<17.846300,0.000000,64.693500> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.846300,0.000000,64.693500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.846300,0.000000,63.354700>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,-90.000000,0> translate<17.846300,0.000000,63.354700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<17.846300,0.000000,63.354700>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.181000,0.000000,63.020000>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,44.997030,0> translate<17.846300,0.000000,63.354700> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.181000,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.850400,0.000000,63.020000>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<18.181000,0.000000,63.020000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<18.850400,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.185100,0.000000,63.354700>}
box{<0,0,-0.088900><0.473337,0.036000,0.088900> rotate<0,-44.997030,0> translate<18.850400,0.000000,63.020000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.527000,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<20.527000,0.000000,65.028300>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,90.000000,0> translate<20.527000,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<19.857600,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.196400,0.000000,65.028300>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<19.857600,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.207700,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.868900,0.000000,63.020000>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<21.868900,0.000000,63.020000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.868900,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.207700,0.000000,64.358800>}
box{<0,0,-0.088900><1.893349,0.036000,0.088900> rotate<0,-44.997030,0> translate<21.868900,0.000000,63.020000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.207700,0.000000,64.358800>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.207700,0.000000,64.693500>}
box{<0,0,-0.088900><0.334700,0.036000,0.088900> rotate<0,90.000000,0> translate<23.207700,0.000000,64.693500> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.207700,0.000000,64.693500>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.873000,0.000000,65.028300>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,45.005588,0> translate<22.873000,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.873000,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.203600,0.000000,65.028300>}
box{<0,0,-0.088900><0.669400,0.036000,0.088900> rotate<0,0.000000,0> translate<22.203600,0.000000,65.028300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<22.203600,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<21.868900,0.000000,64.693500>}
box{<0,0,-0.088900><0.473408,0.036000,0.088900> rotate<0,-45.005588,0> translate<21.868900,0.000000,64.693500> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.880200,0.000000,64.358800>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<24.549600,0.000000,65.028300>}
box{<0,0,-0.088900><0.946745,0.036000,0.088900> rotate<0,-45.001309,0> translate<23.880200,0.000000,64.358800> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<24.549600,0.000000,65.028300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<24.549600,0.000000,63.020000>}
box{<0,0,-0.088900><2.008300,0.036000,0.088900> rotate<0,-90.000000,0> translate<24.549600,0.000000,63.020000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<23.880200,0.000000,63.020000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<25.219000,0.000000,63.020000>}
box{<0,0,-0.088900><1.338800,0.036000,0.088900> rotate<0,0.000000,0> translate<23.880200,0.000000,63.020000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<0.000000,-1.536000,0.000000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<0.000000,-1.536000,66.040000>}
box{<0,0,-0.203200><66.040000,0.036000,0.203200> rotate<0,90.000000,0> translate<0.000000,-1.536000,66.040000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<0.000000,-1.536000,66.040000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<91.120000,-1.536000,66.040000>}
box{<0,0,-0.203200><91.120000,0.036000,0.203200> rotate<0,0.000000,0> translate<0.000000,-1.536000,66.040000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<91.120000,-1.536000,66.040000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<91.120000,-1.536000,0.000000>}
box{<0,0,-0.203200><66.040000,0.036000,0.203200> rotate<0,-90.000000,0> translate<91.120000,-1.536000,0.000000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<91.120000,-1.536000,0.000000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<0.000000,-1.536000,0.000000>}
box{<0,0,-0.203200><91.120000,0.036000,0.203200> rotate<0,0.000000,0> translate<0.000000,-1.536000,0.000000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<10.600000,0.000000,15.080000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<73.200000,0.000000,15.080000>}
box{<0,0,-0.304800><62.600000,0.036000,0.304800> rotate<0,0.000000,0> translate<10.600000,0.000000,15.080000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<73.200000,0.000000,15.080000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<73.200000,0.000000,12.540000>}
box{<0,0,-0.304800><2.540000,0.036000,0.304800> rotate<0,-90.000000,0> translate<73.200000,0.000000,12.540000> }
box{<-0.205700,0,-0.022800><0.205700,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.329900,0.000000,50.337800>}
box{<-0.525800,0,-0.022800><0.525800,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.284200,0.000000,50.383500>}
box{<-0.068500,0,-0.022800><0.068500,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.061400,0.000000,50.383500>}
box{<-0.594300,0,-0.022900><0.594300,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.215600,0.000000,50.429300>}
box{<-0.114300,0,-0.022900><0.114300,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.152900,0.000000,50.429300>}
box{<-0.068600,0,-0.022800><0.068600,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.369800,0.000000,50.475000>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.215600,0.000000,50.475000>}
box{<-0.205700,0,-0.022800><0.205700,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.244300,0.000000,50.475000>}
box{<-0.137100,0,-0.022800><0.137100,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.301200,0.000000,50.520700>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.215600,0.000000,50.520700>}
box{<-0.297100,0,-0.022800><0.297100,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.335700,0.000000,50.520700>}
box{<-0.182900,0,-0.022800><0.182900,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.209800,0.000000,50.566400>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.215600,0.000000,50.566400>}
box{<-0.342900,0,-0.022800><0.342900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.381500,0.000000,50.566400>}
box{<-0.228600,0,-0.022800><0.228600,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.164100,0.000000,50.612100>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.215600,0.000000,50.612100>}
box{<-0.388600,0,-0.022800><0.388600,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.427200,0.000000,50.612100>}
box{<-0.274300,0,-0.022900><0.274300,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.118300,0.000000,50.657900>}
box{<-0.594300,0,-0.022900><0.594300,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.215600,0.000000,50.657900>}
box{<-0.434300,0,-0.022900><0.434300,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.472900,0.000000,50.657900>}
box{<-0.320000,0,-0.022800><0.320000,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.072600,0.000000,50.703600>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.215600,0.000000,50.703600>}
box{<-0.502900,0,-0.022800><0.502900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.495800,0.000000,50.703600>}
box{<-0.365800,0,-0.022800><0.365800,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.026900,0.000000,50.749300>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.215600,0.000000,50.749300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.541500,0.000000,50.749300>}
box{<-0.411500,0,-0.022800><0.411500,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.981200,0.000000,50.795000>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.192700,0.000000,50.795000>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.564400,0.000000,50.795000>}
box{<-0.457200,0,-0.022800><0.457200,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.935500,0.000000,50.840700>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.192700,0.000000,50.840700>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.632900,0.000000,50.840700>}
box{<-0.457200,0,-0.022900><0.457200,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.889700,0.000000,50.886500>}
box{<-0.617200,0,-0.022900><0.617200,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.192700,0.000000,50.886500>}
box{<-0.640000,0,-0.022900><0.640000,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.632900,0.000000,50.886500>}
box{<-0.502900,0,-0.022800><0.502900,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.844000,0.000000,50.932200>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.169900,0.000000,50.932200>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.632900,0.000000,50.932200>}
box{<-0.525700,0,-0.022800><0.525700,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.821100,0.000000,50.977900>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.169900,0.000000,50.977900>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.610000,0.000000,50.977900>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.775400,0.000000,51.023600>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.147000,0.000000,51.023600>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.610000,0.000000,51.023600>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.729700,0.000000,51.069300>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.147000,0.000000,51.069300>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.610000,0.000000,51.069300>}
box{<-0.045700,0,-0.022800><0.045700,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.455900,0.000000,51.069300>}
box{<-0.594300,0,-0.022900><0.594300,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.706800,0.000000,51.115100>}
box{<-0.617200,0,-0.022900><0.617200,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.147000,0.000000,51.115100>}
box{<-0.640100,0,-0.022900><0.640100,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.587200,0.000000,51.115100>}
box{<-0.068500,0,-0.022900><0.068500,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.478700,0.000000,51.115100>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.661100,0.000000,51.160800>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.147000,0.000000,51.160800>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.564300,0.000000,51.160800>}
box{<-0.114300,0,-0.022800><0.114300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.524500,0.000000,51.160800>}
box{<-0.640100,0,-0.022800><0.640100,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.615400,0.000000,51.206500>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.101300,0.000000,51.206500>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.564300,0.000000,51.206500>}
box{<-0.137100,0,-0.022800><0.137100,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.547300,0.000000,51.206500>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.592500,0.000000,51.252200>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.101300,0.000000,51.252200>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.564300,0.000000,51.252200>}
box{<-0.182800,0,-0.022800><0.182800,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.547300,0.000000,51.252200>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.569700,0.000000,51.297900>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.078400,0.000000,51.297900>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.564300,0.000000,51.297900>}
box{<-0.205700,0,-0.022800><0.205700,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.570200,0.000000,51.297900>}
box{<-0.685800,0,-0.022900><0.685800,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.524000,0.000000,51.343700>}
box{<-0.640000,0,-0.022900><0.640000,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.078400,0.000000,51.343700>}
box{<-0.685800,0,-0.022900><0.685800,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.541500,0.000000,51.343700>}
box{<-0.228600,0,-0.022900><0.228600,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.593100,0.000000,51.343700>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.501100,0.000000,51.389400>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.055600,0.000000,51.389400>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.541500,0.000000,51.389400>}
box{<-0.251400,0,-0.022800><0.251400,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.615900,0.000000,51.389400>}
box{<-0.708700,0,-0.022800><0.708700,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.455400,0.000000,51.435100>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.032700,0.000000,51.435100>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.518600,0.000000,51.435100>}
box{<-0.274300,0,-0.022800><0.274300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.638800,0.000000,51.435100>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.432500,0.000000,51.480800>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.032700,0.000000,51.480800>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.518600,0.000000,51.480800>}
box{<-0.297100,0,-0.022800><0.297100,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.661600,0.000000,51.480800>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.386800,0.000000,51.526500>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.009800,0.000000,51.526500>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.518600,0.000000,51.526500>}
box{<-0.342900,0,-0.022800><0.342900,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.661600,0.000000,51.526500>}
box{<-0.754300,0,-0.022900><0.754300,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.363900,0.000000,51.572300>}
box{<-0.640100,0,-0.022900><0.640100,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.987000,0.000000,51.572300>}
box{<-0.640100,0,-0.022900><0.640100,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.495800,0.000000,51.572300>}
box{<-0.342900,0,-0.022900><0.342900,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.661600,0.000000,51.572300>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.341100,0.000000,51.618000>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.964100,0.000000,51.618000>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.472900,0.000000,51.618000>}
box{<-0.365800,0,-0.022800><0.365800,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.684500,0.000000,51.618000>}
box{<-0.365700,0,-0.022800><0.365700,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.810900,0.000000,51.618000>}
box{<-0.754300,0,-0.022800><0.754300,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.318200,0.000000,51.663700>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.964100,0.000000,51.663700>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.472900,0.000000,51.663700>}
box{<-0.388600,0,-0.022800><0.388600,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.707300,0.000000,51.663700>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.833800,0.000000,51.663700>}
box{<-0.754400,0,-0.022800><0.754400,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.272500,0.000000,51.709400>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.918400,0.000000,51.709400>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.450000,0.000000,51.709400>}
box{<-0.434300,0,-0.022800><0.434300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.707300,0.000000,51.709400>}
box{<-0.777200,0,-0.022800><0.777200,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.810900,0.000000,51.709400>}
box{<-0.754400,0,-0.022800><0.754400,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.226800,0.000000,51.755100>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.918400,0.000000,51.755100>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.450000,0.000000,51.755100>}
box{<-0.457200,0,-0.022800><0.457200,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.730200,0.000000,51.755100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,51.755100>}
box{<-0.914400,0,-0.022800><0.914400,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.811000,0.000000,51.755100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,51.755100>}
box{<-0.754400,0,-0.022900><0.754400,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.226800,0.000000,51.800900>}
box{<-0.662900,0,-0.022900><0.662900,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.872700,0.000000,51.800900>}
box{<-0.662900,0,-0.022900><0.662900,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.427200,0.000000,51.800900>}
box{<-0.457200,0,-0.022900><0.457200,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.730200,0.000000,51.800900>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,51.800900>}
box{<-1.005800,0,-0.022900><1.005800,0.036000,0.022900> rotate<0,-0.000000,0> translate<41.810900,0.000000,51.800900>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.102800,0.000000,51.800900>}
box{<-0.754400,0,-0.022800><0.754400,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.181100,0.000000,51.846600>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.849900,0.000000,51.846600>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.404300,0.000000,51.846600>}
box{<-0.480000,0,-0.022800><0.480000,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.753000,0.000000,51.846600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,51.846600>}
box{<-1.097300,0,-0.022800><1.097300,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.811000,0.000000,51.846600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,51.846600>}
box{<-0.754300,0,-0.022800><0.754300,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.135300,0.000000,51.892300>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.849900,0.000000,51.892300>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.381400,0.000000,51.892300>}
box{<-0.525800,0,-0.022800><0.525800,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.753100,0.000000,51.892300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,51.892300>}
box{<-1.188700,0,-0.022800><1.188700,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.811000,0.000000,51.892300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,51.892300>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.112500,0.000000,51.938000>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.804100,0.000000,51.938000>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.381400,0.000000,51.938000>}
box{<-0.525800,0,-0.022800><0.525800,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.753100,0.000000,51.938000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,51.938000>}
box{<-1.280100,0,-0.022800><1.280100,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.810900,0.000000,51.938000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,51.938000>}
box{<-0.754300,0,-0.022800><0.754300,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.089600,0.000000,51.983700>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.804100,0.000000,51.983700>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.335700,0.000000,51.983700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.775900,0.000000,51.983700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,51.983700>}
box{<-1.325900,0,-0.022800><1.325900,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.811000,0.000000,51.983700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,51.983700>}
box{<-0.754400,0,-0.022900><0.754400,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.043900,0.000000,52.029500>}
box{<-0.685800,0,-0.022900><0.685800,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.758400,0.000000,52.029500>}
box{<-0.662900,0,-0.022900><0.662900,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.335700,0.000000,52.029500>}
box{<-0.594300,0,-0.022900><0.594300,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.775900,0.000000,52.029500>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.029500>}
box{<-1.417300,0,-0.022900><1.417300,0.036000,0.022900> rotate<0,-0.000000,0> translate<41.811000,0.000000,52.029500>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.029500>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.021000,0.000000,52.075200>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.735500,0.000000,52.075200>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.312900,0.000000,52.075200>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.775900,0.000000,52.075200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.075200>}
box{<-1.463000,0,-0.022800><1.463000,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.810900,0.000000,52.075200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.075200>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.975300,0.000000,52.120900>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.689800,0.000000,52.120900>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.290000,0.000000,52.120900>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,52.120900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.120900>}
box{<-1.508700,0,-0.022800><1.508700,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.810900,0.000000,52.120900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.120900>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.952400,0.000000,52.166600>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.667000,0.000000,52.166600>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.267200,0.000000,52.166600>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.775900,0.000000,52.166600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.166600>}
box{<-1.554500,0,-0.022800><1.554500,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.811000,0.000000,52.166600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.166600>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.906700,0.000000,52.212300>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.621200,0.000000,52.212300>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.244300,0.000000,52.212300>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,52.212300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.212300>}
box{<-1.600200,0,-0.022800><1.600200,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.811000,0.000000,52.212300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.212300>}
box{<-0.685800,0,-0.022900><0.685800,0.036000,0.022900> rotate<0,-0.000000,0> translate<30.883900,0.000000,52.258100>}
box{<-0.754400,0,-0.022900><0.754400,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.598400,0.000000,52.258100>}
box{<-0.685800,0,-0.022900><0.685800,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.221500,0.000000,52.258100>}
box{<-0.662900,0,-0.022900><0.662900,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.798800,0.000000,52.258100>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.258100>}
box{<-1.645900,0,-0.022900><1.645900,0.036000,0.022900> rotate<0,-0.000000,0> translate<41.811000,0.000000,52.258100>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.258100>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.838200,0.000000,52.303800>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.575500,0.000000,52.303800>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.221500,0.000000,52.303800>}
box{<-0.708700,0,-0.022800><0.708700,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,52.303800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.303800>}
box{<-1.691600,0,-0.022800><1.691600,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.810900,0.000000,52.303800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.303800>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.792500,0.000000,52.349500>}
box{<-0.754400,0,-0.022800><0.754400,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.552700,0.000000,52.349500>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.175700,0.000000,52.349500>}
box{<-0.708700,0,-0.022800><0.708700,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,52.349500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.349500>}
box{<-1.714500,0,-0.022800><1.714500,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.788100,0.000000,52.349500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.349500>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.769600,0.000000,52.395200>}
box{<-0.754300,0,-0.022800><0.754300,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.506900,0.000000,52.395200>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.152800,0.000000,52.395200>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.821600,0.000000,52.395200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.395200>}
box{<-1.760200,0,-0.022800><1.760200,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.788100,0.000000,52.395200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.395200>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.723900,0.000000,52.440900>}
box{<-0.800100,0,-0.022800><0.800100,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.461200,0.000000,52.440900>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.130000,0.000000,52.440900>}
box{<-0.274300,0,-0.022800><0.274300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.318700,0.000000,52.440900>}
box{<-0.251400,0,-0.022800><0.251400,0.036000,0.022800> rotate<0,-0.000000,0> translate<36.301700,0.000000,52.440900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.440900>}
box{<-1.805900,0,-0.022800><1.805900,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.788100,0.000000,52.440900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.440900>}
box{<-0.617200,0,-0.022900><0.617200,0.036000,0.022900> rotate<0,-0.000000,0> translate<30.678100,0.000000,52.486700>}
box{<-0.800100,0,-0.022900><0.800100,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.415500,0.000000,52.486700>}
box{<-0.708600,0,-0.022900><0.708600,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.107100,0.000000,52.486700>}
box{<-0.068600,0,-0.022900><0.068600,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.113000,0.000000,52.486700>}
box{<-0.068600,0,-0.022900><0.068600,0.036000,0.022900> rotate<0,-0.000000,0> translate<36.530300,0.000000,52.486700>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.486700>}
box{<-1.851600,0,-0.022900><1.851600,0.036000,0.022900> rotate<0,-0.000000,0> translate<41.788100,0.000000,52.486700>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.486700>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.632400,0.000000,52.532400>}
box{<-0.800100,0,-0.022800><0.800100,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.369800,0.000000,52.532400>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.084300,0.000000,52.532400>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.532400>}
box{<-0.800100,0,-0.022800><0.800100,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.736600,0.000000,52.532400>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,52.532400>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.532400>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.586700,0.000000,52.578100>}
box{<-0.800100,0,-0.022800><0.800100,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.324100,0.000000,52.578100>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.061400,0.000000,52.578100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.578100>}
box{<-0.754400,0,-0.022800><0.754400,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.645100,0.000000,52.578100>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.976800,0.000000,52.578100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.578100>}
box{<-0.525800,0,-0.022800><0.525800,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.541000,0.000000,52.623800>}
box{<-0.822900,0,-0.022800><0.822900,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.301200,0.000000,52.623800>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.015700,0.000000,52.623800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.623800>}
box{<-0.708700,0,-0.022800><0.708700,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.599400,0.000000,52.623800>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.022500,0.000000,52.623800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.623800>}
box{<-0.480000,0,-0.022800><0.480000,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.495200,0.000000,52.669500>}
box{<-0.845800,0,-0.022800><0.845800,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.232600,0.000000,52.669500>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.015700,0.000000,52.669500>}
box{<-0.480100,0,-0.022800><0.480100,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,52.669500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.669500>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.553600,0.000000,52.669500>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.091100,0.000000,52.669500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.669500>}
box{<-0.457200,0,-0.022900><0.457200,0.036000,0.022900> rotate<0,-0.000000,0> translate<30.426700,0.000000,52.715300>}
box{<-0.845800,0,-0.022900><0.845800,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.186900,0.000000,52.715300>}
box{<-0.708700,0,-0.022900><0.708700,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.970000,0.000000,52.715300>}
box{<-0.754400,0,-0.022900><0.754400,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.798800,0.000000,52.715300>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.715300>}
box{<-0.685800,0,-0.022900><0.685800,0.036000,0.022900> rotate<0,-0.000000,0> translate<40.485100,0.000000,52.715300>}
box{<-0.640000,0,-0.022900><0.640000,0.036000,0.022900> rotate<0,-0.000000,0> translate<43.136800,0.000000,52.715300>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.715300>}
box{<-0.411500,0,-0.022800><0.411500,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.381000,0.000000,52.761000>}
box{<-0.891500,0,-0.022800><0.891500,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.141200,0.000000,52.761000>}
box{<-0.708700,0,-0.022800><0.708700,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.970000,0.000000,52.761000>}
box{<-0.891500,0,-0.022800><0.891500,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,52.761000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.761000>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.462200,0.000000,52.761000>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.159700,0.000000,52.761000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.761000>}
box{<-0.342900,0,-0.022800><0.342900,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.312400,0.000000,52.806700>}
box{<-0.914400,0,-0.022800><0.914400,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.072600,0.000000,52.806700>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.924200,0.000000,52.806700>}
box{<-0.891500,0,-0.022800><0.891500,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,52.806700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.806700>}
box{<-0.640100,0,-0.022800><0.640100,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.439400,0.000000,52.806700>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.182500,0.000000,52.806700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.806700>}
box{<-0.297100,0,-0.022800><0.297100,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.220900,0.000000,52.852400>}
box{<-0.937200,0,-0.022800><0.937200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.004000,0.000000,52.852400>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.901400,0.000000,52.852400>}
box{<-0.937300,0,-0.022800><0.937300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,52.852400>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.852400>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.393600,0.000000,52.852400>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.205400,0.000000,52.852400>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.852400>}
box{<-0.205700,0,-0.022800><0.205700,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.129500,0.000000,52.898100>}
box{<-0.960100,0,-0.022800><0.960100,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.935400,0.000000,52.898100>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.878500,0.000000,52.898100>}
box{<-0.937300,0,-0.022800><0.937300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,52.898100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.898100>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.370800,0.000000,52.898100>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.228300,0.000000,52.898100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.898100>}
box{<-0.068500,0,-0.022900><0.068500,0.036000,0.022900> rotate<0,-0.000000,0> translate<29.992300,0.000000,52.943900>}
box{<-0.983000,0,-0.022900><0.983000,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.866900,0.000000,52.943900>}
box{<-0.731500,0,-0.022900><0.731500,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.855700,0.000000,52.943900>}
box{<-0.960100,0,-0.022900><0.960100,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.775900,0.000000,52.943900>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.943900>}
box{<-0.640000,0,-0.022900><0.640000,0.036000,0.022900> rotate<0,-0.000000,0> translate<40.347900,0.000000,52.943900>}
box{<-0.594300,0,-0.022900><0.594300,0.036000,0.022900> rotate<0,-0.000000,0> translate<43.274000,0.000000,52.943900>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.943900>}
box{<-1.051600,0,-0.022800><1.051600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.798300,0.000000,52.989600>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.810000,0.000000,52.989600>}
box{<-0.960100,0,-0.022800><0.960100,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.775900,0.000000,52.989600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,52.989600>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.325100,0.000000,52.989600>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.274000,0.000000,52.989600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,52.989600>}
box{<-1.074400,0,-0.022800><1.074400,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.729700,0.000000,53.035300>}
box{<-0.754400,0,-0.022800><0.754400,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.787100,0.000000,53.035300>}
box{<-1.005800,0,-0.022800><1.005800,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.775900,0.000000,53.035300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.035300>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.302200,0.000000,53.035300>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.274000,0.000000,53.035300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,53.035300>}
box{<-1.143000,0,-0.022800><1.143000,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.615400,0.000000,53.081000>}
box{<-0.754400,0,-0.022800><0.754400,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.741400,0.000000,53.081000>}
box{<-1.028700,0,-0.022800><1.028700,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.753100,0.000000,53.081000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.081000>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.279300,0.000000,53.081000>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.319700,0.000000,53.081000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,53.081000>}
box{<-1.234400,0,-0.022800><1.234400,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.478200,0.000000,53.126700>}
box{<-0.777200,0,-0.022800><0.777200,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.718500,0.000000,53.126700>}
box{<-1.028700,0,-0.022800><1.028700,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.753100,0.000000,53.126700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.126700>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.256500,0.000000,53.126700>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.319700,0.000000,53.126700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,53.126700>}
box{<-1.394400,0,-0.022900><1.394400,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.272500,0.000000,53.172500>}
box{<-0.777200,0,-0.022900><0.777200,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.672800,0.000000,53.172500>}
box{<-1.051500,0,-0.022900><1.051500,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.730200,0.000000,53.172500>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.172500>}
box{<-0.594400,0,-0.022900><0.594400,0.036000,0.022900> rotate<0,-0.000000,0> translate<40.256500,0.000000,53.172500>}
box{<-0.594300,0,-0.022900><0.594300,0.036000,0.022900> rotate<0,-0.000000,0> translate<43.319700,0.000000,53.172500>}
box{<-1.051500,0,-0.022900><1.051500,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.605700,0.000000,53.172500>}
box{<-1.371600,0,-0.022800><1.371600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.249700,0.000000,53.218200>}
box{<-0.800100,0,-0.022800><0.800100,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.650000,0.000000,53.218200>}
box{<-1.074400,0,-0.022800><1.074400,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.753100,0.000000,53.218200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.218200>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.210700,0.000000,53.218200>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.319700,0.000000,53.218200>}
box{<-1.143000,0,-0.022800><1.143000,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.697200,0.000000,53.218200>}
box{<-1.371600,0,-0.022800><1.371600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.203900,0.000000,53.263900>}
box{<-0.800100,0,-0.022800><0.800100,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.604200,0.000000,53.263900>}
box{<-1.097300,0,-0.022800><1.097300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.730200,0.000000,53.263900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.263900>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.210700,0.000000,53.263900>}
box{<-1.074400,0,-0.022800><1.074400,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.885400,0.000000,53.263900>}
box{<-1.234400,0,-0.022800><1.234400,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.788600,0.000000,53.263900>}
box{<-1.348700,0,-0.022800><1.348700,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.181000,0.000000,53.309600>}
box{<-0.800100,0,-0.022800><0.800100,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.558500,0.000000,53.309600>}
box{<-1.120100,0,-0.022800><1.120100,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.707300,0.000000,53.309600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.309600>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.210700,0.000000,53.309600>}
box{<-1.074400,0,-0.022800><1.074400,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.885400,0.000000,53.309600>}
box{<-1.280100,0,-0.022800><1.280100,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.834300,0.000000,53.309600>}
box{<-1.325900,0,-0.022800><1.325900,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.158200,0.000000,53.355300>}
box{<-0.822900,0,-0.022800><0.822900,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.535600,0.000000,53.355300>}
box{<-1.120100,0,-0.022800><1.120100,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.707300,0.000000,53.355300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.355300>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.187900,0.000000,53.355300>}
box{<-1.074400,0,-0.022800><1.074400,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.885400,0.000000,53.355300>}
box{<-1.325800,0,-0.022800><1.325800,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.880000,0.000000,53.355300>}
box{<-1.280200,0,-0.022900><1.280200,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.112500,0.000000,53.401100>}
box{<-0.822900,0,-0.022900><0.822900,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.489900,0.000000,53.401100>}
box{<-1.143000,0,-0.022900><1.143000,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.684500,0.000000,53.401100>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.401100>}
box{<-0.571500,0,-0.022900><0.571500,0.036000,0.022900> rotate<0,-0.000000,0> translate<40.187900,0.000000,53.401100>}
box{<-1.074400,0,-0.022900><1.074400,0.036000,0.022900> rotate<0,-0.000000,0> translate<42.885400,0.000000,53.401100>}
box{<-1.348700,0,-0.022900><1.348700,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.902900,0.000000,53.401100>}
box{<-1.257300,0,-0.022800><1.257300,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.089600,0.000000,53.446800>}
box{<-0.845800,0,-0.022800><0.845800,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.467100,0.000000,53.446800>}
box{<-1.143000,0,-0.022800><1.143000,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.684500,0.000000,53.446800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.446800>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.165000,0.000000,53.446800>}
box{<-1.074400,0,-0.022800><1.074400,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.885400,0.000000,53.446800>}
box{<-1.394400,0,-0.022800><1.394400,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.948600,0.000000,53.446800>}
box{<-1.234400,0,-0.022800><1.234400,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.066700,0.000000,53.492500>}
box{<-0.845800,0,-0.022800><0.845800,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.421300,0.000000,53.492500>}
box{<-1.165800,0,-0.022800><1.165800,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.661600,0.000000,53.492500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.492500>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.492500>}
box{<-1.074400,0,-0.022800><1.074400,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.885400,0.000000,53.492500>}
box{<-1.417300,0,-0.022800><1.417300,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.971500,0.000000,53.492500>}
box{<-1.211600,0,-0.022800><1.211600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.043900,0.000000,53.538200>}
box{<-0.845800,0,-0.022800><0.845800,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.375600,0.000000,53.538200>}
box{<-1.188700,0,-0.022800><1.188700,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.638800,0.000000,53.538200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.538200>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.538200>}
box{<-1.097200,0,-0.022800><1.097200,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,53.538200>}
box{<-1.440100,0,-0.022800><1.440100,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.994300,0.000000,53.538200>}
box{<-1.165900,0,-0.022800><1.165900,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.998200,0.000000,53.583900>}
box{<-0.845800,0,-0.022800><0.845800,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.375600,0.000000,53.583900>}
box{<-1.234400,0,-0.022800><1.234400,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.638700,0.000000,53.583900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.583900>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.583900>}
box{<-1.097200,0,-0.022800><1.097200,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,53.583900>}
box{<-1.463000,0,-0.022800><1.463000,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.017200,0.000000,53.583900>}
box{<-1.165800,0,-0.022900><1.165800,0.036000,0.022900> rotate<0,-0.000000,0> translate<30.952400,0.000000,53.629700>}
box{<-0.868600,0,-0.022900><0.868600,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.307000,0.000000,53.629700>}
box{<-1.234400,0,-0.022900><1.234400,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.638700,0.000000,53.629700>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.629700>}
box{<-0.571500,0,-0.022900><0.571500,0.036000,0.022900> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.629700>}
box{<-1.097200,0,-0.022900><1.097200,0.036000,0.022900> rotate<0,-0.000000,0> translate<42.908200,0.000000,53.629700>}
box{<-1.485900,0,-0.022900><1.485900,0.036000,0.022900> rotate<0,-0.000000,0> translate<46.040100,0.000000,53.629700>}
box{<-1.120100,0,-0.022800><1.120100,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.906700,0.000000,53.675400>}
box{<-0.868600,0,-0.022800><0.868600,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.261300,0.000000,53.675400>}
box{<-1.257300,0,-0.022800><1.257300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.615900,0.000000,53.675400>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.675400>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.675400>}
box{<-1.097200,0,-0.022800><1.097200,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,53.675400>}
box{<-1.485900,0,-0.022800><1.485900,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.040100,0.000000,53.675400>}
box{<-1.097300,0,-0.022800><1.097300,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.883900,0.000000,53.721100>}
box{<-0.891500,0,-0.022800><0.891500,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.192700,0.000000,53.721100>}
box{<-1.280100,0,-0.022800><1.280100,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.593000,0.000000,53.721100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.721100>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.721100>}
box{<-1.097200,0,-0.022800><1.097200,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,53.721100>}
box{<-1.508700,0,-0.022800><1.508700,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.062900,0.000000,53.721100>}
box{<-1.051500,0,-0.022800><1.051500,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.838100,0.000000,53.766800>}
box{<-0.914400,0,-0.022800><0.914400,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.169900,0.000000,53.766800>}
box{<-1.280100,0,-0.022800><1.280100,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.593000,0.000000,53.766800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.766800>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.766800>}
box{<-1.097200,0,-0.022800><1.097200,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,53.766800>}
box{<-1.531600,0,-0.022800><1.531600,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.085800,0.000000,53.766800>}
box{<-1.028700,0,-0.022800><1.028700,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.815300,0.000000,53.812500>}
box{<-0.914400,0,-0.022800><0.914400,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.124200,0.000000,53.812500>}
box{<-1.303000,0,-0.022800><1.303000,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.570200,0.000000,53.812500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.812500>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.812500>}
box{<-1.097200,0,-0.022800><1.097200,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,53.812500>}
box{<-1.531600,0,-0.022800><1.531600,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.085800,0.000000,53.812500>}
box{<-0.983000,0,-0.022900><0.983000,0.036000,0.022900> rotate<0,-0.000000,0> translate<30.769600,0.000000,53.858300>}
box{<-0.937300,0,-0.022900><0.937300,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.055600,0.000000,53.858300>}
box{<-0.685800,0,-0.022900><0.685800,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.907300,0.000000,53.858300>}
box{<-0.411400,0,-0.022900><0.411400,0.036000,0.022900> rotate<0,-0.000000,0> translate<36.461700,0.000000,53.858300>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.858300>}
box{<-0.571500,0,-0.022900><0.571500,0.036000,0.022900> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.858300>}
box{<-1.097200,0,-0.022900><1.097200,0.036000,0.022900> rotate<0,-0.000000,0> translate<42.908200,0.000000,53.858300>}
box{<-1.531600,0,-0.022900><1.531600,0.036000,0.022900> rotate<0,-0.000000,0> translate<46.085800,0.000000,53.858300>}
box{<-0.937200,0,-0.022800><0.937200,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.723800,0.000000,53.904000>}
box{<-0.960100,0,-0.022800><0.960100,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.987000,0.000000,53.904000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.724300,0.000000,53.904000>}
box{<-0.274300,0,-0.022800><0.274300,0.036000,0.022800> rotate<0,-0.000000,0> translate<36.598900,0.000000,53.904000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.904000>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.904000>}
box{<-1.097200,0,-0.022800><1.097200,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,53.904000>}
box{<-1.554400,0,-0.022800><1.554400,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.108600,0.000000,53.904000>}
box{<-0.891500,0,-0.022800><0.891500,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.678100,0.000000,53.949700>}
box{<-0.960100,0,-0.022800><0.960100,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.941300,0.000000,53.949700>}
box{<-0.480000,0,-0.022800><0.480000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.610000,0.000000,53.949700>}
box{<-0.182800,0,-0.022800><0.182800,0.036000,0.022800> rotate<0,-0.000000,0> translate<36.690300,0.000000,53.949700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.949700>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.949700>}
box{<-1.097200,0,-0.022800><1.097200,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,53.949700>}
box{<-1.554400,0,-0.022800><1.554400,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.108600,0.000000,53.949700>}
box{<-0.845800,0,-0.022800><0.845800,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.632400,0.000000,53.995400>}
box{<-0.983000,0,-0.022800><0.983000,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.872700,0.000000,53.995400>}
box{<-0.434300,0,-0.022800><0.434300,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.518600,0.000000,53.995400>}
box{<-0.114300,0,-0.022800><0.114300,0.036000,0.022800> rotate<0,-0.000000,0> translate<36.758900,0.000000,53.995400>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,53.995400>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,53.995400>}
box{<-1.097200,0,-0.022800><1.097200,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,53.995400>}
box{<-1.577300,0,-0.022800><1.577300,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.131500,0.000000,53.995400>}
box{<-0.800100,0,-0.022800><0.800100,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.586700,0.000000,54.041100>}
box{<-1.005800,0,-0.022800><1.005800,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.849800,0.000000,54.041100>}
box{<-0.388600,0,-0.022800><0.388600,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.472900,0.000000,54.041100>}
box{<-0.045700,0,-0.022800><0.045700,0.036000,0.022800> rotate<0,-0.000000,0> translate<36.827500,0.000000,54.041100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.041100>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,54.041100>}
box{<-1.097200,0,-0.022800><1.097200,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,54.041100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.041100>}
box{<-0.754400,0,-0.022800><0.754400,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.954500,0.000000,54.041100>}
box{<-0.731500,0,-0.022900><0.731500,0.036000,0.022900> rotate<0,-0.000000,0> translate<30.518100,0.000000,54.086900>}
box{<-1.028700,0,-0.022900><1.028700,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.781300,0.000000,54.086900>}
box{<-0.365700,0,-0.022900><0.365700,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.404300,0.000000,54.086900>}
box{<-0.388600,0,-0.022900><0.388600,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.798800,0.000000,54.086900>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.086900>}
box{<-0.571500,0,-0.022900><0.571500,0.036000,0.022900> rotate<0,-0.000000,0> translate<40.142200,0.000000,54.086900>}
box{<-1.097200,0,-0.022900><1.097200,0.036000,0.022900> rotate<0,-0.000000,0> translate<42.908200,0.000000,54.086900>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.086900>}
box{<-0.662900,0,-0.022900><0.662900,0.036000,0.022900> rotate<0,-0.000000,0> translate<47.045900,0.000000,54.086900>}
box{<-0.640100,0,-0.022800><0.640100,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.472400,0.000000,54.132600>}
box{<-1.051600,0,-0.022800><1.051600,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.712700,0.000000,54.132600>}
box{<-0.342900,0,-0.022800><0.342900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.335800,0.000000,54.132600>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.821600,0.000000,54.132600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.132600>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.142200,0.000000,54.132600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.132600>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.091600,0.000000,54.132600>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.426700,0.000000,54.178300>}
box{<-1.074400,0,-0.022800><1.074400,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.644100,0.000000,54.178300>}
box{<-0.320000,0,-0.022800><0.320000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.267100,0.000000,54.178300>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.821600,0.000000,54.178300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.178300>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.165000,0.000000,54.178300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.178300>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.137300,0.000000,54.178300>}
box{<-0.502900,0,-0.022800><0.502900,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.335200,0.000000,54.224000>}
box{<-1.120100,0,-0.022800><1.120100,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.552600,0.000000,54.224000>}
box{<-0.297200,0,-0.022800><0.297200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.198600,0.000000,54.224000>}
box{<-0.868600,0,-0.022800><0.868600,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.821600,0.000000,54.224000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.224000>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.165000,0.000000,54.224000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.224000>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.160200,0.000000,54.224000>}
box{<-0.411500,0,-0.022800><0.411500,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.243800,0.000000,54.269700>}
box{<-1.165800,0,-0.022800><1.165800,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.461200,0.000000,54.269700>}
box{<-0.274300,0,-0.022800><0.274300,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.130000,0.000000,54.269700>}
box{<-0.983000,0,-0.022800><0.983000,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,54.269700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.269700>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.187900,0.000000,54.269700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.269700>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.160200,0.000000,54.269700>}
box{<-0.274300,0,-0.022900><0.274300,0.036000,0.022900> rotate<0,-0.000000,0> translate<30.106600,0.000000,54.315500>}
box{<-1.211600,0,-0.022900><1.211600,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.369800,0.000000,54.315500>}
box{<-0.274300,0,-0.022900><0.274300,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.084300,0.000000,54.315500>}
box{<-1.051500,0,-0.022900><1.051500,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.775900,0.000000,54.315500>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.315500>}
box{<-0.571500,0,-0.022900><0.571500,0.036000,0.022900> rotate<0,-0.000000,0> translate<40.187900,0.000000,54.315500>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.315500>}
box{<-0.571500,0,-0.022900><0.571500,0.036000,0.022900> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.315500>}
box{<-1.280200,0,-0.022800><1.280200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.255500,0.000000,54.361200>}
box{<-0.274300,0,-0.022800><0.274300,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.038600,0.000000,54.361200>}
box{<-1.074400,0,-0.022800><1.074400,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.753100,0.000000,54.361200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.361200>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.210700,0.000000,54.361200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.361200>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.361200>}
box{<-1.371600,0,-0.022800><1.371600,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.118300,0.000000,54.406900>}
box{<-0.251500,0,-0.022800><0.251500,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.970000,0.000000,54.406900>}
box{<-1.120100,0,-0.022800><1.120100,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.707300,0.000000,54.406900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.406900>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.210700,0.000000,54.406900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.406900>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.406900>}
box{<-1.440200,0,-0.022800><1.440200,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.958300,0.000000,54.452600>}
box{<-0.251400,0,-0.022800><0.251400,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.924200,0.000000,54.452600>}
box{<-1.143000,0,-0.022800><1.143000,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.684500,0.000000,54.452600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.452600>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.210700,0.000000,54.452600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.452600>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.452600>}
box{<-1.554500,0,-0.022800><1.554500,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.798300,0.000000,54.498300>}
box{<-0.251400,0,-0.022800><0.251400,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.878500,0.000000,54.498300>}
box{<-1.188700,0,-0.022800><1.188700,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.638800,0.000000,54.498300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.498300>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.233600,0.000000,54.498300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.498300>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.498300>}
box{<-1.668800,0,-0.022900><1.668800,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.638300,0.000000,54.544100>}
box{<-0.251400,0,-0.022900><0.251400,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.832800,0.000000,54.544100>}
box{<-1.188700,0,-0.022900><1.188700,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.593000,0.000000,54.544100>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.544100>}
box{<-0.594400,0,-0.022900><0.594400,0.036000,0.022900> rotate<0,-0.000000,0> translate<40.256500,0.000000,54.544100>}
box{<-0.045700,0,-0.022900><0.045700,0.036000,0.022900> rotate<0,-0.000000,0> translate<42.771100,0.000000,54.544100>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.544100>}
box{<-0.571500,0,-0.022900><0.571500,0.036000,0.022900> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.544100>}
box{<-1.691600,0,-0.022800><1.691600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.523900,0.000000,54.589800>}
box{<-0.251400,0,-0.022800><0.251400,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.787100,0.000000,54.589800>}
box{<-1.211600,0,-0.022800><1.211600,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.570200,0.000000,54.589800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.589800>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.279300,0.000000,54.589800>}
box{<-0.114300,0,-0.022800><0.114300,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.839700,0.000000,54.589800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.589800>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.589800>}
box{<-1.668800,0,-0.022800><1.668800,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.501100,0.000000,54.635500>}
box{<-0.274300,0,-0.022800><0.274300,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.718500,0.000000,54.635500>}
box{<-1.257300,0,-0.022800><1.257300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.524500,0.000000,54.635500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.635500>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.279300,0.000000,54.635500>}
box{<-0.182800,0,-0.022800><0.182800,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.862500,0.000000,54.635500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.635500>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.635500>}
box{<-1.645900,0,-0.022800><1.645900,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.478200,0.000000,54.681200>}
box{<-0.274300,0,-0.022800><0.274300,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.672800,0.000000,54.681200>}
box{<-1.280100,0,-0.022800><1.280100,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.501600,0.000000,54.681200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.681200>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.325100,0.000000,54.681200>}
box{<-0.251400,0,-0.022800><0.251400,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.931100,0.000000,54.681200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.681200>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.681200>}
box{<-1.600200,0,-0.022800><1.600200,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.478300,0.000000,54.726900>}
box{<-0.274300,0,-0.022800><0.274300,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.627100,0.000000,54.726900>}
box{<-1.280200,0,-0.022800><1.280200,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.455900,0.000000,54.726900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.726900>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.325100,0.000000,54.726900>}
box{<-0.320000,0,-0.022800><0.320000,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.953900,0.000000,54.726900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.726900>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.726900>}
box{<-1.554400,0,-0.022900><1.554400,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.432500,0.000000,54.772700>}
box{<-0.274300,0,-0.022900><0.274300,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.581400,0.000000,54.772700>}
box{<-1.303000,0,-0.022900><1.303000,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.433000,0.000000,54.772700>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.772700>}
box{<-0.640000,0,-0.022900><0.640000,0.036000,0.022900> rotate<0,-0.000000,0> translate<40.347900,0.000000,54.772700>}
box{<-0.388600,0,-0.022900><0.388600,0.036000,0.022900> rotate<0,-0.000000,0> translate<42.976800,0.000000,54.772700>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.772700>}
box{<-0.571500,0,-0.022900><0.571500,0.036000,0.022900> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.772700>}
box{<-1.531600,0,-0.022800><1.531600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.409700,0.000000,54.818400>}
box{<-0.297200,0,-0.022800><0.297200,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.558500,0.000000,54.818400>}
box{<-1.325900,0,-0.022800><1.325900,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.410200,0.000000,54.818400>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.818400>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.393600,0.000000,54.818400>}
box{<-0.457200,0,-0.022800><0.457200,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.045400,0.000000,54.818400>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.818400>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.183100,0.000000,54.818400>}
box{<-1.485900,0,-0.022800><1.485900,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.409700,0.000000,54.864100>}
box{<-0.320000,0,-0.022800><0.320000,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.489900,0.000000,54.864100>}
box{<-1.325900,0,-0.022800><1.325900,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.410200,0.000000,54.864100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.864100>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.416500,0.000000,54.864100>}
box{<-0.525800,0,-0.022800><0.525800,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.068300,0.000000,54.864100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.864100>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.160200,0.000000,54.864100>}
box{<-1.440100,0,-0.022800><1.440100,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.363900,0.000000,54.909800>}
box{<-0.320000,0,-0.022800><0.320000,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.444200,0.000000,54.909800>}
box{<-1.325800,0,-0.022800><1.325800,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.364400,0.000000,54.909800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.909800>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.462200,0.000000,54.909800>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.114000,0.000000,54.909800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.909800>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.137300,0.000000,54.909800>}
box{<-1.417300,0,-0.022800><1.417300,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.341100,0.000000,54.955500>}
box{<-0.342900,0,-0.022800><0.342900,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.375600,0.000000,54.955500>}
box{<-1.348700,0,-0.022800><1.348700,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.341600,0.000000,54.955500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,54.955500>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.485100,0.000000,54.955500>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.114000,0.000000,54.955500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,54.955500>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.137300,0.000000,54.955500>}
box{<-1.371600,0,-0.022900><1.371600,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.295400,0.000000,55.001300>}
box{<-0.365700,0,-0.022900><0.365700,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.352700,0.000000,55.001300>}
box{<-1.371600,0,-0.022900><1.371600,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.318700,0.000000,55.001300>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.001300>}
box{<-0.685800,0,-0.022900><0.685800,0.036000,0.022900> rotate<0,-0.000000,0> translate<40.530800,0.000000,55.001300>}
box{<-0.708600,0,-0.022900><0.708600,0.036000,0.022900> rotate<0,-0.000000,0> translate<43.068200,0.000000,55.001300>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.102800,0.000000,55.001300>}
box{<-0.640100,0,-0.022900><0.640100,0.036000,0.022900> rotate<0,-0.000000,0> translate<47.068800,0.000000,55.001300>}
box{<-1.325900,0,-0.022800><1.325900,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.295400,0.000000,55.047000>}
box{<-0.388600,0,-0.022800><0.388600,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.284200,0.000000,55.047000>}
box{<-1.371600,0,-0.022800><1.371600,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.273000,0.000000,55.047000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.047000>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.576500,0.000000,55.047000>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<43.022500,0.000000,55.047000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,55.047000>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<47.023100,0.000000,55.047000>}
box{<-1.280100,0,-0.022800><1.280100,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.249600,0.000000,55.092700>}
box{<-0.411400,0,-0.022800><0.411400,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.261300,0.000000,55.092700>}
box{<-1.371600,0,-0.022800><1.371600,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.273000,0.000000,55.092700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.092700>}
box{<-0.754400,0,-0.022800><0.754400,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.645100,0.000000,55.092700>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.954000,0.000000,55.092700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.102800,0.000000,55.092700>}
box{<-0.777200,0,-0.022800><0.777200,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.931600,0.000000,55.092700>}
box{<-1.234400,0,-0.022800><1.234400,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.203900,0.000000,55.138400>}
box{<-0.434300,0,-0.022800><0.434300,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.192700,0.000000,55.138400>}
box{<-1.394400,0,-0.022800><1.394400,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.250100,0.000000,55.138400>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.138400>}
box{<-0.823000,0,-0.022800><0.823000,0.036000,0.022800> rotate<0,-0.000000,0> translate<40.713700,0.000000,55.138400>}
box{<-0.777200,0,-0.022800><0.777200,0.036000,0.022800> rotate<0,-0.000000,0> translate<42.908200,0.000000,55.138400>}
box{<-1.577300,0,-0.022800><1.577300,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.131500,0.000000,55.138400>}
box{<-1.188700,0,-0.022800><1.188700,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.203900,0.000000,55.184100>}
box{<-0.434300,0,-0.022800><0.434300,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.147000,0.000000,55.184100>}
box{<-1.371600,0,-0.022800><1.371600,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.227300,0.000000,55.184100>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.184100>}
box{<-1.851600,0,-0.022800><1.851600,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.788100,0.000000,55.184100>}
box{<-1.554400,0,-0.022800><1.554400,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.108600,0.000000,55.184100>}
box{<-1.143000,0,-0.022900><1.143000,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.158200,0.000000,55.229900>}
box{<-0.480000,0,-0.022900><0.480000,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.101300,0.000000,55.229900>}
box{<-1.394400,0,-0.022900><1.394400,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.204400,0.000000,55.229900>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.229900>}
box{<-1.828800,0,-0.022900><1.828800,0.036000,0.022900> rotate<0,-0.000000,0> translate<41.811000,0.000000,55.229900>}
box{<-1.554400,0,-0.022900><1.554400,0.036000,0.022900> rotate<0,-0.000000,0> translate<46.108600,0.000000,55.229900>}
box{<-1.097300,0,-0.022800><1.097300,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.112500,0.000000,55.275600>}
box{<-0.525800,0,-0.022800><0.525800,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.055600,0.000000,55.275600>}
box{<-0.937200,0,-0.022800><0.937200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.701500,0.000000,55.275600>}
box{<-0.297200,0,-0.022800><0.297200,0.036000,0.022800> rotate<0,-0.000000,0> translate<36.256000,0.000000,55.275600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.275600>}
box{<-1.783100,0,-0.022800><1.783100,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.811000,0.000000,55.275600>}
box{<-1.531600,0,-0.022800><1.531600,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.085800,0.000000,55.275600>}
box{<-1.005800,0,-0.022800><1.005800,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.066700,0.000000,55.321300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.987000,0.000000,55.321300>}
box{<-0.845800,0,-0.022800><0.845800,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.610100,0.000000,55.321300>}
box{<-0.205700,0,-0.022800><0.205700,0.036000,0.022800> rotate<0,-0.000000,0> translate<36.347400,0.000000,55.321300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.321300>}
box{<-1.760200,0,-0.022800><1.760200,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.788100,0.000000,55.321300>}
box{<-1.531600,0,-0.022800><1.531600,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.085800,0.000000,55.321300>}
box{<-0.960100,0,-0.022800><0.960100,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.021000,0.000000,55.367000>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.941300,0.000000,55.367000>}
box{<-0.823000,0,-0.022800><0.823000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.541500,0.000000,55.367000>}
box{<-0.114300,0,-0.022800><0.114300,0.036000,0.022800> rotate<0,-0.000000,0> translate<36.393200,0.000000,55.367000>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.367000>}
box{<-1.714500,0,-0.022800><1.714500,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.788100,0.000000,55.367000>}
box{<-1.508700,0,-0.022800><1.508700,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.062900,0.000000,55.367000>}
box{<-0.868600,0,-0.022800><0.868600,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.975300,0.000000,55.412700>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.895500,0.000000,55.412700>}
box{<-0.777200,0,-0.022800><0.777200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.495700,0.000000,55.412700>}
box{<-0.068600,0,-0.022800><0.068600,0.036000,0.022800> rotate<0,-0.000000,0> translate<36.438900,0.000000,55.412700>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.412700>}
box{<-1.691600,0,-0.022800><1.691600,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.810900,0.000000,55.412700>}
box{<-1.508700,0,-0.022800><1.508700,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.062900,0.000000,55.412700>}
box{<-0.800100,0,-0.022900><0.800100,0.036000,0.022900> rotate<0,-0.000000,0> translate<30.906800,0.000000,55.458500>}
box{<-0.640000,0,-0.022900><0.640000,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.849800,0.000000,55.458500>}
box{<-0.731500,0,-0.022900><0.731500,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.450000,0.000000,55.458500>}
box{<-0.045700,0,-0.022900><0.045700,0.036000,0.022900> rotate<0,-0.000000,0> translate<36.461700,0.000000,55.458500>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.458500>}
box{<-1.645900,0,-0.022900><1.645900,0.036000,0.022900> rotate<0,-0.000000,0> translate<41.811000,0.000000,55.458500>}
box{<-1.485900,0,-0.022900><1.485900,0.036000,0.022900> rotate<0,-0.000000,0> translate<46.040100,0.000000,55.458500>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.861000,0.000000,55.504200>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.827000,0.000000,55.504200>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.404300,0.000000,55.504200>}
box{<-0.228600,0,-0.022800><0.228600,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.821700,0.000000,55.504200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.504200>}
box{<-1.600200,0,-0.022800><1.600200,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.811000,0.000000,55.504200>}
box{<-1.463000,0,-0.022800><1.463000,0.036000,0.022800> rotate<0,-0.000000,0> translate<46.017200,0.000000,55.504200>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.792400,0.000000,55.549900>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.827000,0.000000,55.549900>}
box{<-0.708600,0,-0.022800><0.708600,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.381400,0.000000,55.549900>}
box{<-0.342900,0,-0.022800><0.342900,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,55.549900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.549900>}
box{<-1.554500,0,-0.022800><1.554500,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.811000,0.000000,55.549900>}
box{<-1.440100,0,-0.022800><1.440100,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.994300,0.000000,55.549900>}
box{<-0.502900,0,-0.022800><0.502900,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.701000,0.000000,55.595600>}
box{<-0.045700,0,-0.022800><0.045700,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.935400,0.000000,55.595600>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.804100,0.000000,55.595600>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.358600,0.000000,55.595600>}
box{<-0.434300,0,-0.022800><0.434300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.798800,0.000000,55.595600>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.595600>}
box{<-1.508700,0,-0.022800><1.508700,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.810900,0.000000,55.595600>}
box{<-1.417300,0,-0.022800><1.417300,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.971500,0.000000,55.595600>}
box{<-0.388600,0,-0.022800><0.388600,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.632400,0.000000,55.641300>}
box{<-0.114300,0,-0.022800><0.114300,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.866900,0.000000,55.641300>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.804100,0.000000,55.641300>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.312900,0.000000,55.641300>}
box{<-0.502900,0,-0.022800><0.502900,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.821600,0.000000,55.641300>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.641300>}
box{<-1.463000,0,-0.022800><1.463000,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.810900,0.000000,55.641300>}
box{<-1.394400,0,-0.022800><1.394400,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.948600,0.000000,55.641300>}
box{<-0.274300,0,-0.022900><0.274300,0.036000,0.022900> rotate<0,-0.000000,0> translate<30.563800,0.000000,55.687100>}
box{<-0.160000,0,-0.022900><0.160000,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.775400,0.000000,55.687100>}
box{<-0.617200,0,-0.022900><0.617200,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.781300,0.000000,55.687100>}
box{<-0.662900,0,-0.022900><0.662900,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.290000,0.000000,55.687100>}
box{<-0.571500,0,-0.022900><0.571500,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.798800,0.000000,55.687100>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.687100>}
box{<-1.394400,0,-0.022900><1.394400,0.036000,0.022900> rotate<0,-0.000000,0> translate<41.833800,0.000000,55.687100>}
box{<-1.371600,0,-0.022900><1.371600,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.925800,0.000000,55.687100>}
box{<-0.182900,0,-0.022800><0.182900,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.472400,0.000000,55.732800>}
box{<-0.228600,0,-0.022800><0.228600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.706900,0.000000,55.732800>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.781300,0.000000,55.732800>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.244300,0.000000,55.732800>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.753100,0.000000,55.732800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.732800>}
box{<-1.325900,0,-0.022800><1.325900,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.811000,0.000000,55.732800>}
box{<-1.348700,0,-0.022800><1.348700,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.902900,0.000000,55.732800>}
box{<-0.068500,0,-0.022800><0.068500,0.036000,0.022800> rotate<0,-0.000000,0> translate<30.403800,0.000000,55.778500>}
box{<-0.297200,0,-0.022800><0.297200,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.638300,0.000000,55.778500>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.781300,0.000000,55.778500>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.244300,0.000000,55.778500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.730200,0.000000,55.778500>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.778500>}
box{<-1.257300,0,-0.022800><1.257300,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.833800,0.000000,55.778500>}
box{<-1.303000,0,-0.022800><1.303000,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.857200,0.000000,55.778500>}
box{<-0.388600,0,-0.022800><0.388600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.546800,0.000000,55.824200>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.758400,0.000000,55.824200>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.221400,0.000000,55.824200>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.707400,0.000000,55.824200>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.824200>}
box{<-1.188700,0,-0.022800><1.188700,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.811000,0.000000,55.824200>}
box{<-1.257300,0,-0.022800><1.257300,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.811500,0.000000,55.824200>}
box{<-0.502900,0,-0.022800><0.502900,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.432500,0.000000,55.869900>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.735500,0.000000,55.869900>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.221400,0.000000,55.869900>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.661600,0.000000,55.869900>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.869900>}
box{<-1.120100,0,-0.022800><1.120100,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.833800,0.000000,55.869900>}
box{<-1.188700,0,-0.022800><1.188700,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.742900,0.000000,55.869900>}
box{<-0.617200,0,-0.022900><0.617200,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.318200,0.000000,55.915700>}
box{<-0.617200,0,-0.022900><0.617200,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.735500,0.000000,55.915700>}
box{<-0.617200,0,-0.022900><0.617200,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.198600,0.000000,55.915700>}
box{<-0.571500,0,-0.022900><0.571500,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.615900,0.000000,55.915700>}
box{<-0.548600,0,-0.022900><0.548600,0.036000,0.022900> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.915700>}
box{<-1.028700,0,-0.022900><1.028700,0.036000,0.022900> rotate<0,-0.000000,0> translate<41.833800,0.000000,55.915700>}
box{<-1.120100,0,-0.022900><1.120100,0.036000,0.022900> rotate<0,-0.000000,0> translate<45.674300,0.000000,55.915700>}
box{<-0.731500,0,-0.022800><0.731500,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.203900,0.000000,55.961400>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.735500,0.000000,55.961400>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.175700,0.000000,55.961400>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.615900,0.000000,55.961400>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<38.473400,0.000000,55.961400>}
box{<-0.914400,0,-0.022800><0.914400,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.856700,0.000000,55.961400>}
box{<-1.005800,0,-0.022800><1.005800,0.036000,0.022800> rotate<0,-0.000000,0> translate<45.560000,0.000000,55.961400>}
box{<-0.708700,0,-0.022800><0.708700,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.226800,0.000000,56.007100>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.735500,0.000000,56.007100>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.152900,0.000000,56.007100>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.570200,0.000000,56.007100>}
box{<-0.777200,0,-0.022800><0.777200,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.856700,0.000000,56.007100>}
box{<-0.685800,0,-0.022800><0.685800,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.249700,0.000000,56.052800>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.735500,0.000000,56.052800>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.152900,0.000000,56.052800>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.547300,0.000000,56.052800>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.833800,0.000000,56.052800>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.249600,0.000000,56.098500>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.735500,0.000000,56.098500>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.152900,0.000000,56.098500>}
box{<-0.525800,0,-0.022800><0.525800,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.524500,0.000000,56.098500>}
box{<-0.365800,0,-0.022800><0.365800,0.036000,0.022800> rotate<0,-0.000000,0> translate<41.856700,0.000000,56.098500>}
box{<-0.640000,0,-0.022900><0.640000,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.249600,0.000000,56.144300>}
box{<-0.594400,0,-0.022900><0.594400,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.712700,0.000000,56.144300>}
box{<-0.617200,0,-0.022900><0.617200,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.152900,0.000000,56.144300>}
box{<-0.525700,0,-0.022900><0.525700,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.478700,0.000000,56.144300>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.272500,0.000000,56.190000>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.712700,0.000000,56.190000>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.152900,0.000000,56.190000>}
box{<-0.502900,0,-0.022800><0.502900,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.455900,0.000000,56.190000>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.295300,0.000000,56.235700>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.712700,0.000000,56.235700>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.130000,0.000000,56.235700>}
box{<-0.502900,0,-0.022800><0.502900,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.455900,0.000000,56.235700>}
box{<-0.571500,0,-0.022800><0.571500,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.318200,0.000000,56.281400>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.712700,0.000000,56.281400>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.130000,0.000000,56.281400>}
box{<-0.480000,0,-0.022800><0.480000,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.433000,0.000000,56.281400>}
box{<-0.548600,0,-0.022800><0.548600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.341100,0.000000,56.327100>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.712700,0.000000,56.327100>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.130000,0.000000,56.327100>}
box{<-0.457200,0,-0.022800><0.457200,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.410200,0.000000,56.327100>}
box{<-0.525700,0,-0.022900><0.525700,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.363900,0.000000,56.372900>}
box{<-0.594400,0,-0.022900><0.594400,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.712700,0.000000,56.372900>}
box{<-0.594300,0,-0.022900><0.594300,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.130000,0.000000,56.372900>}
box{<-0.434300,0,-0.022900><0.434300,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.387300,0.000000,56.372900>}
box{<-0.502900,0,-0.022800><0.502900,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.386800,0.000000,56.418600>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.712700,0.000000,56.418600>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.130000,0.000000,56.418600>}
box{<-0.411400,0,-0.022800><0.411400,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.364400,0.000000,56.418600>}
box{<-0.480000,0,-0.022800><0.480000,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.409600,0.000000,56.464300>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.712700,0.000000,56.464300>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.130000,0.000000,56.464300>}
box{<-0.388600,0,-0.022800><0.388600,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.341600,0.000000,56.464300>}
box{<-0.457200,0,-0.022800><0.457200,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.432500,0.000000,56.510000>}
box{<-0.594400,0,-0.022800><0.594400,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.712700,0.000000,56.510000>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.152900,0.000000,56.510000>}
box{<-0.342900,0,-0.022800><0.342900,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.295900,0.000000,56.510000>}
box{<-0.411400,0,-0.022800><0.411400,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.478200,0.000000,56.555700>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.735500,0.000000,56.555700>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.152900,0.000000,56.555700>}
box{<-0.297200,0,-0.022800><0.297200,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.295900,0.000000,56.555700>}
box{<-0.411500,0,-0.022900><0.411500,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.524000,0.000000,56.601500>}
box{<-0.617200,0,-0.022900><0.617200,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.735500,0.000000,56.601500>}
box{<-0.617200,0,-0.022900><0.617200,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.152900,0.000000,56.601500>}
box{<-0.274300,0,-0.022900><0.274300,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.273000,0.000000,56.601500>}
box{<-0.388600,0,-0.022800><0.388600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.546800,0.000000,56.647200>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.735500,0.000000,56.647200>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.152900,0.000000,56.647200>}
box{<-0.251400,0,-0.022800><0.251400,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.250100,0.000000,56.647200>}
box{<-0.365800,0,-0.022800><0.365800,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.569700,0.000000,56.692900>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.735500,0.000000,56.692900>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.175700,0.000000,56.692900>}
box{<-0.182900,0,-0.022800><0.182900,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.227300,0.000000,56.692900>}
box{<-0.320000,0,-0.022800><0.320000,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.615400,0.000000,56.738600>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.735500,0.000000,56.738600>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.198600,0.000000,56.738600>}
box{<-0.160000,0,-0.022800><0.160000,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.204400,0.000000,56.738600>}
box{<-0.297200,0,-0.022800><0.297200,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.638300,0.000000,56.784300>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.735500,0.000000,56.784300>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.221400,0.000000,56.784300>}
box{<-0.114300,0,-0.022800><0.114300,0.036000,0.022800> rotate<0,-0.000000,0> translate<35.204400,0.000000,56.784300>}
box{<-0.251500,0,-0.022900><0.251500,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.684000,0.000000,56.830100>}
box{<-0.617200,0,-0.022900><0.617200,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.735500,0.000000,56.830100>}
box{<-0.640000,0,-0.022900><0.640000,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.221400,0.000000,56.830100>}
box{<-0.068600,0,-0.022900><0.068600,0.036000,0.022900> rotate<0,-0.000000,0> translate<35.158700,0.000000,56.830100>}
box{<-0.228600,0,-0.022800><0.228600,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.706900,0.000000,56.875800>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.781300,0.000000,56.875800>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.244300,0.000000,56.875800>}
box{<-0.182900,0,-0.022800><0.182900,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.752600,0.000000,56.921500>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.781300,0.000000,56.921500>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.244300,0.000000,56.921500>}
box{<-0.137200,0,-0.022800><0.137200,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.798300,0.000000,56.967200>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.781300,0.000000,56.967200>}
box{<-0.662900,0,-0.022800><0.662900,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.290000,0.000000,56.967200>}
box{<-0.114300,0,-0.022800><0.114300,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.866900,0.000000,57.012900>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.781300,0.000000,57.012900>}
box{<-0.640100,0,-0.022800><0.640100,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.267200,0.000000,57.012900>}
box{<-0.068600,0,-0.022900><0.068600,0.036000,0.022900> rotate<0,-0.000000,0> translate<31.912600,0.000000,57.058700>}
box{<-0.640000,0,-0.022900><0.640000,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.804100,0.000000,57.058700>}
box{<-0.594300,0,-0.022900><0.594300,0.036000,0.022900> rotate<0,-0.000000,0> translate<34.221400,0.000000,57.058700>}
box{<-0.022800,0,-0.022800><0.022800,0.036000,0.022800> rotate<0,-0.000000,0> translate<31.958300,0.000000,57.104400>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.827000,0.000000,57.104400>}
box{<-0.525800,0,-0.022800><0.525800,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.198600,0.000000,57.104400>}
box{<-0.617200,0,-0.022800><0.617200,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.827000,0.000000,57.150100>}
box{<-0.457200,0,-0.022800><0.457200,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.130000,0.000000,57.150100>}
box{<-0.640000,0,-0.022800><0.640000,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.849800,0.000000,57.195800>}
box{<-0.411500,0,-0.022800><0.411500,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.084300,0.000000,57.195800>}
box{<-0.594300,0,-0.022800><0.594300,0.036000,0.022800> rotate<0,-0.000000,0> translate<32.895500,0.000000,57.241500>}
box{<-0.320000,0,-0.022800><0.320000,0.036000,0.022800> rotate<0,-0.000000,0> translate<34.038500,0.000000,57.241500>}
box{<-0.502900,0,-0.022900><0.502900,0.036000,0.022900> rotate<0,-0.000000,0> translate<32.987000,0.000000,57.287300>}
box{<-0.228600,0,-0.022900><0.228600,0.036000,0.022900> rotate<0,-0.000000,0> translate<33.947100,0.000000,57.287300>}
box{<-0.411500,0,-0.022800><0.411500,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.124200,0.000000,57.333000>}
box{<-0.091400,0,-0.022800><0.091400,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.855700,0.000000,57.333000>}
box{<-0.251500,0,-0.022800><0.251500,0.036000,0.022800> rotate<0,-0.000000,0> translate<33.284200,0.000000,57.378700>}
//BAT silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.834000,0.000000,43.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.834000,0.000000,53.634000>}
box{<0,0,-0.076200><9.982000,0.036000,0.076200> rotate<0,90.000000,0> translate<68.834000,0.000000,53.634000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.639000,0.000000,53.634000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.842000,0.000000,53.634000>}
box{<0,0,-0.076200><0.203000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.639000,0.000000,53.634000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.639000,0.000000,53.634000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.639000,0.000000,43.652000>}
box{<0,0,-0.076200><9.982000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.639000,0.000000,43.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.834000,0.000000,43.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.446000,0.000000,43.652000>}
box{<0,0,-0.076200><2.388000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.446000,0.000000,43.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.446000,0.000000,43.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.446000,0.000000,45.252000>}
box{<0,0,-0.076200><1.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.446000,0.000000,45.252000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.446000,0.000000,47.030000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.446000,0.000000,50.256000>}
box{<0,0,-0.076200><3.226000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.446000,0.000000,50.256000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.446000,0.000000,52.034000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.446000,0.000000,53.634000>}
box{<0,0,-0.076200><1.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<66.446000,0.000000,53.634000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.446000,0.000000,43.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.842000,0.000000,43.652000>}
box{<0,0,-0.076200><6.604000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.842000,0.000000,43.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.446000,0.000000,53.634000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<68.834000,0.000000,53.634000>}
box{<0,0,-0.076200><2.388000,0.036000,0.076200> rotate<0,0.000000,0> translate<66.446000,0.000000,53.634000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.842000,0.000000,43.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.842000,0.000000,53.634000>}
box{<0,0,-0.076200><9.982000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.842000,0.000000,53.634000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.842000,0.000000,43.652000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.639000,0.000000,43.652000>}
box{<0,0,-0.076200><0.203000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.639000,0.000000,43.652000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.842000,0.000000,53.634000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.446000,0.000000,53.634000>}
box{<0,0,-0.076200><6.604000,0.036000,0.076200> rotate<0,0.000000,0> translate<59.842000,0.000000,53.634000> }
difference{
cylinder{<61.163200,0,46.141000><61.163200,0.036000,46.141000>0.584200 translate<0,0.000000,0>}
cylinder{<61.163200,-0.1,46.141000><61.163200,0.135000,46.141000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<61.163200,0,51.144800><61.163200,0.036000,51.144800>0.584200 translate<0,0.000000,0>}
cylinder{<61.163200,-0.1,51.144800><61.163200,0.135000,51.144800>0.431800 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.911900,0.000000,44.172500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.530600,0.000000,44.553800>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,44.997030,0> translate<61.530600,0.000000,44.553800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.530600,0.000000,44.553800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.674500,0.000000,44.553800>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,0.000000,0> translate<61.530600,0.000000,44.553800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.674500,0.000000,44.172500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.674500,0.000000,44.935100>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,90.000000,0> translate<62.674500,0.000000,44.935100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.674500,0.000000,49.888100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.674500,0.000000,49.125500>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,-90.000000,0> translate<62.674500,0.000000,49.125500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.674500,0.000000,49.125500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.911900,0.000000,49.888100>}
box{<0,0,-0.063500><1.078479,0.036000,0.063500> rotate<0,44.997030,0> translate<61.911900,0.000000,49.888100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.911900,0.000000,49.888100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.721200,0.000000,49.888100>}
box{<0,0,-0.063500><0.190700,0.036000,0.063500> rotate<0,0.000000,0> translate<61.721200,0.000000,49.888100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.721200,0.000000,49.888100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.530600,0.000000,49.697400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-45.012056,0> translate<61.530600,0.000000,49.697400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.530600,0.000000,49.697400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.530600,0.000000,49.316100>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,-90.000000,0> translate<61.530600,0.000000,49.316100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.530600,0.000000,49.316100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.721200,0.000000,49.125500>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,44.997030,0> translate<61.530600,0.000000,49.316100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.504600,0.000000,55.105300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.504600,0.000000,56.249200>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<62.504600,0.000000,56.249200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.504600,0.000000,56.249200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.076500,0.000000,56.249200>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,0.000000,0> translate<62.504600,0.000000,56.249200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.076500,0.000000,56.249200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.267200,0.000000,56.058600>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<63.076500,0.000000,56.249200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.267200,0.000000,56.058600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.267200,0.000000,55.867900>}
box{<0,0,-0.063500><0.190700,0.036000,0.063500> rotate<0,-90.000000,0> translate<63.267200,0.000000,55.867900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.267200,0.000000,55.867900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.076500,0.000000,55.677200>}
box{<0,0,-0.063500><0.269691,0.036000,0.063500> rotate<0,-44.997030,0> translate<63.076500,0.000000,55.677200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.076500,0.000000,55.677200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.267200,0.000000,55.486600>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<63.076500,0.000000,55.677200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.267200,0.000000,55.486600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.267200,0.000000,55.295900>}
box{<0,0,-0.063500><0.190700,0.036000,0.063500> rotate<0,-90.000000,0> translate<63.267200,0.000000,55.295900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.267200,0.000000,55.295900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.076500,0.000000,55.105300>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-44.982005,0> translate<63.076500,0.000000,55.105300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.076500,0.000000,55.105300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.504600,0.000000,55.105300>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,0.000000,0> translate<62.504600,0.000000,55.105300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.504600,0.000000,55.677200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.076500,0.000000,55.677200>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,0.000000,0> translate<62.504600,0.000000,55.677200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.673900,0.000000,55.105300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.673900,0.000000,55.867900>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,90.000000,0> translate<63.673900,0.000000,55.867900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.673900,0.000000,55.867900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.055200,0.000000,56.249200>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,-44.997030,0> translate<63.673900,0.000000,55.867900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.055200,0.000000,56.249200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.436500,0.000000,55.867900>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,44.997030,0> translate<64.055200,0.000000,56.249200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.436500,0.000000,55.867900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.436500,0.000000,55.105300>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,-90.000000,0> translate<64.436500,0.000000,55.105300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.673900,0.000000,55.677200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.436500,0.000000,55.677200>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<63.673900,0.000000,55.677200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.224500,0.000000,55.105300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.224500,0.000000,56.249200>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<65.224500,0.000000,56.249200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.843200,0.000000,56.249200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<65.605800,0.000000,56.249200>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<64.843200,0.000000,56.249200> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.674000,-1.536000,63.409000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.474000,-1.536000,63.409000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,0.000000,0> translate<16.474000,-1.536000,63.409000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.474000,-1.536000,63.409000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.474000,-1.536000,57.509000>}
box{<0,0,-0.050800><5.900000,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.474000,-1.536000,57.509000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.474000,-1.536000,57.509000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.774000,-1.536000,55.209000>}
box{<0,0,-0.050800><3.252691,0.036000,0.050800> rotate<0,44.997030,0> translate<16.474000,-1.536000,57.509000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<18.774000,-1.536000,55.209000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.674000,-1.536000,55.209000>}
box{<0,0,-0.050800><0.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<18.774000,-1.536000,55.209000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.474000,-1.536000,55.209000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.374000,-1.536000,55.209000>}
box{<0,0,-0.050800><0.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<21.474000,-1.536000,55.209000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.374000,-1.536000,55.209000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.674000,-1.536000,57.509000>}
box{<0,0,-0.050800><3.252691,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.374000,-1.536000,55.209000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.674000,-1.536000,57.509000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.674000,-1.536000,63.409000>}
box{<0,0,-0.050800><5.900000,0.036000,0.050800> rotate<0,90.000000,0> translate<24.674000,-1.536000,63.409000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.674000,-1.536000,63.409000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.474000,-1.536000,63.409000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,0.000000,0> translate<21.474000,-1.536000,63.409000> }
object{ARC(3.953800,0.101600,103.157543,256.842457,0.036000) translate<20.574000,-1.536000,59.309000>}
object{ARC(3.953800,0.101600,283.157543,436.842457,0.036000) translate<20.574000,-1.536000,59.309000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.079900,-1.536000,59.903100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.236700,-1.536000,59.746400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<19.079900,-1.536000,59.903100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.236700,-1.536000,59.746400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.236700,-1.536000,59.432800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<19.236700,-1.536000,59.432800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.236700,-1.536000,59.432800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.079900,-1.536000,59.276100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<19.079900,-1.536000,59.276100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.079900,-1.536000,59.276100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.452800,-1.536000,59.276100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<18.452800,-1.536000,59.276100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.452800,-1.536000,59.276100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.296100,-1.536000,59.432800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<18.296100,-1.536000,59.432800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.296100,-1.536000,59.432800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.296100,-1.536000,59.746400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<18.296100,-1.536000,59.746400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.296100,-1.536000,59.746400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.452800,-1.536000,59.903100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<18.296100,-1.536000,59.746400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.923100,-1.536000,60.211600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.236700,-1.536000,60.525100>}
box{<0,0,-0.038100><0.443427,0.036000,0.038100> rotate<0,-44.987894,0> translate<18.923100,-1.536000,60.211600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<19.236700,-1.536000,60.525100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.296100,-1.536000,60.525100>}
box{<0,0,-0.038100><0.940600,0.036000,0.038100> rotate<0,0.000000,0> translate<18.296100,-1.536000,60.525100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.296100,-1.536000,60.211600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<18.296100,-1.536000,60.838600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,90.000000,0> translate<18.296100,-1.536000,60.838600> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.993000,-1.536000,51.344000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.793000,-1.536000,51.344000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,0.000000,0> translate<28.793000,-1.536000,51.344000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.793000,-1.536000,51.344000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.793000,-1.536000,45.444000>}
box{<0,0,-0.050800><5.900000,0.036000,0.050800> rotate<0,-90.000000,0> translate<28.793000,-1.536000,45.444000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.793000,-1.536000,45.444000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.093000,-1.536000,43.144000>}
box{<0,0,-0.050800><3.252691,0.036000,0.050800> rotate<0,44.997030,0> translate<28.793000,-1.536000,45.444000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.093000,-1.536000,43.144000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.993000,-1.536000,43.144000>}
box{<0,0,-0.050800><0.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<31.093000,-1.536000,43.144000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.793000,-1.536000,43.144000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.693000,-1.536000,43.144000>}
box{<0,0,-0.050800><0.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<33.793000,-1.536000,43.144000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.693000,-1.536000,43.144000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.993000,-1.536000,45.444000>}
box{<0,0,-0.050800><3.252691,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.693000,-1.536000,43.144000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.993000,-1.536000,45.444000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.993000,-1.536000,51.344000>}
box{<0,0,-0.050800><5.900000,0.036000,0.050800> rotate<0,90.000000,0> translate<36.993000,-1.536000,51.344000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.993000,-1.536000,51.344000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.793000,-1.536000,51.344000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,0.000000,0> translate<33.793000,-1.536000,51.344000> }
object{ARC(3.953800,0.101600,103.157543,256.842457,0.036000) translate<32.893000,-1.536000,47.244000>}
object{ARC(3.953800,0.101600,283.157543,436.842457,0.036000) translate<32.893000,-1.536000,47.244000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.398900,-1.536000,47.838100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.555700,-1.536000,47.681400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<31.398900,-1.536000,47.838100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.555700,-1.536000,47.681400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.555700,-1.536000,47.367800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.555700,-1.536000,47.367800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.555700,-1.536000,47.367800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.398900,-1.536000,47.211100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<31.398900,-1.536000,47.211100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.398900,-1.536000,47.211100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.771800,-1.536000,47.211100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<30.771800,-1.536000,47.211100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.771800,-1.536000,47.211100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.615100,-1.536000,47.367800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<30.615100,-1.536000,47.367800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.615100,-1.536000,47.367800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.615100,-1.536000,47.681400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<30.615100,-1.536000,47.681400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.615100,-1.536000,47.681400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.771800,-1.536000,47.838100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.615100,-1.536000,47.681400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.615100,-1.536000,48.773600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.615100,-1.536000,48.146600>}
box{<0,0,-0.038100><0.627000,0.036000,0.038100> rotate<0,-90.000000,0> translate<30.615100,-1.536000,48.146600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<30.615100,-1.536000,48.146600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.242100,-1.536000,48.773600>}
box{<0,0,-0.038100><0.886712,0.036000,0.038100> rotate<0,-44.997030,0> translate<30.615100,-1.536000,48.146600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.242100,-1.536000,48.773600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.398900,-1.536000,48.773600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<31.242100,-1.536000,48.773600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.398900,-1.536000,48.773600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.555700,-1.536000,48.616900>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<31.398900,-1.536000,48.773600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.555700,-1.536000,48.616900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.555700,-1.536000,48.303300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<31.555700,-1.536000,48.303300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.555700,-1.536000,48.303300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<31.398900,-1.536000,48.146600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<31.398900,-1.536000,48.146600> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.514000,-1.536000,63.409000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.314000,-1.536000,63.409000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,0.000000,0> translate<6.314000,-1.536000,63.409000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.314000,-1.536000,63.409000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.314000,-1.536000,57.509000>}
box{<0,0,-0.050800><5.900000,0.036000,0.050800> rotate<0,-90.000000,0> translate<6.314000,-1.536000,57.509000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.314000,-1.536000,57.509000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.614000,-1.536000,55.209000>}
box{<0,0,-0.050800><3.252691,0.036000,0.050800> rotate<0,44.997030,0> translate<6.314000,-1.536000,57.509000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.614000,-1.536000,55.209000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.514000,-1.536000,55.209000>}
box{<0,0,-0.050800><0.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<8.614000,-1.536000,55.209000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.314000,-1.536000,55.209000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.214000,-1.536000,55.209000>}
box{<0,0,-0.050800><0.900000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.314000,-1.536000,55.209000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<12.214000,-1.536000,55.209000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.514000,-1.536000,57.509000>}
box{<0,0,-0.050800><3.252691,0.036000,0.050800> rotate<0,-44.997030,0> translate<12.214000,-1.536000,55.209000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.514000,-1.536000,57.509000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.514000,-1.536000,63.409000>}
box{<0,0,-0.050800><5.900000,0.036000,0.050800> rotate<0,90.000000,0> translate<14.514000,-1.536000,63.409000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.514000,-1.536000,63.409000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.314000,-1.536000,63.409000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.314000,-1.536000,63.409000> }
object{ARC(3.953800,0.101600,103.157543,256.842457,0.036000) translate<10.414000,-1.536000,59.309000>}
object{ARC(3.953800,0.101600,283.157543,436.842457,0.036000) translate<10.414000,-1.536000,59.309000>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.919900,-1.536000,59.903100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.076700,-1.536000,59.746400>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<8.919900,-1.536000,59.903100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.076700,-1.536000,59.746400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.076700,-1.536000,59.432800>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<9.076700,-1.536000,59.432800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.076700,-1.536000,59.432800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.919900,-1.536000,59.276100>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.919900,-1.536000,59.276100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.919900,-1.536000,59.276100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.292800,-1.536000,59.276100>}
box{<0,0,-0.038100><0.627100,0.036000,0.038100> rotate<0,0.000000,0> translate<8.292800,-1.536000,59.276100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.292800,-1.536000,59.276100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.136100,-1.536000,59.432800>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<8.136100,-1.536000,59.432800> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.136100,-1.536000,59.432800>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.136100,-1.536000,59.746400>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<8.136100,-1.536000,59.746400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.136100,-1.536000,59.746400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.292800,-1.536000,59.903100>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.136100,-1.536000,59.746400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.919900,-1.536000,60.211600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.076700,-1.536000,60.368300>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,-44.978755,0> translate<8.919900,-1.536000,60.211600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.076700,-1.536000,60.368300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.076700,-1.536000,60.681900>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,90.000000,0> translate<9.076700,-1.536000,60.681900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<9.076700,-1.536000,60.681900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.919900,-1.536000,60.838600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<8.919900,-1.536000,60.838600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.919900,-1.536000,60.838600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.763100,-1.536000,60.838600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<8.763100,-1.536000,60.838600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.763100,-1.536000,60.838600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.606400,-1.536000,60.681900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.606400,-1.536000,60.681900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.606400,-1.536000,60.681900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.606400,-1.536000,60.525100>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.606400,-1.536000,60.525100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.606400,-1.536000,60.681900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.449600,-1.536000,60.838600>}
box{<0,0,-0.038100><0.221678,0.036000,0.038100> rotate<0,44.978755,0> translate<8.449600,-1.536000,60.838600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.449600,-1.536000,60.838600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.292800,-1.536000,60.838600>}
box{<0,0,-0.038100><0.156800,0.036000,0.038100> rotate<0,0.000000,0> translate<8.292800,-1.536000,60.838600> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.292800,-1.536000,60.838600>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.136100,-1.536000,60.681900>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,-44.997030,0> translate<8.136100,-1.536000,60.681900> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.136100,-1.536000,60.681900>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.136100,-1.536000,60.368300>}
box{<0,0,-0.038100><0.313600,0.036000,0.038100> rotate<0,-90.000000,0> translate<8.136100,-1.536000,60.368300> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.136100,-1.536000,60.368300>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<8.292800,-1.536000,60.211600>}
box{<0,0,-0.038100><0.221607,0.036000,0.038100> rotate<0,44.997030,0> translate<8.136100,-1.536000,60.368300> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.097400,-1.536000,49.666200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.292300,-1.536000,49.861100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.097400,-1.536000,49.666200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.292300,-1.536000,49.861100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.682100,-1.536000,49.861100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<15.292300,-1.536000,49.861100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.682100,-1.536000,49.861100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.876900,-1.536000,49.666200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<15.682100,-1.536000,49.861100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.876900,-1.536000,49.666200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.876900,-1.536000,48.886600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.876900,-1.536000,48.886600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.876900,-1.536000,48.886600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.682100,-1.536000,48.691800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.682100,-1.536000,48.691800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.682100,-1.536000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.292300,-1.536000,48.691800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<15.292300,-1.536000,48.691800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.292300,-1.536000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.097400,-1.536000,48.886600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<15.097400,-1.536000,48.886600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.123000,-1.536000,48.691800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.123000,-1.536000,49.861100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<14.123000,-1.536000,49.861100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.123000,-1.536000,49.861100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.707600,-1.536000,49.276400>}
box{<0,0,-0.050800><0.826820,0.036000,0.050800> rotate<0,45.001930,0> translate<14.123000,-1.536000,49.861100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.707600,-1.536000,49.276400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.928100,-1.536000,49.276400>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<13.928100,-1.536000,49.276400> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.775700,-1.536000,52.206200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.970600,-1.536000,52.401100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<21.775700,-1.536000,52.206200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.970600,-1.536000,52.401100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.360400,-1.536000,52.401100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<21.970600,-1.536000,52.401100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.360400,-1.536000,52.401100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.555200,-1.536000,52.206200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<22.360400,-1.536000,52.401100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.555200,-1.536000,52.206200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.555200,-1.536000,51.426600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.555200,-1.536000,51.426600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.555200,-1.536000,51.426600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.360400,-1.536000,51.231800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<22.360400,-1.536000,51.231800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.360400,-1.536000,51.231800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.970600,-1.536000,51.231800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<21.970600,-1.536000,51.231800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.970600,-1.536000,51.231800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.775700,-1.536000,51.426600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<21.775700,-1.536000,51.426600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.606400,-1.536000,52.401100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.385900,-1.536000,52.401100>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<20.606400,-1.536000,52.401100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.385900,-1.536000,52.401100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.385900,-1.536000,51.816400>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,-90.000000,0> translate<21.385900,-1.536000,51.816400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.385900,-1.536000,51.816400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.996200,-1.536000,52.011300>}
box{<0,0,-0.050800><0.435720,0.036000,0.050800> rotate<0,26.569178,0> translate<20.996200,-1.536000,52.011300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.996200,-1.536000,52.011300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.801300,-1.536000,52.011300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<20.801300,-1.536000,52.011300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.801300,-1.536000,52.011300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.606400,-1.536000,51.816400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<20.606400,-1.536000,51.816400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.606400,-1.536000,51.816400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.606400,-1.536000,51.426600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<20.606400,-1.536000,51.426600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.606400,-1.536000,51.426600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.801300,-1.536000,51.231800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<20.606400,-1.536000,51.426600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<20.801300,-1.536000,51.231800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.191100,-1.536000,51.231800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<20.801300,-1.536000,51.231800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.191100,-1.536000,51.231800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.385900,-1.536000,51.426600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<21.191100,-1.536000,51.231800> }
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.221700,-1.536000,56.397200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.416600,-1.536000,56.592100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.221700,-1.536000,56.397200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.416600,-1.536000,56.592100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.806400,-1.536000,56.592100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<34.416600,-1.536000,56.592100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.806400,-1.536000,56.592100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.001200,-1.536000,56.397200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<34.806400,-1.536000,56.592100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.001200,-1.536000,56.397200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.001200,-1.536000,55.617600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<35.001200,-1.536000,55.617600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.001200,-1.536000,55.617600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.806400,-1.536000,55.422800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<34.806400,-1.536000,55.422800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.806400,-1.536000,55.422800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.416600,-1.536000,55.422800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<34.416600,-1.536000,55.422800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.416600,-1.536000,55.422800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.221700,-1.536000,55.617600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<34.221700,-1.536000,55.617600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.052400,-1.536000,56.592100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.442200,-1.536000,56.397200>}
box{<0,0,-0.050800><0.435810,0.036000,0.050800> rotate<0,26.563298,0> translate<33.052400,-1.536000,56.592100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.442200,-1.536000,56.397200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.831900,-1.536000,56.007400>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,45.004380,0> translate<33.442200,-1.536000,56.397200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.831900,-1.536000,56.007400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.831900,-1.536000,55.617600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<33.831900,-1.536000,55.617600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.831900,-1.536000,55.617600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.637100,-1.536000,55.422800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<33.637100,-1.536000,55.422800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.637100,-1.536000,55.422800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.247300,-1.536000,55.422800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<33.247300,-1.536000,55.422800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.247300,-1.536000,55.422800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.052400,-1.536000,55.617600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<33.052400,-1.536000,55.617600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.052400,-1.536000,55.617600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.052400,-1.536000,55.812500>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<33.052400,-1.536000,55.812500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.052400,-1.536000,55.812500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.247300,-1.536000,56.007400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<33.052400,-1.536000,55.812500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.247300,-1.536000,56.007400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.831900,-1.536000,56.007400>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<33.247300,-1.536000,56.007400> }
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.808700,-1.536000,43.935200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.003600,-1.536000,44.130100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<52.808700,-1.536000,43.935200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.003600,-1.536000,44.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.393400,-1.536000,44.130100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<53.003600,-1.536000,44.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.393400,-1.536000,44.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.588200,-1.536000,43.935200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<53.393400,-1.536000,44.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.588200,-1.536000,43.935200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.588200,-1.536000,43.155600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<53.588200,-1.536000,43.155600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.588200,-1.536000,43.155600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.393400,-1.536000,42.960800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<53.393400,-1.536000,42.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.393400,-1.536000,42.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.003600,-1.536000,42.960800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<53.003600,-1.536000,42.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.003600,-1.536000,42.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.808700,-1.536000,43.155600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<52.808700,-1.536000,43.155600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.418900,-1.536000,43.935200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.224100,-1.536000,44.130100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<52.224100,-1.536000,44.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.224100,-1.536000,44.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.834300,-1.536000,44.130100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<51.834300,-1.536000,44.130100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.834300,-1.536000,44.130100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.639400,-1.536000,43.935200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<51.639400,-1.536000,43.935200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.639400,-1.536000,43.935200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.639400,-1.536000,43.740300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<51.639400,-1.536000,43.740300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.639400,-1.536000,43.740300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.834300,-1.536000,43.545400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<51.639400,-1.536000,43.740300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.834300,-1.536000,43.545400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.639400,-1.536000,43.350500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<51.639400,-1.536000,43.350500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.639400,-1.536000,43.350500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.639400,-1.536000,43.155600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<51.639400,-1.536000,43.155600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.639400,-1.536000,43.155600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.834300,-1.536000,42.960800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<51.639400,-1.536000,43.155600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.834300,-1.536000,42.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.224100,-1.536000,42.960800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<51.834300,-1.536000,42.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.224100,-1.536000,42.960800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.418900,-1.536000,43.155600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<52.224100,-1.536000,42.960800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.418900,-1.536000,43.155600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.418900,-1.536000,43.350500>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<52.418900,-1.536000,43.350500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.418900,-1.536000,43.350500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.224100,-1.536000,43.545400>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<52.224100,-1.536000,43.545400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.224100,-1.536000,43.545400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.418900,-1.536000,43.740300>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<52.224100,-1.536000,43.545400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.418900,-1.536000,43.740300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.418900,-1.536000,43.935200>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<52.418900,-1.536000,43.935200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.224100,-1.536000,43.545400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.834300,-1.536000,43.545400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<51.834300,-1.536000,43.545400> }
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,25.908000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.462000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.877800,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,25.908000>}
box{<0,0,-0.076200><0.584200,0.036000,0.076200> rotate<0,0.000000,0> translate<12.877800,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.877800,0.000000,27.051000>}
box{<0,0,-0.076200><1.283643,0.036000,0.076200> rotate<0,62.923767,0> translate<12.877800,0.000000,27.051000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.877800,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.046200,0.000000,27.051000>}
box{<0,0,-0.076200><1.168400,0.036000,0.076200> rotate<0,0.000000,0> translate<12.877800,0.000000,27.051000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.046200,0.000000,27.051000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,25.908000>}
box{<0,0,-0.076200><1.283643,0.036000,0.076200> rotate<0,-62.923767,0> translate<13.462000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,28.194000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.462000,0.000000,28.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.462000,0.000000,25.908000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.046200,0.000000,25.908000>}
box{<0,0,-0.076200><0.584200,0.036000,0.076200> rotate<0,0.000000,0> translate<13.462000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,20.828000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.668000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,30.988000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.668000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.668000,0.000000,30.988000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.668000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,30.988000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.256000,0.000000,20.828000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.256000,0.000000,20.828000> }
box{<-0.381000,0,-2.794000><0.381000,0.036000,2.794000> rotate<0,-90.000000,0> translate<13.462000,0.000000,22.098000>}
box{<-0.444500,0,-0.635000><0.444500,0.036000,0.635000> rotate<0,-90.000000,0> translate<13.462000,0.000000,20.383500>}
box{<-0.444500,0,-0.635000><0.444500,0.036000,0.635000> rotate<0,-90.000000,0> translate<13.462000,0.000000,31.432500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.504800,0.000000,32.830400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.504800,0.000000,31.686500>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,-90.000000,0> translate<15.504800,0.000000,31.686500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.504800,0.000000,31.686500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.076700,0.000000,31.686500>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,0.000000,0> translate<15.504800,0.000000,31.686500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.076700,0.000000,31.686500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.267400,0.000000,31.877100>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-44.982005,0> translate<16.076700,0.000000,31.686500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.267400,0.000000,31.877100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.267400,0.000000,32.639800>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,90.000000,0> translate<16.267400,0.000000,32.639800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.267400,0.000000,32.639800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.076700,0.000000,32.830400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<16.076700,0.000000,32.830400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.076700,0.000000,32.830400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.504800,0.000000,32.830400>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,0.000000,0> translate<15.504800,0.000000,32.830400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.674100,0.000000,32.449100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.055400,0.000000,32.830400>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,-44.997030,0> translate<16.674100,0.000000,32.449100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.055400,0.000000,32.830400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.055400,0.000000,31.686500>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.055400,0.000000,31.686500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.674100,0.000000,31.686500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.436700,0.000000,31.686500>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<16.674100,0.000000,31.686500> }
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,25.654000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.096000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.511800,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,25.654000>}
box{<0,0,-0.076200><0.584200,0.036000,0.076200> rotate<0,0.000000,0> translate<5.511800,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.511800,0.000000,26.797000>}
box{<0,0,-0.076200><1.283643,0.036000,0.076200> rotate<0,62.923767,0> translate<5.511800,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.511800,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.680200,0.000000,26.797000>}
box{<0,0,-0.076200><1.168400,0.036000,0.076200> rotate<0,0.000000,0> translate<5.511800,0.000000,26.797000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.680200,0.000000,26.797000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,25.654000>}
box{<0,0,-0.076200><1.283643,0.036000,0.076200> rotate<0,-62.923767,0> translate<6.096000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,27.940000>}
box{<0,0,-0.076200><2.286000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.096000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.096000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.680200,0.000000,25.654000>}
box{<0,0,-0.076200><0.584200,0.036000,0.076200> rotate<0,0.000000,0> translate<6.096000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,20.574000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.302000,0.000000,20.574000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,30.734000>}
box{<0,0,-0.076200><5.588000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.302000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,20.574000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.302000,0.000000,30.734000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,90.000000,0> translate<3.302000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,30.734000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.890000,0.000000,20.574000>}
box{<0,0,-0.076200><10.160000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.890000,0.000000,20.574000> }
box{<-0.381000,0,-2.794000><0.381000,0.036000,2.794000> rotate<0,-90.000000,0> translate<6.096000,0.000000,21.844000>}
box{<-0.444500,0,-0.635000><0.444500,0.036000,0.635000> rotate<0,-90.000000,0> translate<6.096000,0.000000,20.129500>}
box{<-0.444500,0,-0.635000><0.444500,0.036000,0.635000> rotate<0,-90.000000,0> translate<6.096000,0.000000,31.178500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.011800,0.000000,32.703400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.011800,0.000000,31.559500>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.011800,0.000000,31.559500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.011800,0.000000,31.559500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.583700,0.000000,31.559500>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,0.000000,0> translate<8.011800,0.000000,31.559500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.583700,0.000000,31.559500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.774400,0.000000,31.750100>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-44.982005,0> translate<8.583700,0.000000,31.559500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.774400,0.000000,31.750100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.774400,0.000000,32.512800>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,90.000000,0> translate<8.774400,0.000000,32.512800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.774400,0.000000,32.512800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.583700,0.000000,32.703400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<8.583700,0.000000,32.703400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.583700,0.000000,32.703400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.011800,0.000000,32.703400>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,0.000000,0> translate<8.011800,0.000000,32.703400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.943700,0.000000,31.559500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.181100,0.000000,31.559500>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<9.181100,0.000000,31.559500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.181100,0.000000,31.559500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.943700,0.000000,32.322100>}
box{<0,0,-0.063500><1.078479,0.036000,0.063500> rotate<0,-44.997030,0> translate<9.181100,0.000000,31.559500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.943700,0.000000,32.322100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.943700,0.000000,32.512800>}
box{<0,0,-0.063500><0.190700,0.036000,0.063500> rotate<0,90.000000,0> translate<9.943700,0.000000,32.512800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.943700,0.000000,32.512800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.753000,0.000000,32.703400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<9.753000,0.000000,32.703400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.753000,0.000000,32.703400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.371700,0.000000,32.703400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<9.371700,0.000000,32.703400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.371700,0.000000,32.703400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.181100,0.000000,32.512800>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,-44.997030,0> translate<9.181100,0.000000,32.512800> }
//D3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,29.210000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.751000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,30.226000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.116000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,29.210000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,-57.990789,0> translate<39.751000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,30.734000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,90.000000,0> translate<39.751000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,30.226000>}
box{<0,0,-0.076200><1.198116,0.036000,0.076200> rotate<0,57.990789,0> translate<39.116000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.116000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,29.210000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.116000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,29.210000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<39.751000,0.000000,29.210000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<38.989000,0.000000,31.242000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<38.989000,0.000000,27.178000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<40.513000,0.000000,27.178000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<40.513000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,31.496000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.989000,0.000000,31.496000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.989000,0.000000,26.924000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.513000,0.000000,26.924000>}
box{<0,0,-0.076200><1.524000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.989000,0.000000,26.924000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,31.242000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<38.735000,0.000000,31.242000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.767000,0.000000,31.242000>}
box{<0,0,-0.076200><4.064000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.767000,0.000000,31.242000> }
box{<-0.254000,0,-1.016000><0.254000,0.036000,1.016000> rotate<0,-90.000000,0> translate<39.751000,0.000000,27.559000>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-90.000000,0> translate<39.751000,0.000000,32.448500>}
box{<-0.952500,0,-0.254000><0.952500,0.036000,0.254000> rotate<0,-90.000000,0> translate<39.751000,0.000000,25.971500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.464600,0.000000,28.511500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.608500,0.000000,28.511500>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,0.000000,0> translate<41.464600,0.000000,28.511500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.608500,0.000000,28.511500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.608500,0.000000,29.083400>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,90.000000,0> translate<42.608500,0.000000,29.083400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.608500,0.000000,29.083400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.417900,0.000000,29.274100>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,45.012056,0> translate<42.417900,0.000000,29.274100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.417900,0.000000,29.274100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.655200,0.000000,29.274100>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,0.000000,0> translate<41.655200,0.000000,29.274100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.655200,0.000000,29.274100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.464600,0.000000,29.083400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-45.012056,0> translate<41.464600,0.000000,29.083400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.464600,0.000000,29.083400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.464600,0.000000,28.511500>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,-90.000000,0> translate<41.464600,0.000000,28.511500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.655200,0.000000,29.680800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.464600,0.000000,29.871400>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,44.997030,0> translate<41.464600,0.000000,29.871400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.464600,0.000000,29.871400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.464600,0.000000,30.252700>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,90.000000,0> translate<41.464600,0.000000,30.252700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.464600,0.000000,30.252700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.655200,0.000000,30.443400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-45.012056,0> translate<41.464600,0.000000,30.252700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.655200,0.000000,30.443400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.845900,0.000000,30.443400>}
box{<0,0,-0.063500><0.190700,0.036000,0.063500> rotate<0,0.000000,0> translate<41.655200,0.000000,30.443400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<41.845900,0.000000,30.443400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.036600,0.000000,30.252700>}
box{<0,0,-0.063500><0.269691,0.036000,0.063500> rotate<0,44.997030,0> translate<41.845900,0.000000,30.443400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.036600,0.000000,30.252700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.036600,0.000000,30.062100>}
box{<0,0,-0.063500><0.190600,0.036000,0.063500> rotate<0,-90.000000,0> translate<42.036600,0.000000,30.062100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.036600,0.000000,30.252700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.227200,0.000000,30.443400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-45.012056,0> translate<42.036600,0.000000,30.252700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.227200,0.000000,30.443400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.417900,0.000000,30.443400>}
box{<0,0,-0.063500><0.190700,0.036000,0.063500> rotate<0,0.000000,0> translate<42.227200,0.000000,30.443400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.417900,0.000000,30.443400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.608500,0.000000,30.252700>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,45.012056,0> translate<42.417900,0.000000,30.443400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.608500,0.000000,30.252700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.608500,0.000000,29.871400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,-90.000000,0> translate<42.608500,0.000000,29.871400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.608500,0.000000,29.871400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<42.417900,0.000000,29.680800>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,-44.997030,0> translate<42.417900,0.000000,29.680800> }
//F1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,-1.536000,49.555400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,-1.536000,48.361600>}
box{<0,0,-0.063500><1.193800,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.654000,-1.536000,48.361600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,-1.536000,48.361600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.873200,-1.536000,48.361600>}
box{<0,0,-0.063500><1.219200,0.036000,0.063500> rotate<0,0.000000,0> translate<25.654000,-1.536000,48.361600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.873200,-1.536000,48.361600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.873200,-1.536000,49.555400>}
box{<0,0,-0.063500><1.193800,0.036000,0.063500> rotate<0,90.000000,0> translate<26.873200,-1.536000,49.555400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.873200,-1.536000,49.555400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,-1.536000,49.555400>}
box{<0,0,-0.063500><1.219200,0.036000,0.063500> rotate<0,0.000000,0> translate<25.654000,-1.536000,49.555400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,-1.536000,44.932600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.873200,-1.536000,44.932600>}
box{<0,0,-0.063500><1.219200,0.036000,0.063500> rotate<0,0.000000,0> translate<25.654000,-1.536000,44.932600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.873200,-1.536000,44.932600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.873200,-1.536000,46.151800>}
box{<0,0,-0.063500><1.219200,0.036000,0.063500> rotate<0,90.000000,0> translate<26.873200,-1.536000,46.151800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.873200,-1.536000,46.151800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,-1.536000,46.151800>}
box{<0,0,-0.063500><1.219200,0.036000,0.063500> rotate<0,0.000000,0> translate<25.654000,-1.536000,46.151800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,-1.536000,46.151800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.654000,-1.536000,44.932600>}
box{<0,0,-0.063500><1.219200,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.654000,-1.536000,44.932600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.799800,-1.536000,48.766100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.969100,-1.536000,48.766100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<23.799800,-1.536000,48.766100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.969100,-1.536000,48.766100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.969100,-1.536000,49.545600>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<24.969100,-1.536000,49.545600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.384400,-1.536000,48.766100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.384400,-1.536000,49.155800>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<24.384400,-1.536000,49.155800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.579300,-1.536000,49.935400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.969100,-1.536000,50.325100>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-44.989680,0> translate<24.579300,-1.536000,49.935400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.969100,-1.536000,50.325100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.799800,-1.536000,50.325100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<23.799800,-1.536000,50.325100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.799800,-1.536000,49.935400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.799800,-1.536000,50.714900>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<23.799800,-1.536000,50.714900> }
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.205200,-1.536000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.205200,-1.536000,48.006000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,90.000000,0> translate<16.205200,-1.536000,48.006000> }
object{ARC(0.381000,0.152400,270.000000,360.000000,0.036000) translate<19.735800,-1.536000,43.688000>}
object{ARC(0.381000,0.152400,90.000000,180.000000,0.036000) translate<16.586200,-1.536000,48.006000>}
object{ARC(0.381000,0.152400,180.000000,270.000000,0.036000) translate<16.586200,-1.536000,43.688000>}
object{ARC(0.381000,0.152400,0.000000,90.000000,0.036000) translate<19.735800,-1.536000,48.006000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.116800,-1.536000,48.006000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.116800,-1.536000,43.688000>}
box{<0,0,-0.076200><4.318000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.116800,-1.536000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.735800,-1.536000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.586200,-1.536000,43.307000>}
box{<0,0,-0.076200><3.149600,0.036000,0.076200> rotate<0,0.000000,0> translate<16.586200,-1.536000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.586200,-1.536000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,-1.536000,48.387000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<16.586200,-1.536000,48.387000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.653000,-1.536000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,-1.536000,48.387000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.653000,-1.536000,48.387000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.669000,-1.536000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.735800,-1.536000,48.387000>}
box{<0,0,-0.076200><1.066800,0.036000,0.076200> rotate<0,0.000000,0> translate<18.669000,-1.536000,48.387000> }
object{ARC(0.508000,0.152400,180.000000,360.000000,0.036000) translate<18.161000,-1.536000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.761200,-1.536000,48.387000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<19.761200,-1.536000,43.307000>}
box{<0,0,-0.025400><5.080000,0.036000,0.025400> rotate<0,-90.000000,0> translate<19.761200,-1.536000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.002500,-1.536000,48.831500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621200,-1.536000,48.831500>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<19.621200,-1.536000,48.831500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.811900,-1.536000,48.831500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.811900,-1.536000,49.975400>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<19.811900,-1.536000,49.975400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.002500,-1.536000,49.975400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.621200,-1.536000,49.975400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<19.621200,-1.536000,49.975400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.460400,-1.536000,49.784800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.651100,-1.536000,49.975400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-44.982005,0> translate<18.460400,-1.536000,49.784800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.651100,-1.536000,49.975400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.032400,-1.536000,49.975400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<18.651100,-1.536000,49.975400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.032400,-1.536000,49.975400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.223000,-1.536000,49.784800>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,44.997030,0> translate<19.032400,-1.536000,49.975400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.223000,-1.536000,49.784800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.223000,-1.536000,49.022100>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,-90.000000,0> translate<19.223000,-1.536000,49.022100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.223000,-1.536000,49.022100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.032400,-1.536000,48.831500>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,-44.997030,0> translate<19.032400,-1.536000,48.831500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<19.032400,-1.536000,48.831500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.651100,-1.536000,48.831500>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<18.651100,-1.536000,48.831500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.651100,-1.536000,48.831500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.460400,-1.536000,49.022100>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<18.460400,-1.536000,49.022100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.053700,-1.536000,49.594100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.672400,-1.536000,49.975400>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,44.997030,0> translate<17.672400,-1.536000,49.975400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.672400,-1.536000,49.975400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.672400,-1.536000,48.831500>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.672400,-1.536000,48.831500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.053700,-1.536000,48.831500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.291100,-1.536000,48.831500>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<17.291100,-1.536000,48.831500> }
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.008500,-1.536000,55.168800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.618800,-1.536000,55.168800>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,0.000000,0> translate<38.618800,-1.536000,55.168800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.813700,-1.536000,55.168800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.813700,-1.536000,56.338100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<38.813700,-1.536000,56.338100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.008500,-1.536000,56.338100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.618800,-1.536000,56.338100>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,0.000000,0> translate<38.618800,-1.536000,56.338100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.449500,-1.536000,56.143200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.644400,-1.536000,56.338100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<37.449500,-1.536000,56.143200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.644400,-1.536000,56.338100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.034200,-1.536000,56.338100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<37.644400,-1.536000,56.338100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.034200,-1.536000,56.338100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.229000,-1.536000,56.143200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<38.034200,-1.536000,56.338100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.229000,-1.536000,56.143200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.229000,-1.536000,55.363600>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<38.229000,-1.536000,55.363600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.229000,-1.536000,55.363600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.034200,-1.536000,55.168800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<38.034200,-1.536000,55.168800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.034200,-1.536000,55.168800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.644400,-1.536000,55.168800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<37.644400,-1.536000,55.168800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.644400,-1.536000,55.168800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.449500,-1.536000,55.363600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<37.449500,-1.536000,55.363600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.280200,-1.536000,55.168800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.059700,-1.536000,55.168800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<36.280200,-1.536000,55.168800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.059700,-1.536000,55.168800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.280200,-1.536000,55.948300>}
box{<0,0,-0.050800><1.102379,0.036000,0.050800> rotate<0,44.997030,0> translate<36.280200,-1.536000,55.948300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.280200,-1.536000,55.948300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.280200,-1.536000,56.143200>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<36.280200,-1.536000,56.143200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.280200,-1.536000,56.143200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.475100,-1.536000,56.338100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<36.280200,-1.536000,56.143200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.475100,-1.536000,56.338100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.864900,-1.536000,56.338100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<36.475100,-1.536000,56.338100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.864900,-1.536000,56.338100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.059700,-1.536000,56.143200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<36.864900,-1.536000,56.338100> }
//IC3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.040800,-1.536000,47.478500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.040800,-1.536000,47.868200>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<47.040800,-1.536000,47.868200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.040800,-1.536000,47.673300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.210100,-1.536000,47.673300>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<47.040800,-1.536000,47.673300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.210100,-1.536000,47.478500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.210100,-1.536000,47.868200>}
box{<0,0,-0.050800><0.389700,0.036000,0.050800> rotate<0,90.000000,0> translate<48.210100,-1.536000,47.868200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.015200,-1.536000,49.037500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.210100,-1.536000,48.842600>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<48.015200,-1.536000,49.037500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.210100,-1.536000,48.842600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.210100,-1.536000,48.452800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<48.210100,-1.536000,48.452800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.210100,-1.536000,48.452800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.015200,-1.536000,48.258000>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<48.015200,-1.536000,48.258000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.015200,-1.536000,48.258000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.235600,-1.536000,48.258000>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,0.000000,0> translate<47.235600,-1.536000,48.258000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.235600,-1.536000,48.258000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.040800,-1.536000,48.452800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<47.040800,-1.536000,48.452800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.040800,-1.536000,48.452800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.040800,-1.536000,48.842600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<47.040800,-1.536000,48.842600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.040800,-1.536000,48.842600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.235600,-1.536000,49.037500>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<47.040800,-1.536000,48.842600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.015200,-1.536000,49.427300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.210100,-1.536000,49.622100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-44.982329,0> translate<48.015200,-1.536000,49.427300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.210100,-1.536000,49.622100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.210100,-1.536000,50.011900>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<48.210100,-1.536000,50.011900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.210100,-1.536000,50.011900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.015200,-1.536000,50.206800>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<48.015200,-1.536000,50.206800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.015200,-1.536000,50.206800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.820300,-1.536000,50.206800>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<47.820300,-1.536000,50.206800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.820300,-1.536000,50.206800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.625400,-1.536000,50.011900>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<47.625400,-1.536000,50.011900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.625400,-1.536000,50.011900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.625400,-1.536000,49.817000>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<47.625400,-1.536000,49.817000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.625400,-1.536000,50.011900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.430500,-1.536000,50.206800>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<47.430500,-1.536000,50.206800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.430500,-1.536000,50.206800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.235600,-1.536000,50.206800>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<47.235600,-1.536000,50.206800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.235600,-1.536000,50.206800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.040800,-1.536000,50.011900>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<47.040800,-1.536000,50.011900> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.040800,-1.536000,50.011900>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.040800,-1.536000,49.622100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<47.040800,-1.536000,49.622100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.040800,-1.536000,49.622100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.235600,-1.536000,49.427300>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,44.997030,0> translate<47.040800,-1.536000,49.622100> }
//K1 silk screen
object{ARC(0.609600,0.203200,270.000000,360.000000,0.036000) translate<68.075400,0.000000,21.919600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.075400,0.000000,21.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.494600,0.000000,21.310000>}
box{<0,0,-0.101600><20.580800,0.036000,0.101600> rotate<0,0.000000,0> translate<47.494600,0.000000,21.310000> }
object{ARC(0.609600,0.203200,180.000000,270.000000,0.036000) translate<47.494600,0.000000,21.919600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.885000,0.000000,21.919600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.885000,0.000000,36.500400>}
box{<0,0,-0.101600><14.580800,0.036000,0.101600> rotate<0,90.000000,0> translate<46.885000,0.000000,36.500400> }
object{ARC(0.609600,0.203200,90.000000,180.000000,0.036000) translate<47.494600,0.000000,36.500400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.494600,0.000000,37.110000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.075400,0.000000,37.110000>}
box{<0,0,-0.101600><20.580800,0.036000,0.101600> rotate<0,0.000000,0> translate<47.494600,0.000000,37.110000> }
object{ARC(0.609600,0.203200,0.000000,90.000000,0.036000) translate<68.075400,0.000000,36.500400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.685000,0.000000,36.500400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<68.685000,0.000000,21.919600>}
box{<0,0,-0.101600><14.580800,0.036000,0.101600> rotate<0,-90.000000,0> translate<68.685000,0.000000,21.919600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.480100,0.000000,20.397100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.480100,0.000000,19.227800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,-90.000000,0> translate<46.480100,0.000000,19.227800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.480100,0.000000,19.617500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.259600,0.000000,20.397100>}
box{<0,0,-0.050800><1.102450,0.036000,0.050800> rotate<0,-45.000705,0> translate<46.480100,0.000000,19.617500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.674900,0.000000,19.812400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.259600,0.000000,19.227800>}
box{<0,0,-0.050800><0.826820,0.036000,0.050800> rotate<0,44.992130,0> translate<46.674900,0.000000,19.812400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.649400,0.000000,20.007300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.039100,0.000000,20.397100>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-45.004380,0> translate<47.649400,0.000000,20.007300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.039100,0.000000,20.397100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.039100,0.000000,19.227800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,-90.000000,0> translate<48.039100,0.000000,19.227800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.649400,0.000000,19.227800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.428900,0.000000,19.227800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<47.649400,0.000000,19.227800> }
//OK1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,26.416000>}
box{<0,0,-0.076200><7.620000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.606000,0.000000,26.416000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,32.258000>}
box{<0,0,-0.076200><7.620000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.606000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,32.258000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.606000,0.000000,32.258000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,26.416000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,28.321000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.226000,0.000000,28.321000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,32.258000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,30.353000>}
box{<0,0,-0.076200><1.905000,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.226000,0.000000,30.353000> }
object{ARC(1.016000,0.152400,90.000000,270.000000,0.036000) translate<30.226000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.890600,0.000000,28.115300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.890600,0.000000,27.734000>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,-90.000000,0> translate<20.890600,0.000000,27.734000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.890600,0.000000,27.734000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.081200,0.000000,27.543400>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,44.997030,0> translate<20.890600,0.000000,27.734000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.081200,0.000000,27.543400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.843900,0.000000,27.543400>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,0.000000,0> translate<21.081200,0.000000,27.543400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.843900,0.000000,27.543400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.034500,0.000000,27.734000>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.843900,0.000000,27.543400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.034500,0.000000,27.734000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.034500,0.000000,28.115300>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,90.000000,0> translate<22.034500,0.000000,28.115300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.034500,0.000000,28.115300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.843900,0.000000,28.306000>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,45.012056,0> translate<21.843900,0.000000,28.306000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.843900,0.000000,28.306000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.081200,0.000000,28.306000>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,0.000000,0> translate<21.081200,0.000000,28.306000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.081200,0.000000,28.306000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.890600,0.000000,28.115300>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-45.012056,0> translate<20.890600,0.000000,28.115300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.890600,0.000000,28.712700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.034500,0.000000,28.712700>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,0.000000,0> translate<20.890600,0.000000,28.712700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.653200,0.000000,28.712700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.890600,0.000000,29.475300>}
box{<0,0,-0.063500><1.078479,0.036000,0.063500> rotate<0,44.997030,0> translate<20.890600,0.000000,29.475300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.462600,0.000000,28.903300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.034500,0.000000,29.475300>}
box{<0,0,-0.063500><0.808859,0.036000,0.063500> rotate<0,-45.002039,0> translate<21.462600,0.000000,28.903300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.271900,0.000000,29.882000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.890600,0.000000,30.263300>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,44.997030,0> translate<20.890600,0.000000,30.263300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<20.890600,0.000000,30.263300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.034500,0.000000,30.263300>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,0.000000,0> translate<20.890600,0.000000,30.263300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.034500,0.000000,29.882000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.034500,0.000000,30.644600>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,90.000000,0> translate<22.034500,0.000000,30.644600> }
//ON/OFF silk screen
object{ARC(1.524000,0.152400,305.538115,360.000000,0.036000) translate<27.940000,0.000000,60.071000>}
object{ARC(1.524000,0.152400,0.000000,53.130102,0.036000) translate<27.940000,0.000000,60.071000>}
object{ARC(1.524000,0.152400,180.000000,232.126995,0.036000) translate<27.940000,0.000000,60.071000>}
object{ARC(1.524000,0.152400,127.873005,180.000000,0.036000) translate<27.940000,0.000000,60.071000>}
object{ARC(2.032000,0.254000,309.807015,360.000000,0.036000) translate<27.940000,0.000000,60.071000>}
object{ARC(2.032000,0.254000,0.002820,61.929172,0.036000) translate<27.940000,0.000000,60.070900>}
object{ARC(2.032000,0.254000,180.000000,229.762648,0.036000) translate<27.940000,0.000000,60.071000>}
object{ARC(2.032000,0.254000,119.746980,180.002820,0.036000) translate<27.940000,0.000000,60.071100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.908400,0.000000,64.326400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.527100,0.000000,64.326400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<25.527100,0.000000,64.326400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.527100,0.000000,64.326400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.336500,0.000000,64.135800>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,-44.997030,0> translate<25.336500,0.000000,64.135800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.336500,0.000000,64.135800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.336500,0.000000,63.373100>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,-90.000000,0> translate<25.336500,0.000000,63.373100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.336500,0.000000,63.373100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.527100,0.000000,63.182500>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,44.997030,0> translate<25.336500,0.000000,63.373100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.527100,0.000000,63.182500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.908400,0.000000,63.182500>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<25.527100,0.000000,63.182500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.908400,0.000000,63.182500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.099100,0.000000,63.373100>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-44.982005,0> translate<25.908400,0.000000,63.182500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.099100,0.000000,63.373100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.099100,0.000000,64.135800>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,90.000000,0> translate<26.099100,0.000000,64.135800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.099100,0.000000,64.135800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<25.908400,0.000000,64.326400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<25.908400,0.000000,64.326400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.505800,0.000000,63.182500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.505800,0.000000,64.326400>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<26.505800,0.000000,64.326400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<26.505800,0.000000,64.326400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.268400,0.000000,63.182500>}
box{<0,0,-0.063500><1.374797,0.036000,0.063500> rotate<0,56.306216,0> translate<26.505800,0.000000,64.326400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.268400,0.000000,63.182500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.268400,0.000000,64.326400>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<27.268400,0.000000,64.326400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<27.675100,0.000000,63.182500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.437700,0.000000,64.326400>}
box{<0,0,-0.063500><1.374797,0.036000,0.063500> rotate<0,-56.306216,0> translate<27.675100,0.000000,63.182500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.416300,0.000000,64.326400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.035000,0.000000,64.326400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<29.035000,0.000000,64.326400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.035000,0.000000,64.326400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.844400,0.000000,64.135800>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,-44.997030,0> translate<28.844400,0.000000,64.135800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.844400,0.000000,64.135800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.844400,0.000000,63.373100>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,-90.000000,0> translate<28.844400,0.000000,63.373100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<28.844400,0.000000,63.373100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.035000,0.000000,63.182500>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,44.997030,0> translate<28.844400,0.000000,63.373100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.035000,0.000000,63.182500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.416300,0.000000,63.182500>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<29.035000,0.000000,63.182500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.416300,0.000000,63.182500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.607000,0.000000,63.373100>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-44.982005,0> translate<29.416300,0.000000,63.182500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.607000,0.000000,63.373100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.607000,0.000000,64.135800>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,90.000000,0> translate<29.607000,0.000000,64.135800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.607000,0.000000,64.135800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<29.416300,0.000000,64.326400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<29.416300,0.000000,64.326400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.013700,0.000000,63.182500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.013700,0.000000,64.326400>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<30.013700,0.000000,64.326400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.013700,0.000000,64.326400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.776300,0.000000,64.326400>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<30.013700,0.000000,64.326400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.013700,0.000000,63.754400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<30.395000,0.000000,63.754400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<30.013700,0.000000,63.754400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.183000,0.000000,63.182500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.183000,0.000000,64.326400>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<31.183000,0.000000,64.326400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.183000,0.000000,64.326400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.945600,0.000000,64.326400>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<31.183000,0.000000,64.326400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.183000,0.000000,63.754400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<31.564300,0.000000,63.754400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<31.183000,0.000000,63.754400> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.280000,0.000000,10.763000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<66.970000,0.000000,10.763000>}
box{<0,0,-0.152400><49.690000,0.036000,0.152400> rotate<0,0.000000,0> translate<17.280000,0.000000,10.763000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<66.970000,0.000000,10.763000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<66.970000,0.000000,1.063000>}
box{<0,0,-0.152400><9.700000,0.036000,0.152400> rotate<0,-90.000000,0> translate<66.970000,0.000000,1.063000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<66.970000,0.000000,1.063000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.280000,0.000000,1.063000>}
box{<0,0,-0.152400><49.690000,0.036000,0.152400> rotate<0,0.000000,0> translate<17.280000,0.000000,1.063000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.280000,0.000000,1.063000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.280000,0.000000,10.763000>}
box{<0,0,-0.152400><9.700000,0.036000,0.152400> rotate<0,90.000000,0> translate<17.280000,0.000000,10.763000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.430000,0.000000,5.913000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<17.130000,0.000000,5.913000>}
box{<0,0,-0.304800><3.700000,0.036000,0.304800> rotate<0,0.000000,0> translate<13.430000,0.000000,5.913000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<67.130000,0.000000,5.913000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<70.830000,0.000000,5.913000>}
box{<0,0,-0.304800><3.700000,0.036000,0.304800> rotate<0,0.000000,0> translate<67.130000,0.000000,5.913000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.040800,0.000000,11.690800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.040800,0.000000,12.860100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<41.040800,0.000000,12.860100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.040800,0.000000,12.860100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.625400,0.000000,12.860100>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<41.040800,0.000000,12.860100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.625400,0.000000,12.860100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.820300,0.000000,12.665200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<41.625400,0.000000,12.860100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.820300,0.000000,12.665200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.820300,0.000000,12.275400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<41.820300,0.000000,12.275400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.820300,0.000000,12.275400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.625400,0.000000,12.080500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<41.625400,0.000000,12.080500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.625400,0.000000,12.080500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.040800,0.000000,12.080500>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<41.040800,0.000000,12.080500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.430500,0.000000,12.080500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.820300,0.000000,11.690800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,44.989680,0> translate<41.430500,0.000000,12.080500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.210100,0.000000,12.470300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.599800,0.000000,12.860100>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-45.004380,0> translate<42.210100,0.000000,12.470300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.599800,0.000000,12.860100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.599800,0.000000,11.690800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,-90.000000,0> translate<42.599800,0.000000,11.690800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.210100,0.000000,11.690800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.989600,0.000000,11.690800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<42.210100,0.000000,11.690800> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.195900,-1.536000,27.482800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.195900,-1.536000,28.652100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<28.195900,-1.536000,28.652100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.195900,-1.536000,28.652100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.611300,-1.536000,28.652100>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<27.611300,-1.536000,28.652100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.611300,-1.536000,28.652100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.416400,-1.536000,28.457200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<27.416400,-1.536000,28.457200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.416400,-1.536000,28.457200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.416400,-1.536000,28.067400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<27.416400,-1.536000,28.067400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.416400,-1.536000,28.067400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.611300,-1.536000,27.872500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<27.416400,-1.536000,28.067400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.611300,-1.536000,27.872500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.195900,-1.536000,27.872500>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<27.611300,-1.536000,27.872500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.806200,-1.536000,27.872500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.416400,-1.536000,27.482800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-44.989680,0> translate<27.416400,-1.536000,27.482800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.247100,-1.536000,27.482800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.026600,-1.536000,27.482800>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<26.247100,-1.536000,27.482800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.026600,-1.536000,27.482800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.247100,-1.536000,28.262300>}
box{<0,0,-0.050800><1.102379,0.036000,0.050800> rotate<0,44.997030,0> translate<26.247100,-1.536000,28.262300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.247100,-1.536000,28.262300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.247100,-1.536000,28.457200>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<26.247100,-1.536000,28.457200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.247100,-1.536000,28.457200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.442000,-1.536000,28.652100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<26.247100,-1.536000,28.457200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.442000,-1.536000,28.652100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.831800,-1.536000,28.652100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<26.442000,-1.536000,28.652100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.831800,-1.536000,28.652100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.026600,-1.536000,28.457200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<26.831800,-1.536000,28.652100> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.927900,-1.536000,52.882800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.927900,-1.536000,54.052100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<42.927900,-1.536000,54.052100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.927900,-1.536000,54.052100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.343300,-1.536000,54.052100>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<42.343300,-1.536000,54.052100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.343300,-1.536000,54.052100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.148400,-1.536000,53.857200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<42.148400,-1.536000,53.857200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.148400,-1.536000,53.857200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.148400,-1.536000,53.467400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<42.148400,-1.536000,53.467400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.148400,-1.536000,53.467400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.343300,-1.536000,53.272500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<42.148400,-1.536000,53.467400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.343300,-1.536000,53.272500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.927900,-1.536000,53.272500>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<42.343300,-1.536000,53.272500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.538200,-1.536000,53.272500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.148400,-1.536000,52.882800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-44.989680,0> translate<42.148400,-1.536000,52.882800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.758600,-1.536000,53.857200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.563800,-1.536000,54.052100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<41.563800,-1.536000,54.052100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.563800,-1.536000,54.052100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.174000,-1.536000,54.052100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<41.174000,-1.536000,54.052100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.174000,-1.536000,54.052100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.979100,-1.536000,53.857200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<40.979100,-1.536000,53.857200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.979100,-1.536000,53.857200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.979100,-1.536000,53.662300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<40.979100,-1.536000,53.662300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.979100,-1.536000,53.662300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.174000,-1.536000,53.467400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<40.979100,-1.536000,53.662300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.174000,-1.536000,53.467400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.368900,-1.536000,53.467400>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<41.174000,-1.536000,53.467400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.174000,-1.536000,53.467400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.979100,-1.536000,53.272500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<40.979100,-1.536000,53.272500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.979100,-1.536000,53.272500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.979100,-1.536000,53.077600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<40.979100,-1.536000,53.077600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.979100,-1.536000,53.077600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.174000,-1.536000,52.882800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<40.979100,-1.536000,53.077600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.174000,-1.536000,52.882800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.563800,-1.536000,52.882800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<41.174000,-1.536000,52.882800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.563800,-1.536000,52.882800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.758600,-1.536000,53.077600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<41.563800,-1.536000,52.882800> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.581800,-1.536000,48.056800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.751100,-1.536000,48.056800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<57.581800,-1.536000,48.056800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.751100,-1.536000,48.056800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.751100,-1.536000,48.641400>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,90.000000,0> translate<58.751100,-1.536000,48.641400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.751100,-1.536000,48.641400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.556200,-1.536000,48.836300>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<58.556200,-1.536000,48.836300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.556200,-1.536000,48.836300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.166400,-1.536000,48.836300>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<58.166400,-1.536000,48.836300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.166400,-1.536000,48.836300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.971500,-1.536000,48.641400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<57.971500,-1.536000,48.641400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.971500,-1.536000,48.641400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.971500,-1.536000,48.056800>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,-90.000000,0> translate<57.971500,-1.536000,48.056800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.971500,-1.536000,48.446500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.581800,-1.536000,48.836300>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,45.004380,0> translate<57.581800,-1.536000,48.836300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.581800,-1.536000,49.810700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.751100,-1.536000,49.810700>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<57.581800,-1.536000,49.810700> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.751100,-1.536000,49.810700>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.166400,-1.536000,49.226100>}
box{<0,0,-0.050800><0.826820,0.036000,0.050800> rotate<0,-44.992130,0> translate<58.166400,-1.536000,49.226100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.166400,-1.536000,49.226100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<58.166400,-1.536000,50.005600>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<58.166400,-1.536000,50.005600> }
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.320200,-1.536000,43.230800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.320200,-1.536000,44.400100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<47.320200,-1.536000,44.400100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.320200,-1.536000,44.400100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.735600,-1.536000,44.400100>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<46.735600,-1.536000,44.400100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.735600,-1.536000,44.400100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.540700,-1.536000,44.205200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<46.540700,-1.536000,44.205200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.540700,-1.536000,44.205200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.540700,-1.536000,43.815400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<46.540700,-1.536000,43.815400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.540700,-1.536000,43.815400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.735600,-1.536000,43.620500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<46.540700,-1.536000,43.815400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.735600,-1.536000,43.620500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.320200,-1.536000,43.620500>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<46.735600,-1.536000,43.620500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.930500,-1.536000,43.620500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.540700,-1.536000,43.230800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-44.989680,0> translate<46.540700,-1.536000,43.230800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.371400,-1.536000,44.400100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.150900,-1.536000,44.400100>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,0.000000,0> translate<45.371400,-1.536000,44.400100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.150900,-1.536000,44.400100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.150900,-1.536000,43.815400>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,-90.000000,0> translate<46.150900,-1.536000,43.815400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.150900,-1.536000,43.815400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.761200,-1.536000,44.010300>}
box{<0,0,-0.050800><0.435720,0.036000,0.050800> rotate<0,26.569178,0> translate<45.761200,-1.536000,44.010300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.761200,-1.536000,44.010300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.566300,-1.536000,44.010300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<45.566300,-1.536000,44.010300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.566300,-1.536000,44.010300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.371400,-1.536000,43.815400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<45.371400,-1.536000,43.815400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.371400,-1.536000,43.815400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.371400,-1.536000,43.425600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<45.371400,-1.536000,43.425600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.371400,-1.536000,43.425600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.566300,-1.536000,43.230800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<45.371400,-1.536000,43.425600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.566300,-1.536000,43.230800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.956100,-1.536000,43.230800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<45.566300,-1.536000,43.230800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.956100,-1.536000,43.230800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.150900,-1.536000,43.425600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<45.956100,-1.536000,43.230800> }
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.849900,-1.536000,52.120800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.849900,-1.536000,53.290100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<53.849900,-1.536000,53.290100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.849900,-1.536000,53.290100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.265300,-1.536000,53.290100>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<53.265300,-1.536000,53.290100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.265300,-1.536000,53.290100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.070400,-1.536000,53.095200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<53.070400,-1.536000,53.095200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.070400,-1.536000,53.095200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.070400,-1.536000,52.705400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<53.070400,-1.536000,52.705400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.070400,-1.536000,52.705400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.265300,-1.536000,52.510500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<53.070400,-1.536000,52.705400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.265300,-1.536000,52.510500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.849900,-1.536000,52.510500>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<53.265300,-1.536000,52.510500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.460200,-1.536000,52.510500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.070400,-1.536000,52.120800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-44.989680,0> translate<53.070400,-1.536000,52.120800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.901100,-1.536000,53.290100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.290900,-1.536000,53.095200>}
box{<0,0,-0.050800><0.435810,0.036000,0.050800> rotate<0,26.563298,0> translate<51.901100,-1.536000,53.290100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.290900,-1.536000,53.095200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.680600,-1.536000,52.705400>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,45.004380,0> translate<52.290900,-1.536000,53.095200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.680600,-1.536000,52.705400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.680600,-1.536000,52.315600>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<52.680600,-1.536000,52.315600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.680600,-1.536000,52.315600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.485800,-1.536000,52.120800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<52.485800,-1.536000,52.120800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.485800,-1.536000,52.120800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.096000,-1.536000,52.120800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<52.096000,-1.536000,52.120800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.096000,-1.536000,52.120800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.901100,-1.536000,52.315600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<51.901100,-1.536000,52.315600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.901100,-1.536000,52.315600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.901100,-1.536000,52.510500>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<51.901100,-1.536000,52.510500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.901100,-1.536000,52.510500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.096000,-1.536000,52.705400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<51.901100,-1.536000,52.510500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.096000,-1.536000,52.705400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.680600,-1.536000,52.705400>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<52.096000,-1.536000,52.705400> }
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.562800,-1.536000,59.867800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.732100,-1.536000,59.867800>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,0.000000,0> translate<32.562800,-1.536000,59.867800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.732100,-1.536000,59.867800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.732100,-1.536000,60.452400>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,90.000000,0> translate<33.732100,-1.536000,60.452400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.732100,-1.536000,60.452400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.537200,-1.536000,60.647300>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<33.537200,-1.536000,60.647300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.537200,-1.536000,60.647300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.147400,-1.536000,60.647300>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<33.147400,-1.536000,60.647300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.147400,-1.536000,60.647300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.952500,-1.536000,60.452400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<32.952500,-1.536000,60.452400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.952500,-1.536000,60.452400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.952500,-1.536000,59.867800>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.952500,-1.536000,59.867800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.952500,-1.536000,60.257500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.562800,-1.536000,60.647300>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,45.004380,0> translate<32.562800,-1.536000,60.647300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.732100,-1.536000,61.037100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.732100,-1.536000,61.816600>}
box{<0,0,-0.050800><0.779500,0.036000,0.050800> rotate<0,90.000000,0> translate<33.732100,-1.536000,61.816600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.732100,-1.536000,61.816600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.537200,-1.536000,61.816600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<33.537200,-1.536000,61.816600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.537200,-1.536000,61.816600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.757600,-1.536000,61.037100>}
box{<0,0,-0.050800><1.102450,0.036000,0.050800> rotate<0,-44.993355,0> translate<32.757600,-1.536000,61.037100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.757600,-1.536000,61.037100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.562800,-1.536000,61.037100>}
box{<0,0,-0.050800><0.194800,0.036000,0.050800> rotate<0,0.000000,0> translate<32.562800,-1.536000,61.037100> }
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.430200,-1.536000,64.058800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.430200,-1.536000,65.228100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<38.430200,-1.536000,65.228100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.430200,-1.536000,65.228100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.845600,-1.536000,65.228100>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<37.845600,-1.536000,65.228100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.845600,-1.536000,65.228100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.650700,-1.536000,65.033200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<37.650700,-1.536000,65.033200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.650700,-1.536000,65.033200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.650700,-1.536000,64.643400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<37.650700,-1.536000,64.643400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.650700,-1.536000,64.643400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.845600,-1.536000,64.448500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<37.650700,-1.536000,64.643400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.845600,-1.536000,64.448500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.430200,-1.536000,64.448500>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<37.845600,-1.536000,64.448500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.040500,-1.536000,64.448500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.650700,-1.536000,64.058800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-44.989680,0> translate<37.650700,-1.536000,64.058800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.260900,-1.536000,65.033200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.066100,-1.536000,65.228100>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<37.066100,-1.536000,65.228100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.066100,-1.536000,65.228100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.676300,-1.536000,65.228100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<36.676300,-1.536000,65.228100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.676300,-1.536000,65.228100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.481400,-1.536000,65.033200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<36.481400,-1.536000,65.033200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.481400,-1.536000,65.033200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.481400,-1.536000,64.838300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<36.481400,-1.536000,64.838300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.481400,-1.536000,64.838300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.676300,-1.536000,64.643400>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<36.481400,-1.536000,64.838300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.676300,-1.536000,64.643400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.481400,-1.536000,64.448500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<36.481400,-1.536000,64.448500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.481400,-1.536000,64.448500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.481400,-1.536000,64.253600>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<36.481400,-1.536000,64.253600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.481400,-1.536000,64.253600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.676300,-1.536000,64.058800>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<36.481400,-1.536000,64.253600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.676300,-1.536000,64.058800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.066100,-1.536000,64.058800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<36.676300,-1.536000,64.058800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.066100,-1.536000,64.058800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.260900,-1.536000,64.253600>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<37.066100,-1.536000,64.058800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.260900,-1.536000,64.253600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.260900,-1.536000,64.448500>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<37.260900,-1.536000,64.448500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.260900,-1.536000,64.448500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.066100,-1.536000,64.643400>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<37.066100,-1.536000,64.643400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.066100,-1.536000,64.643400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.260900,-1.536000,64.838300>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<37.066100,-1.536000,64.643400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.260900,-1.536000,64.838300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.260900,-1.536000,65.033200>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<37.260900,-1.536000,65.033200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.066100,-1.536000,64.643400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.676300,-1.536000,64.643400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<36.676300,-1.536000,64.643400> }
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.975900,-1.536000,59.105800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.975900,-1.536000,60.275100>}
box{<0,0,-0.050800><1.169300,0.036000,0.050800> rotate<0,90.000000,0> translate<45.975900,-1.536000,60.275100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.975900,-1.536000,60.275100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.391300,-1.536000,60.275100>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<45.391300,-1.536000,60.275100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.391300,-1.536000,60.275100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.196400,-1.536000,60.080200>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<45.196400,-1.536000,60.080200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.196400,-1.536000,60.080200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.196400,-1.536000,59.690400>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<45.196400,-1.536000,59.690400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.196400,-1.536000,59.690400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.391300,-1.536000,59.495500>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<45.196400,-1.536000,59.690400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.391300,-1.536000,59.495500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.975900,-1.536000,59.495500>}
box{<0,0,-0.050800><0.584600,0.036000,0.050800> rotate<0,0.000000,0> translate<45.391300,-1.536000,59.495500> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.586200,-1.536000,59.495500>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.196400,-1.536000,59.105800>}
box{<0,0,-0.050800><0.551190,0.036000,0.050800> rotate<0,-44.989680,0> translate<45.196400,-1.536000,59.105800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.806600,-1.536000,59.300600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.611800,-1.536000,59.105800>}
box{<0,0,-0.050800><0.275489,0.036000,0.050800> rotate<0,-44.997030,0> translate<44.611800,-1.536000,59.105800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.611800,-1.536000,59.105800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.222000,-1.536000,59.105800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<44.222000,-1.536000,59.105800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.222000,-1.536000,59.105800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.027100,-1.536000,59.300600>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,44.982329,0> translate<44.027100,-1.536000,59.300600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.027100,-1.536000,59.300600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.027100,-1.536000,60.080200>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,90.000000,0> translate<44.027100,-1.536000,60.080200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.027100,-1.536000,60.080200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.222000,-1.536000,60.275100>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<44.027100,-1.536000,60.080200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.222000,-1.536000,60.275100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.611800,-1.536000,60.275100>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<44.222000,-1.536000,60.275100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.611800,-1.536000,60.275100>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.806600,-1.536000,60.080200>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,45.011732,0> translate<44.611800,-1.536000,60.275100> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.806600,-1.536000,60.080200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.806600,-1.536000,59.885300>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<44.806600,-1.536000,59.885300> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.806600,-1.536000,59.885300>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.611800,-1.536000,59.690400>}
box{<0,0,-0.050800><0.275560,0.036000,0.050800> rotate<0,-45.011732,0> translate<44.611800,-1.536000,59.690400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.611800,-1.536000,59.690400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.027100,-1.536000,59.690400>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<44.027100,-1.536000,59.690400> }
//SERIAL silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,62.611000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.879000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,65.151000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<50.419000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,65.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,65.151000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.879000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,65.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.879000,0.000000,62.611000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,-90.000000,0> translate<47.879000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,62.611000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.419000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,65.151000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.959000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,65.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.419000,0.000000,65.151000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.419000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,62.611000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.959000,0.000000,62.611000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,62.611000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,65.151000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,90.000000,0> translate<55.499000,0.000000,65.151000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.499000,0.000000,65.151000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.959000,0.000000,65.151000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.959000,0.000000,65.151000> }
box{<-0.381000,0,-0.254000><0.381000,0.036000,0.254000> rotate<0,-0.000000,0> translate<49.149000,0.000000,65.405000>}
box{<-0.381000,0,-0.254000><0.381000,0.036000,0.254000> rotate<0,-0.000000,0> translate<51.689000,0.000000,65.405000>}
box{<-0.381000,0,-0.254000><0.381000,0.036000,0.254000> rotate<0,-0.000000,0> translate<54.229000,0.000000,65.405000>}
box{<-0.381000,0,-0.508000><0.381000,0.036000,0.508000> rotate<0,-0.000000,0> translate<49.149000,0.000000,62.103000>}
box{<-0.381000,0,-0.508000><0.381000,0.036000,0.508000> rotate<0,-0.000000,0> translate<51.689000,0.000000,62.103000>}
box{<-0.381000,0,-0.508000><0.381000,0.036000,0.508000> rotate<0,-0.000000,0> translate<54.229000,0.000000,62.103000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.190600,0.000000,58.039800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.999900,0.000000,58.230400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<48.999900,0.000000,58.230400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.999900,0.000000,58.230400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.618600,0.000000,58.230400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<48.618600,0.000000,58.230400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.618600,0.000000,58.230400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.428000,0.000000,58.039800>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,-44.997030,0> translate<48.428000,0.000000,58.039800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.428000,0.000000,58.039800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.428000,0.000000,57.849100>}
box{<0,0,-0.063500><0.190700,0.036000,0.063500> rotate<0,-90.000000,0> translate<48.428000,0.000000,57.849100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.428000,0.000000,57.849100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.618600,0.000000,57.658400>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,45.012056,0> translate<48.428000,0.000000,57.849100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.618600,0.000000,57.658400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.999900,0.000000,57.658400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<48.618600,0.000000,57.658400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.999900,0.000000,57.658400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.190600,0.000000,57.467800>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<48.999900,0.000000,57.658400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.190600,0.000000,57.467800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.190600,0.000000,57.277100>}
box{<0,0,-0.063500><0.190700,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.190600,0.000000,57.277100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.190600,0.000000,57.277100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.999900,0.000000,57.086500>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-44.982005,0> translate<48.999900,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.999900,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.618600,0.000000,57.086500>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<48.618600,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.618600,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.428000,0.000000,57.277100>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,44.997030,0> translate<48.428000,0.000000,57.277100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.359900,0.000000,58.230400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.597300,0.000000,58.230400>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<49.597300,0.000000,58.230400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.597300,0.000000,58.230400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.597300,0.000000,57.086500>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,-90.000000,0> translate<49.597300,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.597300,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.359900,0.000000,57.086500>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<49.597300,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.597300,0.000000,57.658400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<49.978600,0.000000,57.658400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<49.597300,0.000000,57.658400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.766600,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.766600,0.000000,58.230400>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<50.766600,0.000000,58.230400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.766600,0.000000,58.230400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.338500,0.000000,58.230400>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,0.000000,0> translate<50.766600,0.000000,58.230400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.338500,0.000000,58.230400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.529200,0.000000,58.039800>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<51.338500,0.000000,58.230400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.529200,0.000000,58.039800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.529200,0.000000,57.658400>}
box{<0,0,-0.063500><0.381400,0.036000,0.063500> rotate<0,-90.000000,0> translate<51.529200,0.000000,57.658400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.529200,0.000000,57.658400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.338500,0.000000,57.467800>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-44.982005,0> translate<51.338500,0.000000,57.467800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.338500,0.000000,57.467800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.766600,0.000000,57.467800>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,0.000000,0> translate<50.766600,0.000000,57.467800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.147900,0.000000,57.467800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.529200,0.000000,57.086500>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,44.997030,0> translate<51.147900,0.000000,57.467800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.935900,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.317200,0.000000,57.086500>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<51.935900,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.126500,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.126500,0.000000,58.230400>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<52.126500,0.000000,58.230400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.935900,0.000000,58.230400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.317200,0.000000,58.230400>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<51.935900,0.000000,58.230400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.715400,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.715400,0.000000,57.849100>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,90.000000,0> translate<52.715400,0.000000,57.849100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.715400,0.000000,57.849100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.096700,0.000000,58.230400>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,-44.997030,0> translate<52.715400,0.000000,57.849100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.096700,0.000000,58.230400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.478000,0.000000,57.849100>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,44.997030,0> translate<53.096700,0.000000,58.230400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.478000,0.000000,57.849100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.478000,0.000000,57.086500>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,-90.000000,0> translate<53.478000,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.715400,0.000000,57.658400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.478000,0.000000,57.658400>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<52.715400,0.000000,57.658400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.884700,0.000000,58.230400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.884700,0.000000,57.086500>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,-90.000000,0> translate<53.884700,0.000000,57.086500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.884700,0.000000,57.086500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.647300,0.000000,57.086500>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<53.884700,0.000000,57.086500> }
//T1 silk screen
object{ARC(2.667000,0.127000,275.462839,308.244104,0.036000) translate<34.798100,0.000000,29.210000>}
object{ARC(2.667000,0.127000,197.146796,275.464977,0.036000) translate<34.798000,0.000000,29.210000>}
object{ARC(2.666900,0.127000,51.752879,162.852571,0.036000) translate<34.798000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.449000,0.000000,27.115500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<36.449000,0.000000,31.304500>}
box{<0,0,-0.063500><4.189000,0.036000,0.063500> rotate<0,90.000000,0> translate<36.449000,0.000000,31.304500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.052000,0.000000,26.555100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.052000,0.000000,26.956300>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<35.052000,0.000000,26.956300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.052000,0.000000,28.923700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.052000,0.000000,29.496300>}
box{<0,0,-0.063500><0.572600,0.036000,0.063500> rotate<0,90.000000,0> translate<35.052000,0.000000,29.496300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.052000,0.000000,31.463700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<35.052000,0.000000,31.864900>}
box{<0,0,-0.063500><0.401200,0.036000,0.063500> rotate<0,90.000000,0> translate<35.052000,0.000000,31.864900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.972500,0.000000,24.955800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.828600,0.000000,24.955800>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,0.000000,0> translate<32.828600,0.000000,24.955800> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.828600,0.000000,24.574500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.828600,0.000000,25.337100>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,90.000000,0> translate<32.828600,0.000000,25.337100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.209900,0.000000,25.743800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.828600,0.000000,26.125100>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,44.997030,0> translate<32.828600,0.000000,26.125100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<32.828600,0.000000,26.125100>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.972500,0.000000,26.125100>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,0.000000,0> translate<32.828600,0.000000,26.125100> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.972500,0.000000,25.743800>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<33.972500,0.000000,26.506400>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,90.000000,0> translate<33.972500,0.000000,26.506400> }
//VDC_IN silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.631000,0.000000,52.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.631000,0.000000,37.969000>}
box{<0,0,-0.076200><14.986000,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.631000,0.000000,37.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.826000,0.000000,37.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.623000,0.000000,37.969000>}
box{<0,0,-0.076200><0.203000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.623000,0.000000,37.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.826000,0.000000,37.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.826000,0.000000,52.955000>}
box{<0,0,-0.076200><14.986000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.826000,0.000000,52.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.631000,0.000000,52.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,52.955000>}
box{<0,0,-0.076200><2.388000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.631000,0.000000,52.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,52.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,51.355000>}
box{<0,0,-0.076200><1.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.019000,0.000000,51.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,49.577000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,46.351000>}
box{<0,0,-0.076200><3.226000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.019000,0.000000,46.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,44.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,41.347000>}
box{<0,0,-0.076200><3.226000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.019000,0.000000,41.347000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,39.569000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,37.969000>}
box{<0,0,-0.076200><1.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<4.019000,0.000000,37.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,52.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.623000,0.000000,52.955000>}
box{<0,0,-0.076200><6.604000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.019000,0.000000,52.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,37.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.631000,0.000000,37.969000>}
box{<0,0,-0.076200><2.388000,0.036000,0.076200> rotate<0,0.000000,0> translate<1.631000,0.000000,37.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.623000,0.000000,37.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.623000,0.000000,52.955000>}
box{<0,0,-0.076200><14.986000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.623000,0.000000,52.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.623000,0.000000,37.969000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.019000,0.000000,37.969000>}
box{<0,0,-0.076200><6.604000,0.036000,0.076200> rotate<0,0.000000,0> translate<4.019000,0.000000,37.969000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.623000,0.000000,52.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.826000,0.000000,52.955000>}
box{<0,0,-0.076200><0.203000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.623000,0.000000,52.955000> }
difference{
cylinder{<9.301800,0,50.466000><9.301800,0.036000,50.466000>0.584200 translate<0,0.000000,0>}
cylinder{<9.301800,-0.1,50.466000><9.301800,0.135000,50.466000>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<9.301800,0,40.458400><9.301800,0.036000,40.458400>0.584200 translate<0,0.000000,0>}
cylinder{<9.301800,-0.1,40.458400><9.301800,0.135000,40.458400>0.431800 translate<0,0.000000,0>}}
difference{
cylinder{<9.301800,0,45.462200><9.301800,0.036000,45.462200>0.584200 translate<0,0.000000,0>}
cylinder{<9.301800,-0.1,45.462200><9.301800,0.135000,45.462200>0.431800 translate<0,0.000000,0>}}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.267700,0.000000,56.102200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.267700,0.000000,55.339600>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,-90.000000,0> translate<3.267700,0.000000,55.339600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.267700,0.000000,55.339600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.649000,0.000000,54.958300>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,44.997030,0> translate<3.267700,0.000000,55.339600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.649000,0.000000,54.958300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.030300,0.000000,55.339600>}
box{<0,0,-0.063500><0.539240,0.036000,0.063500> rotate<0,-44.997030,0> translate<3.649000,0.000000,54.958300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.030300,0.000000,55.339600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.030300,0.000000,56.102200>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,90.000000,0> translate<4.030300,0.000000,56.102200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.437000,0.000000,56.102200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.437000,0.000000,54.958300>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,-90.000000,0> translate<4.437000,0.000000,54.958300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.437000,0.000000,54.958300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.008900,0.000000,54.958300>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,0.000000,0> translate<4.437000,0.000000,54.958300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.008900,0.000000,54.958300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.199600,0.000000,55.148900>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-44.982005,0> translate<5.008900,0.000000,54.958300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.199600,0.000000,55.148900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.199600,0.000000,55.911600>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,90.000000,0> translate<5.199600,0.000000,55.911600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.199600,0.000000,55.911600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.008900,0.000000,56.102200>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<5.008900,0.000000,56.102200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.008900,0.000000,56.102200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.437000,0.000000,56.102200>}
box{<0,0,-0.063500><0.571900,0.036000,0.063500> rotate<0,0.000000,0> translate<4.437000,0.000000,56.102200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.368900,0.000000,55.911600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.178200,0.000000,56.102200>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,44.982005,0> translate<6.178200,0.000000,56.102200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.178200,0.000000,56.102200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.796900,0.000000,56.102200>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<5.796900,0.000000,56.102200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.796900,0.000000,56.102200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.606300,0.000000,55.911600>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,-44.997030,0> translate<5.606300,0.000000,55.911600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.606300,0.000000,55.911600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.606300,0.000000,55.148900>}
box{<0,0,-0.063500><0.762700,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.606300,0.000000,55.148900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.606300,0.000000,55.148900>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.796900,0.000000,54.958300>}
box{<0,0,-0.063500><0.269549,0.036000,0.063500> rotate<0,44.997030,0> translate<5.606300,0.000000,55.148900> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.796900,0.000000,54.958300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.178200,0.000000,54.958300>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<5.796900,0.000000,54.958300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.178200,0.000000,54.958300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.368900,0.000000,55.148900>}
box{<0,0,-0.063500><0.269620,0.036000,0.063500> rotate<0,-44.982005,0> translate<6.178200,0.000000,54.958300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.775600,0.000000,54.767700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.538200,0.000000,54.767700>}
box{<0,0,-0.063500><0.762600,0.036000,0.063500> rotate<0,0.000000,0> translate<6.775600,0.000000,54.767700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.944900,0.000000,54.958300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.326200,0.000000,54.958300>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<7.944900,0.000000,54.958300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.135500,0.000000,54.958300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.135500,0.000000,56.102200>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<8.135500,0.000000,56.102200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.944900,0.000000,56.102200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.326200,0.000000,56.102200>}
box{<0,0,-0.063500><0.381300,0.036000,0.063500> rotate<0,0.000000,0> translate<7.944900,0.000000,56.102200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.724400,0.000000,54.958300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.724400,0.000000,56.102200>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<8.724400,0.000000,56.102200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.724400,0.000000,56.102200>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.487000,0.000000,54.958300>}
box{<0,0,-0.063500><1.374797,0.036000,0.063500> rotate<0,56.306216,0> translate<8.724400,0.000000,56.102200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.487000,0.000000,54.958300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.487000,0.000000,56.102200>}
box{<0,0,-0.063500><1.143900,0.036000,0.063500> rotate<0,90.000000,0> translate<9.487000,0.000000,56.102200> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  MAGNETCHARGER(-45.560000,0,-33.020000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//K1	JS-M1-12V-5	JS-M
