//
//  ViewController4.swift
//  ReaccionesQuimicas
//
//  Created by Luis Alfonso Rojo Sánchez on 28/04/18.
//  Copyright © 2018 Luis Alfonso Rojo Sánchez. All rights reserved.
//

import UIKit

class ViewController4: UIViewController {

    //  Nombre del componente
    var componenteRecibido = "";
    //  Imágen del componente
    @IBOutlet weak var imagenComponente: UIImageView!
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
        let DatosPrincipales = [String : String]();
    }
    
    var componentes = [Componente]()
    
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
                    let temporal = traducirElementos(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    /*
                    print(componente.DatosPrincipales["PuntoDeEbullicion"]);
                    print(componente.DatosPrincipales["PuntoDeFusion"]);
                    print(componente.DatosPrincipales["Densidad"]);
                    print(componente.DatosPrincipales["FormulaMolecular"]);
                     */
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"];
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"];
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"];
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"];
                    
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenComponente.image = imagenTemporal
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementos(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenComponente.image = imagenTemporal
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementos(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenComponente.image = imagenTemporal
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementos(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenComponente.image = imagenTemporal
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementos(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenComponente.image = imagenTemporal
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementos(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenComponente.image = imagenTemporal
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementos(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenComponente.image = imagenTemporal
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementos(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenComponente.image = imagenTemporal
                    
                }else if(componenteRecibido == componente.NombreComponente){
                    
                    informacionComponente.text = componente.ParrafoDeResumen;
                    
                    informacionAdicional = componente.Fuente;
                    let temporal = traducirElementos(elemento: componenteRecibido);
                    botonInformacionAdicional.setTitle("Ver mas sobre " + temporal, for: .normal)
                    
                    dt1PuntoEbullicion.text  = componente.DatosPrincipales["PuntoDeEbullicion"]!;
                    dp2PuntoFusion.text      = componente.DatosPrincipales["PuntoDeFusion"]!;
                    dp3Densidad.text         = componente.DatosPrincipales["Densidad"]!;
                    dp4FormulaMolecular.text = componente.DatosPrincipales["FormulaMolecular"]!;
                    
                    let imageUrlString = componente.Imagen
                    let imageUrl = URL(string: imageUrlString)!
                    let imageData = try! Data(contentsOf: imageUrl)
                    let imagenTemporal = UIImage(data: imageData)
                    imagenComponente.image = imagenTemporal
                    
                }
            }
            
        } catch let error {
            print(error as? Any)
            print("error")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
