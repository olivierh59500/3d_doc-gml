var game = instance_find(obj_game, 0);
if (!visible || game == noone) return;

// Calculer la position et l'échelle de l'ombre
var shadow_pos_x = x;
var shadow_pos_y = 60;  // Position Y fixe de l'ombre au sol

// Projeter la position de l'ombre
var shadow_z = z_3d;
var shadow_proj_scale = 400 / (400 + shadow_z);
var shadow_screen_y = shadow_pos_y * shadow_proj_scale + SCREEN_HEIGHT / 2 + 40;

// L'échelle de l'ombre
var final_shadow_scale = shadow_proj_scale * 0.7;

// Sélectionner l'indice de l'ombre
var shadow_color_index = floor(((final_shadow_scale - 0.5) * 10) / 2);
shadow_index = 3 - clamp(shadow_color_index, 0, 3);

// Déplacement vertical de l'ombre
var vertical_displace = min(1, max(0, 1 - final_shadow_scale)) * 26;

// Dessiner l'ombre
draw_sprite_ext(game.shadows[shadow_index], 0, 
                shadow_pos_x, 
                shadow_screen_y - vertical_displace, 
                final_shadow_scale, 
                final_shadow_scale, 
                0, c_white, 1);

// Dessiner la sphère
draw_sprite_ext(game.sphere, 0, x, y, sprite_scale, sprite_scale, 0, c_white, 1);
