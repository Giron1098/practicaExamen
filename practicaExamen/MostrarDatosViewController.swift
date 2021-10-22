//
//  MostrarDatosViewController.swift
//  practicaExamen
//
//  Created by Mac15 on 20/10/21.
//

import UIKit

class MostrarDatosViewController: UIViewController {
    
    var nombreUsuario:String?
    var password:String?

    @IBOutlet weak var LBL_Mensaje: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if nombreUsuario != "" || password != ""
        {
            LBL_Mensaje.text = "Hola, \(nombreUsuario ?? "a"). Bienvenido."
            print("Contraseña del usuario: \(password ?? "b")")
            
        } else {
            print("No hay datos")
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
