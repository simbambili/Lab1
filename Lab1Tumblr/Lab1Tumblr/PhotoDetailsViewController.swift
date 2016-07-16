//
//  PhotosDetailsViewController.swift
//  Lab1Tumblr
//
//  Created by Shaz Rajput on 7/16/16.
//  Copyright © 2016 Shaz Rajput. All rights reserved.
//

import UIKit
import AFNetworking

class PhotoDetailsViewController: UIViewController {
    
    var url = ""

    @IBOutlet var detailImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailImageView.setImageWithURL(NSURL(string: url)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
