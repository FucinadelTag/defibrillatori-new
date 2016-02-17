moment.locale('it');
var lastDayOfMonth = moment().endOf('month').format("D\ MMMM YYYY");

 $(".dataPromo").html(lastDayOfMonth);