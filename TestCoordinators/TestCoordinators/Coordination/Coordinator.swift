
import UIKit

public protocol CoordinatorType: class, Presentable {
    associatedtype DeepLinkType
    associatedtype R: RouterType

    var router: R { get }

    func start()
    func start(with deeplink: DeepLinkType?)
}

public class Coordinator<DeepLinkType, R: RouterType>: NSObject, CoordinatorType {
    public var router: R
    public var childCoordinators: [Coordinator<DeepLinkType, NavigationRouter>] = []

    public init(with router: R) {
        self.router = router
        super.init()
    }

    public func start() {
        self.start(with: nil)
    }

    public func start(with deeplink: DeepLinkType?) {}

    public func addChild(_ coordinator: Coordinator<DeepLinkType, NavigationRouter>) {
        childCoordinators.append(coordinator)
    }

    public func removeChild(_ coordinator: Coordinator<DeepLinkType, NavigationRouter>?) {
        guard let coordinator = coordinator, let index = childCoordinators.index(where: { $0 === coordinator }) else {
            return
        }

        childCoordinators.remove(at: index)
    }

    public func toPresentable() -> UIViewController {
        return router.toPresentable()
    }
}

typealias RootCoordinator = Coordinator<DeepLink, AppRouter>
typealias NavigationCoordinator = Coordinator<DeepLink, NavigationRouter>
