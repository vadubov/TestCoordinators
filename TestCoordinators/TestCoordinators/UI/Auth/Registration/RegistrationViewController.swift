
import UIKit
import Reusable
import RxSwift

protocol RegistrationControllerOutput: class {
    var onRegister: (() -> Void)? { get set }
}

class RegistrationViewController: AbstractViewController, StoryboardSceneBased, RegistrationControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.auth

    var onRegister: (() -> Void)?

    private var viewModel: RegistrationControllerViewModel!

    class func instantiate(viewModel: RegistrationControllerViewModel) -> RegistrationViewController {
        let controller = RegistrationViewController.instantiate()
        controller.viewModel = viewModel
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction private func registerAction(_ sender: UIButton) {
        viewModel.register { [weak self] in
            self?.onRegister?()
        }
    }
}
