//  PrimitiveScene.swift
//  SceneKitTutorial
//  Created by Jacob Dobson on 8/25/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.

/*
	-- Make a triangle out of spheres
	-- Make the spheres tangent to each other

	* Hint * Increase the y-coordinate at each step sqrt(3) --> height of equilateral triangle
		https://camo.githubusercontent.com/76f62e282f21730fb94f178acb9443957d42e052/687474703a2f2f7777772e7765686561727473776966742e636f6d2f77702d636f6e74656e742f75706c6f6164732f323031342f31302f657175696c61746572616c2d747269616e676c652e706e67
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
			var x: Float = Float(radius) * Float(row)
			for column in row..<xCount {
				let sphere = SCNSphere(radius: radius)
				//color spheres based on row/column
				if ((row + column) % 2 == 0) {
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
			y += sqrt(3) * Float(radius)
		}
	}
	//init w/ coder method
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
