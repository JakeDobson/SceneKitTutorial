//  PrimitiveScene.swift
//  SceneKitTutorial
//  Created by Jacob Dobson on 8/25/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.

/*
	-- Create a line of 20 spheres with radius 0.2
	-- with distance 0.2 between each other along the xAxis (coordinates (0,0,0),(3,0,0),(6,0,0)…)
	-- Make their colors alternate between red and green
*/

import UIKit
import SceneKit

class PrimitiveScene: SCNScene {
	//initialize contents of scene
	override init() {
		super.init()
		//variables
		var x: Float = 0.0
		let radius: CGFloat = 0.2
		//create 20 spheres in for loop using an index
		for i in 1...20 {
			let sphere = SCNSphere(radius: radius)
			//color sphere red if index is odd, green if index is even
			if (i % 2 == 0) {
				sphere.firstMaterial?.diffuse.contents = UIColor.green
			} else {
				sphere.firstMaterial?.diffuse.contents = UIColor.red
			}
			//set node and position
			let sphereNode = SCNNode(geometry: sphere)
			sphereNode.position = SCNVector3(x: x, y: 0, z: 0)
			//add node to scene
			self.rootNode.addChildNode(sphereNode)
			//distance b/w spheres
			x += 3 * Float(radius)
			print(x)
		}
	}
	//init w/ coder method
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
