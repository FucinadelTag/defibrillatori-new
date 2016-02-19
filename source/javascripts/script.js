$.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
        return null;
    }
    else{
        return results[1] || 0;
    }
}

$.getDivece = function () {
    var viewportWidth = $(window).width();
    if (viewportWidth > 0) {
        var device = 'small';
    };

    if (viewportWidth > 640) {
        var device = 'medium';
    };

    if (viewportWidth > 1024) {
        var device = 'large';
    };

    return device;

}

$.setFormValue = function (fieldId, newValue){
    if ($(fieldId)) {
        $(fieldId).val(newValue);
    }
}

$.setDeviceInForm = function (fieldId) {
    var newValue = $.getDivece ();
    $.setFormValue (fieldId, newValue);
}
