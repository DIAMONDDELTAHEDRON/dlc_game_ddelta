return {
  version = "1.11",
  luaversion = "5.1",
  tiledversion = "1.11.2",
  class = "",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 50,
  height = 11,
  tilewidth = 40,
  tileheight = 40,
  nextlayerid = 11,
  nextobjectid = 172,
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
      width = 50,
      height = 11,
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
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11,
        11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11
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
      width = 50,
      height = 11,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 6, 10, 6, 6, 0, 0, 0, 0, 39, 37, 9, 13, 38, 38, 9, 13, 38, 38, 38, 39, 37, 0, 0, 0, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        9, 38, 9, 38, 38, 38, 9, 38, 38, 38, 6, 6, 6, 6, 6, 37, 38, 2147483661, 39, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 24, 37, 38, 39, 17, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        23, 23, 23, 2147483667, 23, 23, 23, 2147483667, 23, 2147483667, 2147483665, 6, 17, 6, 6, 22, 2, 3, 2147483670, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 34, 22, 23, 2147483670, 17, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        3221225475, 23, 23, 23, 3221225490, 3221225475, 23, 23, 3221225490, 3221225475, 6, 6, 6, 2147483665, 6, 22, 18, 23, 2147483670, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 35, 22, 23, 2147483670, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        27, 27, 27, 27, 27, 27, 27, 27, 27, 27, 6, 6, 6, 6, 6, 26, 27, 27, 2147483674, 10, 17, 6, 6, 17, 6, 6, 6, 6, 1073741841, 6, 17, 6, 26, 27, 2147483674, 6, 6, 6, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 3221225489, 3221225489, 6, 6, 6, 6, 6, 6, 2147483665, 6, 6, 6, 6, 17, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 2147483665, 6, 6, 3221225489, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 2684354572, 6, 6, 6, 6, 6, 2147483665, 6, 2147483658, 6, 6, 6, 2147483665, 6, 6, 6, 6, 3221225489, 6, 6, 6, 6, 6, 2147483665, 6, 6, 6, 6, 6, 6, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2147483660, 6, 6, 6, 6, 6, 6, 14, 6, 3221225489, 6, 6, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
      }
    },
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 50,
      height = 11,
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
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
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
          id = 138,
          name = "",
          type = "",
          shape = "rectangle",
          x = 800,
          y = 320,
          width = 440,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 139,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1280,
          y = 280,
          width = 280,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 140,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 280,
          width = 760,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 142,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1600,
          y = 200,
          width = 40,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 143,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1280,
          y = 160,
          width = 120,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 144,
          name = "",
          type = "",
          shape = "rectangle",
          x = 760,
          y = 120,
          width = 520,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 145,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 160,
          width = 160,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 146,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 160,
          width = 400,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 147,
          name = "",
          type = "",
          shape = "rectangle",
          x = 360,
          y = 0,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 148,
          name = "",
          type = "",
          shape = "rectangle",
          x = 600,
          y = 0,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 149,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1360,
          y = 0,
          width = 40,
          height = 160,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 150,
          name = "",
          type = "",
          shape = "rectangle",
          x = 1600,
          y = 0,
          width = 40,
          height = 200,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 152,
          name = "",
          type = "",
          shape = "polygon",
          x = 1600,
          y = 240,
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
          id = 157,
          name = "",
          type = "",
          shape = "polygon",
          x = 1240,
          y = 320,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          polygon = {
            { x = 0, y = 0 },
            { x = 40, y = -40 },
            { x = 40, y = 0 }
          },
          properties = {}
        },
        {
          id = 158,
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
            { x = 40, y = 40 },
            { x = 0, y = 40 }
          },
          properties = {}
        },
        {
          id = 162,
          name = "",
          type = "",
          shape = "rectangle",
          x = 930,
          y = 160,
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
      id = 10,
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
          id = 153,
          name = "",
          type = "",
          shape = "rectangle",
          x = 920,
          y = 200,
          width = 216,
          height = 148,
          rotation = 0,
          gid = 2147483704,
          visible = true,
          properties = {}
        },
        {
          id = 154,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 1400,
          y = -40,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "storage",
            ["marker"] = "entry3"
          }
        },
        {
          id = 155,
          name = "transition",
          type = "",
          shape = "rectangle",
          x = 400,
          y = -40,
          width = 200,
          height = 40,
          rotation = 0,
          visible = true,
          properties = {
            ["map"] = "storage-left",
            ["marker"] = "entry2"
          }
        },
        {
          id = 161,
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
            ["map"] = "storage-arcade",
            ["marker"] = "entry"
          }
        },
        {
          id = 169,
          name = "controllersbox",
          type = "",
          shape = "point",
          x = 840,
          y = 180,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["item"] = "apple_core",
            ["money"] = 250
          }
        },
        {
          id = 170,
          name = "controllersbox",
          type = "",
          shape = "point",
          x = 1200,
          y = 180,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {
            ["money"] = 250
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
          x = 1500,
          y = 40,
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
          x = 500,
          y = 40,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 159,
          name = "spawn",
          type = "",
          shape = "point",
          x = 1040,
          y = 260,
          width = 0,
          height = 0,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 160,
          name = "entry3",
          type = "",
          shape = "point",
          x = 60,
          y = 240,
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
