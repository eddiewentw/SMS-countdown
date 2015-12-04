//
//  NavigationController.swift
//  SMSCount
//
//  Created by Eddie on 12/4/15.
//  Copyright © 2015 Wen. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // Set style of NavigationBar
        self.navigationBar.barTintColor = UIColor(red: 255/255, green: 206/255, blue: 84/255, alpha: 1)
        self.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]

        // Add LeftBarItem and title
        let drawerItem = UIBarButtonItem(barButtonSystemItem: .Camera, target: self, action: "test")
        let childVC = self.childViewControllers.first!
        childVC.navigationItem.setLeftBarButtonItem( drawerItem, animated: true )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func test() {
        print("OOOO")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
