# The better way of running Minecraft Without XWayland

Because I **REALLY** had nothing better to do with my life.

## Requirements

- A version of Minecraft >= 1.13

  - Older versions use a version of LWJGL that doesn't work with this patch

- MultiMC (or derivatives) (optional)

  - Other launchers (not the official one) might or might not have similar settings
  - If they don't, you can throw this into your Java arguments, changing the file
    path as needed depending on your distro:
    `-Dorg.lwjgl.glfw.libname=/usr/lib/libglfw.so`

- A distro with a patched GLFW package

  - This guide has steps for Arch, Fedora, Gentoo, and Guix
  - Or the knowledge on how to patch packages in your distribution.
    - In which case you can skip step 2 of this guide, as it will not apply to you
      and you should know what to do with the `.patch` files in this repo already

## Side effects

- Forge will not work without another workaround
- The controls page (and anywhere a keyboard key is shown) is a bit wonky
  - Keys you replace through your compositor (example: `caps:swapescape`) will
    require you to use the original key
- Originally made for Sway, other desktops (GNOME, for example) might need to
  manually makepkg the `libdecoration` branch for GNOME specific fixes or download
  an unofficial package listed below (until a new GLFW version releases)
  - KDE works on both branches, but with some [minor issues](https://github.com/Admicos/minecraft-wayland/issues/8#issuecomment-997155245)

## Step 1: Setting up MultiMC to use the system GLFW

Go to `Settings` > `Minecraft`, and enable `Use system installation of GLFW`.

If you have a Wayland-compatible version of GLFW installed (`glfw-wayland` on
Arch) you can try launching the game. It will most likely error out with
something about window focus not being supported. In that case, you are in the
right direction.

## Step 2: Installing the patched GLFW library

If you're not under a distro with a guide here, you're mostly on your own.
You can try waiting for someone else to write a guide for your distro, I guess.

### Option 1: Use the AUR

Install the `glfw-wayland-minecraft` package from the AUR.

If you're using a desktop that needs it, try using the **unofficial**
`glfw-wayland-minecraft-libdecoration` package, which packages the
`libdecoration` branch of this repository to the AUR.

### Option 2: Build the PKGBUILD manually

`git clone` this repository to somewhere, and run `makepkg -si` inside. It will
ask you to replace your existing GLFW package if already installed.

If you're using a desktop that needs it, consider running `git checkout libdecoration`
before running `makepkg -si`. This is a (probably) slightly unstable version that
works better on some desktops.

### Option 3: Install the Fedora package

Install the Fedora package from https://copr.fedorainfracloud.org/coprs/lyessaadi/minecraft-wayland-glfw/.
See https://github.com/Admicos/minecraft-wayland/issues/4 for more information.

You might need to change the Java arguments even if you are using a launcher that
can replace GLFW. See [this issue](https://github.com/Admicos/minecraft-wayland/issues/14)
for more details.

### Option 4: Patch the Gentoo package

Patch Gentoo's GLFW package by following the guide at https://github.com/Admicos/minecraft-wayland/issues/6

### Option 5: Install the Guix package

Install the Guix package from https://github.com/Admicos/minecraft-wayland/issues/18

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

- `christianrauch` on GitHub

  - For https://github.com/glfw/glfw/pull/1693
