# Flatpak build instructions

### Note:

>Support for `libdecoration` is not present, yet, as the patches are outdated. So if you run GNOME, you'll see white borders, you'll have no minimize, maximize and close buttons and resizing the window will result in lag city, so good luck.

Clone this repository and then run the following commands (ignore everything after the "#"):

```bash
cd minecraft-wayland
git checkout flatpak                # Select the correct branch
chmod +x flatpak-build.sh           # Give executable permissions to the script
./flatpak-build.sh <flatpak-appid>  # Build the library!
```

Replace `<flatpak-appid>` with the string you use to run the flatpak application. Here are the commands for some of the most common appids:

```bash
./flatpak-build.sh com.mojang.Minecraft # Official Minecraft launcher
./flatpak-build.sh org.polymc.PolyMC    # PolyMC launcher
./flatpak-build.sh io.gdevs.GDLauncher  # GDLauncher
```

To use this GLFW build instead of the system's, add the following string to the launch commands:

```bash
-Dorg.lwjgl.glfw.libname=/home/<your-username>/.var/app/<flatpak-appid>/usr/lib/libglfw.so
```

Replace `<your-username>` and `<flatpak-appid>` with the appropriate values for your use case.

For example, if my username is `mcplayer` and I want use the `PolyMC` launcher, I'll have to add the following string to my Minecraft launch arguments:

```bash
-Dorg.lwjgl.glfw.libname=/home/mcplayer/.var/app/org.polymc.PolyMC/usr/lib/libglfw.so
```
