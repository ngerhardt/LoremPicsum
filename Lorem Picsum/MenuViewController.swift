//
//  MenuViewController.swift
//  Lorem Picsum
//
//  Created by Nathan Gerhardt on 5/18/22.
//

import Cocoa

class MenuViewController: NSViewController {

	@IBOutlet weak var tbsListLength: NSTextFieldCell!
	@IBOutlet weak var authorLabel: NSTextField!
	@IBOutlet weak var tbxImageId: NSTextField!
	@IBOutlet weak var imageListTable: NSTableView!
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
	@IBOutlet weak var image: NSImageView!
	
	@IBAction func getListClicked(_ sender: Any) {
		//get number of images to size table
		let rows = Int(tbsListLength.stringValue)
		//TODO
		//loop through and assign table cells an image
		
		if let url = URL(string:"https://picsum.photos/200"){
			URLSession.shared.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
				if error != nil {
					print (error!)
				}else{
					let imagesrc = NSImage(data: data!)
					self.image.image = imagesrc
				}
			}.resume()
		}
	}
	@IBAction func getImageClicked(_ sender: Any) {
		let id = tbxImageId.stringValue
		if let url = URL(string:"https://picsum.photos/id/\(id)/200"){
			URLSession.shared.dataTask(with: url) {(data: Data?, response: URLResponse?, error: Error?) in
				if error != nil {
					print (error!)
				}else{
					let imagesrc = NSImage(data: data!)
					self.image.image = imagesrc
					//TODO
					//use API to get info and use swifty json to get out info
					/*do{
						let json = try? JSON(data: data!)
						if let temp = json?["author"].string {
						self.authorLabel.stringValue = temp
						}
					}*/
				}
			}.resume()
		}
	}
}
