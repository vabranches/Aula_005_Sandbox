
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Estrutura do Sandbox
        let pathToSandbox = NSHomeDirectory()
        let pathToDocuments = (pathToSandbox as NSString).appendingPathComponent("Documents")

        
        print("Caminho para Documents: \n \(pathToDocuments)")
        
        //Criando um gerenciador de arquivos
        let caminhoSubdiretorio = (pathToDocuments as NSString).appendingPathComponent("Subdireotorio")
        
        let gerenciadorArquivos = FileManager.default
      
        //Criando um subdiretorio
        do {
            try gerenciadorArquivos.createDirectory(atPath: caminhoSubdiretorio, withIntermediateDirectories: true, attributes: nil)
        } catch {}
        
        if gerenciadorArquivos.fileExists(atPath: caminhoSubdiretorio){
            print("\nExistem Arquivos\n")
        } else {
            print("\nNao existem arquivos\n")
        }
        
        //Removendo arquivos
        do {
            try gerenciadorArquivos.removeItem(atPath: caminhoSubdiretorio)
        } catch{}
        
        //Movendo arquivos
        let caminhoSubdiretorio2 = (pathToDocuments as NSString).appendingPathComponent("Subdiretorio2")
        
        do {
            try gerenciadorArquivos.createDirectory(atPath: caminhoSubdiretorio2, withIntermediateDirectories: false, attributes: nil)
        } catch  {}
        
        let caminhoPastaFinal = (pathToDocuments as NSString).appendingPathComponent("PastaFinal")
        
        do {
            try gerenciadorArquivos.createDirectory(atPath: caminhoPastaFinal, withIntermediateDirectories: false, attributes: nil)
        } catch  {}
        
        do{
            try gerenciadorArquivos.moveItem(atPath: caminhoPastaFinal, toPath: caminhoSubdiretorio2)
        } catch{}
        
        //Copiando arquivos
        let caminhoPastaCopiar = (pathToDocuments as NSString).appendingPathComponent("PastaCopiar")
        
        do{
            try gerenciadorArquivos.createDirectory(atPath: caminhoPastaCopiar, withIntermediateDirectories: false, attributes: nil)
        } catch{}
        
        do{
            try gerenciadorArquivos.copyItem(atPath: caminhoPastaCopiar, toPath: caminhoPastaFinal)
        } catch{}
        
        
        print("\n\(caminhoPastaCopiar)\n\n")
        

    }
    
    func salvarDados(){
        //Estrutura do Sandbox
        let pathToSandbox = NSHomeDirectory()
        let pathToDocuments = (pathToSandbox as NSString).appendingPathComponent("Documents")
        let pathToFile = (pathToDocuments as NSString).appendingPathComponent("array.plist")
        
        print("Caminho para Documents: \n \(pathToDocuments)")
        
        
        //Array para ser salvo
        let arrayFrutas = ["Abacaxi", "Laranja", "Maçã"] as NSArray
        
        //Gravando os dados do Array no diretorio
        arrayFrutas.write(toFile: pathToFile, atomically: true)
        
        //Resgatando dados do Array no diretorio
        let arrayResgatado = NSArray(contentsOfFile: pathToFile)
        print("\nArray Resgatado: \n\(arrayResgatado!)\n")
    }



}

