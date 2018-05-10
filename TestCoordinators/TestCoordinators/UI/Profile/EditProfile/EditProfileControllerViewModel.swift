
import UIKit

class EditProfileControllerViewModel {
    let session: Session

    init(session: Session) {
        self.session = session
    }

    func save(completion: @escaping () -> Void) {
        completion()
    }
}
