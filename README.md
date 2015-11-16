# SFSafariViewControllerPlayground

Simple iOS 9 app to test delegate callbacks in the new [`SFSafariViewController`](https://developer.apple.com/videos/wwdc/2015/?id=504).

## How it works

When you tap a button corresponding to an HTTP status, the app instantiates a
`SFSafariViewController`and pushes it onto the top-level
`UINavigationController`.

The navigation bar will indicate when the `SFSafariViewControllerDelegate`
receives the `didCompleteInitialLoad:` message, unless presented modally.

The synthetic response pages utilize HTTP streaming to delay the
`document.DOMContentLoaded` event, and include a slow hidden image to delay the
`window.load` event. Indicators exist upon completion of both events.

![Landing page](/screenshot-1.png?raw=true)
![Loaded page](/screenshot-2.png?raw=true)

## Dependencies

Uses the [synthetic response generator](https://http-playground.herokuapp.com/synthetic)
included in [`http-playground`](https://github.com/jamesreggio/http-playground).
