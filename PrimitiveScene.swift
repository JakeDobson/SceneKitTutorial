//  PrimitiveScene.swift
//  SceneKitTutorial
//  Created by Jacob Dobson on 8/25/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.

/*
	Draw a flight of 20 stairs
	Alternate b/w 3 stair colors while keeping color sequence
*/

import UIKit
import SceneKit

class PrimitiveScene: SCNScene {
	//initialize contents of scene
	override init() {
		super.init()
		//constants
		let numStairs = 20
		let stairWidth: CGFloat = 1
		let stairHeight: CGFloat = 0.2
		let stairLength: CGFloat = 0.5
		//vars
		var y: Float = 0.0
		var z: Float = 0.0
		//iterate to setup stairs and add to scene
		for i in 0..<numStairs {
			let stair = SCNBox(width: stairWidth, height: stairHeight, length: stairLength, chamferRadius: 0)
			let stairNode = SCNNode(geometry: stair)
			//each stair gets one of 3 colors
			if i % 3 == 0 {
				stairNode.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
			} else if i % 3 == 1 {
				stairNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green
			} else {
				stairNode.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
			}
			
			stairNode.position = SCNVector3(x: 0, y: y, z: z)
			
			y += Float(stairHeight)
			z += Float(stairLength)
			
			self.rootNode.addChildNode(stairNode)
		}
	}
	//init w/ coder method
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
