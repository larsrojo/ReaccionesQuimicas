//
//  ViewController2.swift
//  ReaccionesQuimicas
//
//  Created by Luis Alfonso Rojo Sánchez on 24/04/18.
//  Copyright © 2018 Luis Alfonso Rojo Sánchez. All rights reserved.
//

import UIKit
import Foundation

class ViewController2: UIViewController {
    
    var elemento1 = "";
    var elemento2 = "";
    var elemento3 = "";
    var elemento4 = "";
    
    var informacionAdicional = "";
    
    struct Reaccion : Decodable {
        let NombreReaccion : String;
        var Componentes = [String : String]();
        let Informacion : String;
        let Fuente : String;
        let Imagen : String;
    }
    
    /*
     NombreReaccion
     Componentes
     Informacion
     Fuente
     Imagen
     */
    var reacciones = [Reaccion]()
    
    var reaccionRecibida = "";
    
    /*-------------------------------------------------------------------*/
    /*---------COMPONENTES PARA LA INFORMACIÓN DEL ARCHIVO JSON----------*/
    /*-------------------------------------------------------------------*/
    //Imágen de la reacción
    @IBOutlet weak var imagenDeLaReaccion: UIImageView!
    
    //Componentes de la reacción
    /*
    @IBOutlet weak var labelComponente1: UILabel!
    @IBOutlet weak var labelComponente2: UILabel!
    @IBOutlet weak var labelComponente3: UILabel!
    @IBOutlet weak var labelComponente4: UILabel!
     */
    
    @IBOutlet weak var botonComponente1: UIButton!
    @IBOutlet weak var botonComponente2: UIButton!
    @IBOutlet weak var botonComponente3: UIButton!
    @IBOutlet weak var botonComponente4: UIButton!
    
    //Información de la reacción
    @IBOutlet weak var textViewInformacionDeLaReaccion: UITextView!
    
