return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 25,
  height = 22,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 10,
  nextobjectid = 142,
  properties = {
    ["border"] = "green_sloppy",
    ["music"] = "tv_changingroom",
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
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 25,
      height = 22,
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
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 32, 29, 11, 11, 11, 11, 11, 11, 11, 11, 11, 29, 30, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 36, 30, 11, 11, 11, 11, 11, 11, 11, 11, 11, 34, 34, 11, 11, 11, 11, 11, 11,
        11, 11, 18, 2, 11, 11, 35, 33, 11, 11, 11, 11, 11, 11, 11, 11, 11, 33, 35, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11
      }
    },
    {
      type = "objectgroup",
      draworder = "topdown",
      id = 7,
      name = "objects_bg",
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
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 25,
      height = 22,
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
        0, 0, 0, 0, 0, 0, 39, 37, 9, 13, 38, 38, 9, 13, 38, 38, 38, 39, 37, 0, 0, 0, 0, 0, 0,
        9, 38, 2147483657, 38, 2147483661, 39, 0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 24, 37, 38, 38, 38, 38, 38,
        23, 2147483667, 2147483650, 2, 3, 2147483670, 0, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 0, 0, 22, 23, 23, 23, 23, 23,
        3221225490, 3221225475, 3, 18, 23, 2147483670, 0, 0, 35, 35, 35, 35, 35, 35, 35, 35, 35, 0, 0, 22, 23, 23, 23, 23, 23,
        27, 27, 27, 27, 27, 2147483674, 10, 17, 6, 6, 17, 6, 6, 6, 6, 1073741841, 6, 17, 6, 26, 27, 27, 27, 27, 27,
        6, 6, 6, 2147483665, 6, 6, 6, 6, 17, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 2147483665, 6, 6,
        6, 2147483665, 6, 2147483658, 6, 6, 6, 2147483665, 6, 6, 6, 6, 3221225489, 6, 6, 6, 6, 6, 2147483665, 6, 6, 6, 6, 6, 6,
        0, 0, 0, 0, 0, 0, 2147483660, 6, 6, 6, 6, 6, 6, 14, 6, 3221225489, 6, 6, 12, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1073741841, 6, 6, 14, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 38, 38, 38, 38, 38, 2147483661, 39, 6, 1073741841, 6, 1073741841, 6, 13, 13, 13, 13, 9, 13, 13, 13, 0, 0,
        0, 0, 0, 22, 23, 23, 20, 19, 2147483667, 2147483670, 10, 6, 6, 6, 1073741841, 22, 20, 23, 23, 20, 19, 20, 20, 0, 0,
        0, 0, 0, 22, 23, 23, 23, 23, 23, 24, 6, 6, 6, 6, 6, 22, 23, 23, 23, 23, 23, 23, 23, 0, 0,
        0, 0, 0, 26, 27, 27, 27, 27, 27, 28, 1073741841, 6, 3221225489, 6, 6, 26, 27, 27, 27, 27, 27, 27, 27, 0, 0,
        0, 0, 0, 6, 17, 6, 6, 6, 6, 6, 6, 6, 6, 1073741841, 6, 6, 6, 6, 6, 6, 17, 6, 6, 0, 0,
        0, 0, 0, 10, 6, 6, 6, 14, 6, 14, 6, 6, 6, 6, 6, 6, 6, 17, 6, 6, 6, 6, 6, 0, 0,
        0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 14, 1073741841, 6, 17, 6, 6, 6, 1073741841, 15, 6, 6, 0, 0,
        0, 0, 0, 1073741841, 14, 6, 15, 6, 6, 6, 6, 6, 6, 6, 1073741841, 6, 6, 6, 6, 15, 6, 6, 6, 0, 0,
        0, 0, 0, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1073741841, 1073741841, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0,
        0, 0, 0, 1073741841, 6, 6, 6, 14, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 0, 0,
        0, 0, 0, 2684354572, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 12, 0, 0,
        0, 0, 0, 0, 2684354572, 6, 6, 14, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 14, 6, 6, 12, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 25,
      height = 22,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 1073741828, 1073741825, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 3221225475, 2147483650, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          id = 111,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 280,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 112,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 320,
          width = 160,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 113,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 320,
          width = 160,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 114,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 280,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 115,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 360,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 116,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 360,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 117,
          name = "",
          type = "",
          shape = "rectangle",
          x = 640,
          y = 480,
          width = 280,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 118,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 480,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 119,
          name = "",
          type = "",
          shape = "rectangle",
          x = 80,
          y = 520,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 120,
          name = "",
          type = "",
          shape = "rectangle",
          x = 120,
          y = 840,
          width = 280,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 121,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 840,
          width = 320,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 122,
          name = "",
          type = "",
          shape = "rectangle",
          x = 920,
          y = 520,
          width = 40,
          height = 320,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 123,
          name = "",
          type = "",
          shape = "polygon",
          x = 120,
          y = 760,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 80, y = 80 },
            { x = 0, y = 80 }
          },
          properties = {}
        },
        {
          id = 124,
          name = "",
          type = "",
          shape = "polygon",
          x = 920,
          y = 760,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -80, y = 80 },
            { x = 0, y = 80 }
          },
          properties = {}
        },
        {
          id = 125,
          name = "",
          type = "",
          shape = "polygon",
          x = 760,
          y = 280,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -40, y = 40 },
            { x = 0, y = 40 }
          },
          properties = {}
        },
        {
          id = 126,
          name = "",
          type = "",
          shape = "polygon",
          x = 280,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = -40, y = -40 },
            { x = -40, y = 0 }
          },
          properties = {}
        },
        {
          id = 127,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 160,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 128,
          name = "",
          type = "",
          shape = "rectangle",
          x = 240,
          y = 120,
          width = 520,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 129,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 160,
          width = 240,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 141,
          name = "",
          type = "",
          shape = "rectangle",
          x = 670,
          y = 520,
          width = 200,
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
          id = 107,
          name = "",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 170,
          width = 216,
          height = 148,
          rotation = 0,
          gid = 2147483704,
          visible = true,
          properties = {}
        },
        {
          id = 133,
          name = "",
          type = "",
          shape = "rectangle",
          x = 660,
          y = 560,
          width = 216,
          height = 148,
          rotation = 0,
          gid = 2147483704,
          visible = true,
          properties = {}
        },
        {
          id = 109,
          name = "",
          type = "",
          shape = "rectangle",
          x = 10,
          y = 210,
          width = 216,
          height = 148,
          rotation = 0,
          gid = 2147483704,
          visible = true,
          properties = {}
        },
        {
          id = 135,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 1000,
          y = 200,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "down_hall",
            ["marker"] = "storageentry"
          }
        },
        {
          id = 137,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = -40,
          y = 200,
          width = 40,
          height = 80,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "storage-left",
            ["marker"] = "entry"
          }
        },
        {
          id = 138,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 400,
          y = 880,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "storage-down",
            ["marker"] = "entry"
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
          id = 130,
          name = "entry",
          type = "",
          shape = "point",
          x = 960,
          y = 250,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 131,
          name = "entry2",
          type = "",
          shape = "point",
          x = 40,
          y = 250,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 132,
          name = "entry3",
          type = "",
          shape = "point",
          x = 500,
          y = 840,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 139,
          name = "spawn",
          type = "",
          shape = "point",
          x = 500,
          y = 260,
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
