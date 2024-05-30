//
//  ChoiceViewController.swift
//  TestTendable
//
//  Created by Suprabha Dhavan on 30/05/24.
//

import UIKit


class ChoiceViewController: UIViewController,UITextFieldDelegate {
    var areas:[Area] = []
    var categorys:[Category] = []
    var inspections:[Inspection] = []
    var questions:[Question] = []
    @IBOutlet weak var areaTextField: UITextField!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var inspectionTextField: UITextField!
    @IBOutlet weak var questionTextField: UITextField!
    private let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getArea()
        getCategory()
        getInspection()
        getQuestion()
        // Do any additional setup after loading the view.
    }
    func getArea()  {
        networkManager.getAreas { result in
            switch result {
            case .success(let areas):
                /// if the data is retrieved
                DispatchQueue.main.async { [self] in
                    self.areas = areas
                    areaTextField.text = areas.description
                }
            case .failure(let error):
                // if not
                print(error.localizedDescription)
            }
        }
    }
    func getCategory()  {
        networkManager.getCategorys { result in
            switch result {
            case .success(let categorys):
                /// if the data is retrieved
                DispatchQueue.main.async { [self] in
                    self.categorys = categorys
                    categoryTextField.text = categorys.description
                }
            case .failure(let error):
                // if not
                print(error.localizedDescription)
            }
        }
    }
    func getInspection()  {
        networkManager.getInspections { result in
            switch result {
            case .success(let inspections):
                /// if the data is retrieved
                DispatchQueue.main.async { [self] in
                    self.inspections = inspections
                    inspectionTextField.text = inspections.description
                }
            case .failure(let error):
                // if not
                print(error.localizedDescription)
            }
        }
    }
    func getQuestion()  {
        networkManager.getQuestions { result in
            switch result {
            case .success(let questions):
                /// if the data is retrieved
                DispatchQueue.main.async { [self] in
                    self.questions = questions
                    questionTextField.text = questions.description
                }
            case .failure(let error):
                // if not
                print(error.localizedDescription)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
