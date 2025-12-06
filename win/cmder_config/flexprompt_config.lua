-- This pattern is in case this script runs before flexprompt.lua is loaded,
-- for example if they're in different directories.
flexprompt = flexprompt or {}
flexprompt.settings = flexprompt.settings or {}

-- #35374B
-- #344955
-- #50727B
-- #78A083



-- #0A2647
-- #144272
-- #205295
-- #2C74B3


-- #





-- #371B58
-- #4C3575
-- #5B4B8A
-- #7858A6









-- #18230F
-- #27391C
-- #255F38
-- #1F7D53













-- #059212
-- #06D001
-- #9BEC00
-- #F3FF90





-- #5D8736
-- #809D3C
-- #A9C46C
-- #F4FFC3





-- 128 157 60
-- 93 135 54

-- 244 255 195
-- 169 196 108
-- 141 208 6

-- 141 208 6

-- 93 135 54
-- 5 146 18














-- -- -- Apply your settings here.
-- -- flexprompt.settings.style = "classic"
-- flexprompt.settings.heads = "pointed"
-- -- flexprompt.settings.lines = "two"

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- go to flexprompt_modules.lua file ...
-- (Ctrl + F) this to easily jump to each module 1 by 1: "MODULE:"
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

-- ############################################################
-- ############################################################
-- BELOW ARE EXAMPLES FOR SYNTAX ON HOW TO invoke OPTIONS/ADDITIONAL_ARGS for EACH MODULE ...
-- flexprompt.settings.left_prompt = "{battery:onlyicon}{user:type=computer}{cwd:color=magenta:type=folder}{git:nountracked:staged=blue}"
-- flexprompt.settings.right_prompt = "{exit:always}{duration:format=colons:tenths}{time:format=%a %h %e %R}"
-- ############################################################
-- ############################################################












-- ############################################################
-- THIS IS THE STANDARD 'best' SO FAR:
-- flexprompt.settings.left_prompt = "{user:type=computer}{break}{cwd}{break}{git}"
-- flexprompt.settings.left_prompt = "{user:type=computer}{break:color=black}{cwd:type=full}{break}{git:showremote}"

-- ############################################################


-- LEGIT OPTIONS TO CONSIDER, for each 'module':
-- {admin:forcetext}    
-- {user:type=computer:color=green}
-- {cwd:color=white,alt_color_name:rootcolor=blue:type=full}    -- NOT SURE if this rootcolor can actually do anything in my context
-- {cwd:color=magenta,alt_color_name:rootcolor=blue:type=full}
-- {cwd:color=magenta:type=full}
-- {git} --DEFAULT one is fine alone tbh
-- {git:showremote:counts:color_options}
-- {git:showremote:counts:color_options:clean=red,black}  -- UNSURE ON SYNTAX HERE, but many more formats to check out 
-- {git:showremote:counts:clean=blue:dirty=magenta}
-- {break:color=red}


-- {admin:always:forcetext:text_options:icon_options:color_options}
-- {user:type=type_name:color=color_name,alt_color_name}


-- ############################################################
-- # NO-DIVIDERS (aka trying to mirroor p10k look)
-- MY CUSTOM PROMPT WITHOUT 'divider' / 'breaks' (so similar to powerlevel10k)
-- ############################################################
-- flexprompt.settings.left_prompt = "{admin}{cwd}{git}"

-- ############################################################
-- # WITH-DIVIDERS (aka trying to mirroor p10k look)
-- MY CUSTOM PROMPT WITHOUT 'divider' / 'breaks' (so similar to powerlevel10k)
-- ############################################################

flexprompt = flexprompt or {}
flexprompt.settings = flexprompt.settings or {}


-- Apply your settings here.
-- flexprompt.settings.style = "classic"
-- flexprompt.settings.heads = "pointed"
-- flexprompt.settings.lines = "two"
-- flexprompt.settings.left_frame = 


-- flexprompt.settings.frame_color =
-- {
--         "darkwhite",
--         "darkwhite",
--         "darkwhite",
--         "darkwhite"
-- }
    
    -- flexprompt.settings.frame_color =
    -- {
        --     "38;5;242",     -- frame color (gray 44%)
        --     "38;5;238",     -- background color (gray 28%)
        --     "38;5;246",     -- text color (gray 60%)
        --     "38;5;234",     -- separator color (gray 12%)
        -- }


