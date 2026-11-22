/*
  target-lookup.js
  Receives a target index (int) from the target umenu.
  Looks up the selected target's metadata from the lom-targets dict
  based on the current category, then outputs the metadata as
  separate messages: path, prop, actions, type, index.
*/

inlets = 1;
outlets = 1;

var currentCategory = "Transport";

function setcategory(cat) {
  currentCategory = arrayfromargs(arguments).join(" ");
  if (arguments.length === 0) {
    currentCategory = cat;
  }
}

function msg_int(idx) {
  var d = new Dict("lom-targets");
  var targets = d.get("targets::" + currentCategory);
  if (!targets) {
    post("No targets for category: " + currentCategory + "\n");
    return;
  }

  var entry;
  var count = targets.getsize();
  if (count === undefined) {
    // Single entry
    if (idx === 0) {
      entry = targets;
    } else {
      return;
    }
  } else {
    entry = targets.get(idx);
  }

  if (!entry) {
    post("No target at index " + idx + "\n");
    return;
  }

  var path = entry.get("path");
  var prop = entry.get("prop");
  var actions = entry.get("actions");
  var type = entry.get("type");
  var index = entry.get("index");

  if (path) outlet(0, "path", path);
  if (prop) outlet(0, "prop", prop);
  if (actions) outlet(0, "actions", actions);
  if (type) outlet(0, "type", type);
  if (index) {
    outlet(0, "index", index);
  } else {
    outlet(0, "index", "none");
  }
}

function anything() {
  // Handle category changes routed here
  var msg = arrayfromargs(messagename, arguments).join(" ");
  currentCategory = msg;
}
