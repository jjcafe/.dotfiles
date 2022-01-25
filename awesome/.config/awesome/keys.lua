local gears = require("gears")
local awful = require("awful")

local M = {}

-- Default modkey.
modkey = "Mod4"
altkey = "Mod1"

-- {{{ Key bindings
M.globalkeys = gears.table.join(
--	awful.key({ modkey, "Shift"   }, "q", awesome.quit,
--             {description = "quit awesome", group = "awesome"}),
	awful.key({ modkey }, "r",
		function ()
			local c = awful.client.restore()
			-- Focus restored client
			if c then
				c:emit_signal(
					"request::activate", "key.unminimize", {raise = true}
				)
			end
		end,
	{ description = "restore minimized", group = "client" }),
   -- =========================================
   -- NUMBER OF MASTER / COLUMN CLIENTS
   -- =========================================
   -- Number of columns
   awful.key({modkey, altkey}, "k",
      function()
         awful.tag.incncol(1, nil, true)
      end,
      {description = "increase the number of columns", group = "layout"}
   ),
   awful.key({modkey, altkey}, "j",
      function()
         awful.tag.incncol(-1, nil, true)
      end,
      {description = "decrease the number of columns", group = "layout"}
   ),
   awful.key({modkey, altkey}, "Up",
      function()
         awful.tag.incncol(1, nil, true)
      end,
      {description = "increase the number of columns", group = "layout"}
   ),
   awful.key({modkey, altkey}, "Down",
      function()
         awful.tag.incncol(-1, nil, true)
      end,
      {description = "decrease the number of columns", group = "layout"}
   ),
   -- =========================================
   -- GAP CONTROL
   -- =========================================
   awful.key({modkey}, "minus",
      function()
         awful.tag.incgap(2, nil)
      end,
      {description = "increment gaps size for the current tag", group = "gaps"}
   ),
   awful.key({modkey}, "equal",
      function()
         awful.tag.incgap(-2, nil)
      end,
      {description = "decrement gap size for the current tag", group = "gaps"}
   )
)

M.clientkeys = gears.table.join()

M.clientbuttons =
    gears.table.join(
    awful.button(
        {},
        1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end
    ),
    awful.button(
        {modkey},
        1,
        function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.move(c)
        end
    ),
    awful.button(
        {modkey},
        3,
        function(c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.resize(c)
        end
    )
)

return M
