return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.0",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 23,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 29,
  properties = {},
  tilesets = {
    {
      name = "hometownobjects",
      firstgid = 1,
      filename = "../../../../libraries/hometown_library/scripts/world/tilesets/hometownobjects.tsx",
      exportfilename = "../../../../libraries/hometown_library/scripts/world/tilesets/hometownobjects.lua"
    }
  },
  layers = {
    {
      type = "imagelayer",
      image = "../../../../libraries/hometown_library/assets/sprites/world/maps/hometown/interior/sans_store.png",
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
      id = 5,
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
          id = 19,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 400,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 20,
          y = 400,
          width = 500,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 20,
          y = 40,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 22,
          name = "",
          type = "",
          shape = "rectangle",
          x = 20,
          y = 0,
          width = 820,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 23,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 400,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 24,
          name = "",
          type = "",
          shape = "rectangle",
          x = 680,
          y = 400,
          width = 160,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 25,
          name = "",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 40,
          width = 40,
          height = 360,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 26,
          name = "",
          type = "",
          shape = "rectangle",
          x = 60,
          y = 160,
          width = 20,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 27,
          name = "",
          type = "",
          shape = "rectangle",
          x = 222,
          y = 160,
          width = 578,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 28,
          name = "",
          type = "",
          shape = "rectangle",
          x = 102,
          y = 284,
          width = 330,
          height = 78,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
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
          id = 1,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 670,
          y = 160,
          width = 28,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown.sansplin"
          }
        },
        {
          id = 2,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 160,
          width = 142,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = Game:locRaw("sans_fixed_interactable_1")
          }
        },
        {
          id = 3,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 112,
          y = 322,
          width = 58,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = Game:locRaw("sans_fixed_interactable_1"),
            ["text2"] = Game:locRaw("sans_fixed_interactable_2")
          }
        },
        {
          id = 4,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 178,
          y = 322,
          width = 60,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = Game:locRaw("sans_fixed_interactable_1"),
            ["text2"] = Game:locRaw("sans_fixed_interactable_2"),
            ["text3"] = Game:locRaw("sans_fixed_interactable_3")
          }
        },
        {
          id = 5,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 246,
          y = 322,
          width = 60,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("sans_fixed_interactable_1")
          }
        },
        {
          id = 6,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 320,
          y = 322,
          width = 104,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = Game:locRaw("sans_fixed_interactable_1"),
            ["text2"] = Game:locRaw("sans_fixed_interactable_2")
          }
        },
        {
          id = 7,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 658,
          y = 336,
          width = 42,
          height = 42,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = Game:locRaw("sans_fixed_interactable_1")
          }
        },
        {
          id = 8,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 718,
          y = 328,
          width = 58,
          height = 58,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text1"] = Game:locRaw("sans_fixed_interactable_1"),
            ["text2"] = Game:locRaw("sans_fixed_interactable_2")
          }
        },
        {
          id = 9,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 712,
          y = 200,
          width = 80,
          height = 18,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("sans_fixed_interactable_1")
          }
        },
        {
          id = 10,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 200,
          width = 80,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = Game:locRaw("sans_fixed_interactable_1"),
            ["text2"] = Game:locRaw("sans_fixed_interactable_2")
          }
        },
        {
          id = 11,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 324,
          y = 200,
          width = 58,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = Game:locRaw("sans_fixed_interactable_1"),
            ["text2"] = Game:locRaw("sans_fixed_interactable_2")
          }
        },
        {
          id = 12,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 422,
          y = 200,
          width = 58,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("sans_fixed_interactable_1")
          }
        },
        {
          id = 13,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 200,
          width = 36,
          height = 16,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("sans_fixed_interactable_1")
          }
        },
        {
          id = 14,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 480,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["depths"] = true,
            ["facing"] = "down",
            ["map"] = "sansArea",
            ["marker"] = "entrysans"
          }
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 94,
          y = 370,
          width = 344,
          height = 150,
          rotation = 0,
          gid = 20,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 718,
          y = 388,
          width = 58,
          height = 166,
          rotation = 0,
          gid = 17,
          visible = true,
          properties = {}
        },
        {
          id = 17,
          name = "",
          type = "",
          shape = "rectangle",
          x = 654,
          y = 384,
          width = 52,
          height = 56,
          rotation = 0,
          gid = 19,
          visible = true,
          properties = {}
        }
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 4,
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
          id = 18,
          name = "spawn",
          type = "",
          shape = "point",
          x = 600,
          y = 440,
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
