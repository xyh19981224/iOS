//
//  aaaVController.swift
//  DomeOver
//
//  Created by 寇凤伟 on 2020/9/11.
//  Copyright © 2020 RX. All rights reserved.
//

import UIKit
import ESPullToRefresh

class aaaVController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var LieBiao: UITableView!
    
    let cellID = "aaaTVCell"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LieBiao.delegate = self
        LieBiao.dataSource = self
        LieBiao.es.addPullToRefresh {
            [unowned self] in
            
        }

        // Do any additional setup after loading the view.
    }
    
    //返回 内容数目
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:aaaTVCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! aaaTVCell
        
        cell.BiaoTi.text = "\(indexPath.row)"
        cell.backgroundColor = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        return cell
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
