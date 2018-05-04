
import UIKit

public protocol AuthFlowRunner {
    func runAuthFlow(finishHandler: (() -> Void)?)
}

extension Coordinator: AuthFlowRunner where DeepLinkType == DeepLink, R: PresentationRouterType {
    public func runAuthFlow(finishHandler: (() -> Void)? = nil) {
        let coordinator = AuthCoordinator(with: NavigationRouter())

        coordinator.onFinish = { [weak self] in
            self?.router.dismissModule()
            self?.removeChild(coordinator)
            finishHandler?()
        }

        addChild(coordinator)
        router.present(coordinator.toPresentable())
    }
}
