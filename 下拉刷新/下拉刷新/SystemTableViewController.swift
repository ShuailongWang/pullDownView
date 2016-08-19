//
//  SystemTableViewController.swift
//  下拉刷新
//
//  Created by czbk on 16/8/19.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

import UIKit


private let cellID = "cellID"
class SystemTableViewController: UITableViewController {
    //系统的下拉刷新
    private lazy var refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        
        //添加事件
        refresh.addTarget(self, action: "pullDownRefresh", forControlEvents: .ValueChanged)
        
        return refresh
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //添加下拉控件
//        self.tableView.addSubview(refresh)
        self.refreshControl = refresh
        
    }

    //下拉
    @objc private func pullDownRefresh() {
        //  加载下拉刷新的数据
        //  延时两秒回调
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
            //结束旋转
             self.refresh.endRefreshing()
        });
        
    }
    
    
}

extension SystemTableViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellID)
        }
        
        cell!.textLabel?.text = "1"
        
        return cell!
    }
}
