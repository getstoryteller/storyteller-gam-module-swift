# Storyteller GAM Module

This module is a helper module to facilitate integrating Google Mobile Ads reporting into the Storyteller SDK's Stories and Clips players.

To make use of it, you need to set it up as a module for the `Storyteller` class, like so:

```swift
let config = StorytellerGAMModuleConfiguration(adUnit: { requestInfo in
    return <adUnit based on requestInfo>
})
let adModule = StorytellerGAMModule(configuration: config)
Storyteller.modules = [adModule]
```

The main customisation point is the `StorytellerGAMModuleConfiguration` initializer. It has the following signature:

```swift
init(
    adUnit: @escaping (StorytellerAdRequestInfo) -> String,
    customNativeTemplateIds: StorytellerGAMModuleConfiguration.CustomNativeTemplateIds? = nil,
    customKvps: (() -> [String: String])? = nil
)
```

where:

- `adUnit` - the closure where you receive the request info and based on that you return the ad unit for the ads.
- `customNativeTemplateIds` - for old GAM formats, you will want to pass in custom native template ID's for stories and clips.
- `customKvps` - a dictionary of strings you may want to pass on each request to GAM.
