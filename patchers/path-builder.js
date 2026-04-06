/*
  path-builder.js
  Receives a path template with placeholders (N, M, D, P, S, R)
  and index values. Outputs the resolved path string.

  Placeholders:
    N = track index
    M = clip_slot index
    D = device index
    P = parameter index
    S = scene index
    R = return track index

  Messages:
    template <path>   - set the path template
    track <int>       - set track index
    clip_slot <int>   - set clip slot index
    device <int>      - set device index
    parameter <int>   - set parameter index
    scene <int>       - set scene index
    return <int>      - set return track index
    bang              - rebuild and output path
*/

inlets = 1;
outlets = 1;

var template = "live_set";
var indices = {
  N: 0,
  M: 0,
  D: 0,
  P: 0,
  S: 0,
  R: 0
};

function anything() {
  var args = arrayfromargs(messagename, arguments);
  template = args.join(" ");
  buildPath();
}

function track(v) { indices.N = v; buildPath(); }
function clip_slot(v) { indices.M = v; buildPath(); }
function device(v) { indices.D = v; buildPath(); }
function parameter(v) { indices.P = v; buildPath(); }
function scene(v) { indices.S = v; buildPath(); }
function msg_return(v) { indices.R = v; buildPath(); }

function bang() {
  buildPath();
}

function buildPath() {
  var path = template;

  // Replace placeholders with actual index values
  // Use word boundary matching by splitting and replacing tokens
  var parts = path.split(" ");
  for (var i = 0; i < parts.length; i++) {
    if (parts[i] === "N") parts[i] = indices.N.toString();
    else if (parts[i] === "M") parts[i] = indices.M.toString();
    else if (parts[i] === "D") parts[i] = indices.D.toString();
    else if (parts[i] === "P") parts[i] = indices.P.toString();
    else if (parts[i] === "S") parts[i] = indices.S.toString();
    else if (parts[i] === "R") parts[i] = indices.R.toString();
  }
  path = parts.join(" ");

  outlet(0, path);
}
