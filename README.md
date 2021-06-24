# The better way of running Minecraft Without XWayland

Because I **REALLY** had nothing better to do with my life.

## Why is this better than [Waynotgonnaland](https://github.com/Admicos/waynotgonnaland)

This doesn't require modding Minecraft, instead preferring to patch GLFW. You
had to patch GLFW anyway to fix a pretty important freezing issue, so why not
patch it for the other things too?

## Requirements

- A version of Minecraft >= 1.13

  - Older versions are not guaranteed to work. You can still try, though.

- The MultiMC Minecraft Launcher

  - Use it even if you don't plan to do this. It's great!
  - If you don't want to do that, throw this into your Java arguments, changing
    the file path as needed: `-Dorg.lwjgl.glfw.libname=/usr/lib/libglfw.so`

- An Arch-based system

  - Or the knowledge on how to patch packages in your distribution.
  - In which case you can skip step 2 of this guide, as it will not apply to you
    and you should know what to do with the `.patch` files in this repo already

## Side effects

- Forge will not work without another workaround
- The controls page (and anywhere a keyboard key is shown) is a bit wonky
- Not tested outside Sway. You mileage may vary on, say, GNOME.
  - I do not have any test environment but if you're confident a patch fixes any
    issues encountered I will most likely add it in.

## Step 1: Setting up MultiMC to use the system GLFW

Go to `Settings` > `Minecraft`, and enable `Use system installation of GLFW`.

If you have a Wayland-compatible version of GLFW installed (`wayland-glfw` on
Arch) you can try launching the game. It will most likely error out with
something about window focus not being supported. In that case, you are in the
right direction.

## Step 2: Installing tha patched GLFW library

If you're not under an Arch-based system, you're mostly on your own here. You
can try waiting for someone else to write a guide I guess.

`git clone` this repository to somewhere, and run `makepkg -si` inside. It will
ask you to replace your existing GLFW package if already installed.

## Step 3: There is no step 3

This should be it. Try launching Minecraft now and see if it works.

## Bonus: XWayland per instance

If some version of Minecraft doesn't work with the patch enabled, you can
disable it through MultiMC just for that version by

- Right clicking on your instance
- Clicking `Edit instance`
- Going to `Settings` > `Workarounds`
- Enabling `Native Libraries` override switch
- Disabling the GLFW option

You can also disable the global switch and enable the patch per instance if
that's how you want to roll.

## Bonus: Making Forge work

Due to "Forge being Forge", you will need to add
`-Dfml.earlyprogresswindow=false` to your Java arguments to make Forge instances
start up properly. See [issue #1](https://github.com/Admicos/minecraft-wayland/issues/1)
for more information.

## Thanks To

I really didn't do much on this other than "re-discovering" these things which
aren't even that old. Here are the proper credits:

- `ninja-` on GitHub

  - For https://github.com/glfw/glfw/pull/1725

- `annacrombie` on GitHub

  - For https://github.com/glfw/glfw/pull/1711
