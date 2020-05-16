//
// Created by Jonathan YEUNG on 13/5/2020.
// DemoView
// Copyright © 2020 Jonathan Yeung. All rights reserved.
// 

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let data = PersonalData()
    var summaryToPass: String?

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "ProfileCell", bundle: nil), forCellReuseIdentifier: "ProfileCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.entities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
        
        cell.setData(data: data.entities[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
        
        cell.profileImage.kf.cancelDownloadTask()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        self.summaryToPass = data.entities[indexPath.row].summary
        self.performSegue(withIdentifier: "ModalSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ModalViewController {
            vc.summary = self.summaryToPass
        }
    }
}

