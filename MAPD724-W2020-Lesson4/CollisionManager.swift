
import SpriteKit
import GameplayKit

class CollisionManager
{
    public static func squaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat
    {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y

        return Xs * Xs + Ys * Ys
    }
    
    public static func squaredRadiusCheck(object1: GameObject, object2: GameObject) -> Void
    {
        let P1 = object1.position
        let P2 = object2.position
        let P1HalfHeight = object1.height! * 0.5
        let P2HalfHeight = object2.height! * 0.5
        let halfHeights = P1HalfHeight + P2HalfHeight
        
        if(squaredDistance(point1: P1, point2: P2) < halfHeights * halfHeights)
        {
            if(!object2.isColliding!)
            {
                switch object2.name {
                case "island":
                    print("Collision with island")
                    break
                case "cloud":
                    print("Collision with cloud")
                    break
                default:
                    break
                }
                object2.isColliding = true
            }
        }
    }
}
