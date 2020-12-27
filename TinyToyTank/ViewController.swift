//
//  ViewController.swift
//  TinyToyTank
//
//  Created by nju on 2020/12/27.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    var tankAnchor: TinyToyTank._TinyToyTank?
    var isActionPlaying: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        tankAnchor = try! TinyToyTank.load_TinyToyTank()
        arView.scene.anchors.append(tankAnchor!)
        
        tankAnchor!.cannon?.setParent(tankAnchor!.tank,preservingWorldTransform:true)
        tankAnchor?.actions.actionComplete.onAction = { _ in self.isActionPlaying = false}
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
    }
    
    @IBAction func TurretLeftPressed(_ sender: Any) {
        if self.isActionPlaying {return}
        else {self.isActionPlaying = true}
        tankAnchor!.notifications.turretLeft.post()
    }
    
    @IBAction func TurretRightPressed(_ sender: Any) {
        if self.isActionPlaying {return}
        else {self.isActionPlaying = true}
        tankAnchor!.notifications.turretRight.post()
    }
    
    @IBAction func TankLeftPressed(_ sender: Any) {
        if self.isActionPlaying {return}
        else {self.isActionPlaying = true}
        tankAnchor!.notifications.tankLeft.post()
    }
    
    @IBAction func TankRightPressed(_ sender: Any) {
        if self.isActionPlaying {return}
        else {self.isActionPlaying = true}
        tankAnchor!.notifications.tankRight.post()
    }
    
    @IBAction func TankForwardPressed(_ sender: Any) {
        if self.isActionPlaying {return}
        else {self.isActionPlaying = true}
        tankAnchor!.notifications.tankForward.post()
    }
   
    @IBAction func ConnonFirePressed(_ sender: Any) {
        if self.isActionPlaying {return}
        else {self.isActionPlaying = true}
        tankAnchor!.notifications.cannonFire.post()
    }
}
