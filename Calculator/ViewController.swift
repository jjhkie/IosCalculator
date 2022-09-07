
import UIKit

enum Operation{
    case Add
    case Subtrack
    case Divide
    case Multiply
    case unknown
}


class ViewController: UIViewController {

    @IBOutlet weak var numberOutput: UILabel!
    
    var displayNumber = ""
    var firstOperand = ""
    var secondOperand = ""
    var result = ""
    var currentOperation: Operation = .unknown
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //숫자 키패드를 눌렀을 때 발생하는 이벤트
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let numberValue = sender.title(for: .normal) else { return }
        if self.displayNumber.count < 9 {
            self.displayNumber += numberValue
            self.numberOutput.text = displayNumber
        }
    }
    
    //AC 버튼을 눌렀을 때 발생하는 이벤트
    @IBAction func clearButton(_ sender: UIButton) {
        self.displayNumber = ""
        self.firstOperand = ""
        self.secondOperand = ""
        self.result = ""
        self.currentOperation = .unknown
        self.numberOutput.text = "0 "
    }
    
    // Dot Button Click Event
    @IBAction func tapDotButton(_ sender: Any) {
        if self.displayNumber.count < 8, !self.displayNumber.contains("."){
            self.displayNumber += self.displayNumber.isEmpty ? "0." : "."
            self.numberOutput.text = self.displayNumber
        }
    }
    
    //operator Button
    @IBAction func tapDivideButton(_ sender: UIButton) {
        self.operation(.Divide)
    }
    
    // Multiple Button Event
    @IBAction func tapMultipleButton(_ sender: UIButton) {
        self.operation(.Multiply)
    }
    
    // Subtract Button Event
    @IBAction func tapSubtractButton(_ sender: UIButton) {
        self.operation(.Subtrack)
    }
    
    // Add Button Event
    @IBAction func tapAddButton(_ sender: UIButton) {
        self.operation(.Add)
    }
    
    // Equal Button Event
    @IBAction func tapEqualButton(_ sender: UIButton) {
        self.operation(self.currentOperation)
    }
    
    // Button Event 에서 넘겨받은 값에 따른 실행 Code
    func operation(_ operation: Operation){
        if self.currentOperation != .unknown{
            if !self.displayNumber.isEmpty{
                self.secondOperand = self.displayNumber
                self.displayNumber = ""
                
                guard let firstOperand = Double(self.firstOperand) else {return}
                guard let secondOperand = Double(self.secondOperand) else { return }
                
                switch self.currentOperation {
                case .Add:
                    self.result = "\(firstOperand + secondOperand)"
                case .Subtrack:
                    self.result = "\(firstOperand - secondOperand)"
                case .Divide:
                    self.result = "\(firstOperand / secondOperand)"
                case .Multiply:
                    self.result = "\(firstOperand * secondOperand)"
                default:
                    break
                }
                
                //결과값 부분에 필요없는 소수점을 제거한다. 
                if let result = Double(self.result), result.truncatingRemainder(dividingBy: 1) == 0{
                    self.result = "\(Int(result))"
                }
                
                
                self.firstOperand = self.result
                self.numberOutput.text = self.result
            }
            self.currentOperation = operation
        } else{
            self.firstOperand = self.displayNumber
            self.currentOperation = operation
            self.displayNumber = ""
        }
    }
}


