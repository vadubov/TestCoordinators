
import UIKit

class LoginControllerViewModel {
    let session: Session

    init(session: Session) {
        self.session = session
    }

    func login(completion: @escaping () -> Void) {
        session.user.value = User()
        completion()
    }
}
