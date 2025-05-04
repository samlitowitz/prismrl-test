# PrismRL Feedback

## Some background about my experience to contextualize my feedback

1. I have experience with Lua, primarily writing WoW addons and Jupiter Hell mods.
2. I consider myself at a beginner or maybe intermediate level of Lua developer (syntax, paradigms, ecosystem, etc.).
3. I have never worked with and was not aware of the LÖVE framework.

## What I did

1. Clone the [Prism Template](https://github.com/PrismRL/prism-template)
2. Read through [documentation](https://prismrl.github.io/prism/index.html) in order
3. After the [`Getting Started`](https://prismrl.github.io/prism/making-a-roguelike/part1.html) tutorial I did a small
   project to add mineable wall tiles.

## Prism Template Feedback: https://github.com/prismrl/prism-template

1. It was not clear to me from the README what `love` was, where I should get it, or how I should install it. I did
   later see this information in the `Getting started > Installation` section of the documentation.
2. It was not clear to me from the README how to run the project. I did not see this information in
   the `Getting started` section of the documentation either.
3. Cloning the PrismRL submodule failed for me initially because it's setup for SSH, `git@github.com:PrismRL/prism.git`,
   not HTTPS  `https://github.com/PrismRL/prism.git`.
4. I did not see a baseline `.gitignore` file included, I would find it helpful to have something at least excluding
   hidden files, i.e.

```text
.*

!.gitignore
```

## Documentation Feedback: https://prismrl.github.io/prism

1. I found the following example code from
   the [`Getting started > Creating an Enemey`](https://prismrl.github.io/prism/making-a-roguelike/part1.html#creating-an-enemy)
   section to be a bit confusing because it lacked context.

```lua
--- @class Kobold : Actor
local Kobold = prism.Actor:extend("Kobold")
Kobold.name = "Kobold"

function Kobold:initialize()
   return {
      --[!!!] How does this determine what is drawn and why are we adding 1 here?
      prism.components.Drawable(string.byte("k") + 1, prism.Color4.RED),
   }
end

return Kobold
```

## General Feedback
1. I love that the Prism template makes it easy to spin up a new project!
2. I found the architecture primer very helpful in understanding the nomenclature both in the documentation and in the code.
3. I love the idea of the `How-tos` section as a quick reference for commonly used "recipes"
4. I love the `Making a roguelike` section as a practical example walk through!
