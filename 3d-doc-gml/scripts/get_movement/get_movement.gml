function get_movement(index, t, i) {
    // Éviter les animations 0 et 1 après le début
    if (index < 2 && t > 21) {
        index = 2 + floor(t / 7) mod 6;
    }
    
    var result = array_create(4); // [SpinSpeed, Displace, BallLineDisplacement, RadiusFromCenterOfScreen]
    
    switch (index) {
        case 0:
        case 1:
            result[0] = -5; result[1] = 40; result[2] = 0; result[3] = 0;
            break;
        case 2:
            result[0] = -5; result[1] = -60 - sin(t * 7) * 95; result[2] = 35; result[3] = 150;
            break;
        case 3:
            result[0] = 5; result[1] = sin((t + i) * 0.5 * 13) * 90 - 50; result[2] = 16; result[3] = 150;
            break;
        case 4:
            result[0] = 5; result[1] = 80 - abs(sin((t + i) * 0.125 * 13.5) * 8 * cos((t + i) * 0.125 * 13.5) * 42) - 50; 
            result[2] = 20; result[3] = 150;
            break;
        case 5:
            result[0] = 5; result[1] = sin((t + i) * 0.25 * 13.5) * 8 * cos((t + i) * 0.25 * 13.5) * 22 - 50; 
            result[2] = 20; result[3] = 150;
            break;
        case 6:
            result[0] = -7; result[1] = sin((t + i) * 0.25 * 13.5) * 8 * cos((t + i) * 0.25 * 13.5) * 22 - 50; 
            result[2] = 20; result[3] = 150;
            break;
        case 7:
            result[0] = -8; result[1] = 10 - abs(sin((t * 0.6 + i * 0.05) * 1.75) * 70) * 2.3; 
            result[2] = 20; result[3] = 150;
            break;
        default:
            return get_movement(2 + (index - 2) mod 6, t, i);
    }
    
    return result;
}