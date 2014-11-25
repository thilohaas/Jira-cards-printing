var getRgbaColor = function(colorString) {
    var rgb = [],
        colorStringShortened = colorString.substr(0, 1) + colorString.substr(-2, 2);

    for (var i = 0; i < 3; i++) {
        rgb.push(parseInt((colorStringShortened.charCodeAt(i % colorString.length) * colorString.length) % 255));
    }

    return 'rgba(' + rgb.join(',') + ',0.7)';
};

$(document).ready(function () {
    $('.colorize').each(function(){
        $(this).css('background-color', getRgbaColor($(this).data('color-hash')));
    });
});
