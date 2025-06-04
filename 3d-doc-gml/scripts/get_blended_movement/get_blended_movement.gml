function get_blended_movement(index1, index2, t, i, alpha) {
    var a = get_movement(index1, t, i);
    var b = get_movement(index2, t, i);
    var result = array_create(4);
    
    for (var j = 0; j < 4; j++) {
        result[j] = a[j] * (1 - alpha) + b[j] * alpha;
    }
    
    return result;
}