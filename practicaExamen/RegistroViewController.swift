//
//  RegistroViewController.swift
//  practicaExamen
//
//  Created by Mac4 on 29/11/21.
//

import UIKit
import CLTypingLabel

class RegistroViewController: UIViewController {
    @IBOutlet weak var LBL_Registro: CLTypingLabel!
    
    @IBOutlet weak var TF_NombreUsuario: UITextField!
    @IBOutlet weak var TF_Email: UITextField!
    @IBOutlet weak var TF_Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        LBL_Registro.text = "Registro"
    }
    
    @IBAction func BTN_A_Registrar(_ sender: UIButton) {
        
        if (TF_NombreUsuario.text != "" && TF_Password.text != "" && TF_Email.text != "")
        {
            if let username = TF_NombreUsuario.text
            {
                if let email = TF_Email.text
                {
                    if let password = TF_Password.text
                    {
                        print(username)
                        print(email)
                        print(password)
                        
                        TF_NombreUsuario.text = ""
                        TF_Email.text = ""
                        TF_Password.text = ""
                        
                        showRegisterCompleteAlert()
                    }
                }
            }
            
        } else {
            showNoEmptyFieldsAlert()
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
    
    //Funcion para mostrar un alert en caso de que el registro se haya completado
    func showRegisterCompleteAlert ()
    {
        let alerta = UIAlertController(title: "Completado", message:"Usuario registrado exitosamente", preferredStyle: .alert)
        
        let actionAceptar = UIAlertAction(title: "Aceptar", style: .default) { (_) in
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        alerta.addAction(actionAceptar)
        
        present(alerta, animated: true, completion: nil)
    }
    

}
