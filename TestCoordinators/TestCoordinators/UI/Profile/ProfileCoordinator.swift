
import UIKit

protocol ProfileCoordinatorOutput: class {
    var onFinish:(() -> Void)? { get set }
}

class ProfileCoordinator: NavigationCoordinator, ProfileCoordinatorOutput {
    var onFinish: (() -> Void)?

    override init(with router: NavigationRouter, session: Session) {
        super.init(with: router, session: session)

        let viewModel = ProfileControllerViewModel(session: session)
        let controller = ProfileViewController.instantiate(with: viewModel)

        controller.onClickClose = { [weak self] in
            self?.onFinish?()
        }

        controller.onClickEdit = { [weak self] in
            let viewModel = EditProfileControllerViewModel(session: session)
            let controller = EditProfileViewController.instantiate(with: viewModel)

            controller.onSave = { [weak self] in
                self?.router.popModule()
            }

            self?.router.push(controller)
        }

        controller.onLogout = { [weak self] in
            self?.onFinish?()
        }

        router.setRootModule(controller)
    }
}
