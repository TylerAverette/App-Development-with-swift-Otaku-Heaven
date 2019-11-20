//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    
    @IBOutlet var widthConastraint: NSLayoutConstraint!
    
    override func loadView() {
        
        let liveViewFrame = CGRect(x: 0, y: 0, width: 500, height: 500)
        let liveView = UIView(frame: liveViewFrame)
        let smallFrame = CGRect(x: 50, y: 50, width: 100, height: 100)
        let square = UIView(frame: smallFrame)
        let anchorSquare = CGRect(x: 10, y: 10 , width: 10, height: 10)
        let anchorSquareView = UIView(frame: anchorSquare)
        anchorSquareView.backgroundColor = .darkGray
        square.backgroundColor = .purple
        
////        Using Animations
//        UIView.animate(withDuration: 3.0){
//            square.backgroundColor = .orange
//            square.frame = CGRect(x: 600, y: 600, width: 200, height: 200)
//        }
//        UIView.animate(withDuration: 3.0){
//            square.center = liveView.center
//            square.backgroundColor = .blue
//        }
//        UIView.animate(withDuration: 10.0){
//            square.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//            square.backgroundColor = .darkGray
//        }
//
////        Chaining animations with breaks
//        UIView.animate(withDuration:   3, animations: {
//            square.backgroundColor = .orange
//            square.frame = CGRect(x: 600, y: 600, width: 200, height: 200)
//        },completion: { bool in
//            UIView.animate(withDuration:   3, animations: {
//            square.center = liveView.center
//            square.backgroundColor = .blue
//            },completion: { bool in
//                UIView.animate(withDuration:   3, animations: {
//                square.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//                square.backgroundColor = .darkGray
//                })
//                { bool in  }
//            })
//        })
////         Loop animations
//        UIView.animate(withDuration: 3.0, delay: 2.0, options: [.repeat], animations: {
//            square.backgroundColor = .red
//            square.frame = CGRect(x: 400, y: 400, width: 100, height: 100)
//        }, completion: nil)
        
        let rotateTransform1 = CGAffineTransform(rotationAngle: .pi*1.5)
        let scaleTransform1 = CGAffineTransform(scaleX: 1.5, y: 1.5)
        let translateTransform1 = CGAffineTransform(translationX: 50, y: 50)
        let comboTransform1 = scaleTransform1.concatenating(rotateTransform1).concatenating(translateTransform1)

        
        let rotateTransform = CGAffineTransform(rotationAngle: .pi)
        let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        let translateTransform = CGAffineTransform(translationX: 200, y: 200)
        let comboTransform = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)
        UIView.animate(withDuration: 2.0, animations: {
            square.backgroundColor = .orange
            square.transform = comboTransform1
        }, completion:  {bool in
            UIView.animate(withDuration: 2.0, animations: {
                square.transform = comboTransform //CGAffineTransform.identity // undoes any animation
            })
        })
        
        square.addSubview(anchorSquareView)
        liveView.addSubview(square)
        liveView.backgroundColor = .yellow
        
        PlaygroundPage.current.liveView = liveView

    }
    
//    @IBAction func buttonTapped(_ sender: UIButton){
//        widthConastraint.constant = 320
//
//        UIView.animate(withDuration: 0.5){
//            self.view.layoutIfNeeded()
//        }
//    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
