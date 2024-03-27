-- Core configuration
-- Rationale: The ~/.config/nvim itself is the configuration. So naming basic
-- configuration to "config" doesn't make much sense.
require("core.options")
require("core.keymaps")
require("core.lazy") -- Lazy, the great plugin manager
