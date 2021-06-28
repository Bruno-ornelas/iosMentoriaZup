//
//  ViewController.swift
//  Busca Herois
//
//  Created by Bruno Ornelas on 17/06/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    
    //lazy roda depois da inicialização
    lazy var containerView: UIView = {
        let view = UIView(frame: CGRect(x: 0 , y: 0, width: 100, height: 100))
        view.backgroundColor = .red
        
        return view
    }()//roda uma vez

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(containerView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        tfName.resignFirstResponder()
        let vc = segue.destination as! HeroesTableViewController
        vc.name = tfName.text
    }

}



























