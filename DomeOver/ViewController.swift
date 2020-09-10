//
//  ViewController.swift
//  DomeOver
//
//  Created by 寇凤伟 on 2020/9/9.
//  Copyright © 2020 RX. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    //组中的成员数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    // 包含的cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    }
    
    @IBOutlet weak var zhu: UICollectionView!
    
    // 获取屏幕高宽
    
    let PingWidth = UIScreen.main.bounds.width
    let PingHeigt = UIScreen.main.bounds.height
    
    let cellID = "HomePageCell"
    let headerID = "HomePageHeader"
    let footID = "HomePageFoot"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 设置流水布局
     
        
    }
    private func zhuready(){
        // 设置数据源和代理
        zhu.delegate = self
        zhu.dataSource = self
               
            // 设置分页效果
            zhu.isPagingEnabled = true
            // 隐藏水平滚动条
            zhu.showsHorizontalScrollIndicator = false
            // 隐藏垂直滚动条
            zhu.showsVerticalScrollIndicator = false
               
            zhu.backgroundColor = .systemTeal
        
        // 注册cell
        zhu.register(UINib(nibName: "HomePageCVC", bundle: nil), forCellWithReuseIdentifier: cellID)
        // 注册header
        zhu.register(UINib(nibName: "HomePageHeaderCRV", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
        // 配置collectionview的布局类型
        let layout = UICollectionViewLayout.init()
        
        
        
        
    }


}

