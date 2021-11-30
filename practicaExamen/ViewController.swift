//
//  ViewController.swift
//  practicaExamen
//
//  Created by Mac15 on 20/10/21.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {

    @IBOutlet weak var TF_Username: UITextField!
    @IBOutlet weak var TF_Password: UITextField!
    
    
    @IBOutlet weak var LBL_Login: CLTypingLabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        LBL_Login.text = "Iniciar sesión"
    }

    
    @IBAction func BTN_A_Login(_ sender: UIButton) {
        
        if (TF_Username.text != "" && TF_Password.text != "")
        {
            if let email = TF_Username.text
            {
                if let password = TF_Password.text
                {
                    print(email)
                    print(password)
                    
                    performSegue(withIdentifier: "enviarDatos", sender: nil)
                    TF_Username.text = ""
                    TF_Password.text = ""
                }
            }
            
        } else {
            showNoEmptyFieldsAlert()
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
    
    //OCULTAR TECLADO
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Funcion para mostrar un alert en caso de que exista algùn campo vacío
    func showNoEmptyFieldsAlert ()
    {
        let alerta = UIAlertController(title: "Hubo un problema", message:"No se permiten campos vacíos", preferredStyle: .alert)
        
        let actionAceptar = UIAlertAction(title: "Aceptar", style:.default, handler: nil)
        
        alerta.addAction(actionAceptar)
        
        present(alerta, animated: true, completion: nil)
    }
}

