//
//  ViewController.swift
//  SceneKitTutorial
//
//  Created by Jacob Dobson on 8/25/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.
//

import UIKit
import SceneKit

class ViewController: UIViewController {
	//life cycle
	override func viewDidLoad() {
		super.viewDidLoad()
		//setup scn
		let scnView = self.view as! SCNView
		scnView.scene = PrimitiveScene()
		scnView.backgroundColor = UIColor.black
		//add light to scn
		scnView.autoenablesDefaultLighting = true
		//allow cam control
		scnView.allowsCameraControl = true
	}
}

