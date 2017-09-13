//  PrimitiveScene.swift
//  SceneKitTutorial
//  Created by Jacob Dobson on 8/25/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.

/*
	Move Circle upwards
*/

import UIKit
import SceneKit

class PrimitiveScene: SCNScene {
	//initialize contents of scene
	override init() {
		super.init()
		//setup sphere and add to scene
		let sphere = SCNSphere(radius: 0.002)
		sphere.firstMaterial?.diffuse.contents = UIColor.purple
		let sphereNode = SCNNode(geometry: sphere)
		self.rootNode.addChildNode(sphereNode)
		
		let moveUp = SCNAction.moveBy(x: 0, y: 0.002, z: 0, duration: 1)
		let moveDown = SCNAction.moveBy(x: 0, y: -0.002, z: 0, duration: 1)
		let sequence = SCNAction.sequence([moveUp, moveDown])
		let sequenceForever = SCNAction.repeatForever(sequence)
		sphereNode.runAction(sequenceForever)
	}
	//init w/ coder method
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
