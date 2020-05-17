//
// Created by Jonathan YEUNG on 13/5/2020.
// DemoView
// Copyright © 2020 Jonathan Yeung. All rights reserved.
// 

import UIKit
import FoldingCell

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    fileprivate struct C {
      struct CellHeight {
        static let close: CGFloat = 150.0 // equal or greater foregroundView height
        static let open: CGFloat = 300.0 // equal or greater containerView height
      }
    }
    
    let data = PersonalData()
    var summaryToPass: String?
    var cellHeights: [CGFloat] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.register(UINib(nibName: "ProfileFoldingCell", bundle: nil), forCellReuseIdentifier: "ProfileFoldingCell")

        cellHeights = (0..<data.entities.count).map { _ in C.CellHeight.close }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.entities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileFoldingCell") as! ProfileFoldingCell
        
        cell.setData(data: data.entities[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileFoldingCell") as! ProfileFoldingCell
        
        cell.profileImage.kf.cancelDownloadTask()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeights[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

//        self.summaryToPass = data.entities[indexPath.row].summary
//        self.performSegue(withIdentifier: "ModalSegue", sender: nil)

        guard case let cell as FoldingCell = tableView.cellForRow(at: indexPath) else {
            return
        }

        var duration = 0.0
        if self.cellHeights[indexPath.row] == C.CellHeight.close { // open cell
            self.cellHeights[indexPath.row] = C.CellHeight.open
            cell.unfold(true, animated: false)
            duration = 0.5
        } else {// close cell
            self.cellHeights[indexPath.row] = C.CellHeight.close
            cell.unfold(false, animated: false)
            duration = 1.1
        }
        

        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            tableView.beginUpdates()
            tableView.endUpdates()
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if case let cell as FoldingCell = cell {
            if self.cellHeights[indexPath.row] == C.CellHeight.close {
                cell.setSelected(false, animated: false)
            } else {
                cell.setSelected(true, animated: false)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ModalViewController {
            vc.summary = self.summaryToPass
        }
    }
}

