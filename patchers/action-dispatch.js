/*
  action-dispatch.js
  Dispatches action messages to the LOM engine.

  Argument 1: action type (get, set, observe, call)

  Inlet 0: bang (from button click) triggers dispatch
  Also receives "prop <name>" messages to store current property

  Output: "get <prop>", "set <prop>", "call <prop>", "observe <prop>"
*/

inlets = 1;
outlets = 1;

var actionType = "get";
var currentProp = "tempo";

if (jsarguments.length > 1) {
  actionType = jsarguments[1];
}

function bang() {
  outlet(0, actionType, currentProp);
}

function prop(name) {
  currentProp = name;
}

function msg_int(v) {
  bang();
}

function anything() {
  var args = arrayfromargs(messagename, arguments);
  if (args[0] === "prop" && args.length > 1) {
    currentProp = args[1];
  } else {
    bang();
  }
}
