import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var names = ["Tammy", "Cole"]
        names.removeFirst()
        names.removeFirst()
        let sample = "sample"
        print(sample)
        
        if sample == "sample" {
            print("Will this line of code ever be reached?")
            someMethod()
        }
        
    }
    
    func someMethod() {
        print("You are in some method.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

