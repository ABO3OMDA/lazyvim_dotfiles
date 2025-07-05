return {
  -- Snippet engine
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local ls = require("luasnip")
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node

      -- NestJS snippets
      ls.add_snippets("typescript", {
        s("nest-controller", {
          t({ "import { Controller, Get } from '@nestjs/common';", "", "@Controller('" }),
          i(1, "name"),
          t({ "')", "export class " }),
          i(2, "Name"),
          t({ "Controller {", "  @Get()", "  findAll() {", "    return [];", "  }", "}", "" }),
        }),
        s("nest-service", {
          t({ "import { Injectable } from '@nestjs/common';", "", "@Injectable()", "export class " }),
          i(1, "Name"),
          t({ "Service {", "  ", "}", "" }),
        }),
        s("nest-module", {
          t({
            "import { Module } from '@nestjs/common';",
            "",
            "@Module({",
            "  imports: [],",
            "  controllers: [],",
            "  providers: [],",
            "})",
            "export class ",
          }),
          i(1, "Name"),
          t({ "Module {}", "" }),
        }),
      })
    end,
  },
}
