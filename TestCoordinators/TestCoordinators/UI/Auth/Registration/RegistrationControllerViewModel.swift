
import UIKit

class RegistrationControllerViewModel {
    let session: Session

    init(session: Session) {
        self.session = session
    }

    func register(completion: @escaping () -> Void) {
        session.user.value = User()
        completion()
    }
}
