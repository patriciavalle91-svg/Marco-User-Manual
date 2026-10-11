import Cocoa
import WebKit

@main
final class MarcoLauncher: NSObject, NSApplicationDelegate {
    private var window: NSWindow?

    static func main() {
        let app = NSApplication.shared
        let delegate = MarcoLauncher()
        app.delegate = delegate
        app.setActivationPolicy(.regular)
        app.run()
    }

    func applicationDidFinishLaunching(_ notification: Notification) {
        let window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 760, height: 900),
            styleMask: [.titled, .closable, .miniaturizable, .resizable],
            backing: .buffered,
            defer: false
        )
        window.title = "Relationship v1.0"
        window.minSize = NSSize(width: 540, height: 640)
        window.center()

        let webView = WKWebView(frame: window.contentView?.bounds ?? .zero)
        webView.autoresizingMask = [.width, .height]
        window.contentView = webView
        self.window = window

        if let resources = Bundle.main.resourceURL {
            let page = resources.appendingPathComponent("index.html")
            webView.loadFileURL(page, allowingReadAccessTo: resources)
        }

        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        true
    }
}
