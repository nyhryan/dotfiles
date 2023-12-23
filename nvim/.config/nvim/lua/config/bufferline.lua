require('bufferline').setup({
    options = {
        separator_style = 'slant',
        color_icons = true,
        get_element_icon = function(element)
            local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, {default = false})
            return icon, hl
        end,
        indicator = {
            style = 'underline'
       }
    }
})
