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
  nextlayerid = 12,
  nextobjectid = 173,
  properties = {
    ["border"] = "green_sloppy",
    ["name"] = "Play Room - Ramb"
  },
  tilesets = {
    {
      name = "castle",
      firstgid = 1,
      class = "",
      tilewidth = 40,
      tileheight = 40,
      spacing = 0,
      margin = 0,
      columns = 4,
      image = "../../../assets/sprites/tilesets/castle.png",
      imagewidth = 160,
      imageheight = 400,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 40,
        height = 40
      },
      properties = {},
      wangsets = {},
      tilecount = 40,
      tiles = {
        {
          id = 24,
          animation = {
            {
              tileid = 24,
              duration = 500
            },
            {
              tileid = 39,
              duration = 500
            }
          }
        }
      }
    },
    {
      name = "board",
      firstgid = 41,
      class = "",
      tilewidth = 320,
      tileheight = 240,
      spacing = 0,
      margin = 0,
      columns = 0,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 1,
        height = 1
      },
      properties = {},
      wangsets = {},
      tilecount = 9,
      tiles = {
        {
          id = 7,
          image = "../../../assets/sprites/world/maps/tvland/board/gameshow_console.png",
          width = 50,
          height = 17
        },
        {
          id = 8,
          image = "../../../assets/sprites/world/maps/tvland/board/gameshow_couch.png",
          width = 319,
          height = 50
        },
        {
          id = 9,
          image = "../../../assets/sprites/world/maps/tvland/board/gameshow_floor.png",
          width = 320,
          height = 81
        },
        {
          id = 10,
          image = "../../../assets/sprites/world/maps/tvland/board/gameshow_playerpodiums.png",
          width = 135,
          height = 18
        },
        {
          id = 11,
          image = "../../../assets/sprites/world/maps/tvland/board/gameshow_tvframe.png",
          width = 218,
          height = 162
        },
        {
          id = 12,
          image = "../../../assets/sprites/world/maps/tvland/board/gameshow_wall.png",
          width = 320,
          height = 240
        },
        {
          id = 13,
          image = "../../../assets/sprites/world/maps/tvland/board/back.png",
          width = 195,
          height = 60
        },
        {
          id = 14,
          image = "../../../assets/sprites/world/maps/tvland/board/front.png",
          width = 191,
          height = 53
        },
        {
          id = 15,
          image = "../../../assets/sprites/world/maps/tvland/board/put_lemons_in_your_eyes.png",
          width = 108,
          height = 74
        }
      }
    },
    {
      name = "arcade-storage",
      firstgid = 57,
      class = "",
      tilewidth = 40,
      tileheight = 40,
      spacing = 0,
      margin = 0,
      columns = 7,
      image = "../../../assets/sprites/tilesets/arcade_storage.png",
      imagewidth = 280,
      imageheight = 160,
      objectalignment = "unspecified",
      tilerendersize = "tile",
      fillmode = "stretch",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 40,
        height = 40
      },
      properties = {},
      wangsets = {},
      tilecount = 28,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 10,
      name = "tv",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 61, 62, 62, 62, 62, 62, 62, 62, 62, 63, 0, 0, 0,
        0, 0, 0, 68, 0, 0, 0, 0, 0, 0, 0, 0, 70, 0, 0, 0,
        0, 0, 0, 68, 0, 0, 0, 0, 0, 0, 0, 0, 70, 0, 0, 0,
        0, 0, 0, 68, 0, 0, 0, 0, 0, 0, 0, 0, 70, 0, 0, 0,
        0, 0, 0, 68, 0, 0, 0, 0, 0, 0, 0, 0, 70, 0, 0, 0,
        0, 0, 0, 68, 0, 0, 0, 0, 0, 0, 0, 0, 70, 0, 0, 0,
        0, 0, 0, 75, 76, 76, 76, 76, 76, 76, 76, 76, 77, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 8,
      name = "back",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66,
        66, 66, 66, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 66, 66, 66,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 1,
      name = "tiles",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        72, 73, 74, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 72, 73, 74,
        72, 73, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 73, 74,
        72, 73, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 73, 74,
        72, 73, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 73, 74,
        72, 73, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 73, 74,
        72, 73, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 73, 74,
        72, 73, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 73, 74,
        72, 73, 74, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 72, 73, 74,
        79, 80, 81, 57, 57, 71, 71, 71, 57, 71, 64, 57, 71, 79, 80, 81,
        78, 78, 78, 71, 78, 71, 71, 71, 78, 78, 78, 78, 71, 78, 78, 71,
        78, 71, 78, 71, 78, 71, 71, 71, 71, 71, 71, 78, 71, 71, 78, 71,
        71, 71, 71, 78, 78, 78, 71, 78, 78, 71, 71, 71, 78, 78, 78, 78
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 12,
      id = 2,
      name = "decal",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 38,
      offsety = 20,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      encoding = "lua",
      data = {
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 3,
      name = "collision",
      class = "",
      visible = true,
      opacity = 0.5,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {
        {
          id = 157,
          name = "",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 360,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 158,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 480,
          width = 640,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 159,
          name = "",
          type = "",
          shape = "rectangle",
          x = 520,
          y = 320,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 160,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 280,
          width = 400,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 161,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 320,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 167,
          name = "",
          type = "",
          shape = "rectangle",
          x = 290,
          y = 320,
          width = 80,
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
      id = 9,
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
          id = 163,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 360,
          width = 40,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "storage-down",
            ["marker"] = "entry3"
          }
        },
        {
          id = 165,
          name = "",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 356,
          width = 100,
          height = 34,
          rotation = 0,
          gid = 48,
          visible = true,
          properties = {}
        },
        {
          id = 166,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 290,
          y = 320,
          width = 80,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["cutscene"] = "sword.play",
            ["map"] = "world_abandoned_storage",
            ["once"] = false,
            ["x"] = 3,
            ["y"] = 3
          }
        },
        {
          id = 168,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 200,
          y = 280,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "* (The sign is too high up to read it)"
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
          id = 162,
          name = "entry",
          type = "",
          shape = "point",
          x = 600,
          y = 420,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 172,
          name = "spawn",
          type = "",
          shape = "point",
          x = 330,
          y = 430,
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
