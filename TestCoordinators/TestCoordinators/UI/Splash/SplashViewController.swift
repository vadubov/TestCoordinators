
import UIKit
import Reusable

protocol SplashControllerOutput: class {
    var onFinish: (() -> Void)? { get set }
}

class SplashViewController: AbstractViewController, StoryboardSceneBased, SplashControllerOutput {
    static var sceneStoryboard: UIStoryboard = Storyboard.splash

    var onFinish: (() -> Void)?

    private var viewModel: SplashControllerViewModel!

    class func instantiate(with viewModel: SplashControllerViewModel) -> SplashViewController {
        let controller = SplashViewController.instantiate()
        controller.viewModel = viewModel
        return controller
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        delay(1) { [weak self] in
            self?.viewModel.loadConfig { [weak self] in
                self?.onFinish?()
            }
        }
    }

}
