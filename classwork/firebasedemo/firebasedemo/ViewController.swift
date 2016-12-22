import UIKit
import Firebase

class ViewController: UIViewController, GIDSignInDelegate, GIDSignInUIDelegate {
    
    var ref: Firebase!
    
    @IBOutlet weak var loginStatus: UILabel!
//    let myRootRef = Firebase(url:"https://ga-ios-class.firebaseio.com")
//    let myRootRef = Firebase(url:"https://radiant-fire-1715.firebaseio.com")
    
    @IBOutlet weak var myTextfield: UITextField!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Firebase(url:"https://ga-ios-class.firebaseio.com")
        // Setup delegates
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
        // Attempt to sign in silently, this will succeed if
        // the user has recently been authenticated
        GIDSignIn.sharedInstance().signInSilently()
        
//        myRootRef.observeEventType(.Value, withBlock: {
//            snapshot in
//            self.myLabel.text = "\(snapshot.value)"
//        })
        
        
    }
    
    
    @IBAction func saveToFirebase(sender: AnyObject) {
        
//        if myTextfield.text != "" {
//            myRootRef.setValue(myTextfield.text)
//        }
    }
    
    // Wire up to a button tap
    @IBAction func authenticateWithGoogle(sender: UIButton) {
        GIDSignIn.sharedInstance().signIn()
    }
    @IBAction func signOut() {
        GIDSignIn.sharedInstance().signOut()
        ref.unauth()
        self.loginStatus.text = "Logged out"
    }
    
    // Implement the required GIDSignInDelegate methods
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
        withError error: NSError!) {
            if (error == nil) {
                // Auth with Firebase
                ref.authWithOAuthProvider("google", token: user.authentication.accessToken, withCompletionBlock: { (error, authData) in
                    
                    // User is logged in!
                    self.loginStatus.text = authData.providerData["displayName"] as? String
                    
                    print(authData.uid)
                    let newUser = [
                        "provider": authData.provider,
                        "displayName": authData.providerData["displayName"] as? NSString as? String
                    ]
                    self.ref.childByAppendingPath("users")
                        .childByAppendingPath(authData.uid).setValue(newUser)
                    
                    self.ref.observeEventType(.Value, withBlock: {
                                    snapshot in
                        self.myLabel.text = "\(snapshot.value)"
                    })
                })
            } else {
                // Don't assert this error it is commonly returned as nil
                print("\(error.localizedDescription)")
            }
    }
    // Implement the required GIDSignInDelegate methods
    // Unauth when disconnected from Google
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
        withError error: NSError!) {
            ref.unauth();
    }
}

