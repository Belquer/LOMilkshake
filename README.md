# LOMilkshake

A Max for Live device that simplifies the Ableton Live Object Model (LOM) into an action-based menu system. Pick what you want to control, pick what to do with it -- no LOM paths or IDs needed.

## How It Works

1. Select a **Category** (Transport, Track, Clip, etc.)
2. Select a **Target** (Tempo, Volume, Fire, etc.)
3. Set **indices** if needed (Track 0, Clip Slot 2, etc.)
4. Click an **Action** button (Get / Set / Observe / Call)
5. See the result in the value display

All LOM paths and wiring happen automatically behind the scenes.

## Actions

| Action | What it does |
|--------|-------------|
| **Get** | Read the current value of the target |
| **Set** | Change the value (type a new value first) |
| **Observe** | Watch the value update in real-time |
| **Call** | Execute a function (play, stop, fire, etc.) |

## Installation

1. Copy the `LOMilkshake` folder to your Max for Live devices directory
2. In Ableton Live, drag `LOMilkshake.amxd` onto any track
3. The device appears with the category/target menus ready to use

## File Structure

```
LOMilkshake/
  LOMilkshake.amxd              Main Max for Live device
  data/
    lom-targets.json            Target registry (117 entries)
  patchers/
    lom-engine.maxpat           Core LOM engine (live.path + live.object + live.observer)
    populate-target-menu.js     Populates target menu from dict
    target-lookup.js            Looks up target metadata
    path-builder.js             Builds LOM paths from template + indices
    action-dispatch.js          Dispatches action messages to engine
```

## Target Reference (117 targets)

### Transport (12 targets)

| Target | Description | Actions | Type |
|--------|-------------|---------|------|
| Tempo | Song tempo in BPM (20-999) | Get, Set, Observe | float |
| Is Playing | Whether the transport is running | Get, Observe | bool |
| Play | Start playback from the beginning | Call | -- |
| Continue Playing | Resume playback from current position | Call | -- |
| Stop | Stop playback | Call | -- |
| Song Position | Current playback position in beats | Get, Set, Observe | float |
| Metronome | Metronome on/off | Get, Set, Observe | bool |
| Time Sig Numerator | Time signature top number | Get, Set, Observe | int |
| Time Sig Denominator | Time signature bottom number | Get, Set, Observe | int |
| Tap Tempo | Tap to set tempo | Call | -- |
| Nudge Down | Temporarily slow down tempo | Get, Set | bool |
| Nudge Up | Temporarily speed up tempo | Get, Set | bool |

### Song (19 targets)

| Target | Description | Actions | Type |
|--------|-------------|---------|------|
| Loop On/Off | Arrangement loop toggle | Get, Set, Observe | bool |
| Loop Start | Loop start position in beats | Get, Set, Observe | float |
| Loop Length | Loop length in beats | Get, Set, Observe | float |
| Punch In | Punch-in recording toggle | Get, Set, Observe | bool |
| Punch Out | Punch-out recording toggle | Get, Set, Observe | bool |
| Record Mode | Arrangement record toggle | Get, Set, Observe | bool |
| Session Record | Session recording toggle | Get, Set, Observe | bool |
| Session Record Status | Session record state (0=off, 1=on, 2=transition) | Get, Observe | int |
| Arrangement Overdub | Arrangement overdub toggle | Get, Set, Observe | bool |
| Back to Arranger | Back to arrangement toggle | Get, Set, Observe | bool |
| Groove Amount | Global groove amount (0.0-1.0) | Get, Set, Observe | float |
| Clip Trigger Quantization | Global clip launch quantization (0=None to 13=1/32) | Get, Set, Observe | int |
| MIDI Rec Quantization | MIDI recording quantization (0-8) | Get, Set, Observe | int |
| Song Length | Total arrangement length in beats | Get, Observe | float |
| Stop All Clips | Stop all playing clips in session | Call | -- |
| Trigger Session Record | Toggle session recording | Call | -- |
| Capture MIDI | Capture recently played MIDI notes | Call | -- |
| Undo | Undo last action | Call | -- |
| Redo | Redo last undone action | Call | -- |

