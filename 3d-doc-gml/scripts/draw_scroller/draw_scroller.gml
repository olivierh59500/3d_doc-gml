function draw_scroller() {
    // Clear surfaces
    surface_set_target(surf_scroll2);
    draw_clear_alpha(c_black, 0);
    scroll_x2 = draw_scroll_text(surf_scroll2, font_out, text2, scroll_x2);
    surface_reset_target();
    
    // Effet de vague sur le scroller
    surface_set_target(surf_scroll3);
    draw_clear_alpha(c_black, 0);
    for (var j = 0; j < 25; j++) {
        var dst_x = ds_list_find_value(scroll_x, (vbl3 + j) mod scroll_x_mod);
        draw_surface_part(surf_scroll2, 0, j * 2, 1024, 2, dst_x, j * 2);
    }
    surface_reset_target();
    
    // Effet de rebond vertical
    var y_offset = 30 + 30 * cos(vbl4 / 20);
    
    surface_set_target(surf_scroll5);
    draw_clear_alpha(c_black, 0);
    for (var j = 0; j < 25; j++) {
        var dst_x = ds_list_find_value(scroll_x, (vbl3 + j) mod scroll_x_mod);
        var dst_y = j * 2 + y_offset;
        draw_surface_part(surf_scroll3, 0, j * 2, 1024, 2, dst_x, dst_y);
    }
    surface_reset_target();
    
    // Extraire la partie visible et dessiner
    var offset_x = (1024 - 768) / 2;
    draw_surface_part(surf_scroll5, offset_x, 0, 768, 120, 0, 62);
    
    vbl4 += 1.2;
    vbl3++;
}