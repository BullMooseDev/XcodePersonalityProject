
import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    // init? coder needed the required init below it to remove error messages
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]){
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // comment above in regards to response init ends here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    func calculatePersonalityResult(){
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in counts[answer.type, default: 0] += 1
        }
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {(pair1, pair2) in return pair1.value > pair2.value})
        
        let mostcommonAnswer = frequentAnswersSorted.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostcommonAnswer.rawValue)!"
        resultDefinitionLabel.text = mostcommonAnswer.definition
    }
}
