//
//  NORMainViewController.swift
//  nRF Toolbox
//
//  Created by Mostafa Berg on 27/04/16.
//  Copyright © 2016 Nordic Semiconductor. All rights reserved.
//  Edited by Anastasios Panagoulias on 11/01/07

import UIKit

class NORMainViewController: UIViewController, UICollectionViewDataSource, UIAlertViewDelegate {

    // MARK: - Outlets & Actions
    @IBOutlet weak var collectionView: UICollectionView!

    @IBAction func aboutButtonTapped(_ sender: AnyObject) {
        showAboutAlertView()
    }
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        
        if (!isUserLoggedIn){
            
            self.performSegue(withIdentifier: "loginView", sender: self)
            
        }
    }
    
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        self.performSegue(withIdentifier: "loginView", sender: self)
    }
    
    
    func showAboutAlertView() {
        //let appVersion = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String
        //Note: The character \u{2022} found here is a unicode bullet, used just for styling purposes
        let aboutMessage = String("This application is a creation of Anastasios Panagoulias on behalf of  Coventry University and the Module M99 EKM of the academic year 2016-2017. This application is part of the Dissertaion Module. Several parts of this application are taken from the nRF Toolbox official open source App. This application is designed to work with the most popular Low Energy Bluetooth accessories that use standard BLE profiles. This Application has been tested with the Nordic Semiconductor nRF 52 - DK. It supports Nordic Semiconductor's proprietary profiles:\n\n\u{2022}UART (Universal Asynchronous Receiver/Transmitter),\n\n\u{2022}DFU (Device Firmware Update).\n\nMore information and the source code may be found on GitHub.\n\nVersion 0.2")
        
        let alertView = UIAlertView.init(title: "About", message: aboutMessage!, delegate: self, cancelButtonTitle: "Ok", otherButtonTitles:"GitHub")
        alertView.show()
    }

    // MARK: - UIalertViewDelegate
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if buttonIndex == 1 {
            UIApplication.shared.openURL(URL(string: "https://github.com/anasmeister/nRF-Coventry-University")!)
        }
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellName = String(format: "profile_%d", (indexPath as NSIndexPath).item)
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath)
    }

}
