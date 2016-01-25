// Boolean to trigger pause on mouseover event
var pause = false;

// Timer ID variables.
var t1,t2,t3;

// Outside loop counter
var icnt = 0;

//Inside loop counter and pointer into characters of the lines.
var currentChar=1;
jQuery(document).ready(function($) {
	// The next code writes the div tag on the page complete with mouseover code.
	$('#statustext').append("<div id=\'tick1\' OnMouseOver=\'pause=true;\' OnMouseOut=\'pause=false; t3=setTimeout(\"type()\",2000);\'></div>");
	if(tickercontent.length > 0) {
		type();
	}
});
function type(){
	//clear all timing
	clearTimeout(t1);
	//clear all timing
	clearTimeout(t2);
	//clear all timing
	clearTimeout(t3);

	// The next code checks for mouseover pause and completes the line instantly if true.
	if(pause && currentChar==1){
		return;
	} else if (pause){
		currentChar=tickercontent[icnt][0].length-1;
	}//if

	// The next code fast fills html tags by rapidly moving to the closing >.
	if(tickercontent[icnt][0].charAt(currentChar-1)=='<'){

		while (tickercontent[icnt][0].charAt(currentChar-1)!='>'){

			currentChar++;

			if (currentChar>tickercontent[icnt][0].length){
				tickercontent[icnt][0]=tickercontent[icnt][0]+'>'; // correct for missing > overflow condition
				currentChar--;
			}//if

		}//while

	}//if


	// The next code types the textual part of the line and indexes to the next line
  	// document.getElementById('tick1').innerHTML=tickercontent[icnt][0].substr(0, currentChar); move this value in code below for test
	if (tickercontent[icnt][1] == 0) {
		parent.document.getElementById("tick1").innerHTML = "Shows this week on OTCams.com:" + tickercontent[icnt][0].substr(0, currentChar);
	} else if (tickercontent[icnt][1] == 1) {
		parent.document.getElementById("tick1").innerHTML = "Shows this week on OTCams.com:" + tickercontent[icnt][0].substr(0, currentChar);
	}//if

  currentChar++

	// Are we at the last character in the line?
	if (currentChar>tickercontent[icnt][0].length) {

		icnt++;

		// Are we at the last line in the array?
		if (icnt==tickercontent.length){
			icnt=0;
		}//if

		currentChar=1;

		// This is the pause between lines in ms
		t1=setTimeout("type()", 4400);

	} else {

		pause=false;
		t2=setTimeout("type()", 70);  // This is the pause between typed characters in ms

	}//if

}//function

