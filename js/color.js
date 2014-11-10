var getColor = function(str) {
    var hash = 0;
    for (var i = 0; i < str.length; i++) {
       hash = str.charCodeAt(i) + ((hash << 5) - hash);
    }
    return '#' + hashToRgb(hash);
};

var hashToRgb = function(i){
    return ((i>>16)&0xFF).toString(16) +
           ((i>>8)&0xFF).toString(16) +
           (i&0xFF).toString(16);
};

$(document).ready(function () {
    $('.epic').each(function(){
        $(this).css(
          'background-color',
          getColor($(this).children('.value').text())
        );
    });
});