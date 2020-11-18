
package jflex;
import java_cup.runtime.Symbol;

import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Espacios en blanco */
{espacio} {/*Ignore*/}
/* Comentarios */
( "//"(.)* ) {/*Ignore*/}
/* Comillas */
( "\"" ) {return new Symbol(sym.Comillas);}
/* Tipos de datos */
( byte | char | long | float | double ) {return new Symbol(sym.T_dato);}
/* Tipo de dato Int (Para el main) */
( "int" ) {return new Symbol(sym.Int);}

/* Tipo de dato String */
( String ) {return new Symbol(sym.Cadena);}
/* Palabra reservada If */
( if ) {return new Symbol(sym.If);}
/* Palabra reservada Else */
( else ) {return new Symbol(sym.Else);}
/* Palabra reservada Do */
( do ) {return new Symbol(sym.Do);}
/* Palabra reservada While */
( while ) {return new Symbol(sym.While);}
/* Palabra reservada For */
( for ) {return new Symbol(sym.For);}
/* Operador Igual */
( "=" ) {return new Symbol(sym.Igual);}
/* Operador Suma */
( "+" ) {return new Symbol(sym.Suma);}
/* Operador Resta */
( "-" ) {return new Symbol(sym.Resta);}
/* Operador Multiplicacion */
( "*" ) {return new Symbol(sym.Multiplicacion);}
/* Operador Division */
( "/" ) {return new Symbol(sym.Division);}
/* Operadores logicos */
( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico);}
/*Operadores Relacionales */
( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional);}
/* Operadores Atribucion */
( "+=" | "-="  | "*=" | "/=" | "%=" | "=" ) {return new Symbol(sym.Op_atribucion);}
/* Operadores Incremento y decremento */
( "++" | "--" ) {return new Symbol(sym.Op_incremento);}
/*Operadores Booleanos*/
( true | false ) {return new Symbol(sym.Op_booleano);}
/* Parentesis de apertura */
( "(" ) {return new Symbol(sym.Parentesis_a);}
/* Parentesis de cierre */
( ")" ) {return new Symbol(sym.Parentesis_c);}
/* Llave de apertura */
( "{" ) {return new Symbol(sym.Llave_a);}
/* Llave de cierre */
( "}" ) {return new Symbol(sym.Llave_c);}
/* Corchete de apertura */
( "[" ) {return new Symbol(sym.Corchete_a);}
/* Corchete de cierre */
( "]" ) {return new Symbol(sym.Corchete_c);}
/* Marcador de inicio de algoritmo */
( "main" ) {return new Symbol(sym.Main);}
/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma);}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador);}
/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero);}
/* Error de analisis */
 . {return new Symbol(sym.ERROR);}


