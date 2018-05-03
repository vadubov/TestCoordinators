
import UIKit

public class AppRouter: RouterType {
    let window: UIWindow

    init(with window: UIWindow) {
        self.window = window
    }

    func setRootModule(_ module: Presentable) {
        window.rootViewController = module.toPresentable()
        window.makeKeyAndVisible()
    }

    public func toPresentable() -> UIViewController {
        return window.rootViewController!
    }
}
