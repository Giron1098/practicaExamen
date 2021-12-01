//
//  ViewController.swift
//  practicaExamen
//
//  Created by Mac15 on 20/10/21.
//

import UIKit
import CLTypingLabel
import FirebaseAuth
import Firebase

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
                    /*print(email)
                    print(password)*/
                    
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                      if let e = error
                      {
                        let error = "\(e.localizedDescription)"
                        
                        print("Error al iniciar sesión: \(error)")
                        if error == "The email address is badly formatted."
                        {
                            self.showFirebaseErrorAlert(mensaje: "El correo está en un formato erróneo")
                        } else if error == "There is no user record corresponding to this identifier. The user may have been deleted."
                        {
                            self.showFirebaseErrorAlert(mensaje: "Usuario no encontrado")
                        } else if error == "The password is invalid or the user does not have a password."
                        {
                            self.showFirebaseErrorAlert(mensaje: "La contraseña es incorrecta o el usuario no tiene contraseña")
                        } else
                        {
                            self.showFirebaseErrorAlert(mensaje: error)
                        }
                      } else
                      {
                        self.performSegue(withIdentifier: "enviarDatos", sender: self)
                        self.TF_Username.text = ""
                        self.TF_Password.text = ""
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
    
    //Funcion para mostrar un alert en caso de que exista algùn campo vacío
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
}