### Track (21 targets) -- requires Track index

| Target | Description | Actions | Type |
|--------|-------------|---------|------|
| Name | Track name | Get, Set, Observe | string |
| Mute | Track mute state | Get, Set, Observe | bool |
| Solo | Track solo state | Get, Set, Observe | bool |
| Arm | Track record arm | Get, Set, Observe | bool |
| Volume | Track volume fader (0.0-1.0) | Get, Set, Observe | float |
| Pan | Track pan position (-1.0 to 1.0) | Get, Set, Observe | float |
| Color | Track color as RGB integer | Get, Set, Observe | int |
| Color Index | Track color palette index | Get, Set, Observe | int |
| Send A | Send A level | Get, Set, Observe | float |
| Send B | Send B level | Get, Set, Observe | float |
| Monitoring State | Input monitoring (0=In, 1=Auto, 2=Off) | Get, Set, Observe | int |
| Playing Slot Index | Index of currently playing clip slot (-2=none, -1=stop) | Get, Observe | int |
| Fired Slot Index | Index of last fired clip slot | Get, Observe | int |
| Can Be Armed | Whether the track supports arming | Get | bool |
| Is Foldable | Whether the track is a group | Get | bool |
| Fold State | Group track folded/unfolded | Get, Set, Observe | bool |
| Is Grouped | Whether the track is inside a group | Get | bool |
| Output Meter Left | Left channel output level (0.0-1.0) | Get, Observe | float |
| Output Meter Right | Right channel output level (0.0-1.0) | Get, Observe | float |
| Stop All Clips | Stop all clips on this track | Call | -- |
| Crossfade Assign | Crossfader assignment (0=A, 1=None, 2=B) | Get, Set, Observe | int |

### Clip (25 targets) -- requires Track + Clip Slot index

| Target | Description | Actions | Type |
|--------|-------------|---------|------|
| Fire | Launch the clip | Call | -- |
| Stop | Stop the clip | Call | -- |
| Name | Clip name | Get, Set, Observe | string |
| Color | Clip color as RGB integer | Get, Set, Observe | int |
| Loop On/Off | Clip looping toggle | Get, Set, Observe | bool |
| Loop Start | Loop start position in beats | Get, Set, Observe | float |
| Loop End | Loop end position in beats | Get, Set, Observe | float |
| Start Marker | Clip start marker in beats | Get, Set, Observe | float |
| End Marker | Clip end marker in beats | Get, Set, Observe | float |
| Playing Position | Current playback position within clip | Get, Observe | float |
| Is Playing | Whether the clip is currently playing | Get, Observe | bool |
| Is Recording | Whether the clip is currently recording | Get, Observe | bool |
| Is Triggered | Whether the clip is queued to play | Get, Observe | bool |
| Pitch Coarse | Pitch transposition in semitones (-48 to 48, audio only) | Get, Set, Observe | int |
| Pitch Fine | Fine pitch adjustment in cents (-50 to 50, audio only) | Get, Set, Observe | float |
| Gain | Clip gain (0.0-1.0, audio only) | Get, Set, Observe | float |
| Warp Mode | Warp algorithm (0-6, audio only) | Get, Set, Observe | int |
| Warping | Warp on/off (audio only) | Get, Set, Observe | bool |
| Muted | Clip mute/deactivate toggle | Get, Set, Observe | bool |
| Velocity Amount | MIDI velocity sensitivity (0.0-1.0) | Get, Set, Observe | float |
| Launch Mode | Launch behavior (0=Trigger, 1=Gate, 2=Toggle, 3=Repeat) | Get, Set, Observe | int |
| Launch Quantization | Clip-level launch quantization (0=Global, 1-14) | Get, Set, Observe | int |
| Legato | Legato launch mode | Get, Set, Observe | bool |
| Sig Numerator | Clip time signature numerator | Get, Set, Observe | int |
| Sig Denominator | Clip time signature denominator | Get, Set, Observe | int |

### Clip Slot (7 targets) -- requires Track + Clip Slot index

