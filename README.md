# PokeballSDK

A Roku SceneGraph package that provides a ready-to-use pokeballs screen, built with BrightScript and distributed via ROPM.

## Description

The SDK exposes the `PokeballsScreen`, which renders a full screen with a laboratory background and a RowList populated with pokeballs. Focus handling and item rendering are managed internally by the SDK.

## Instalation

Install via [ROPM](https://github.com/rokucommunity/ropm) in your Roku project:

1. Install the `ropm` globally
```
npm install ropm -g
```
2. Install the `pokeball-sdk`
``` 
ropm install pokeball-sdk
```

## Usage

Instantiate the component via BrightScript in your Roku project:
```
screen = createObject("roSGNode", "pokeballsdk_PokeballsScreen")
m.top.appendChild(screen)
screen.setFocus(true)
```
