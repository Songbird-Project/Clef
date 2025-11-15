# Clef

> [!IMPORTANT]
> Clef is no longer being developed, it will be replaced by
> Nest's to-be-implemented `manage` subcommand. If you would like
> to keep Clef alive and are willing to maintain it, please [email me](mailto:vaelixd@proton.me).
> For now, the repo will be archived.

> [!NOTE]
> Clef is experimental and does not yet have a stable release.
> If you encounter any issues please file an issue using the
> provided `Bug Report` template.

Clef is a simple and clean dotfile manager inspired by GNU Stow.

## Install

The only way to currently install Clef is by building it from source.
This isn't too difficult though.
The following is all that's required:

```sh
git --depth=1 clone https://github.com/Songbird-Project/Clef.git
cd clef
gleam build
gleam run -m gleescript
```

Once it's built you should move it into a directory that exists in your `PATH`.
Then you can run it:
> [!IMPORTANT]
> Clef is targeted at Linux based systems. It should work on MacOS,
> but if any issues arise they are not high priority unless they
> also effect Linux systems.
> Clef is **not** made for Windows systems.
> Compatibility is planned but is not yet implemented
> and there is currently no install method for the
> platform.

MacOS/Linux:

```sh
clef ...
```