flexprompt.settings.charset = "unicode"
flexprompt.settings.connection = "disconnected"
flexprompt.settings.flow = "fluent"
flexprompt.settings.style = "rainbow" --classic, rainbow, lean (lean, bubbles)-- the 'blurred' for the 'head' option looks WAY DIFF than you'd think, actually good/cool
flexprompt.settings.heads = "pointed" -- (pointed, round or blurred are best) flat, pointed, slant, backslant, round, blurred
flexprompt.settings.tails = "flat" -- (blurred or flat are best) flat, pointed, slant, backslant, round, blurred

flexprompt.settings.separator = "pointed" -- if CLASSIC, then none, vertical, pointed, slant, backslant, round, dot, updiagonal, downdiagonal, downdiagonal2, uparrow, downarrow
-- if RAINBOW, then flat, pointed, slant, backslant, round, blurred

flexprompt.settings.left_frame = "none"
-- flexprompt.settings.left_prompt = "{cwd}{battery:breakright}{histlabel}{cwd}{git}{exit}{duration}{time:dim:format=}"
flexprompt.settings.lines = "two"
-- flexprompt.settings.right_frame = "two"
-- flexprompt.settings.separators = "vertical"
-- flexprompt.settings.separator = { "»", "«" }
flexprompt.settings.spacing = "normal"
flexprompt.settings.symbols =
{
    prompt = "❯",
    angle       = { ">" }, -- unicode="❯" looks very good in some fonts, and is missing in some fonts.
    dollar      = { "$" },
    percent     = { "%" },
}

-- MISC SETTINGS...
flexprompt.settings.powerline_font = true
flexprompt.settings.use_icons = true

-- -- -- Nerd Fonts version:  (e.g. NF version 3.0.0 and higher rearranged the icons)
-- -- flexprompt.settings.nerdfonts_version = 3
-- -- Nerd Fonts width:  (set to 1 to indicate font has mono width icons, or 2 to indicate double-width icons)
-- flexprompt.settings.nerdfonts_width = 2
-- flexprompt.settings.fade_sep = true


-- flexprompt.settings.symbol.charging = "++"
-- flexprompt.settings.no_graphics = true



    -- angle       = { ">" }, -- unicode="❯" looks very good in some fonts, and is missing in some fonts.
    -- dollar      = { "$" },
    -- percent     = { "%" },

-- unicode="❯" looks very good in some fonts, and is missing in some fonts.
-- ############################################################
-- THIS IS THE STANDARD 'best' SO FAR:
-- flexprompt.settings.left_prompt = "{user:type=computer}{break}{cwd}{break}{git}"
-- ############################################################
-- flexprompt.settings.left_prompt = "{admin}{user:type=computer}{break}{cwd}{break}{git}"
-- flexprompt.settings.left_prompt = "{admin}{break}{cwd:color=magenta:type=folder}{break}{git}"
-- flexprompt.settings.left_prompt = "{admin:forcetext}{break}{user:type=computer:color=green}{break}{cwd:color=black,alt_color_name:rootcolor=blue}{break}{git:showremote:counts:color_options}"
-- flexprompt.settings.left_prompt = "{admin:forcetext}{break}{user:type=computer:color=green}{break}{cwd:color=magenta,alt_color_name:rootcolor=blue}{break}{git:showremote:counts:color_options:clean=red,black}"
-- flexprompt.settings.left_prompt = "{user:type=computer:color=green}{break}{cwd:color=magenta:type=full}{break}{git:showremote}{break}{vpn}{break}"
-- flexprompt.settings.left_prompt = "{user:type=computer:color=green}{break}{vpn}{break}"
-- flexprompt.settings.left_prompt = "{user:type=computer:color=green}{break:color=black}{cwd:type=full}{break}{git:showremote}"
-- flexprompt.settings.left_prompt = "{user:type=computer}{break:color=black}{cwd:type=full}{break}{git:showremote}"
-- flexprompt.settings.left_prompt = "{admin:forcetext}{break:color=black}{user:type=computer}{break:color=black}{cwd:type=full}{break}{git:showremote}"

