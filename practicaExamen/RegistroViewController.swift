//
//  RegistroViewController.swift
//  practicaExamen
//
//  Created by Mac4 on 29/11/21.
//

import UIKit
import CLTypingLabel
import FirebaseAuth
import Firebase

class RegistroViewController: UIViewController {
    @IBOutlet weak var LBL_Registro: CLTypingLabel!
    
    @IBOutlet weak var TF_Email: UITextField!
    @IBOutlet weak var TF_Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        LBL_Registro.text = "Registro"
    }
    
    @IBAction func BTN_A_Registrar(_ sender: UIButton) {
        
        if (TF_Password.text != "" && TF_Email.text != "")
        {
                if let email = TF_Email.text
                {
                    if let password = TF_Password.text
                    {
                        /*print(username)
                        print(email)
                        print(password)*/
                        
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                          if let e = error
                          {
                            print("Error al crear el usuario: \(e.localizedDescription)")
                            let error = "\(e.localizedDescription)"
                            
                            if error == "The email address is already in use by another account."
                            {
                                self.showFirebaseErrorAlert(mensaje: "El correo ya está en uso por otra cuenta")
                            } else if error == "The email address is badly formatted."
                            {
                                self.showFirebaseErrorAlert(mensaje: "El correo está en un formato erróneo")
                            } else if error == "The password must be 6 characters long or more."
                            {
                                self.showFirebaseErrorAlert(mensaje: "La contraseña debe tener mínimo 6 caracteres")
                            } else {
                                self.showFirebaseErrorAlert(mensaje: error)
                            }

                            

                          } else
                          {
                            self.TF_Email.text = ""
                            self.TF_Password.text = ""
                            self.showRegisterCompleteAlert()
                          }
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
    
    //Funcion para mostrar un alert en caso de que la contraseña sea menor a 6 caracteres
    func showNoEmptyFieldsAlert ()
    {
        let alerta = UIAlertController(title: "Hubo un problema", message:"No se permiten campos vacíos", preferredStyle: .alert)
        
        let actionAceptar = UIAlertAction(title: "Aceptar", style:.default, handler: nil)
        
        alerta.addAction(actionAceptar)
        
        present(alerta, animated: true, completion: nil)
    }
    
    //Funcion para mostrar un alert en caso de que exista un error de Firebase
    func showFirebaseErrorAlert (mensaje:String)
    {
        let alerta = UIAlertController(title: "Hubo un problema", message:mensaje, preferredStyle: .alert)
        
        let actionAceptar = UIAlertAction(title: "Aceptar", style:.default, handler: nil)
        
        alerta.addAction(actionAceptar)
        
        present(alerta, animated: true, completion: nil)
    }
    
    //Funcion para mostrar un alert en caso de que el registro se haya completado
    func showRegisterCompleteAlert ()
    {
        let alerta = UIAlertController(title: "Completado", message:"Usuario registrado exitosamente", preferredStyle: .alert)
        
        let actionAceptar = UIAlertAction(title: "Aceptar", style: .default) { (_) in
            self.TF_Password.text = ""
            self.performSegue(withIdentifier: "usuarioRegistrado", sender: self)
        }
        
        alerta.addAction(actionAceptar)
        
        present(alerta, animated: true, completion: nil)
    }
    

}
