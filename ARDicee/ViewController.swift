//
//  ViewController.swift
//  ARDicee
//
//  Created by Ananth S on 17/01/2021.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        let sphere = SCNSphere(radius: 0.2)
        
        let material = SCNMaterial()
        material.diffuse.contents  = UIColor.red
        cube.materials = [material]
        
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/8k_moon.jpg")
        sphere.materials = [sphereMaterial]
        
        
        let node = SCNNode()
        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        node.geometry = cube
        
        let node2 = SCNNode()
        node2.position = SCNVector3(x: 0.1, y: 0.21, z: -0.6)
        node2.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.scene.rootNode.addChildNode(node2)

        sceneView.autoenablesDefaultLighting = true
        
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        //sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        //ARSessionConfiguration.
        
        print("Session is supported: \(ARConfiguration.isSupported)")
        print("World Tracking is supported: \(ARWorldTrackingConfiguration.isSupported)")
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

 
}
