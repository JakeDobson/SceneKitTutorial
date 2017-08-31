//  PrimitiveScene.swift
//  SceneKitTutorial
//  Created by Jacob Dobson on 8/25/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.

/*
	-- Create a line of 20 spheres with radius 1.0
	-- with distance 1.0 between each other along the xAxis (coordinates (0,0,0),(3,0,0),(6,0,0)…)
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


/*
//SPHERE 1
//sphere1 size by giving radius
let sphere1 = SCNSphere(radius: 0.2)
//set color of sphere1
sphere1.firstMaterial?.diffuse.contents = UIColor.green
//scene node with gemoetrics from sphere1
let sphereNode1 = SCNNode(geometry: sphere1)
//set position of sphere2 in 3D space
sphereNode1.position = SCNVector3(x: -0.25, y: 0, z: 0)
//add sphereNode1 to scn
self.rootNode.addChildNode(sphereNode1)
//SPHERE 2
let sphere2 = SCNSphere(radius: 0.1)
sphere2.firstMaterial?.diffuse.contents = UIColor.cyan
let sphereNode2 = SCNNode(geometry: sphere2)
sphereNode2.position = SCNVector3(x: 0.5, y: 0, z: 0)
self.rootNode.addChildNode(sphereNode2)
//SPHERE 3
let sphere3 = SCNSphere(radius: 0.25)
sphere3.firstMaterial?.diffuse.contents = UIColor.red
let sphereNode3 = SCNNode(geometry: sphere3)
sphereNode3.position = SCNVector3(x: -0.25, y: 1, z: 0)
self.rootNode.addChildNode(sphereNode3)
*/
