function draw_scroll_text(surf, font_sprite, text, scroll_xx) {
    var char_spacing = FONT_WIDTH;
    var start_char = floor(scroll_xx / char_spacing);
    var offset = scroll_xx mod char_spacing;
    
    var surf_width = surface_get_width(surf);
    var max_chars = floor(surf_width / char_spacing) + 3;
    
    for (var i = 0; i < max_chars; i++) {
        var char_index = (start_char + i) mod string_length(text);
        if (char_index < 0) char_index += string_length(text);
        
        var xx = i * char_spacing - offset;
        if (xx >= -char_spacing && xx < surf_width + char_spacing) {
            var char = string_char_at(text, char_index + 1);
            draw_char(surf, font_sprite, char, xx, 0, 1);
        }
    }
    
    return (scroll_xx + 3) mod (string_length(text) * char_spacing);
}