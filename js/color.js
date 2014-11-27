var getRgbaColor = function(colorString) {
    var rgb = [],
        colorStringShortened = colorString.substr(0, 1) + colorString.substr(-2, 2);

    for (var i = 0; i < 3; i++) {
        rgb.push(parseInt((colorStringShortened.charCodeAt(i % colorStringShortened.length) * colorString.length) % 255));
    }

    return rgb;
};


var getBrightness = function(rgb) {
    return Math.round(((parseInt(rgb[0]) * 299) + (parseInt(rgb[1]) * 587) + (parseInt(rgb[2]) * 114)) /1000);
};

var getColorFromBackground = function(bgColor) {
    if(getBrightness(bgColor) > 125) {
        return 'black';
    } else{
        return 'white';
    }
};

$(document).ready(function () {
    var bgColor;

    $('.colorize').each(function(){
        bgColor = getRgbaColor($(this).data('color-hash'));
        $(this).css({
            'background-color': 'rgba(' + bgColor.join(',') + ',0.7)',
            'color': getColorFromBackground(bgColor)
        });

    });
});
