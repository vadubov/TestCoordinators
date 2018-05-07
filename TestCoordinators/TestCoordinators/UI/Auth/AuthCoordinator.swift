
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

        controller.onClickForgotPassword = { [weak self] in
            let controller = ForgotPasswordViewController.instantiate()

            controller.onSend = { [weak self] in
                self?.router.popModule()
            }

            self?.router.push(controller)
        }

        controller.onClickRegister = { [weak self] in
            let controller = RegistrationViewController.instantiate()

            controller.onRegister = { [weak self] in
                self?.onFinish?()
            }
            
            self?.router.push(controller)
        }

        router.setRootModule(controller, hideBar: true)
    }
}
