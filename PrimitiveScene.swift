//  PrimitiveScene.swift
//  SceneKitTutorial
//  Created by Jacob Dobson on 8/25/17.
//  Copyright © 2017 Jacob Dobson. All rights reserved.

/*
	We’ll be using polar coordinates to arrange our primitives in the XZ plane.
	A radius of 4 is great for nicely arranging the primitives.
	We’ll be starting the angle off at 0 and incrementing it by 2π / geometries.count so that the primitives are positioned uniform along the circle.
	We have to convert from polar coordinates to x,z coordinates when actually setting the position of the primitive.
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
		let radius: Float = 4.0
		let angleIncrement: Float = .pi * 2.0 / Float(geometries.count)
		//iterate thru geometries array
		for i in 0..<geometries.count {
			//create diff colors based on index
			let hue: CGFloat = CGFloat(i) / CGFloat(geometries.count)
			let color = UIColor(hue: hue, saturation: 1, brightness: 1, alpha: 1)
			//create new node for each geometry
			let geometry = geometries[i]
			geometry.firstMaterial?.diffuse.contents = color
			let node = SCNNode(geometry: geometry)
			let x = radius * cos(angle)
			let z = radius * sin(angle)
			node.position = SCNVector3(x: x, y: 0, z: z)
			//add node to scene
			self.rootNode.addChildNode(node)
			//move each node by angleIncrement
			angle += angleIncrement
		}
	}
	//init w/ coder method
	required init(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
