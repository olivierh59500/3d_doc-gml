// Clear screen
draw_clear(c_black);

if (!jump) {
    // Phase d'intro avec superposition des deux fonts
    surface_set_target(surf_scroll1);
    draw_clear_alpha(c_black, 0);
    
    // D'abord dessiner font_out (contour)
    draw_scroll_text(surf_scroll1, font_out, text1, scroll_x1);
    
    // Ensuite dessiner font_in (intérieur) par-dessus
    draw_scroll_text(surf_scroll1, font_in, text1, scroll_x1);
    
    surface_reset_target();
    
    draw_surface(surf_scroll1, 0, 62);
} else {
    // Scène principale
    
    // 1. Dessiner le fond
    draw_sprite_ext(backdrop, 0, 0, 0, 77, 1, 0, c_white, 1);
    
    // 2. Dessiner les montagnes
    draw_sprite(mountains, 0, 0, 0);
    
    // 3. Dessiner le damier
    draw_chessboard();
    
    // 4. Dessiner le damier sur l'écran
    draw_surface_ext(surf_chessboard, 0, 260, 0.6, 2.6, 0, c_white, 1);
    
    // 5. Dessiner le scroller avec effets
    draw_scroller();
    
    // 6. Trier et dessiner les sphères 3D
    draw_3d_balls();
}
