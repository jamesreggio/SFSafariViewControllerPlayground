# SFSafariViewControllerPlayground

Simple iOS 9 app to test delegate callbacks and reproduce bugs in the new
[`SFSafariViewController`](https://developer.apple.com/videos/wwdc/2015/?id=504).

![Delegates](/screenshot-1.png?raw=true)
![Bugs](/screenshot-1.png?raw=true)
![Synthetic Response](/screenshot-3.png?raw=true)

## How it works

### Delegates

When you tap a button corresponding to an HTTP status, the app instantiates a
`SFSafariViewController`and pushes it onto the top-level
`UINavigationController`.

The navigation bar will indicate when the `SFSafariViewControllerDelegate`
receives the `didCompleteInitialLoad:` message.

The synthetic response pages utilize HTTP streaming to delay the
`document.DOMContentLoaded` event, and include a slow hidden image to delay the
`window.load` event. Indicators exist upon completion of both events.

### Bugs

When you tap a button corresponding to a bug, the app instantiates a
`SFSafariViewController` and presents it modally. The bug should reproduce
under the conditions specified in the Radars below:

* [Animated GIF OOM Crash](https://openradar.appspot.com/)
* [Large Resource OOM Crash](https://openradar.appspot.com/)
* [ContentInset + Keyboard Usability Bug](https://openradar.appspot.com/)
* [ContentInset + Landscape Usability Bug](https://openradar.appspot.com/)

## Dependencies

Uses the [synthetic response generator](https://http-playground.herokuapp.com/synthetic)
and [common crashing bugs](https://http-playground.herokuapp.com/crashers)
tools included in [`http-playground`](https://github.com/jamesreggio/http-playground).
