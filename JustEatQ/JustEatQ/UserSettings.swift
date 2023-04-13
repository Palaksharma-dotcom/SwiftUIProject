import SwiftUI

class UserSettings: ObservableObject {
    @Published var user = User()
    @Published var loggedIn = false
        func signIn(){
            loggedIn = true
        }
    func signOut() {
        loggedIn = false
    }
    func SetUser(user: User){
        self.user = user
    }
    
    func setCartItems(items: [Cart]){
        self.user.cartItem?.addingObjects(from: items)
    }
    
}
