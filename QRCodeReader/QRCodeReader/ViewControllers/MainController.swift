//
//  ViewController.swift
//  QRCodeReader
//
//  Created by Linh Chu on 30/8/17.
//  Copyright © 2017 Philology Pty. Ltd. All rights reserved.
//

import UIKit
import Foundation

class MainController: BaseController {
    
    var mScanSessions = Array<ScanSession>()
    var mScannedCodes = Array<QRCode>()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "QRCode Reader"
        
//        let qrCode = QRCode(batchId: "test", scanSessionId: "", desc: "session 1",
//                            location: "philology", dateReceived: "today")
//        AppInstances.scannedCodeList.append(qrCode)
//        AppInstances.scannedCodeList.append(qrCode)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueStart" {
            AppInstances.scannedCodeList.removeAll()
        }else if segue.identifier == "segueResume" {}
    }
    
    @IBAction func btnViewListTapped(_ sender: UIButton) {
    }
    
    @IBAction func btnSaveTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func settingsButtonOnTap(_ sender: UIButton) {
        popUpSettings()
    }
    
    
    // MARK: - Private Methods
    
    func loadData() {
        if let data = UserDefaults.standard.object(forKey: Config.KEY_SCAN_SESSION_LIST) as? Array<ScanSession> {
            AppInstances.scanSessionList = data
        }
    }
    
    func saveData() {        
        if let scanSession = AppInstances.scanSession {
            UserDefaults.standard.set(AppInstances.scannedCodeList, forKey: scanSession.id)
            UserDefaults.standard.synchronize()
        }
    }
    
    // Pop up FindCow view controller
    func popUpSettings() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let settingsVC = storyboard.instantiateViewController(withIdentifier :"SettingsViewController") as! BasePopupController
        self.addChildViewController(settingsVC)
        self.view.addSubview(settingsVC.view)
        settingsVC.view.frame = self.view.frame
        settingsVC.didMove(toParentViewController: self)
    }
}