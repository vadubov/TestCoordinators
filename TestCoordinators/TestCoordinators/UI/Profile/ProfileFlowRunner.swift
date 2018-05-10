
import UIKit

public protocol ProfileFlowRunner where Self: NavigationCoordinator {
    func runProfileFlow()
}

extension ProfileFlowRunner {
    func runProfileFlow() {
        let coordinator = ProfileCoordinator(with: NavigationRouter(), session: session)

        coordinator.onFinish = { [weak self] in
            self?.router.dismissModule()
            self?.removeChild(coordinator)
        }

        addChild(coordinator)
        router.present(coordinator.toPresentable())
    }
}
