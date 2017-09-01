//  PrimitiveScene.swift
//  SceneKitTutorial
//  Created by Jacob Dobson on 8/25/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.

/*
	-- Make a 20x20 tangent grid
	-- Assume that each sphere has a row and column number from 0 to 19
	-- Use the formula sphereColor = i & j != 0 ? UIColor.purpleColor() : UIColor.orangeColor()
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
				//color spheres based on row/column
				sphere.firstMaterial?.diffuse.contents = row & column != 0 ? UIColor.green : UIColor.red
				print(row, column)
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
