
import UIKit

protocol ProfileCoordinatorOutput: class {
    var onFinish:(() -> Void)? { get set }
}

class ProfileCoordinator: NavigationCoordinator, ProfileCoordinatorOutput {
    var onFinish: (() -> Void)?

    override init(with router: NavigationRouter) {
        super.init(with: router)

        let controller = ProfileViewController.instantiate()

        controller.onClickClose = { [weak self] in
            self?.onFinish?()
        }

        controller.onClickEdit = { [weak self] in
            let controller = EditProfileViewController.instantiate()

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
