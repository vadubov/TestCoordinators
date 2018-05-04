
import UIKit

public class AppRouter: PresentationRouterType {
    let window: UIWindow

    init(with window: UIWindow) {
        self.window = window
    }

    func setRootModule(_ module: Presentable) {
        window.rootViewController = module.toPresentable()
        window.makeKeyAndVisible()
    }

    public func toPresentable() -> UIViewController {
        assert(window.rootViewController != nil, "setRootModule must be already called at this moment")
        return window.rootViewController!
    }
}
