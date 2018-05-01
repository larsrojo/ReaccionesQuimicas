    //
//  ViewController4.swift
//  ReaccionesQuimicas
//
//  Created by Luis Alfonso Rojo Sánchez on 28/04/18.
//  Copyright © 2018 Luis Alfonso Rojo Sánchez. All rights reserved.
//

import UIKit
import SceneKit

class ViewController4: UIViewController {

    //  Nombre del componente
    var componenteRecibido = "";
    
    //  Imágen del componente
    //@IBOutlet weak var imagenComponente: UIImageView!
    //  Ahora será un modelo
    
    @IBOutlet weak var modeloElemento: SCNView!
    
    //  Información del componente
    @IBOutlet weak var informacionComponente: UITextView!
    //  Botón de información adicional del componente
    @IBOutlet weak var botonInformacionAdicional: UIButton!
    //  Datos principales: 1, 2, 3 y 4
    @IBOutlet weak var dt1PuntoEbullicion: UILabel!
    @IBOutlet weak var dp2PuntoFusion: UILabel!
    @IBOutlet weak var dp3Densidad: UILabel!
    @IBOutlet weak var dp4FormulaMolecular: UILabel!
    
    var informacionAdicional = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = traducirElementos(elemento: componenteRecibido);
        cargarJSON();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    struct Componente : Decodable {
        let NombreComponente : String;
        let ParrafoDeResumen : String;
        let Fuente : String;
        let Imagen : String;
        var DatosPrincipales = [String : String]();
    }
    
    var componentes = [Componente]()
    
    func traducirElementos(elemento : String) -> String {
        switch elemento {
        case "Agua":
            let scene1 = SCNScene(named: "VaporDeAgua.dae")!
            modeloElemento.scene = scene1;
            return "Agua";
        case "Butano":
            let scene1 = SCNScene(named: "Butano.dae")!
            modeloElemento.scene = scene1;
            return "Butano";
        case "DioxidoDeCarbono":
            let scene1 = SCNScene(named: "DioxidoDeCarbono.dae")!
            modeloElemento.scene = scene1;
            return "Dióxido de Carbono"
        case "Fructuosa":
            let scene1 = SCNScene(named: "Fructuosa.dae")!
            modeloElemento.scene = scene1;
            return "Fructuosa";
        case "Glucosa":
            let scene1 = SCNScene(named: "Glucosa.dae")!
            modeloElemento.scene = scene1;
            return "Glucosa";
        case "Metano":
            let scene1 = SCNScene(named: "Metano.dae")!
            modeloElemento.scene = scene1;
            return "Metano"
        case "Sacarosa":
            let scene1 = SCNScene(named: "Sacarosa.dae")!
            modeloElemento.scene = scene1;
            return "Sacarosa"
        case "Octano":
            let scene1 = SCNScene(named: "Octano.dae")!
            modeloElemento.scene = scene1;
            return "Octano";
        case "Oxigeno":
            let scene1 = SCNScene(named: "Oxigeno.dae")!
            modeloElemento.scene = scene1;
            return "Oxígeno"
        case "VaporDeAgua":
            let scene1 = SCNScene(named: "VaporDeAgua.dae")!
            modeloElemento.scene = scene1;
            return "Vapor de agua";
        default:
            return "Elemento None";
        }
    }
    
    func traducirElementosParaBoton(elemento : String) -> String {
        switch elemento {
        case "Agua":
            return "agua";
        case "Butano":
            return "butano";
        case "DioxidoDeCarbono":
            return "dióxido de carbono"
        case "Fructuosa":
            return "fructuosa";
        case "Glucosa":
            return "glucosa";
        case "Metano":
            return "metano"
        case "Sacarosa":
            return "Sacarosa";
        case "Octano":
            return "octano";
        case "Oxigeno":
            return "oxígeno"
        case "VaporDeAgua":
            return "vapor de agua";
        default:
            return "elemento None";
        }
    }
    
    func cargarJSON(){
        let path = Bundle.main.path(forResource: "compuestos", ofType: "json");
        let url = URL(fileURLWithPath: path!)
        do{
            let data = try Data(contentsOf: url);
            let decoder = JSONDecoder();
            self.componentes = try decoder.decode([Componente].self, from: data);
            
            for componente in componentes{
                if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementosParaBoton(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    /*
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    */
                    
                    //imagenComponente.image = imagenTemporal
                    //VaporDeAgua
                    /*
                    let scene1 = SCNScene(named: "VaporDeAgua.dae")!
                    modeloElemento.scene = scene1;
                    */
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementosParaBoton(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    /*
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    */
                    
                    //imagenComponente.image = imagenTemporal
                    //Butano
                    /*
                    let scene1 = SCNScene(named: "Butano.dae")!
                    modeloElemento.scene = scene1;
                    */
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementosParaBoton(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    /*
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    */
                    
                    //imagenComponente.image = imagenTemporal
                    //DioxidoDeCarbono
                    /*
                    let scene1 = SCNScene(named: "DioxidoDeCarbono.dae")!
                    modeloElemento.scene = scene1;
                    */
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementosParaBoton(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    /*
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    */
                    
                    //imagenComponente.image = imagenTemporal
                    //Fructuosa
                    /*
                    let scene1 = SCNScene(named: "Fructuosa.dae")!
                    modeloElemento.scene = scene1;
                    */
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementosParaBoton(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    /*
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    */
                    
                    //imagenComponente.image = imagenTemporal
                    //Glucosa
                    /*
                    let scene1 = SCNScene(named: "Glucosa.dae")!
                    modeloElemento.scene = scene1;
                    */
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementosParaBoton(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    /*
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    */
                    
                    //imagenComponente.image = imagenTemporal
                    //Octano
                    /*
                    let scene1 = SCNScene(named: "Octano.dae")!
                    modeloElemento.scene = scene1;
                     */
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementosParaBoton(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    /*
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    */
                    
                    //imagenComponente.image = imagenTemporal
                    //Oxigeno
                    /*
                    let scene1 = SCNScene(named: "Oxigeno.dae")!
                    modeloElemento.scene = scene1;
                     */
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementosParaBoton(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    /*
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    */
                    
                    //imagenComponente.image = imagenTemporal
                    //Sacarosa
                    /*
                    let scene1 = SCNScene(named: "Sacarosa.dae")!
                    modeloElemento.scene = scene1;
                    */
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementosParaBoton(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    /*
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    */
                    
                    //imagenComponente.image = imagenTemporal
                    //Metano
                    /*
                    let scene1 = SCNScene(named: "Metano.dae")!
                    modeloElemento.scene = scene1;
                     */
                }
            }
            
        } catch let error {
            print(error as? Any)
            print("error")
        }
    }
    
    @IBAction func accionVerInformacionAdicional(_ sender: UIButton) {
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
        if(segue.identifier == "terciario"){
            let vistaComponente = segue.destination as! ViewController5;
            vistaComponente.elementoRecibido = componenteRecibido;
        }
    }
    
}
