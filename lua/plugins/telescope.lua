return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "MunifTanjim/nui.nvim" },
  },
  opts = {},
  config = function(_, opts)
    local Layout = require("nui.layout")
    local Popup = require("nui.popup")

    local telescope = require("telescope")
    local TSLayout = require("telescope.pickers.layout")

    local function make_popup(options)
      local popup = Popup(options)
      function popup.border:change_title(title)
        popup.border.set_text(popup.border, "top", title)
      end

      return TSLayout.Window(popup)
    end

    telescope.setup({
      defaults = {
        sorting_strategy = "ascending",
        prompt_prefix = " ",
        selection_caret = " ",
        layout_strategy = "flex",
        layout_config = {
          horizontal = {
            size = {
              width = "90%",
              height = "85%",
            },
          },
          vertical = {
            size = {
              width = "90%",
              height = "85%",
            },
          },
        },
        create_layout = function(picker)
          local border = {
            results = {
              bottom_left = "┌",
              bottom = "─",
              bottom_right = "┬",
              right = "│",
              top_right = "",
              top = "",
              top_left = "",
              left = "│",
            },
            results_patch = {
              minimal = {
                bottom_left = "└",
                bottom_right = "┘",
              },
              horizontal = {
                bottom_left = "└",
                bottom_right = "┴",
              },
              vertical = {
                bottom_left = "├",
                bottom_right = "┤",
              },
            },
            prompt = {
              bottom_left = "├",
              bottom = "─",
              bottom_right = "┤",
              right = "│",
              top_right = "┐",
              top = "─",
              top_left = "┌",
              left = "│",
            },
            prompt_patch = {
              minimal = {
                top_right = "┐",
              },
              horizontal = {
                top_right = "┬",
              },
              vertical = {
                top_right = "┐",
              },
            },
            preview = {
              bottom_left = "p",
              bottom = "─",
              bottom_right = "┘",
              right = "│",
              top_right = "┐",
              top = "─",
              top_left = "└",
              left = "│",
            },
            preview_patch = {
              minimal = {},
              horizontal = {
                top = "─",
                top_left = "",
                top_right = "┐",
                left = "",
                bottom_left = "",
              },
              vertical = {
                top = "",
                top_left = "",
                top_right = "",
                left = "│",
                bottom_left = "└",
              },
            },
          }

          local results = make_popup({
            focusable = false,
            border = {
              style = border.results,
              text = {
                top = picker.results_title,
                top_align = "center",
              },
            },
            win_options = {
              winhighlight = "Normal:Normal",
            },
          })

          local prompt = make_popup({
            enter = true,
            border = {
              style = border.prompt,
              text = {
                top = picker.prompt_title,
                top_align = "center",
              },
            },
            win_options = {
              winhighlight = "Normal:Normal",
            },
          })

          local preview = make_popup({
            focusable = false,
            border = {
              style = border.preview,
              text = {
                top = picker.preview_title,
                top_align = "center",
              },
            },
          })

          local box_by_kind = {
            vertical = Layout.Box({
              Layout.Box(prompt, { size = 3 }),
              Layout.Box(results, { grow = 1 }),
              Layout.Box(preview, { grow = 1 }),
            }, { dir = "col" }),
            horizontal = Layout.Box({
              Layout.Box({
                Layout.Box(prompt, { size = 3 }),
                Layout.Box(results, { grow = 1 }),
              }, { dir = "col", size = "50%" }),
              Layout.Box(preview, { size = "50%" }),
            }, { dir = "row" }),
            minimal = Layout.Box({
              Layout.Box(prompt, { size = 3 }),
              Layout.Box(results, { grow = 1 }),
            }, { dir = "col" }),
          }

          local function get_box()
            local strategy = picker.layout_strategy
            if strategy == "vertical" or strategy == "horizontal" then
              return box_by_kind[strategy], strategy
            end

            local height, width = vim.o.lines, vim.o.columns
            local box_kind = "horizontal"
            if width < 100 then
              box_kind = "vertical"
              if height < 35 then
                box_kind = "minimal"
              end
            end
            return box_by_kind[box_kind], box_kind
          end

          local function prepare_layout_parts(layout, box_type)
            layout.results = results
            results.border:set_style(border.results_patch[box_type])

            layout.prompt = prompt
            prompt.border:set_style(border.prompt_patch[box_type])

            if box_type == "minimal" then
              layout.preview = nil
            else
              layout.preview = preview
              preview.border:set_style(border.preview_patch[box_type])
            end
          end

          local function get_layout_size(box_kind)
            return picker.layout_config[box_kind == "minimal" and "vertical" or box_kind].size
          end

          local box, box_kind = get_box()
          local layout = Layout({
            relative = "editor",
            position = "50%",
            size = get_layout_size(box_kind),
          }, box)

          layout.picker = picker
          prepare_layout_parts(layout, box_kind)

          local layout_update = layout.update
          function layout:update()
            local box, box_kind = get_box()
            prepare_layout_parts(layout, box_kind)
            layout_update(self, { size = get_layout_size(box_kind) }, box)
          end

          return TSLayout(layout)
        end,
      },
    })
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
  end,
}
