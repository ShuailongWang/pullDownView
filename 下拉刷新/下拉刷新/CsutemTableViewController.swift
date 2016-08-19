//
//  CsutemTableViewController.swift
//  下拉刷新
//
//  Created by czbk on 16/8/19.
//  Copyright © 2016年 王帅龙. All rights reserved.
//

import UIKit

private let cellID = "cellID"

//  自定义下拉刷新控件
class CsutemTableViewController: UITableViewController {
    //下拉刷新
    private lazy var pullDownView: WSLRefreshControl = {
        let pullDownView = WSLRefreshControl()
        
        //添加事件
        pullDownView.addTarget(self, action: "pullDownRefresh", forControlEvents: .ValueChanged)
        
        return pullDownView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //添加下拉控件
        tableView.addSubview(pullDownView)
    }
    
    //下拉
    @objc private func pullDownRefresh() {
        //  加载下拉刷新的数据
        //  延时两秒回调
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), { () -> Void in
            //结束旋转
            self.pullDownView.endRefreshing()
        });
        
    }

}

extension CsutemTableViewController {
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
