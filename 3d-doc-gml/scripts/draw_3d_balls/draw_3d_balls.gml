function draw_3d_balls() {
    // Trier les balles par profondeur Z
    ds_list_clear(ball_depth_sorted);
    
    for (var i = 0; i < 4; i++) {
        if (instance_exists(balls[i])) {
            ds_list_add(ball_depth_sorted, balls[i]);
        }
    }
    
    // Trier par Z décroissant (plus loin en premier)
    for (var i = 0; i < ds_list_size(ball_depth_sorted) - 1; i++) {
        for (var j = i + 1; j < ds_list_size(ball_depth_sorted); j++) {
            var ball_i = ds_list_find_value(ball_depth_sorted, i);
            var ball_j = ds_list_find_value(ball_depth_sorted, j);
            if (ball_i.z_3d < ball_j.z_3d) {
                ds_list_set(ball_depth_sorted, i, ball_j);
                ds_list_set(ball_depth_sorted, j, ball_i);
            }
        }
    }
    
    // Dessiner dans l'ordre trié
    for (var i = 0; i < ds_list_size(ball_depth_sorted); i++) {
        var ball = ds_list_find_value(ball_depth_sorted, i);
        with (ball) {
            event_perform(ev_draw, 0);
        }
    }
}