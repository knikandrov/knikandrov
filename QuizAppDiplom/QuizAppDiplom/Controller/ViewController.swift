//
//  ViewController.swift
//  QuizAppDiplom
//
//  Created by Konstantin Nikandrov on 08/02/2019.
//  Copyright © 2019 Konstantin Nikandrov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var QuestionCount: UILabel!
    @IBOutlet weak var ScoreCount: UILabel!
    @IBOutlet weak var ProgressView: UIView!
    @IBOutlet weak var QuestionView: UILabel!
    //Buttons
    @IBOutlet weak var Answer1: UIButton!
    @IBOutlet weak var Answer2: UIButton!
    @IBOutlet weak var Answer3: UIButton!
    @IBOutlet weak var Answer4: UIButton!
    
    let allQuestions = QuestionStorage()
    var questionNumber: Int = 0
    var score: Int = 0
    var SelectedAnswer: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateQuestion()
        updateUI()

        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func AnswerAction(_ sender: UIButton) {
        print(String(sender.tag))
        if sender.tag == SelectedAnswer{
            print("correct")
            score += 1
        }else {
            print("wrong")
        }
        questionNumber += 1
        UpdateQuestion()
    }
    
    func UpdateQuestion(){
        if  questionNumber <= allQuestions.list.count - 1 {
            QuestionView.text = allQuestions.list[questionNumber].question
            Answer1.setTitle(allQuestions.list[questionNumber].Answer1, for: UIControl.State.normal)
            Answer2.setTitle(allQuestions.list[questionNumber].Answer2, for: UIControl.State.normal)
            Answer3.setTitle(allQuestions.list[questionNumber].Answer3, for: UIControl.State.normal)
            Answer4.setTitle(allQuestions.list[questionNumber].Answer4, for: UIControl.State.normal)
            SelectedAnswer = allQuestions.list[questionNumber].CorrectAnswer
        } else if score < allQuestions.list.count {
            let alert = UIAlertController(title:"Вы не справились, правильных ответов: \(score)", message: "Хотите начать сначала?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: " Заново", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        } else
        {
            let alert = UIAlertController(title:"Восхитительно", message: "Хотите начать сначала?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: " Заново", style: .default, handler: {action in self.restartQuiz()})
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        }
        
        updateUI()

    }
    
    func updateUI(){
        ScoreCount.text = "Правильных ответов: \(score)"
        QuestionCount.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        ProgressView.frame.size.width = (view.frame.size.width / CGFloat(allQuestions.list.count)) * CGFloat(questionNumber + 1)
        
    }
    
    func restartQuiz(){
        score = 0
        questionNumber = 0
        UpdateQuestion()
        
        
    }
    

}
