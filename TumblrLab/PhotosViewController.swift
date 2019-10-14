//
//  PhotosViewController.swift
//  TumblrLab
//
//  Created by Nathan Ireland on 10/14/19.
//  Copyright © 2019 Nathan Ireland. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    var posts: [[String: Any]] =  []

    override func viewDidLoad() {
        super.viewDidLoad()
        retrievePosts()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Private Functions
    
    private func retrievePosts(){
        let url = URL(string: "https://api.tumblr.com/v2/blog/humansofnewyork.tumblr.com/posts/photo?api_key=Q6vHoaVm5L1u2ZAW1fqv3Jw48gFzYVg9P0vH0VHl3GVy6quoGV")!
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        let task = session.dataTask(with: url) { (data, response, error) in
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data,
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
             
              // TODO: Get the posts and store in posts property
            let responseDictonary = dataDictionary["response"] as! [String: Any]

              // TODO: Reload the table view
            self.posts = responseDictonary["posts"] as! [[String: Any]]
            
          }
        }
        task.resume()
   
    }
}
