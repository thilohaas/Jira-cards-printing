var getColor = function(str) {
    var hash = 0;
    for (var i = 0; i < str.length; i++) {
       hash = str.charCodeAt(i) + ((hash << 5) - hash);
    }
    var rgbColor = hashToRgb(hash);
    return '#' + rgbColor + Array(6 - rgbColor.length + 1).join('0');
};

var hashToRgb = function(i){
    return ((i>>16)&0xFF).toString(16) +
           ((i>>8)&0xFF).toString(16) +
           (i&0xFF).toString(16);
};

$(document).ready(function () {
    $('.colorize').each(function(){
        $(this).css(
          'background-color',
          getColor($(this).data('color-hash'))
        );
    });
});