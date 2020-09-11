//
//  ViewController.swift
//  DomeOver
//
//  Created by 寇凤伟 on 2020/9/9.
//  Copyright © 2020 RX. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    // 有多少组
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //组中的成员数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    // 包含的cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //print("xxxxxxxxxx")
        let cell: HomePageCVC = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HomePageCVC
        cell.NeiRong.text = "\(indexPath.row)"
        cell.DiTu.backgroundColor = .systemFill
        return cell
    }
    // 包含的 header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        print("nnnnnnnnnnnnn")
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView:HomePageHeaderCRV = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! HomePageHeaderCRV
            headerView.HeaderTxt.text = "我是夏云浩"
            headerView.backgroundColor = .systemRed
            return headerView
        }
        let headerView:HomePageHeaderCRV = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! HomePageHeaderCRV
        headerView.HeaderTxt.text = "我是夏云浩"
        headerView.backgroundColor = .systemRed
        return headerView
    }
    //  设置内容大小
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize.init(width: PingWidth, height: 100)
//    }
    
    
    //  设置头部 header的大小
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize.init(width: PingWidth, height: 100)
    }
    //  设置点击事件
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(indexPath.row)")
        
        collectionView.deselectItem(at: indexPath, animated: false)
        
        let bc = UIStoryboard(name: "Main", bundle: nil)
        let des = bc.instantiateViewController(withIdentifier: "aaaVController") as! aaaVController
        //des.hidesBottomBarWhenPushed = true
        //des.navigationItem.backBarButtonItem?.title = "ddd"
        self.navigationController?.pushViewController(des, animated: true)

        
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
   
     // 初始化
        self.zhuready()
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
        let layout = UICollectionViewFlowLayout.init()
        // 设置cell的大小
        layout.itemSize = CGSize.init(width: 200, height: 100)
        // 设置 滚动方向
        layout.scrollDirection = .vertical
        //每个item 之间的最小间距
        layout.minimumInteritemSpacing = 10
        // 每行之间最小的间距
        layout.minimumLineSpacing = 10
        
        
        self.zhu.collectionViewLayout = layout
        
        
        
        
    }


}

