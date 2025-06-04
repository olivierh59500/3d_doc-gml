function draw_chessboard() {
    surface_set_target(surf_chessboard);
    draw_clear_alpha(c_black, 0);
    
    x_move += xm * speed * 0.005;
    if (x_move > 32) x_move -= 32;
    if (x_move < 0) x_move += 32;
    
    var chess_color = make_color_rgb(96, 96, 96);
    
    // Dessiner toutes les bandes verticales
    for (var i = -5; i < 50; i++) {
        var x1 = -8 + i * 32 + x_move;
        var x2 = 8 + i * 32 + x_move;
        var x3 = -752 + i * 192 + x_move * 6;
        var x4 = -848 + i * 192 + x_move * 6;
        
        draw_primitive_begin(pr_trianglestrip);
        draw_vertex_color(x1, 0, chess_color, 1);
        draw_vertex_color(x2, 0, chess_color, 1);
        draw_vertex_color(x4, 80, chess_color, 1);
        draw_vertex_color(x3, 80, chess_color, 1);
        draw_primitive_end();
    }
    
    surface_reset_target();
    
    // Créer le masque pour les bandes horizontales
    y_move += ym * speed * 0.016;
    if (y_move > 64) y_move -= 64;
    if (y_move < 0) y_move += 64;
    
    surface_set_target(surf_chessboard_mask);
    draw_clear_alpha(c_black, 0);
    
    // Dessiner toutes les bandes horizontales
    for (var i = -2; i < 8; i++) {
        var y1 = -20 + (fov / (fov + 2 * i * 32 - y_move)) * 50;
        var y2 = -20 + (fov / (fov + 2 * i * 32 + 32 - y_move)) * 50;
        
        if (y1 > y2) {
            var temp = y1;
            y1 = y2;
            y2 = temp;
        }
        
        if (y2 > y1 && y1 < 80 && y2 > 0) {
            var start_y = max(0, y1);
            var end_y = min(80, y2);
            draw_rectangle_color(0, start_y, 1280, end_y, chess_color, chess_color, chess_color, chess_color, false);
        }
    }
    
    surface_reset_target();
    
    // Appliquer l'effet XOR pour créer le damier
    gpu_set_blendmode_ext(bm_inv_dest_color, bm_inv_src_color);
    surface_set_target(surf_chessboard);
    draw_surface(surf_chessboard_mask, 0, 0);
    surface_reset_target();
    gpu_set_blendmode(bm_normal);
}
