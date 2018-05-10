
import UIKit
import Reusable

protocol LoginControllerOutput: class {
    var onLogin: (() -> Void)? { get set }
    var onClickForgotPassword: (() -> Void)? { get set }
    var onClickRegister: (() -> Void)? { get set }
    var onClickClose: (() -> Void)? { get set }
}

class LoginViewController: AbstractViewController, StoryboardSceneBased, LoginControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.auth

    var onLogin: (() -> Void)?
    var onClickForgotPassword: (() -> Void)?
    var onClickRegister: (() -> Void)?
    var onClickClose: (() -> Void)?

    private var viewModel: LoginControllerViewModel!

    class func instantiate(with viewModel: LoginControllerViewModel) -> LoginViewController {
        let controller = LoginViewController.instantiate()
        controller.viewModel = viewModel
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    @IBAction private func loginAction(_ sender: UIButton) {
        viewModel.login { [weak self] in
            self?.onLogin?()
        }
    }

    @IBAction private func forgotPasswordAction(_ sender: UIButton) {
        onClickForgotPassword?()
    }

    @IBAction private func registerAction(_ sender: UIButton) {
        onClickRegister?()
    }

    @IBAction private func closeAction(_ sender: UIButton) {
        onClickClose?()
    }
}