flexprompt.settings.left_prompt = "{admin}{break:color=black}{user:type=computer}{break:color=black}{cwd:type=full}{break}{git:showremote}"
-- flexprompt.settings.left_prompt = "{admin}{break:color=black}{cwd:type=full}{break}{git:showremote}"
-- flexprompt.settings.left_prompt = "{user:type=computer}{break}{cwd}{break}{git}"
-- flexprompt.settings.left_prompt = "{user:type=computer}{break}{cwd:type=full}{break}{git}"



-- TRYING OUT HTE COLOR SYNTAX DIFF FORMATS ...
-- flexprompt.settings.left_prompt = "{user:type=computer}{break}{cwd:color=blue:alt_color_name=red:type=full}{break}{git:showremote}"
-- flexprompt.settings.left_prompt = "{user:type=computer}{break}{cwd:alt_color_name=red:type=full}{break}{git:showremote}"
-- flexprompt.settings.left_prompt = "{user:type=computer}{break}{cwd:color=blue,red:type=full}{break}{git:showremote}"
-- flexprompt.settings.left_prompt = "{user:type=computer}{break}{cwd:color=blue,alt_color_name=red:type=full}{break}{git:showremote}"

-- {cwd:color=blue:alt_color_name:red:type=full}
-- {cwd:alt_color_name=red:type=full}
-- {cwd:color=blue,red:type=full}
-- {cwd:color=blue,alt_color_name=red:type=full}











































































--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- go to flexprompt_modules.lua file ...
-- (Ctrl + F) this to easily jump to each module 1 by 1: "MODULE:"
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------



-- THESE ARE ALL THE MODULES OF flexprompt THAT COULD BE WORTH TRYING/aDDING
-- {admin}
-- {user:type=computer} OR {user}
-- {cwd}
-- {git}
-- {break}
-- ===== misc below ====
-- {env}
-- {scm}
-- {svn}
-- {vpn}
-- {keymap}



--------------------------------------------------------------------------------
-- ADMIN MODULE:  {admin:always:forcetext:text_options:icon_options:color_options}
--  - 'always' shows the module even when not running as an Administrator.
--  - 'forcetext' shows text even if an icon is shown.
--  - 'admintext=abc' sets admin mode text to 'abc' ('admintext=' for none).
--  - 'normaltext=xyz' sets normal mode text to 'xyz' ('normaltext=' for none).
--  - 'adminicon=X' sets the admin mode icon to 'X'.
--  - 'normalicon=Y' sets the normal mode icon to 'Y'.
--  - color_options override status colors as follows:
--      - normal=color_name,alt_color_name      When not running as an Administrator.
--      - admin=color_name,alt_color_name       When running as an Administrator.
--
-- By default, it uses just an icon if icons are enabled and the font supports
-- powerline characters.
--
-- NOTES:
--  - The ADMIN module requires at least Clink v1.4.17 or higher.
--  - The admintext and normaltext options currently don't support text that
--    contains a colon character ':'.


--------------------------------------------------------------------------------
-- USER MODULE:  {user:type=type_name:color=color_name,alt_color_name}
--  - type_name is any of 'computer', 'user', or 'both' (the default).
--  - color_name is a name like "green", or an sgr code like "38;5;60".
--  - alt_color_name is optional; it is the text color in rainbow style.

-- {cwd:color=blue,alt_color_name:red:
--------------------------------------------------------------------------------
-- CWD MODULE:  {cwd:color=color_name,alt_color_name:rootcolor=rootcolor_name:type=type_name:shorten}
--  - color_name is a name like "green", or an sgr code like "38;5;60".
--  - alt_color_name is optional; it is the text color in rainbow style.
--  - rootcolor_name overrides the repo parent color when using "rootsmart".
--  - type_name is the format to use:
--      - "full" is the full path.
--      - "folder" is just the folder name.
--      - "smart" is the git repo\subdir, or the full path.
--      - "rootsmart" is the full path, with parent of git repo not colored.
--
-- The 'shorten' option can abbreviate parent directories to the shortest string
-- that uniquely identifies the directory.  The first and last directories in
-- the string are never abbreviated, and git repo or workspace directories are
-- never abbreviated.  Abbreviation occurs when the cwd string is longer than 80
-- columns (2 line style) or longer than half the terminal width (1 line style),
-- or when the terminal width is not wide enough for the left and right prompts
-- to fit on a single line.
-- The 'shorten' option may optionally be followed by "=rootsmart" to abbreviate
-- only the repo's parent directories when in a git repo (otherwise abbreviate
-- all the parent directories), or by "=32" or other number to only use
-- abbreviation when the path is longer than the specified number of columns.
--
-- The default type is "rootsmart" if not specified.

