
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

        router.setRootModule(controller)
    }
}
