//  PrimitiveScene.swift
//  SceneKitTutorial
//  Created by Jacob Dobson on 8/25/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.

/*
	Organize the primitives in a spiral
*/

import UIKit
import SceneKit

class PrimitiveScene: SCNScene {
	//initialize contents of scene
	override init() {
		super.init()
		//array of primitives/geometries
		var geometries = [SCNSphere(radius: 1),
		                  SCNPlane(width: 1.0, height: 1.5),
		                  SCNBox(width: 1.0, height: 1.5, length: 2.0, chamferRadius: 0.0),
		                  SCNPyramid(width: 2.0, height: 1.5, length: 1.0),
		                  SCNCylinder(radius: 1.0, height: 1.5),
		                  SCNCone(topRadius: 0.5, bottomRadius: 1.0, height: 1.5),
		                  SCNTorus(ringRadius: 1.0, pipeRadius: 0.2),
		                  SCNTube(innerRadius: 0.5, outerRadius: 1.0, height: 1.5),
		                  SCNCapsule(capRadius: 0.5, height: 2.0)]
		//make plane visible on both sides
		geometries[1].firstMaterial?.isDoubleSided = true
		//setup position of primitives
		var angle: Float = 0.0
		let radius: Float = 2.0
		let angleIncrement: Float = .pi * 4.0 / Float(geometries.count)// * 4.0 to go around unit circle twice
		var y: Float = 0.0
		//iterate thru geometries array
		for i in 0..<geometries.count {
			//create diff colors based on index
			let hue: CGFloat = CGFloat(i) / CGFloat(geometries.count)
			let color = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
			//increase y to induce spiral position
			//create new node for each geometry
			let geometry = geometries[i]
			geometry.firstMaterial?.diffuse.contents = color
			let node = SCNNode(geometry: geometry)
			//setup/position node
			let x = radius * cos(angle)
			let z = radius * sin(angle)
			node.position = SCNVector3(x: x, y: y, z: z)
			//add node to scene
			self.rootNode.addChildNode(node)
			//move each node by angleIncrement
			angle += angleIncrement
			y += 1.5
		}
	}
	//init w/ coder method
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
