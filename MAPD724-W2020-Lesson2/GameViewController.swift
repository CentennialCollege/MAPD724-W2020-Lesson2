//
//  GameViewController.swift
//  MAPD724-W2020-Lesson2
//
//  Created by Tom Tsiliopoulos on 2020-01-15.
//  Copyright © 2020 CentennialCollege. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController, GameManager {
    
    

    @IBOutlet weak var StartButtonOutlet: UIButton!
    
    @IBOutlet weak var BackButtonOutlet: UIButton!
    
    
    var currentScene: SKScene?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        BackButtonOutlet.isHidden = true
        SetScene(sceneName: "StartScene")
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func SetScene(sceneName: String)
    {
        if let view = self.view as! SKView?
        {
            // Load the SKScene from 'GameScene.sks'
            currentScene = SKScene(fileNamed: sceneName)
            
            if let gameScene = currentScene as? GameScene
            {
                gameScene.gameManager = self
            }
            
            // Set the scale mode to scale to fit the window
            currentScene?.scaleMode = .aspectFill
                
            // Present the scene
            view.presentScene(currentScene)
            
            
            view.ignoresSiblingOrder = true
        
        }
    }
    
    func PresentStartScene() {
        StartButtonOutlet.isHidden = false
    }
    
    func PresentEndScene() {
        BackButtonOutlet.isHidden = false
        SetScene(sceneName: "EndScene")
    }
    
    
    @IBAction func StartButton_Press(_ sender: Any)
    {
        StartButtonOutlet.isHidden = true
        SetScene(sceneName: "GameScene")
        
    }
    
    @IBAction func BackButton_Press(_ sender: Any)
    {
        BackButtonOutlet.isHidden = true
        SetScene(sceneName: "GameScene")
    }
    
    
}
