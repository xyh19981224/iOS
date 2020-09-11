//
//  aaaVController.swift
//  DomeOver
//
//  Created by 寇凤伟 on 2020/9/11.
//  Copyright © 2020 RX. All rights reserved.
//

import UIKit
import ESPullToRefresh

struct nanShou{
    var red:CGFloat
    var green:CGFloat
    var blue:CGFloat
}


class aaaVController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var LieBiao: UITableView!
    
    let cellID = "aaaTVCell"
    
    var lineNumber: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("pppppppppppp")
        
        // 设置代理
        LieBiao.delegate = self
        LieBiao.dataSource = self
        
        // nib注册
        let nib1 = UINib(nibName: "aaaTVCell", bundle: nil)
        LieBiao.register(nib1, forCellReuseIdentifier: cellID)
        
        // 导航栏设置
        navigationItem.title = "xiayunqing"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "返回"), style: .plain, target: self, action: #selector(back))
        
        // 下拉刷新
        LieBiao.es.addPullToRefresh {
            [unowned self] in
            
            self.upData()
            self.LieBiao.es.stopPullToRefresh()
        }
        
    

        // Do any additional setup after loading the view.
    }
    
    // 点击返回事件
    @objc func back(){
        navigationController?.popViewController(animated: true)
    }
    
    func upData(){
        
        lineNumber = lineNumber + 1
        LieBiao.reloadData()

    }
    
    
    //返回 内容数目
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lineNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:aaaTVCell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! aaaTVCell
        cell.BiaoTi.text = "\(indexPath.row)"
        //let haoShou:nanShou = nanShou.init(red: CGFloat(Double(arc4random_uniform(255))), green: CGFloat(Double(arc4random_uniform(255))), blue: CGFloat(Double(arc4random_uniform(255))))
        print(arc4random_uniform(10))
        let red = CGFloat(Double(Double(arc4random_uniform(10)) * 0.1))
        let green = CGFloat(Double(Double(arc4random_uniform(10)) * 0.1))
        let blue = CGFloat(Double(Double(arc4random_uniform(10)) * 0.1))
        cell.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
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
