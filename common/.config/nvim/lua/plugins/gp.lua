return{{ "robitx/gp.nvim", config = function()
  local config = {
    -- default_command_agent = "gpt4o-php",
    -- default_chat_agent = "ChatGPT4o",
    default_command_agent = "claude-sonnet-4",
    default_chat_agent = "claude-sonnet-4",
    providers = {
      openai = { 
        disabled = false,
        secret = { "cat", "/Users/kvl/.openai-gp-apikey" },
      },
      anthropic = {
        disabled = false,
        secret = { "cat", "/Users/kvl/.anthropic-gp-apikey" },
      }
    },
    agents = {
      {
        provider = "openai",
        name = "gpt4o-php",
        chat = false,
        command = true,
        model = { model = "gpt-4o", temperature = 1.1, top_p = 1 },
        system_prompt = "you are an expert software developer well versed in PHP and codeigniter 3. you never comment your code. answers should be in syntactically correct, functional code. when fixing sql queries in php use query builder. code should be self-documenting. check you work."
      },
      {
        provider = "anthropic",
        name = "claude-sonnet-php",
        chat = false,
        command = true,
        model = { model = "claude-3-5-sonnet-20241022", temperature = 0.8, top_p = 1 },
        system_prompt = "you are an expert software developer well versed in PHP and codeigniter 3. you never comment your code. answers should be in syntactically correct, functional code. when fixing sql queries in php use query builder. code should be self-documenting. check you work."
      },
      {
        provider = "anthropic",
        name = "ChatClaude-3-7-Sonnet",
        chat = true,
        command = true,
        model = { model = "claude-3-7-sonnet-20250219", temperature = 0.8, top_p = 1 },
        system_prompt = "you are an expert software engineer. you have a firm grasp on all software languages, design patterns, and cloud providers, you prefer compact readable code with no inline comments" 
      },
      {
        provider = "anthropic",
        name = "claude-sonnet-4",
        chat = true,
        command = true,
        model = { model = "claude-sonnet-4-20250514", temperature = 0.8, top_p = 1 },
        system_prompt = "you are an expert software engineer. you have a firm grasp on all software languages, design patterns, and cloud providers, you prefer compact readable code with no inline comments" 
      },
    },
    hooks = {
      Explain = function(gp, params)
        local template = "I have the following code from {{filename}}:\n\n"
        .. "```{{filetype}}\n{{selection}}\n```\n\n"
        .. "Please respond by explaining the code above."
        local agent = gp.get_chat_agent()
        gp.Prompt(params, gp.Target.popup, agent, template)
      end,
      BufferChatNew = function(gp, _)
        vim.api.nvim_command("%" .. gp.config.cmd_prefix .. "ChatNew")
      end,
    }
  }
  require("gp").setup(config)
end,
}}
