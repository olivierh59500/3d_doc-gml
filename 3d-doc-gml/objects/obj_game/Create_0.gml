// Constantes
#macro SCREEN_WIDTH 768
#macro SCREEN_HEIGHT 540
#macro FONT_WIDTH 62
#macro FONT_HEIGHT 50

// Images
backdrop = spr_backdrop;
mountains = spr_mountains;
font_in = spr_font_in;
font_out = spr_font_out;
sphere = spr_sphere;
shadows[0] = spr_shadow0;
shadows[1] = spr_shadow1;
shadows[2] = spr_shadow2;
shadows[3] = spr_shadow3;

// Surfaces pour les canvas
surf_chessboard = surface_create(1280, 80);
surf_chessboard_mask = surface_create(1280, 80);
surf_scroll1 = surface_create(768, 50);
surf_scroll2 = surface_create(1024, 50);
surf_scroll3 = surface_create(1024, 50);
surf_scroll5 = surface_create(1024, 120);

// Variables d'animation
vbl = 0;
vbl2 = 0;
vbl3 = 0;
vbl4 = 0;
x_move = 0;
y_move = 0;
xm = 0;
ym = 315;
fov = 250;
speed = 1;

// Scroll precalc
scroll_x = ds_list_create();
precalc_scroll_x();
scroll_x_mod = ds_list_size(scroll_x);

// Scrolltext
text1 = "               BILIZIR FROM DMA HAVE DONE IT AGAIN: A NEW GAMEMAKER CONVERSION, THIS TIME THIS IS THE 3D-DOC FROM TCB    \\          ";
text2 = "                          BILIZIR IS PROUD TO PRESENT THE CONVERSION OF THE 3D-DOC DEMO!    THIS SCREEN WAS ORIGINALLY RELEASED IN TCB'S CUDDLY DEMOS ON ATARI ST A LONG TIME AGO...  HERE IT'S THE GAMEMAKER VERSION OF THE 3D-DOC WELL IT'S A FREE ADAPTATION :)   GREETINGS TO ALL MEMBERS OF DMA AND THE UNION... LET'S WRAP!   ";
scroll_x1 = 0;
scroll_x2 = 0;

// 3D Doc animation
current_radians = 0;
overwrite_first_two_waveforms = true;
start_time = current_time;

// Phase
jump = false;

// Créer les boules 3D
for (var i = 0; i < 4; i++) {
    balls[i] = instance_create_layer(SCREEN_WIDTH/2, SCREEN_HEIGHT/2, "Instances", obj_3d_ball);
    balls[i].ball_index = i;
}

// Tri des sphères par profondeur
ball_depth_sorted = ds_list_create();

// Musique
music_instance = audio_play_sound(snd_music, 0, true);
