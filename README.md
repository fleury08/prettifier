<div align="center">
  <span align="center"> <img width="128" height="128" class="center" src="https://github.com/fleury08/prettifier/blob/master/data/images/com.github.fleury08.prettifier.png" alt="Icon"></span>
  <h1 align="center">Prettifier</h1>
  <h3 align="center">Prettify your JSON/XML outputs</h3>
</div>

<br/>

<p align="center">
    <a href="https://appcenter.elementary.io/com.github.fleury08.prettifier">
        <img src="https://appcenter.elementary.io/badge.svg">
    </a>
</p>

<p align="center">
  <a href="https://github.com/fleury08/prettifier/blob/master/LICENSE">
    <img src="https://img.shields.io/badge/License-MIT-blue.svg">
  </a>
  <a href="https://github.com/fleury08/prettifier/releases">
    <img src="https://img.shields.io/badge/Release-v%201.0.9-orange.svg">
  </a>
</p>

<p align="center">
    <img  src="https://github.com/fleury08/prettifier/blob/master/data/images/PrettifierXML.png" alt="Screenshot"> <br>
    <img  src="https://github.com/fleury08/prettifier/blob/master/data/images/PrettifierJSON.png" alt="Screenshot"> <br>
  <a href="https://github.com/fleury08/prettifier/issues/new"> Report a problem! </a>
</p>

## Installation

### Dependencies
These dependencies must be present before building:
 - `meson`
 - `valac`
 - `debhelper`
 - `libgranite-dev`
 - `libgtk-3-dev`
 - `libjson-glib-dev`
 - `libxml2-dev`
 - `libgtksourceview-3.0-dev`

Use the App script to simplify installation by running `./app install-deps`
 
 ### Building

```
git clone https://github.com/fleury08/prettifier.git com.github.fleury08.prettifier && cd com.github.fleury08.prettifier
./app install-deps && ./app install
```

### Deconstruct

```
./app uninstall
```

### Development & Testing

Prettifier includes a script to simplify the development process. This script can be accessed in the main project directory through `./app`.

```
Usage:
  ./app [OPTION]

Options:
  clean             Removes build directories (can require sudo)
  generate-i18n     Generates .pot and .po files for i18n (multi-language support)
  install           Builds and installs application to the system (requires sudo)
  install-deps      Installs missing build dependencies
  run               Builds and runs the application
  test              Builds and runs testing for the application
  test-run          Builds application, runs testing and if successful application is started
  uninstall         Removes the application from the system (requires sudo)
```

### Contributing

To help, access the links below:

- [Guide on Code Style](https://github.com/fleury08/prettifier/wiki/Guide-on-code-style)

- [Proposing Design Changes](https://github.com/fleury08/prettifier/wiki/Proposing-Design-Changes)

- [Reporting Bugs](https://github.com/fleury08/prettifier/wiki/Reporting-Bugs)

- [Translate](https://github.com/fleury08/prettifier/wiki/Translate)


### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details.

### P.S.

Big shout-out to [Archetype app](https://appcenter.elementary.io/com.github.kjlaw89.archetype.desktop), without it this app wouldn't happen.
