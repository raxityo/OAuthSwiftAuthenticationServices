import AuthenticationServices
import OAuthSwift
import UIKit

@available(iOS 12.0, *)
public class ASWebAuthenticationSessionURLHandler: NSObject, OAuthSwiftURLHandlerType {
  private var webAuthSession: ASWebAuthenticationSession!
  private let prefersEphemeralWebBrowserSession: Bool
  private let callbackUrlScheme: String

  weak var presentationAnchor: ASPresentationAnchor?

  public init(
    callbackUrlScheme: String,
    presentationAnchor: ASPresentationAnchor?,
    prefersEphemeralWebBrowserSession: Bool = false
  ) {
    self.callbackUrlScheme = callbackUrlScheme
    self.prefersEphemeralWebBrowserSession = prefersEphemeralWebBrowserSession
  }

  public func handle(_ url: URL) {
    webAuthSession = ASWebAuthenticationSession(
      url: url,
      callbackURLScheme: callbackUrlScheme,
      completionHandler: { callbackURL, error in
        guard error == nil, let callbackURL = callbackURL else {
          let msg = error?.localizedDescription.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
          let urlString = "\(self.callbackUrlScheme)?error=\(msg ?? "UNKNOWN")"
          guard let url = URL(string: urlString) else {
            return
          }
          OAuthSwift.handle(url: url)
          return
        }
        OAuthSwift.handle(url: callbackURL)
      }
    )
    if #available(iOS 13.0, *) {
      webAuthSession.presentationContextProvider = self
      webAuthSession.prefersEphemeralWebBrowserSession = prefersEphemeralWebBrowserSession
    }

    _ = webAuthSession.start()
  }
}

@available(iOS 12.0, *)
extension ASWebAuthenticationSessionURLHandler: ASWebAuthenticationPresentationContextProviding {
  public func presentationAnchor(for session: ASWebAuthenticationSession) -> ASPresentationAnchor {
    presentationAnchor ?? ASPresentationAnchor()
  }
}
