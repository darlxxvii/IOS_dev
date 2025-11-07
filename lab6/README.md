# Nazerke_MusicPlayer

## Overview

Simple music player built with UIKit and Interface Builder. Demonstrates layout with UIStackView, Auto Layout constraints, audio playback (AVAudioPlayer), and basic controls.

## Features implemented

* UI composed using UIStackView (main vertical stack + horizontal stacks)
* Track title and artist display
* Album cover image (aspect fit, rounded corners)
* Previous / Play-Pause / Next controls using SF Symbols
* Track data modeling via Track struct and PlaylistManager
* Audio playback with AVAudioPlayer
* Playback progress slider (seekable) and current/total time labels (MM:SS)
* Wrap-around next/previous behavior
* Dark mode support via semantic colors

## Bonus tasks completed

* Track duration and current time labels
* Artist name display
* Dark mode support via semantic colors

## How to run

1. Open Nazerke_MusicPlayer.xcodeproj in Xcode 13+.
2. Add audio files and cover images to the app bundle
3. Build & run on a simulator or device running iOS 15.0+.

## Files of interest

* Track.swift — data model
* PlaylistManager.swift — simple playlist navigation
* ViewController.swift — UI bindings and audio playback logic
* Main.storyboard — UI layout using UIStackView

## Resources

* SF Symbols for control icons.
* Apple Developer Documentation: UIStackView, Auto Layout, AVAudioPlayer.
* https://soundcloud.com for covers

<img width="1640" height="2360" alt="image" src="https://github.com/user-attachments/assets/eec22a03-2276-42c6-8853-1363ebaeaa9e" />
<img width="622" height="837" alt="image" src="https://github.com/user-attachments/assets/11d29356-3959-4f46-852f-2dfeaa78a8b5" />
