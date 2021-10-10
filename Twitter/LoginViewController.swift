//
//  LoginViewController.swift
//  Twitter
//
//  Created by Henry M on 10/10/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // immediately once your page shows up (viewDidAppear), check to see if user is logged in
    override func viewDidAppear(_ animated: Bool) {
        // if the key "userLoggedIn" is set to true
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            // then send them to home
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    
    @IBAction func onLoginButton(_ sender: Any) {
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            
            // for persistent login between sessions
            // anytime someone logs in it will set/create a variable called "userLoggedIn" and set to true
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            // this will make them go to the home screen
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { Error in
            print("Could not login")
        })
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
