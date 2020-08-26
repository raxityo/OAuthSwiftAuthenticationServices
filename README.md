# OAuthSwiftAuthenticationServices

`OAuthSwiftASWebAuthenticationURLHandler` adds ability to use `ASWebAuthenticationSession` with [`OAuthSwift`](https://github.com/OAuthSwift/OAuthSwift) while targeting iOS 12.0+ and does not require defining an extra URI scheme in the application's `Info.plist` or handling the URI scheme in the app delegate.

## Installation:
Add this repository to `Xcode` using SPM.

## Sample usage:
```swift
oauthSwift.authorizeURLHandler = ASWebAuthenticationSessionURLHandler(
  callbackUrlScheme: "scheme",
  presentationAnchor: view.window
)
```

For more details of how to use `authorizeURLHandler`, see the docs in [`OAuthSwift`](https://github.com/OAuthSwift/OAuthSwift/tree/8e94866ddbb0b252be5483eac14fd3cd5065e0c9#handle-authorize-url)
