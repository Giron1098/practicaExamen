//
//  MostrarDatosViewController.swift
//  practicaExamen
//
//  Created by Mac15 on 20/10/21.
//

import UIKit
import FirebaseAuth
import Firebase

class MostrarDatosViewController: UIViewController {
    

    @IBOutlet weak var LBL_Mensaje: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        //Guardamos los datos del usuario logueado correctamente
        if let email = Auth.auth().currentUser?.email
        {
            let defaults = UserDefaults.standard
            defaults.set(email,forKey: "correo")
            defaults.synchronize()
        }
        let defaults = UserDefaults.standard
        
        LBL_Mensaje.text = "Bienvenido usuario, tu correo es: \(defaults.value(forKey: "correo") as? String ?? "")"
        
    }
    
    @IBAction func BTN_A_CerrarSesión(_ sender: UIBarButtonItem) {
        
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        
        //Eliminamos los datos de inicio de sesión que habíamos guardado
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "correo")
        defaults.synchronize()
        
        print("Cierre de sesión realizado correctamente")
        navigationController?.popToRootViewController(animated: true)
    } catch let error as NSError {
        print("Error signing out: \(error.localizedDescription)")
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
