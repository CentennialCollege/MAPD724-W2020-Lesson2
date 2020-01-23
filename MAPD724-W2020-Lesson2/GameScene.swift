
import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?

class GameScene: SKScene {
    
    var oceanSprite1: Ocean?
    var oceanSprite2: Ocean?
    var planeSprite: Plane?
    var islandSprite: Island?
    var cloudSprites: [Cloud] = []
    
    
    override func didMove(to view: SKView)
    {
        screenWidth = frame.width
        screenHeight = frame.height
        
        // add ocean
        self.oceanSprite1 = Ocean()
        self.oceanSprite1?.position = CGPoint(x: 0, y: 1864.67)
        self.addChild(oceanSprite1!)
        
        self.oceanSprite2 = Ocean()
        self.oceanSprite2?.position = CGPoint(x: 0, y: 177)
        self.addChild(oceanSprite2!)
        
        // add plane
        self.planeSprite = Plane()
        self.planeSprite?.position = CGPoint(x: 0, y: -575)
        self.addChild(planeSprite!)
        
        // add island
        self.islandSprite = Island()
        self.addChild(islandSprite!)
        
        // add clouds
        for index in 0...3
        {
            let cloud: Cloud = Cloud()
            cloudSprites.append(cloud)
            self.addChild(cloudSprites[index])
        }
    }
    
    func touchDown(atPoint pos : CGPoint)
    {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: -575))
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: -575))
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        self.planeSprite?.TouchMove(newPos: CGPoint(x: pos.x, y: -575))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchDown(atPoint: t.location(in: self))}
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self))}
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self))}
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self))}
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        self.oceanSprite1?.Update()
        self.oceanSprite2?.Update()
        
        self.planeSprite?.Update()
        self.islandSprite?.Update()
        
        for cloud in cloudSprites
        {
            cloud.Update()
        }
    }
}
