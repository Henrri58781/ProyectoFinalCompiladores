
package jflex;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
/**
 *
 * @author Henrr
 */
public class JFlex {
  /* public static void main(String[] args) throws Exception {
        try{
           generarLexer();
        }catch(Exception e){
           throw new Exception("Error al generar Archivo Lexer");
       }
    }
    
    
    
    public static void generarLexer() throws Exception{
        // Ruta del archivo donde se encuentra el archivo lex.flex
        String[] ruta = {"C:\\Users\\Henrr\\Documents\\NetBeansProjects\\JFlex\\src\\jflex\\lex.flex"};
        try {  
            jflex.Main.generate(ruta);
        }catch(Exception e){
            throw new Exception("Error al crear  Archivo Lexer.java ");
        }
    }*/
     public static void main(String[] args) throws Exception {
       System.out.println("Generando Archivos Lexers");
        try{
           generar();
        }catch(Exception e){
           throw new Exception("Error al generar Archivo Lexer");
       }
     }
    

    public static void generar() throws IOException, Exception{
        String rutaProy = "\\Users\\Henrr\\Documents\\NetBeansProjects\\JFlex";
        String[] ruta1 = {rutaProy+"\\src\\jflex\\lex.flex"};
        String[] ruta2 = {rutaProy+"\\src\\jflex\\LexerCup.flex"};
        String[] rutaS = {"-parser", "Sintax", rutaProy+"\\src\\jflex\\Sintax.cup"};

        jflex.Main.generate(ruta1);       
        jflex.Main.generate(ruta2);
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get(rutaProy+"\\src\\jflex\\sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get(rutaProy+"\\sym.java"), 
                Paths.get(rutaProy+"\\src\\jflex\\sym.java")
        );
        Path rutaSin = Paths.get(rutaProy+"\\src\\jflex\\Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get(rutaProy+"\\Sintax.java"), 
                Paths.get(rutaProy+"\\src\\jflex\\Sintax.java")
        );
    }




    
}
