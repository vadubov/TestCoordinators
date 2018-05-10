
import UIKit

class ForgotPasswordControllerViewModel {
    let session: Session

    init(session: Session) {
        self.session = session
    }

    func send(completion: @escaping () -> Void) {
        completion()
    }
}
