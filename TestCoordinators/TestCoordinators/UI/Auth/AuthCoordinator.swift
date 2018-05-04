
import UIKit

protocol AuthCoordinatorOutput: class {
    var onFinish: (() -> Void)? { get set }
}

class AuthCoordinator: NavigationCoordinator, AuthCoordinatorOutput {
    var onFinish: (() -> Void)?

    override init(with router: NavigationRouter) {
        super.init(with: router)

        let controller = LoginViewController.instantiate()

        controller.onLogin = { [weak self] in
            self?.onFinish?()
        }

        controller.onClickClose = { [weak self] in
            self?.onFinish?()
        }

        router.setRootModule(controller, hideBar: true)
    }
}
