//  PrimitiveScene.swift
//  SceneKitTutorial
//  Created by Jacob Dobson on 8/25/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.

/*
	-- Make a 7x7x7 cube out of spheres
	-- Alternate each level of the cube with red and green
	
	BONUS: Don’t add any spheres inside the cube
*/

import UIKit
import SceneKit

class PrimitiveScene: SCNScene {
	//initialize contents of scene
	override init() {
		super.init()
		//array of primitives/geometries
		var geometries = [SCNSphere(radius: 2),
		                  SCNPlane(width: 1.0, height: 1.5),
		                  SCNBox(width: 1.0, height: 1.5, length: 2.0, chamferRadius: 0.0),
		                  SCNPyramid(width: 2.0, height: 1.5, length: 1.0),
		                  SCNCylinder(radius: 1.0, height: 1.5),
		                  SCNCone(topRadius: 0.5, bottomRadius: 1.0, height: 1.5),
		                  SCNTorus(ringRadius: 1.0, pipeRadius: 0.2),
		                  SCNTube(innerRadius: 0.5, outerRadius: 1.0, height: 1.5),
		                  SCNCapsule(capRadius: 0.5, height: 2.0)]
		//setup x to move items along x-axis easily with each iteration
		var x: Float = 0.0
		//iterate thru geometries array
		for i in 0..<geometries.count {
			//create diff colors based on index
			let hue: CGFloat = CGFloat(i) / CGFloat(geometries.count)
			let color = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
			//create new node for each geometry
			let geometry = geometries[i]
			geometry.firstMaterial?.diffuse.contents = color
			let node = SCNNode(geometry: geometry)
			node.position = SCNVector3(x: x, y: 0, z: 0)
			//add node to scene
			self.rootNode.addChildNode(node)
			//move each node by 2.5 on the x-axis
			x += 2.5
		}
	}
	//init w/ coder method
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
