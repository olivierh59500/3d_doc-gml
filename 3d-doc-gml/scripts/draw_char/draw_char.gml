function draw_char(surf, font_sprite, char, xx, yy, scale) {
    var index = 0;
    var char_code = ord(char);
    
    // Mapping des caractères
    if (char_code == 32) index = 0; // espace
    else if (char_code >= 65 && char_code <= 90) index = 33 + (char_code - 65); // A-Z
    else if (char_code >= 97 && char_code <= 122) index = 33 + (char_code - 97); // a-z
    else if (char_code >= 48 && char_code <= 57) index = 16 + (char_code - 48); // 0-9
    else if (char_code == 33) index = 1; // !
    else if (char_code == 39) index = 7; // '
    else if (char_code == 40) index = 8; // (
    else if (char_code == 41) index = 9; // )
    else if (char_code == 44) index = 12; // ,
    else if (char_code == 45) index = 13; // -
    else if (char_code == 46) index = 14; // .
    else if (char_code == 58) index = 26; // :
    else if (char_code == 59) index = 27; // ;
    else if (char_code == 63) index = 31; // ?
    
    var cols = 10;
    var src_x = (index mod cols) * FONT_WIDTH;
    var src_y = floor(index / cols) * FONT_HEIGHT;
    
    draw_sprite_part_ext(font_sprite, 0, src_x, src_y, FONT_WIDTH, FONT_HEIGHT, 
                         xx, yy, scale, scale, c_white, 1);
}