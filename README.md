# Storyteller GAM Module

This module is a helper module to facilitate integrating Google Mobile Ads reporting into the Storyteller SDK's Stories and Clips players.

To make use of it, you need to set it up as a module for the `Storyteller` class, like so:

```swift
let config = StorytellerGAMModuleConfiguration(adUnitId: "<your-ad-unit>")
let adModule = StorytellerGAMModule(configuration: config)
Storyteller.modules = [adModule]
```
