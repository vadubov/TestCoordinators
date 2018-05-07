
import UIKit
import Reusable

protocol ForgotPasswordControllerOutput: class {
    var onSend: (() -> Void)? { get set }
}

class ForgotPasswordViewController: AbstractViewController, StoryboardSceneBased, ForgotPasswordControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.auth

    var onSend: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction private func sendAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Login with your new password", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak self] (_) in
            self?.onSend?()
        }))
        present(alert, animated: true, completion: nil)
    }
}
