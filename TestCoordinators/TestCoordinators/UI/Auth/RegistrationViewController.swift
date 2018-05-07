
import UIKit
import Reusable

protocol RegistrationControllerOutput: class {
    var onRegister: (() -> Void)? { get set }
}

class RegistrationViewController: AbstractViewController, StoryboardSceneBased, RegistrationControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.auth

    var onRegister: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    @IBAction private func registerAction(_ sender: UIButton) {
        Session.shared.user = User()
        onRegister?()
    }
}
