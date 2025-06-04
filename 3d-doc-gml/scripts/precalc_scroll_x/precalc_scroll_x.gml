function precalc_scroll_x() {
    ds_list_clear(scroll_x);
    
    // Premier pattern
    var stp1 = 7.0 / 180.0 * pi;
    var stp2 = 3.0 / 180.0 * pi;
    for (var i = 0; i < 389; i++) {
        ds_list_add(scroll_x, 20 * sin(i * stp1) + 30 * cos(i * stp2));
    }
    
    // Deuxième pattern
    stp1 = 8.0 / 180.0 * pi;
    for (var i = 0; i < 68; i++) {
        ds_list_add(scroll_x, 30 * sin(i * stp1));
    }
    
    // Répétition du premier pattern
    stp1 = 7.0 / 180.0 * pi;
    stp2 = 3.0 / 180.0 * pi;
    for (var i = 0; i < 389; i++) {
        ds_list_add(scroll_x, 20 * sin(i * stp1) + 30 * cos(i * stp2));
    }
    
    // Dernier pattern
    stp1 = 8.0 / 180.0 * pi;
    for (var i = 0; i < 189; i++) {
        ds_list_add(scroll_x, 30 * sin(i * stp1));
    }
}