"use strict"

function setup(classDays) {

	// var classDays = [ [7, 9, 17], [14, 9, 17], [21, 9, 17], [28, 9, 17], [5, 10, 17], [19, 10, 17], [26, 10, 17], [2, 11, 17], [9, 11, 17], [16, 11, 17], [23, 11, 17], [30, 11, 17] ];

	var doCalendar = true;

	//get the day
	var myDays = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" ];
	var myMonths = [ "jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec" ];
	var today = new Date();
	var thisDay = today.getDay();

	//get the date
	var month = today.getMonth() + 1;
	var day = today.getDate();
	var year = today.getFullYear();

	//get the time
	var hours = today.getHours();
	var minutes = today.getMinutes();

	var openThis = classDays.length;

		console.log("There are " + classDays.length + " days in this class.");

		for (var i=0; i<classDays.length; i++) {
			var id = "#day" + (i+1); 
			$(id).append("Day " + (i+1) + ", " + classDays[i][0] + " " + myMonths[classDays[i][1]-1] + " " + classDays[i][2]);

			if (doCalendar) {
				if ((day >= classDays[i][0] && month >= classDays[i][1]) || month > classDays[i][1]) {
					openThis--;
				} else {
					$(id).hide();
				}		
			}
		}

		if (doCalendar) {
			$("#accordion2").accordion({
				autoHeight: false,
				navigation: true,
				active: openThis
			});
		}

	// ~ ~ ~ ~ ~ 
	$(".user").each(function() {
		var url = $(this).attr("href").split("/");
		var name = url[url.length-1];
  		$(this).append("<span style=\"color:black;font-style:italic;\">&nbsp;&nbsp;|&nbsp;&nbsp;" + name + "</span>");
  	});

}

