
import UIKit

protocol AuthCoordinatorOutput: class {
    var onFinish: (() -> Void)? { get set }
}

class AuthCoordinator: NavigationCoordinator, AuthCoordinatorOutput {
    var onFinish: (() -> Void)?

    override init(with router: NavigationRouter, session: Session) {
        super.init(with: router, session: session)

        let viewModel = LoginControllerViewModel(session: session)
        let controller = LoginViewController.instantiate(with: viewModel)

        controller.onLogin = { [weak self] in
            self?.onFinish?()
        }

        controller.onClickClose = { [weak self] in
            self?.onFinish?()
        }

        controller.onClickForgotPassword = { [weak self] in
            let viewModel = ForgotPasswordControllerViewModel(session: session)
            let controller = ForgotPasswordViewController.instantiate(with: viewModel)

            controller.onSend = { [weak self] in
                self?.router.popModule()
            }

            self?.router.push(controller)
        }

        controller.onClickRegister = { [weak self] in
            let viewModel = RegistrationControllerViewModel(session: session)
            let controller = RegistrationViewController.instantiate(viewModel: viewModel)

            controller.onRegister = { [weak self] in
                self?.onFinish?()
            }
            
            self?.router.push(controller)
        }

        router.setRootModule(controller, hideBar: true)
    }
}
