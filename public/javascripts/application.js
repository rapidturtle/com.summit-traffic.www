// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

function addEventHandler(oNode, sEvent, fFunction, bCaptures) {
	if (typeof (window.event) != "undefined") {
		oNode.attachEvent("on" + sEvent, fFunction);
	} else {
		oNode.addEventListener(sEvent, fFunction, bCatpure);
	}
}