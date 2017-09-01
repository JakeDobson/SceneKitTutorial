//  PrimitiveScene.swift
//  SceneKitTutorial
//  Created by Jacob Dobson on 8/25/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.

/*
	-- Make a grid of 20×20 spheres of radius 0.1 in the XY plane
	-- Make each sphere tangent to it’s neighbors
	-- Color the spheres in a grid pattern with orange and purple
*/

import UIKit
import SceneKit

class PrimitiveScene: SCNScene {
	//initialize contents of scene
	override init() {
		super.init()
		//variables
		var y: Float = 0.0
		let radius: CGFloat = 0.1
		let xCount = 20
		let yCount = 20
		//create 20 spheres in for loop using an index
		for row in 0..<yCount {
			var x: Float = 0.0
			for column in 0..<xCount {
				let sphere = SCNSphere(radius: radius)
				//color sphere green if index is odd, red if index is even
				if (row + column) % 2 == 0 {
					print(row + column)
					sphere.firstMaterial?.diffuse.contents = UIColor.green
				} else {
					sphere.firstMaterial?.diffuse.contents = UIColor.red
				}
				//set node and position
				let sphereNode = SCNNode(geometry: sphere)
				sphereNode.position = SCNVector3(x: x, y: y, z: 0)
				//add node to scene
				self.rootNode.addChildNode(sphereNode)
				//distance b/w spheres
				x += Float(radius)*2
			}
			y += Float(radius)*2
		}
	}
	//init w/ coder method
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
