
var game = instance_find(obj_game, 0);
if (game == noone || !game.jump) {
    visible = false;
    x = -1000; // Mettre hors écran
    y = -1000;
    return;
}

visible = true;

// Constantes
var FOCAL_LENGTH = 400;
var ANIM_DURATION = 7;

var t = (current_time - game.start_time) / 1000; // Convertir en secondes

// Gestion de la boucle d'animation
if (game.overwrite_first_two_waveforms && t > ANIM_DURATION * 3) {
    game.overwrite_first_two_waveforms = false;
}

// Déterminer l'index d'animation actuel
var anim_index = floor(t / ANIM_DURATION) mod 8;

// Après les 3 premières boucles, éviter les animations 0 et 1
if (!game.overwrite_first_two_waveforms && anim_index < 2) {
    anim_index = 2 + floor(t / ANIM_DURATION) mod 6;
}

// Si on est dans les 3 premières boucles et sur les animations 0 ou 1
if (game.overwrite_first_two_waveforms && anim_index < 2) {
    anim_index = 7;
}

// Calculer l'alpha pour le blend entre deux animations
var alpha = min(1, (t / ANIM_DURATION - floor(t / ANIM_DURATION)) * ANIM_DURATION * 0.8);

// Obtenir les paramètres d'animation
var anim = get_blended_movement(anim_index, anim_index + 1, t, ball_index, alpha);

// Créer la position de base sur le cercle
var current_pos_x = anim[3]; // RadiusFromCenterOfScreen
var current_pos_y = 0;
var current_pos_z = 0;

// Rotation autour de Y pour la position sur le cercle
var angle = pi * 2 / 360 * anim[2] * ball_index; // BallLineDisplacement
var rotated_x = current_pos_x * cos(angle) - current_pos_z * sin(angle);
var rotated_z = current_pos_x * sin(angle) + current_pos_z * cos(angle);
current_pos_x = rotated_x;
current_pos_z = rotated_z;

// Ajouter le déplacement vertical
x_3d = current_pos_x;
y_3d = current_pos_y + anim[1]; // Displace
z_3d = current_pos_z;

// Rotation globale
game.current_radians += (pi * 2 / 360) * anim[0] * 0.15; // SpinSpeed
game.current_radians = game.current_radians mod (pi * 2);

// Appliquer la rotation globale
rotated_x = x_3d * cos(game.current_radians) - z_3d * sin(game.current_radians);
rotated_z = x_3d * sin(game.current_radians) + z_3d * cos(game.current_radians);
x_3d = rotated_x;
z_3d = rotated_z;

// Projection 3D -> 2D
sprite_scale = FOCAL_LENGTH / (FOCAL_LENGTH + z_3d);
x = x_3d * sprite_scale + SCREEN_WIDTH / 2;
y = y_3d * sprite_scale + SCREEN_HEIGHT / 2 + 40;
sprite_scale *= 0.7;