//
//  RootViewController.swift
//  Photos
//
//  Created by Valerio Ferrucci on 05/09/14.
//  Copyright (c) 2014 Valerio Ferrucci. All rights reserved.
//

import UIKit

class RootViewController : UIViewController, ParserDelegate {
    
    var photos : [Photo] = [Photo]()
    let parser = Parser()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        parser.delegate = self
        parser.start()
    }
    
    //MARK: Segue
    @IBAction func launchSegue(sender: UIButton) {
        
        self.performSegueWithIdentifier("show", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        var index : Int!
        let identifier : String = segue.identifier!
        index = (sender as UIButton).tag
        
        let photoTitle = photos[index].titolo
        let photoImage = UIImage(named: photoTitle ?? "rovi")   // es. di cohalesce operator
        let photoInfo = photos[index].descr
        
        // il VC destinazione
        //println(reflect(segue.destinationViewController).summary)
        if segue.destinationViewController is PhotoViewController {
            
            let photoVC = segue.destinationViewController as PhotoViewController
            photoVC.title = photoTitle
            photoVC.image = photoImage
            photoVC.imageInfo = photoInfo ?? ""
        }
        
    }
    
    //MARK: ParserProtocol
    func parserOK(photoArray:[Photo]) {

        photos = photoArray
    }
    
    func parserKO(error:NSError) {

        let alert:UIAlertController = UIAlertController(title: "Errore", message: error.localizedDescription, preferredStyle:.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction!) in
            
        }))
        self.presentViewController(alert, animated:true, completion:nil);
    }

}