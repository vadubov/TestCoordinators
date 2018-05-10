
import UIKit

class ProfileControllerViewModel {
    let session: Session

    init(session: Session) {
        self.session = session
    }

    func logout(completion: @escaping () -> Void) {
        session.user.value = nil
        completion()
    }
}
