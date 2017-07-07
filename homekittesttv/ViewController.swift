//
//  ViewController.swift
//  homekittesttv
//
//  Created by Levi Dahlstrom on 6/20/16.
//  Copyright © 2016 Levi Dahlstrom. All rights reserved.
//

import UIKit
import HomeKit

class ViewController: UIViewController, HMHomeManagerDelegate, UITableViewDelegate, UITableViewDataSource
{
    var homeKitHomeManager = HMHomeManager()
    @IBOutlet var tableView:UITableView!
    @IBOutlet var countLabel:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // if (HomeStore.sharedStore.homeManager.primaryHome != 0)
       // {
        homeKitHomeManager.delegate = self
        tableView.delegate = self
       // }
    }
    func homeManagerDidUpdateHomes(_ manager: HMHomeManager) {
        homeKitHomeManager = manager
        countLabel.text = "HOME COUNT: \((homeKitHomeManager.homes.count))"
        self.tableView.reloadData()
    }
    func homeManager(_ manager: HMHomeManager, didAdd home: HMHome) {
        print (home)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeKitHomeManager.homes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell()
        cell.textLabel?.text = homeKitHomeManager.homes[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

