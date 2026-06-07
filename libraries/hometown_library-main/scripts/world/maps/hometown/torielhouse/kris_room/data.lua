return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 7,
  nextobjectid = 28,
  properties = {
    ["border"] = "leaves",
    ["light"] = true,
    ["music"] = "house"
  },
  tilesets = {
    {
      name = "hometownobjects",
      firstgid = 1,
      filename = "../../../../tilesets/hometownobjects.tsx",
      exportfilename = "../../../../tilesets/hometownobjects.lua"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../../../../assets/sprites/world/maps/hometown/torielhouse/kris_room.png",
      id = 2,
      name = "room",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      repeatx = false,
      repeaty = false,
      properties = {}
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "collision",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 1,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 400,
          width = 210,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 250,
          y = 440,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 3,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 80,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 40,
          width = 520,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 40,
          width = 40,
          height = 400,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 370,
          y = 400,
          width = 190,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 370,
          y = 440,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
      name = "objects",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 8,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 190,
          y = 188.25,
          width = 82,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = Game:locRaw("kris_room_interactable_1")
          }
        },
        {
          id = 9,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 378.5,
          y = 188.25,
          width = 82,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = Game:locRaw("kris_room_interactable_1")
          }
        },
        {
          id = 10,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 276.5,
          y = 198.75,
          width = 25.75,
          height = 28,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = false,
            ["text1"] = Game:locRaw("kris_room_interactable_1"),
            ["text2"] = Game:locRaw("kris_room_interactable_2")
          }
        },
        {
          id = 11,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 196,
          width = 100,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = Game:locRaw("kris_room_interactable_1"),
            ["text2"] = Game:locRaw("kris_room_interactable_2")
          }
        },
        {
          id = 12,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 466,
          y = 200,
          width = 94,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = Game:locRaw("kris_room_interactable_1"),
            ["text2"] = Game:locRaw("kris_room_interactable_2")
          }
        },
        {
          id = 26,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 200,
          width = 94,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "nightCutscenes.susie",
            ["solid"] = true
          }
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 470,
          y = 390,
          width = 74,
          height = 60,
          rotation = 0,
          gid = 34,
          visible = true,
          properties = {
            ["solid"] = true
          }
        },
        {
          id = 14,
          name = "",
          type = "",
          shape = "rectangle",
          x = 466,
          y = 274,
          width = 92,
          height = 76,
          rotation = 0,
          gid = 35,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 84,
          y = 400,
          width = 106,
          height = 64,
          rotation = 0,
          gid = 37,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 88,
          y = 366,
          width = 92,
          height = 34,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = Game:locRaw("kris_room_interactable_1")
          }
        },
        {
          id = 18,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 532,
          y = 322,
          width = 24,
          height = 28,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("kris_room_interactable_1")
          }
        },
        {
          id = 20,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 290,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["facing"] = "down",
            ["map"] = "hometown/torielhouse/toriel_hallway",
            ["marker"] = "spawn"
          }
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = -95.3813,
          y = 283.566,
          width = 0,
          height = 0.859291,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 307.25,
          y = 158,
          width = 59.5,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("kris_room_interactable_1")
          }
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 5,
      name = "markers",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 19,
          name = "spawn",
          type = "",
          shape = "point",
          x = 330,
          y = 440,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "krisstart",
          type = "",
          shape = "point",
          x = 494,
          y = 257,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "kriswalkbed",
          type = "",
          shape = "point",
          x = 436,
          y = 270,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
