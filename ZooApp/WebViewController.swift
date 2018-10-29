//
//  WebViewController.swift
//  ZooApp
//
//  Created by Tianxia Dong on 28/02/2018.
//  Copyright © 2018 Tianxia Dong. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    //outlet of the UI
    @IBOutlet weak var webView: UIWebView!
    
    var animalData: Animal!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // load the url of the animal
        self.title = "Web"
        // Do any additional setup after loading the view.
        let url = URL(string: animalData.url)
        print(url)
        webView.loadRequest(URLRequest(url: url!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
