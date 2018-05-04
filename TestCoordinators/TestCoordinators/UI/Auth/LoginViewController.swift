
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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func loginAction(_ sender: UIButton) {
        Session.shared.user = User()
        onLogin?()
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
