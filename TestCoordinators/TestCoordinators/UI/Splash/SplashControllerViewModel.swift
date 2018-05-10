
import UIKit

class SplashControllerViewModel {
    let session: Session

    init(session: Session) {
        self.session = session
    }

    func loadConfig(completion: @escaping () -> Void) {
        session.config.value = Config()
        completion()
    }
}
