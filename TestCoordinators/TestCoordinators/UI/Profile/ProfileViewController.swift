
import UIKit
import Reusable

protocol ProfileControllerOutput: class {
    var onClickClose:(() -> Void)? { get set }
    var onClickEdit: (() -> Void)? { get set }
    var onLogout: (() -> Void)? { get set }
}

class ProfileViewController: AbstractViewController, StoryboardSceneBased, ProfileControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.profile

    var onClickClose: (() -> Void)?
    var onClickEdit: (() -> Void)?
    var onLogout: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction private func closeAction(_ sender: UIBarButtonItem) {
        onClickClose?()
    }
    
    @IBAction private func editAction(_ sender: UIButton) {
        onClickEdit?()
    }

    @IBAction private func logoutAction(_ sender: UIButton) {
        Session.shared.user = nil
        onLogout?()
    }
}
