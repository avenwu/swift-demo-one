//
//  ViewController.swift
//  Dialog
//
//  Created by aven wu on 8/4/15.
//  Copyright (c) 2015 avenwu. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var leftCount: UILabel!
    @IBOutlet weak var rightCount: UILabel!
    
    var options = ["剪刀", "石头", "布"]
    var leftWinCount:Int = 0
    var rightWinCount:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
    }

    func setupLabel() {
        leftLabel.text = options[(Int)(arc4random_uniform(3))]
        rightLabel.text = options[(Int)(arc4random_uniform(3))]
    }
    
    @IBAction func clickPlay(sender: UIButton) {
        setupLabel()
        switch win(leftLabel.text!, secound: rightLabel.text!) {
        case 1:
            leftCount.text = "win:\(++leftWinCount)"
        case -1:
            rightCount.text = "win:\(++rightWinCount)"
        default:
            print("equal state")
        }
        
    }
    
    func win(first:String, secound: String) -> Int {
        var result = 0;
        if equal(first, options[0]) {//剪刀
            if equal(secound, options[1]) {
                result = -1;
            } else if equal(secound, options[2]) {
                result = 1;
            }
        } else if equal(first, options[1]) {//石头
            if equal(secound, options[0]) {
                result = 1;
            } else if equal(secound, options[2]) {
                result = -1;
            }
        } else if equal(first, options[2]) {//布
            if equal(secound, options[0]) {
                result = -1;
            } else if equal(secound, options[1]) {
                result = 1;
            }
        }
        return result;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

