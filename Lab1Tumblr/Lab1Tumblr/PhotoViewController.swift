//
//  ViewController.swift
//  Lab1Tumblr
//
//  Created by Shaz Rajput on 7/16/16.
//  Copyright © 2016 Shaz Rajput. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tumblrPosts = [NSDictionary]()
    
    @IBOutlet weak var tumblrTableView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tumblrTableView.dataSource = self
        tumblrTableView.delegate = self
        tumblrTableView.rowHeight = 320
        self.setTumblrPostsData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setTumblrPostsData() {
        let clientId = "Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV"
        let url = NSURL(string:"https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=\(clientId)")
        let request = NSURLRequest(URL: url!)
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            //NSLog("response: \(responseDictionary)")
                            if let myResponse = responseDictionary["response"] as? NSDictionary {
                                //NSLog("response\n\n \(myResponse)")
                                self.tumblrPosts = myResponse["posts"] as! [NSDictionary]
                                //NSLog("WTF: \(self.tumblrPosts[0]["photos"])")
                                self.tumblrTableView.reloadData()
                            }
                    }
                    
                }
        });
        task.resume()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tumblrTableView.dequeueReusableCellWithIdentifier("com.walmartlabs.shaz.tumblr.prototypecell", forIndexPath: indexPath) as! TableViewCell
        let imageUrl = self.getImageUrl(indexPath: indexPath)
        //NSLog("imageURL: \(imageUrl)")
        cell.tumblrImageView.setImageWithURL(NSURL(string: imageUrl)!)
        return cell
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tumblrPosts.count
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tumblrTableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let photoDetailsVC = segue.destinationViewController as! PhotoDetailsViewController
        let indexPath = tumblrTableView.indexPathForCell(sender as! UITableViewCell)
        photoDetailsVC.url = self.getImageUrl(indexPath: indexPath!)
        
        
    }
    
    func getImageUrl(indexPath ip: NSIndexPath) -> String{
        let photosDictionary = self.tumblrPosts[ip.row]["photos"] as! [NSDictionary]
        let originalSize = photosDictionary[0]["original_size"] as! NSDictionary
        return originalSize["url"] as! String
        
    }


}

