{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 9,
      "minor": 0,
      "revision": 0,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [ 0, 0, 500, 300 ],
    "bglocked": 0,
    "openinpresentation": 0,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [ 15.0, 15.0 ],
    "gridsnaponopen": 1,
    "objectsnaponopen": 1,
    "statusbarvisible": 2,
    "toolbarvisible": 1,
    "lefttoolbarpinned": 0,
    "toptoolbarpinned": 0,
    "righttoolbarpinned": 0,
    "bottomtoolbarpinned": 0,
    "toolbars_unpinned_last_save": 0,
    "tallnewobj": 0,
    "boxanimatetime": 200,
    "enablehscroll": 1,
    "enablevscroll": 1,
    "devicewidth": 0.0,
    "description": "LOM Engine - Core execution engine for LOMilkshake",
    "tags": "",
    "style": "",
    "subpatcher_template": "",
    "assistshowspatchername": 0,
    "boxes": [
      {
        "box": {
          "comment": "Path string (goto message)",
          "id": "obj-inlet-path",
          "index": 1,
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [ "" ],
          "patching_rect": [ 30.0, 15.0, 30.0, 30.0 ]
        }
      },
      {
        "box": {
          "comment": "Action message (get/set/call/observe)",
          "id": "obj-inlet-action",
          "index": 2,
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [ "" ],
          "patching_rect": [ 200.0, 15.0, 30.0, 30.0 ]
        }
      },
      {
        "box": {
          "comment": "Set value (for set action)",
          "id": "obj-inlet-value",
          "index": 3,
          "maxclass": "inlet",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [ "" ],
          "patching_rect": [ 370.0, 15.0, 30.0, 30.0 ]
        }
      },
      {
        "box": {
          "id": "obj-prepend-goto",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [ "" ],
          "patching_rect": [ 30.0, 65.0, 85.0, 22.0 ],
          "text": "prepend goto"
        }
      },
      {
        "box": {
          "id": "obj-livepath",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [ "", "", "" ],
          "patching_rect": [ 30.0, 100.0, 65.0, 22.0 ],
          "text": "live.path"
        }
      },
      {
        "box": {
          "id": "obj-route-action",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 5,
          "outlettype": [ "", "", "", "", "" ],
          "patching_rect": [ 200.0, 65.0, 220.0, 22.0 ],
          "text": "route get set call observe"
        }
      },
      {
        "box": {
          "id": "obj-prepend-get",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [ "" ],
          "patching_rect": [ 200.0, 100.0, 75.0, 22.0 ],
          "text": "prepend get"
        }
      },
      {
        "box": {
          "id": "obj-pack-set",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [ "" ],
          "patching_rect": [ 260.0, 100.0, 80.0, 22.0 ],
          "text": "pak set s 0."
        }
      },
      {
        "box": {
          "id": "obj-prepend-call",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [ "" ],
          "patching_rect": [ 350.0, 100.0, 75.0, 22.0 ],
          "text": "prepend call"
        }
      },
      {
        "box": {
          "id": "obj-prepend-property",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [ "" ],
          "patching_rect": [ 430.0, 100.0, 100.0, 22.0 ],
          "text": "prepend property"
        }
      },
      {
        "box": {
          "id": "obj-liveobject",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [ "" ],
          "patching_rect": [ 30.0, 175.0, 75.0, 22.0 ],
          "text": "live.object"
        }
      },
      {
        "box": {
          "id": "obj-liveobserver",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [ "", "" ],
          "patching_rect": [ 300.0, 175.0, 85.0, 22.0 ],
          "text": "live.observer"
        }
      },
      {
        "box": {
          "id": "obj-t-id",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [ "", "" ],
          "patching_rect": [ 60.0, 135.0, 60.0, 22.0 ],
          "text": "t l l"
        }
      },
      {
        "box": {
          "comment": "Result value output",
          "id": "obj-outlet-value",
          "index": 1,
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [ 30.0, 250.0, 30.0, 30.0 ]
        }
      },
      {
        "box": {
          "comment": "Observer value output",
          "id": "obj-outlet-observe",
          "index": 2,
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [ 300.0, 250.0, 30.0, 30.0 ]
        }
      },
      {
        "box": {
          "comment": "Path status output",
          "id": "obj-outlet-path",
          "index": 3,
          "maxclass": "outlet",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [ 150.0, 250.0, 30.0, 30.0 ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [ "obj-inlet-path", 0 ],
          "destination": [ "obj-prepend-goto", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-prepend-goto", 0 ],
          "destination": [ "obj-livepath", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-livepath", 1 ],
          "destination": [ "obj-t-id", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-t-id", 0 ],
          "destination": [ "obj-liveobject", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-t-id", 1 ],
          "destination": [ "obj-liveobserver", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-livepath", 0 ],
          "destination": [ "obj-outlet-path", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-inlet-action", 0 ],
          "destination": [ "obj-route-action", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-route-action", 0 ],
          "destination": [ "obj-prepend-get", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-route-action", 1 ],
          "destination": [ "obj-pack-set", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-route-action", 2 ],
          "destination": [ "obj-prepend-call", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-route-action", 3 ],
          "destination": [ "obj-prepend-property", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-prepend-get", 0 ],
          "destination": [ "obj-liveobject", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-pack-set", 0 ],
          "destination": [ "obj-liveobject", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-prepend-call", 0 ],
          "destination": [ "obj-liveobject", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-prepend-property", 0 ],
          "destination": [ "obj-liveobserver", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-inlet-value", 0 ],
          "destination": [ "obj-pack-set", 1 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-liveobject", 0 ],
          "destination": [ "obj-outlet-value", 0 ]
        }
      },
      {
        "patchline": {
          "source": [ "obj-liveobserver", 1 ],
          "destination": [ "obj-outlet-observe", 0 ]
        }
      }
    ]
  }
}