| Target | Description | Actions | Type |
|--------|-------------|---------|------|
| Fire | Fire the clip slot (launches clip or stops if empty) | Call | -- |
| Stop | Stop the clip slot | Call | -- |
| Has Clip | Whether a clip exists in this slot | Get, Observe | bool |
| Is Playing | Whether this slot's clip is playing | Get, Observe | bool |
| Is Recording | Whether this slot is recording | Get, Observe | bool |
| Is Triggered | Whether this slot is queued | Get, Observe | bool |
| Color | Clip slot color | Get, Set, Observe | int |

### Device (10 targets) -- requires Track + Device index (some also need Param index)

| Target | Description | Actions | Type |
|--------|-------------|---------|------|
| Name | Device display name | Get, Set, Observe | string |
| Class Name | Device type identifier (e.g. "Compressor") | Get | string |
| On/Off | Device enabled toggle (parameter 0) | Get, Set, Observe | float |
| Is Active | Whether the device is currently active | Get, Observe | bool |
| Param Value | Value of a specific parameter | Get, Set, Observe | float |
| Param Name | Display name of a parameter | Get, Observe | string |
| Param Min | Minimum value of a parameter | Get | float |
| Param Max | Maximum value of a parameter | Get | float |
| Param Quantized | Whether a parameter snaps to discrete values | Get | bool |
| Param Display | Parameter value as a formatted display string | Get | string |

### Scene (8 targets) -- requires Scene index

| Target | Description | Actions | Type |
|--------|-------------|---------|------|
| Fire | Launch the scene (fires all clips in that row) | Call | -- |
| Fire as Selected | Fire the scene and select it | Call | -- |
| Name | Scene name | Get, Set, Observe | string |
| Color | Scene color as RGB integer | Get, Set, Observe | int |
| Color Index | Scene color palette index | Get, Set, Observe | int |
| Tempo | Scene tempo in BPM (0 = no tempo change) | Get, Set, Observe | float |
| Sig Numerator | Scene time signature numerator | Get | int |
| Sig Denominator | Scene time signature denominator | Get | int |

### Master (6 targets)

| Target | Description | Actions | Type |
|--------|-------------|---------|------|
| Volume | Master track volume fader | Get, Set, Observe | float |
| Pan | Master track pan | Get, Set, Observe | float |
| Crossfader | Crossfader position (-1.0 to 1.0) | Get, Set, Observe | float |
| Name | Master track name | Get, Observe | string |
| Color | Master track color | Get, Set, Observe | int |
| Cue Volume | Cue/preview volume | Get, Set, Observe | float |

### Return (5 targets) -- requires Return index

| Target | Description | Actions | Type |
|--------|-------------|---------|------|
| Name | Return track name | Get, Set, Observe | string |
| Volume | Return track volume fader | Get, Set, Observe | float |
| Pan | Return track pan | Get, Set, Observe | float |
| Mute | Return track mute state | Get, Set, Observe | bool |
| Solo | Return track solo state | Get, Set, Observe | bool |

### View (4 targets)

| Target | Description | Actions | Type |
|--------|-------------|---------|------|
| Selected Track | Currently selected track in Live's UI | Get, Set, Observe | object |
| Selected Scene | Currently selected scene in Live's UI | Get, Set, Observe | object |
| Detail Clip | Clip currently shown in detail view | Get, Set, Observe | object |
| Is View Visible | Whether a specific view is visible | Get | bool |

## Adding Custom Targets

Edit `data/lom-targets.json` to add new targets. Each entry needs:

```json
{
  "name": "Display Name",
  "path": "live_set tracks N devices D",
  "prop": "property_name",
  "actions": "gso",
  "type": "float",
  "index": "track,device"
}
```

- **actions**: `g` = Get, `s` = Set, `o` = Observe, `c` = Call
- **index**: which selectors are needed (`track`, `clip_slot`, `device`, `parameter`, `scene`, `return`)
- **path placeholders**: `N` = track, `M` = clip slot, `D` = device, `P` = parameter, `S` = scene, `R` = return

## License

MIT
