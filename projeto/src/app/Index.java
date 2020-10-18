/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;

/**
 *
 * @author Charly Ponce
 */
public class Index {
    public static void main(String[] args) {
        String route = "C:/Users/Gabri/Documents/AnalizadorLexico/src/codigo/Lexer.flex";
        generarLexer(route);
    }
    public static void generarLexer(String route){
        File archivo = new File(route);
        JFlex.Main.generate(archivo);
    }
}
