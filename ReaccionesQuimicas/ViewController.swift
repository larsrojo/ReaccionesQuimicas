//
//  ViewController.swift
//  ReaccionesQuimicas
//
//  Created by Luis Alfonso Rojo Sánchez on 05/04/18.
//  Copyright © 2018 Luis Alfonso Rojo Sánchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /* Variables de los outlets */
    @IBOutlet weak var botonFermentacion: UIButton!
    @IBOutlet weak var botonRespiracion: UIButton!
    @IBOutlet weak var botonGasolina: UIButton!
    @IBOutlet weak var botonGasCocina: UIButton!
    
    @IBOutlet weak var viewOxigeno: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Reacciones Químicas";
        cargarOxigeno();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  Función para cargar la imágen del oxígeno
    func cargarOxigeno(){
        let imageUrlString = "https://st.depositphotos.com/1711722/5128/i/950/depositphotos_51289779-stock-photo-oxygen-o2-molecular-structure-isolated.jpg";
        let imageUrl = URL(string: imageUrlString)!
        let imageData = try! Data(contentsOf: imageUrl)
        let imagenTemporal = UIImage(data: imageData)
        viewOxigeno.image = imagenTemporal
    }
    
    func alertaReaccionCreada(reaccionRecibida : String) {
        
        if(reaccionRecibida == "Fermentacion"){
            
            let alerta = UIAlertController(title: "¡Reacción creada!", message: "Haz creado la reacción de fermentación.", preferredStyle: .alert);
            let accion = UIAlertAction(title: "Ver reacción", style: .default);
            alerta.addAction(accion);
            present(alerta, animated: true, completion: nil);
            
        }else if(reaccionRecibida == "Respiracion"){
            
            let alerta = UIAlertController(title: "¡Reacción creada!", message: "Haz creado la reacción de respiración.", preferredStyle: .alert);
            let accion = UIAlertAction(title: "Ver reacción", style: .default);
            alerta.addAction(accion);
            present(alerta, animated: true, completion: nil);
            
        }else if(reaccionRecibida == "CombustibilidadGasolina"){
            
            let alerta = UIAlertController(title: "¡Reacción creada!", message: "Haz creado la reacción de la combustión de la gasolina.", preferredStyle: .alert);
            let accion = UIAlertAction(title: "Ver reacción", style: .default);
            alerta.addAction(accion);
            present(alerta, animated: true, completion: nil);
            
        }else if(reaccionRecibida == "CombustibilidadGasDeCocinaButano"){
            
            let alerta = UIAlertController(title: "¡Reacción creada!", message: "Haz creado la reacción del gas de cocina.", preferredStyle: .alert);
            let accion = UIAlertAction(title: "Ver reacción", style: .default);
            alerta.addAction(accion);
            present(alerta, animated: true, completion: nil);
            
        }
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "fermentacion"){
            //alertaReaccionCreada(reaccionRecibida: "Fermentacion");
            let vistaReacciones = segue.destination as! ViewController2;
            vistaReacciones.reaccionRecibida = "Fermentacion";
            
        }else if(segue.identifier == "respiracion"){
            //alertaReaccionCreada(reaccionRecibida: "Respiracion");
            let vistaReacciones = segue.destination as! ViewController2;
            vistaReacciones.reaccionRecibida = "Respiracion";
            
        }else if(segue.identifier == "gasolina"){
            //alertaReaccionCreada(reaccionRecibida: "CombustibilidadGasolina");
            let vistaReacciones = segue.destination as! ViewController2;
            vistaReacciones.reaccionRecibida = "CombustibilidadGasolina";
            
        }else if(segue.identifier == "gasDeCocina"){
            //alertaReaccionCreada(reaccionRecibida: "CombustibilidadGasDeCocinaButano");
            let vistaReacciones = segue.destination as! ViewController2;
            vistaReacciones.reaccionRecibida = "CombustibilidadGasDeCocinaButano";
        }
        
     }
}