-- Returns the folder name of the specified directory.
--  - For c:\foo\bar it yields bar
--  - For c:\ it yields c:\
--  - For \\server\share\subdir it yields subdir
--  - For \\server\share it yields \\server\share









--------------------------------------------------------------------------------
-- GIT MODULE:  {git:nostaged:noaheadbehind:counts:color_options}
--  - 'nountracked' omits untracked files.
--  - 'nostaged' omits the staged details.
--  - 'noaheadbehind' omits the ahead/behind details.
--  - 'showremote' shows the branch and its remote.
--  - 'submodules' includes status for submodules.
--  - 'counts' shows the count of added/modified/etc files.
--  - color_options override status colors as follows:
--      - clean=color_name,alt_color_name           When status is clean.
--      - conflict=color_name,alt_color_name        When a conflict exists.
--      - dirty=color_name,alt_color_name           When status is dirty.
--      - remote=color_name,alt_color_name          For ahead/behind details.
--      - staged=color_name,alt_color_name          For staged details.
--      - unknown=color_name,alt_color_name         When status is unknown.
--      - unpublished=color_name,alt_color_name     When status is clean but branch is not published.



--------------------------------------------------------------------------------
-- KEYMAP MODULE:  {keymap:color=color_name,alt_color_name}
--  - color_name is a name like "green", or an sgr code like "38;5;60".
--  - alt_color_name is optional; it is the text color in rainbow style.
--
-- The default keymap names are:
--  - emacs mode is "" (don't show the module).
--  - vi command mode is "vi-CMD".
--  - vi insert mode is "vi-ins".
--
-- You can override the keymap names by setting the following variables in your
-- flexprompt_config.lua file:
--  - flexprompt.settings.emacs_keymap = "emacs"
--  - flexprompt.settings.vicmd_keymap = "vi-command"
--  - flexprompt.settings.viins_keymap = "vi-insert"
--
-- Requires Clink v1.2.50 or higher.




























































--------------------------------------------------------------------------------
-- SCM MODULE:  {scm:nostaged:noaheadbehind:counts:color_options}
--  - 'noaheadbehind' omits the ahead/behind details.
--  - 'noconflict' omits conflict info.
--  - 'nostaged' omits the staged details.
--  - 'nosubmodules' omits status for submodules.
--  - 'nountracked' omits untracked files.
--  - 'showremote' shows the branch and its remote.
--  - 'counts' shows the count of added/modified/etc files.
--  - color_options override status colors as follows:
--      - clean=color_name,alt_color_name           When status is clean.
--      - conflict=color_name,alt_color_name        When a conflict exists.
--      - dirty=color_name,alt_color_name           When status is dirty.
--      - remote=color_name,alt_color_name          For ahead/behind details.
--      - staged=color_name,alt_color_name          For staged details.
--      - unknown=color_name,alt_color_name         When status is unknown.
--      - unpublished=color_name,alt_color_name     When status is clean but branch is not published.

-- TODO: some way to postprocess the branch name string.


--------------------------------------------------------------------------------
-- SVN MODULE:  {svn:color_options}
--  - color_options override status colors as follows:
--      - clean=color_name,alt_color_name       When status is clean.
--      - dirty=color_name,alt_color_name       When status is dirty (modified files).
--      - unknown=color_name,alt_color_name     When status is unknown.







--------------------------------------------------------------------------------
-- VPN MODULE:  {color=color_name,alt_color_name}
--  - color_name is a name like "green", or an sgr code like "38;5;60".
--  - alt_color_name is optional; it is the text color in rainbow style.








--------------------------------------------------------------------------------
-- BREAK MODULE:  {break:color=color_name}
--  - color_name is a name like "green", or an sgr code like "38;5;60".
--
-- Inserts a break between segments.  If there is no visible segment to the left
-- or right of the break, then the break is discarded.
