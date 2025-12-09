return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 16,
  height = 17,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 14,
  nextobjectid = 194,
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
      imageheight = 320,
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
      tilecount = 56,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 17,
      id = 12,
      name = "tv_back",
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 106, 106, 106, 106, 92, 92, 92, 99, 85, 92, 0, 0, 0,
        0, 0, 0, 106, 99, 85, 92, 99, 106, 85, 85, 99, 92, 0, 0, 0,
        0, 0, 0, 85, 85, 106, 92, 99, 92, 99, 85, 92, 92, 0, 0, 0,
        0, 0, 0, 106, 99, 106, 85, 99, 99, 92, 92, 92, 92, 0, 0, 0,
        0, 0, 0, 99, 106, 106, 85, 92, 92, 92, 92, 92, 85, 0, 0, 0,
        0, 0, 0, 85, 106, 85, 92, 106, 99, 99, 85, 99, 99, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 78, 0, 0, 0, 0,
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
      height = 17,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
      height = 17,
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
        0, 0, 0, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 0, 0, 0,
        0, 0, 0, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 0, 0, 0,
        0, 0, 0, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 0, 0, 0,
        0, 0, 0, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 0, 0, 0,
        0, 0, 0, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 0, 0, 0,
        0, 0, 0, 66, 66, 66, 66, 66, 66, 66, 66, 66, 66, 0, 0, 0,
        0, 0, 0, 80, 80, 80, 80, 80, 80, 80, 80, 80, 80, 0, 0, 0,
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
      height = 17,
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
        72, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 72, 74,
        72, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 72, 73,
        72, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 72, 74,
        72, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 72, 73,
        72, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 72, 74,
        72, 73, 73, 73, 73, 73, 73, 5, 73, 73, 73, 73, 73, 73, 72, 73,
        72, 74, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 72, 74,
        72, 74, 71, 78, 71, 78, 71, 78, 71, 78, 71, 71, 71, 78, 72, 73,
        72, 74, 71, 78, 78, 78, 78, 78, 71, 71, 71, 71, 78, 71, 72, 74,
        72, 74, 78, 71, 78, 71, 71, 71, 78, 78, 78, 78, 71, 78, 79, 81,
        72, 73, 78, 71, 78, 71, 71, 71, 71, 71, 71, 78, 71, 71, 78, 71,
        72, 73, 71, 78, 78, 78, 71, 78, 78, 71, 71, 71, 78, 78, 78, 78,
        72, 73, 71, 78, 71, 78, 78, 78, 78, 71, 71, 71, 78, 78, 71, 72,
        72, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
        72, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
        72, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73,
        72, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73, 73
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 16,
      height = 17,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
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
          id = 173,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 520,
          width = 560,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 174,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 240,
          width = 480,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 187,
          name = "",
          type = "",
          shape = "rectangle",
          x = 40,
          y = 280,
          width = 40,
          height = 240,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 191,
          name = "",
          type = "",
          shape = "rectangle",
          x = 560,
          y = 280,
          width = 80,
          height = 120,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 193,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 480,
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
      id = 13,
      name = "objects_back",
      class = "",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      parallaxx = 1,
      parallaxy = 1,
      properties = {},
      objects = {}
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
          y = 400,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "storage-bigdoor",
            ["marker"] = "entry2"
          }
        },
        {
          id = 190,
          name = "interactable",
          type = "",
          shape = "rectangle",
          x = 280,
          y = 240,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["text"] = "\"4223\""
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
          y = 460,
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
          x = 520,
          y = 460,
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
