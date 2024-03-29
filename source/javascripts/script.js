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

$.getCampaign = function (){

    if (Cookies.get('campaign') !== undefined) {
        var campaign = Cookies.get('campaign');
    }
    else {
        var campaign = 'direct';
    }


    if ($.urlParam('gclid')) {
        campaign = 'google';
    }

    if ($.urlParam('utm_source')) {
        campaign = $.urlParam('utm_source');
    }

    Cookies.set('campaign', campaign, { expires: 100});

    return campaign;
}

$.getCampaignName = function (){

    if (Cookies.get('campaignName') !== undefined) {
        var campaignName = Cookies.get('campaignName');
    }
    else {
        var campaignName = 'not_set';
    }

    if ($.urlParam('utm_campaign')) {
        campaignName = $.urlParam('utm_campaign');
    }

    Cookies.set('campaignName', campaignName, { expires: 100});

    return campaignName;
}

$.setCampaingInForm = function (fieldId) {
    var newValue = $.getCampaign ();
    $.setFormValue (fieldId, newValue);
}

$.setCampaingNameInForm = function (fieldId) {
    var newValue = $.getCampaignName ();
    $.setFormValue (fieldId, newValue);
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

$.setOptimizelyVariationInForm = function (fieldId, experimentId) {
    var newValue = optimizely.variationNamesMap[experimentId];
    $.setFormValue (fieldId, newValue);
}

$.setPageFrom = function (fieldId) {
    var newValue = window.location.href;
    $.setFormValue (fieldId, newValue);
}