    //Sitio web con información adicional
    @IBOutlet weak var botonIformacionAdicional: UIButton!
    /*-----------------------------------------------------------*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //alertaReaccionCreada();
        cargarTituloDeLaVista();
        cargarInformacionJSON();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func cargarTituloDeLaVista () {
        if(reaccionRecibida == "Fermentacion"){
            //labelTituloReaccion.text = "Fermentación del alcohol";
            self.title = "Fermentación del alcohol";
            botonIformacionAdicional.setTitle("Ver más sobre fermentación alcohólica", for: .normal);
        }else if(reaccionRecibida == "Respiracion"){
            //labelTituloReaccion.text = "Respiración humana";
            self.title = "Respiración humana";
            botonIformacionAdicional.setTitle("Ver más sobre respiración humana", for: .normal);
        }else if(reaccionRecibida == "CombustibilidadGasolina"){
            //labelTituloReaccion.text = "Combustión de la gasolina";
            self.title = "Combustión de la gasolina";
            botonIformacionAdicional.setTitle("Ver más sobre combustión de la gasolina", for: .normal);
        }else if(reaccionRecibida == "CombustibilidadGasDeCocinaButano"){
            //labelTituloReaccion.text = "Combustión de gas de cocina";
            self.title = "Combustión de gas de cocina";
            botonIformacionAdicional.setTitle("Ver más sobre gas de cocina butano", for: .normal);
        }
    }
    
    func cargarInformacionDeLaReaccion () {
        /*
        Fermentación del alcohol
        Respiración humana
        Combustión de la gasolina
        Combustión de gas de cocina
        */
    }
    
    func cargarInformacionJSON () {
        //Path
        let path = Bundle.main.path(forResource: "reacciones", ofType: "json");
        //URL
        let url = URL(fileURLWithPath: path!)
        //Decoder
        do{
            let data = try Data(contentsOf: url);
            let decoder = JSONDecoder();
            self.reacciones = try decoder.decode([Reaccion].self, from: data);
            //print(reacciones);
            /*
            for reaccion in reacciones{
                print(reaccion)
            }
             */
            
            for reaccionIndividual in reacciones{
                //print(reaccionRecibida)
                /*
                print("---------------");
                print(reaccionRecibida);
                print(reaccionIndividual.NombreReaccion);
                print("---------------");
                */
                if (reaccionRecibida == reaccionIndividual.NombreReaccion){
                    //print("Matched");
                    //print("---------------");
                    elemento1 = reaccionIndividual.Componentes["Componente1"]!;
                    elemento2 = reaccionIndividual.Componentes["Componente2"]!;
                    elemento3 = reaccionIndividual.Componentes["Componente3"]!;
                    elemento4 = reaccionIndividual.Componentes["Componente4"]!;
                    
                    /*
                    labelComponente1.text = traducirElementos(elemento: elemento1);
                    labelComponente2.text = traducirElementos(elemento: elemento2);
                    labelComponente3.text = traducirElementos(elemento: elemento3);
                    labelComponente4.text = traducirElementos(elemento: elemento4);
                    */
                    
                    botonComponente1.setTitle(traducirElementos(elemento: elemento1), for: .normal);
                    botonComponente2.setTitle(traducirElementos(elemento: elemento2), for: .normal);
                    botonComponente3.setTitle(traducirElementos(elemento: elemento3), for: .normal);
                    botonComponente4.setTitle(traducirElementos(elemento: elemento4), for: .normal);
                    
                    textViewInformacionDeLaReaccion.text = reaccionIndividual.Informacion;
                    
                    informacionAdicional = reaccionIndividual.Fuente;
                    //print(informacionAdicional);
                    
                    //print("Ver más sobre fermentación alcohólica");
                    
                    //botonIformacionAdicional.setTitle("1", for: .normal);
                    //botonIformacionAdicional.setTitle("Ver más sobre fermentación alcohólica", for: .normal);
                    
                    //reaccionIndividual.Imagen
                    
                    let imageUrlString = reaccionIndividual.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenDeLaReaccion.image = imagenTemporal
                    
                    //imagenDeLaReaccion
                    
                    break;
                }else if (reaccionRecibida == reaccionIndividual.NombreReaccion){
                    //print("Matched");
                    //print("---------------");
                    elemento1 = reaccionIndividual.Componentes["Componente1"]!;
                    elemento2 = reaccionIndividual.Componentes["Componente2"]!;
                    elemento3 = reaccionIndividual.Componentes["Componente3"]!;
                    elemento4 = reaccionIndividual.Componentes["Componente4"]!;
                    
                    botonComponente1.setTitle(traducirElementos(elemento: elemento1), for: .normal);
                    botonComponente2.setTitle(traducirElementos(elemento: elemento2), for: .normal);
                    botonComponente3.setTitle(traducirElementos(elemento: elemento3), for: .normal);
                    botonComponente4.setTitle(traducirElementos(elemento: elemento4), for: .normal);
                    
                    textViewInformacionDeLaReaccion.text = reaccionIndividual.Informacion;
                    
                    informacionAdicional = reaccionIndividual.Fuente;
                    //print(informacionAdicional);
                    
                    //botonIformacionAdicional.text = "Ver más sobre respiración humana";
                    //print("Ver más sobre respiración humana");
                    
                    //botonIformacionAdicional.setTitle("2", for: .normal);
                    //botonIformacionAdicional.setTitle("Ver más sobre respiración humana", for: .normal);
                    
                    let imageUrlString = reaccionIndividual.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenDeLaReaccion.image = imagenTemporal
                    
                    break;
                }else if (reaccionRecibida == reaccionIndividual.NombreReaccion){
                    //print("Matched");
                    //print("---------------");
                    elemento1 = reaccionIndividual.Componentes["Componente1"]!;
                    elemento2 = reaccionIndividual.Componentes["Componente2"]!;
                    elemento3 = reaccionIndividual.Componentes["Componente3"]!;
                    elemento4 = reaccionIndividual.Componentes["Componente4"]!;
                    
                    botonComponente1.setTitle(traducirElementos(elemento: elemento1), for: .normal);
                    botonComponente2.setTitle(traducirElementos(elemento: elemento2), for: .normal);
                    botonComponente3.setTitle(traducirElementos(elemento: elemento3), for: .normal);
                    botonComponente4.setTitle(traducirElementos(elemento: elemento4), for: .normal);
                    
                    textViewInformacionDeLaReaccion.text = reaccionIndividual.Informacion;
                    
                    informacionAdicional = reaccionIndividual.Fuente;
                    //print(informacionAdicional);
                    
                    //print("Ver más sobre combustión de la gasolina");
                    //botonIformacionAdicional.text = "Ver más sobre combustión de la gasolina";
                    
                    //botonIformacionAdicional.setTitle("3", for: .normal);
                    //botonIformacionAdicional.setTitle("Ver más sobre combustión de la gasolina", for: .normal);
                    
                    let imageUrlString = reaccionIndividual.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenDeLaReaccion.image = imagenTemporal
                    
                    break;
                }else if (reaccionRecibida == reaccionIndividual.NombreReaccion){
                    //print("Matched");
                    //print("---------------");
                    elemento1 = reaccionIndividual.Componentes["Componente1"]!;
                    elemento2 = reaccionIndividual.Componentes["Componente2"]!;
                    elemento3 = reaccionIndividual.Componentes["Componente3"]!;
                    elemento4 = reaccionIndividual.Componentes["Componente4"]!;
                    
                    botonComponente1.setTitle(traducirElementos(elemento: elemento1), for: .normal);
                    botonComponente2.setTitle(traducirElementos(elemento: elemento2), for: .normal);
                    botonComponente3.setTitle(traducirElementos(elemento: elemento3), for: .normal);
                    botonComponente4.setTitle(traducirElementos(elemento: elemento4), for: .normal);
                    
                    textViewInformacionDeLaReaccion.text = reaccionIndividual.Informacion;
                    
                    //informacionAdicional = reaccionIndividual.Fuente;
                    //print(informacionAdicional);
                    
                    //print("Ver más sobre gas de cocina butano");
                    //botonIformacionAdicional.text = "Ver más sobre gas de cocina butano";
                    
                    //botonIformacionAdicional.setTitle("4", for: .normal);
                    //botonIformacionAdicional.setTitle("Ver más sobre gas de cocina butano", for: .normal);
                    
                    let imageUrlString = reaccionIndividual.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenDeLaReaccion.image = imagenTemporal
                    
                    break;
                }else if (reaccionRecibida == reaccionIndividual.NombreReaccion){
                    //print("Matched");
                    //print("---------------");
                    elemento1 = reaccionIndividual.Componentes["Componente1"]!;
                    elemento2 = reaccionIndividual.Componentes["Componente2"]!;
                    elemento3 = reaccionIndividual.Componentes["Componente3"]!;
                    elemento4 = reaccionIndividual.Componentes["Componente4"]!;
                    
                    botonComponente1.setTitle(traducirElementos(elemento: elemento1), for: .normal);
                    botonComponente2.setTitle(traducirElementos(elemento: elemento2), for: .normal);
                    botonComponente3.setTitle(traducirElementos(elemento: elemento3), for: .normal);
                    botonComponente4.setTitle(traducirElementos(elemento: elemento4), for: .normal);
                    
                    textViewInformacionDeLaReaccion.text = reaccionIndividual.Informacion;
                    
                    informacionAdicional = reaccionIndividual.Fuente;
                    //print(informacionAdicional);
                    
                    //print("Ver más sobre gas de cocina metano");
                    //botonIformacionAdicional.text = "Ver más sobre gas de cocina metano";
                    
                    //botonIformacionAdicional.setTitle("5", for: .normal);
                    //botonIformacionAdicional.setTitle("Ver más sobre gas de cocina metano", for: .normal);
                    
                    let imageUrlString = reaccionIndividual.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenDeLaReaccion.image = imagenTemporal
                    
                    break;
                }
            }
            
        } catch let error {
            print(error as? Any)
            //print("error")
        }
    }
    
    func alertaReaccionCreada(){

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
    
    func traducirElementos(elemento : String) -> String {
        switch elemento {
        case "Agua":
            return "Agua";
        case "Butano":
            return "Butano";
        case "DioxidoDeCarbono":
            return "Dióxido de Carbono"
        case "Fructosa":
            return "Fructosa";
        case "Glucosa":
            return "Glucosa";
        case "Metano":
            return "Metano"
        case "Octano":
            return "Octano";
        case "Oxigeno":
            return "Oxígeno"
        case "VaporDeAgua":
            return "Vapor de agua";
        default:
            return "Elemento None";
        }
    }
    
    @IBAction func botonInformacionAdicionalPresionado(_ sender: UIButton) {
        //botonIformacionAdicional.setTitle("Presionado", for: .normal);
        
        //print(informacionAdicional);
        
        if let url = URL(string: informacionAdicional) {
            print("Se abrió safari");
            UIApplication.shared.open(url, options: [:])
        }else{
            print("No se abrió safari");
        }
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if(segue.identifier == "componente1"){
            let vistaComponente = segue.destination as! ViewController4;
            vistaComponente.componenteRecibido = elemento1;
        }else if(segue.identifier == "componente2"){
            let vistaComponente = segue.destination as! ViewController4;
            vistaComponente.componenteRecibido = elemento2;
        }else if(segue.identifier == "componente3"){
            let vistaComponente = segue.destination as! ViewController4;
            vistaComponente.componenteRecibido = elemento3;
        }else if(segue.identifier == "componente4"){
            let vistaComponente = segue.destination as! ViewController4;
            vistaComponente.componenteRecibido = elemento4;
        }
    }
    

}
