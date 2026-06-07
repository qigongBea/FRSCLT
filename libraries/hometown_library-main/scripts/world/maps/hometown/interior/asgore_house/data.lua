return {
  version = "1.10",
  luaversion = "5.1",
  tiledversion = "1.10.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 12,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 6,
  nextobjectid = 39,
  properties = {
    ["border"] = "leaves",
    ["light"] = true,
    ["music"] = "hometown"
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
      image = "../../../../../../assets/sprites/world/maps/hometown/interior/asgore_house.png",
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
          x = 120,
          y = 440,
          width = 400,
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
          x = 600,
          y = 0,
          width = 40,
          height = 480,
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
          y = 0,
          width = 560,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 4,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 40,
          height = 480,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 5,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 40,
          width = 232,
          height = 124,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 6,
          name = "",
          type = "",
          shape = "rectangle",
          x = 356,
          y = 40,
          width = 244,
          height = 123,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 238,
          y = 242,
          width = 144,
          height = 46,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 8,
          name = "",
          type = "",
          shape = "rectangle",
          x = 382,
          y = 242,
          width = 50,
          height = 132,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 9,
          name = "",
          type = "",
          shape = "rectangle",
          x = 188,
          y = 242,
          width = 50,
          height = 132,
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
          id = 10,
          name = "",
          type = "",
          shape = "rectangle",
          x = 290,
          y = 270,
          width = 46,
          height = 62,
          rotation = 0,
          gid = 6,
          visible = true,
          properties = {}
        },
        {
          id = 11,
          name = "",
          type = "",
          shape = "rectangle",
          x = 230,
          y = 270,
          width = 46,
          height = 62,
          rotation = 0,
          gid = 5,
          visible = true,
          properties = {}
        },
        {
          id = 12,
          name = "",
          type = "",
          shape = "rectangle",
          x = 346,
          y = 270,
          width = 46,
          height = 62,
          rotation = 0,
          gid = 9,
          visible = true,
          properties = {}
        },
        {
          id = 13,
          name = "",
          type = "",
          shape = "rectangle",
          x = 190,
          y = 300,
          width = 46,
          height = 62,
          rotation = 0,
          gid = 4,
          visible = true,
          properties = {}
        },
        {
          id = 15,
          name = "",
          type = "",
          shape = "rectangle",
          x = 190,
          y = 350,
          width = 46,
          height = 62,
          rotation = 0,
          gid = 8,
          visible = true,
          properties = {}
        },
        {
          id = 16,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 302,
          width = 46,
          height = 62,
          rotation = 0,
          gid = 7,
          visible = true,
          properties = {}
        },
        {
          id = 18,
          name = "",
          type = "",
          shape = "rectangle",
          x = 384,
          y = 352,
          width = 46,
          height = 62,
          rotation = 0,
          gid = 10,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 380,
          y = 142,
          width = 60,
          height = 38,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 22,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 448,
          y = 142,
          width = 68,
          height = 38,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "hometown.asgorefridge",
            ["solid"] = true
          }
        },
        {
          id = 23,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 522,
          y = 136,
          width = 58,
          height = 44,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 24,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 164,
          width = 100,
          height = 68,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 25,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 272,
          y = 78,
          width = 84,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 26,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 386,
          y = 310,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 27,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 386,
          y = 260,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 28,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 348,
          y = 228,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 29,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 292,
          y = 228,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 30,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 232,
          y = 228,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 31,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 258,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 32,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 192,
          y = 308,
          width = 42,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 33,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 468,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_delay"] = 0.3,
            ["facing"] = "down",
            ["map"] = "hometown/interior/flower_shop",
            ["marker"] = "entrywest",
            ["sound"] = "escaped"
          }
        },
        {
          id = 35,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 468,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["exit_delay"] = 0.3,
            ["facing"] = "down",
            ["map"] = "hometown/interior/flower_shop",
            ["marker"] = "entryeast",
            ["sound"] = "escaped"
          }
        },
        {
          id = 36,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 140,
          y = 164,
          width = 60,
          height = 42,
          rotation = 0,
          visible = true,
          properties = {
            ["solid"] = true,
            ["text"] = Game:locRaw("asgore_house_interactable_1")
          }
        },
        {
          id = 37,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 58,
          y = 288,
          width = 68,
          height = 72,
          rotation = 0,
          visible = true,
          properties = {
            ["text1"] = Game:locRaw("asgore_house_interactable_1"),
            ["text2"] = Game:locRaw("asgore_house_interactable_2"),
            ["text3"] = Game:locRaw("asgore_house_interactable_3")
          }
        },
        {
          id = 38,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 492,
          y = 236,
          width = 108,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = Game:locRaw("asgore_house_interactable_1")
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
          x = 80,
          y = 440,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "entryeast",
          type = "",
          shape = "point",
          x = 560,
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
