/*
  populate-target-menu.js
  Receives a category name from the category umenu,
  looks up the target list from the lom-targets dict,
  and outputs messages to populate the target umenu.
*/

inlets = 1;
outlets = 1;

function anything() {
  var category = arrayfromargs(messagename, arguments).join(" ");
  var d = new Dict("lom-targets");

  // Clear the target menu
  outlet(0, "clear");

  // Get targets for this category
  var targets = d.get("targets::" + category);
  if (!targets) {
    post("No targets found for category: " + category + "\n");
    return;
  }

  // targets is a dict containing an array
  var count = targets.getsize();
  if (count === undefined) {
    // Single entry case
    var name = targets.get("name");
    if (name) {
      outlet(0, "append", name);
    }
    return;
  }

  for (var i = 0; i < count; i++) {
    var entry = targets.get(i);
    if (entry) {
      var name = entry.get("name");
      if (name) {
        outlet(0, "append", name);
      }
    }
  }
}
