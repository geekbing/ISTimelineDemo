//
//  Main.swift
//  ISTimelineDemo
//
//  Created by Bing on 7/3/16.
//  Copyright © 2016 Bing. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.mainScreen().bounds.size.width
let screenHeight = UIScreen.mainScreen().bounds.size.height

class Main: UIViewController
{
    var schedule: [[String:String]]?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let timeline = ISTimeline(frame: CGRect(x: 20, y: 20, width: screenWidth - 20, height: screenHeight - 20))
        timeline.backgroundColor = .whiteColor()
        timeline.bubbleColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.00)
        timeline.titleColor = .whiteColor()
        timeline.descriptionColor = .darkTextColor()
        timeline.pointDiameter = 7.0
        timeline.lineWidth = 2.0
        timeline.bubbleRadius = 0.0
        self.view.addSubview(timeline)
        
        self.schedule = getScheduleDate()
        
        for i in 0..<self.schedule!.count
        {  
            let point = ISPoint(title: self.schedule![i]["time"]!)
            point.description = self.schedule![i]["task"]!
            if i < 3
            {
                point.lineColor = UIColor.grayColor()
            }
            else if i == 3
            {
                point.lineColor = UIColor.greenColor()
            }
            else
            {
                point.lineColor = UIColor.blackColor()
            }
            point.touchUpInside = { (point:ISPoint) in
                let alert = UIAlertController(title: point.title, message: point.description, preferredStyle: .Alert)
                let sure = UIAlertAction(title: "确定", style: .Default, handler: { (action) in
                })
                alert.addAction(sure)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            point.pointColor = point.lineColor
            timeline.points.append(point)
        }
    }
    
    // 获取日程表
    func getScheduleDate() -> [[String:String]]
    {
        return [
                ["time": "06:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."],
                ["time": "07:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."],
                ["time": "08:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "],
                ["time": "09:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."],
                ["time": "10:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."],
                ["time": "11:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "],
                ["time": "12:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."],
                ["time": "13:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."],
                ["time": "14:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "],
                ["time": "15:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."],
                ["time": "16:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."],
                ["time": "17:00", "task": "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "]]
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}
