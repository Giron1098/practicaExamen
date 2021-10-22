//
//  ViewController.swift
//  practicaExamen
//
//  Created by Mac15 on 20/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BTN_RedesSociales: UIButton!
    
    @IBOutlet weak var TF_Username: UITextField!
    @IBOutlet weak var TF_Password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func BTN_A_RedesSociales(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "")
    }
    
    @IBAction func BTN_A_Login(_ sender: UIButton) {
        
        if (TF_Username.text != "" && TF_Password.text != "")
        {
            performSegue(withIdentifier: "enviarDatos", sender: nil)
            TF_Username.text = ""
            TF_Password.text = ""
            
        } else {
            print("Falta por llenar algún campo")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    if segue.identifier == "enviarDatos"
    {
        let objDestino = segue.destination as! MostrarDatosViewController
                
        objDestino.nombreUsuario = TF_Username.text!
        objDestino.password = TF_Password.text!
                
    }

        
    }
}

