if (!jump) {
    // Phase d'intro - détecter le caractère '\'
    var char_index = floor(scroll_x1 / FONT_WIDTH);
    if (char_index < string_length(text1) && string_char_at(text1, char_index + 1) == "\\") {
        jump = true;
    }
    scroll_x1 = (scroll_x1 + 6) mod (string_length(text1) * FONT_WIDTH);
} else {
    // Animation principale
    speed = -1 * cos(vbl / 40);
    vbl += 0.16;
    xm = 128 * cos(vbl2 / 40);
    vbl2 += 0.8;
}
