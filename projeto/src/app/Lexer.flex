package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens


L=[a-zA-Z_]+

D=[0-9]+

espaco=[ ,\t,\r,\n]+

%{
    public String lexeme;
%}
%%
{espaco} {/*Ignore*/}

(">" | "<" | ">=" | "<=" | "==" | "!=" | "!" | "&" | "|" | "&&" | "||" | "?" | "+" | "-" | "*" | "/" | "%" | "+=" | "-=" | "*=" | "/=" | ":" ) {lexeme = yytext(); return Operador;}

("=" ) {lexeme = yytext(); return Atribuição;}

( private | string | var | double | static | struct | union |abstract | if | else | switch | case | default | do | while | break | for |foreach | goto | null | int | float | byte | return | try | as | in | false | true | break | internal | continue | class | is | try | or | and | public | console.Write | console.WriteLine | catch | new ) {lexeme = yytext(); return Palavra_Reservada;}

{L}({L}|{D})* {lexeme=yytext(); return Identificador;}

("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero_Inteiro;}

{D}+"."{D}* {lexeme = yytext(); return Numero_Com_Ponto_FLutuante;}

"//"[^\n]* {lexeme = yytext(); return Comentario_Simples;}

"/*" [^*] ~"*/" | "/*" "*"+ "/" {lexeme = yytext(); return Comentario_Multilines;}

("[" | "]" | "{" | "}" | "(" | ")" ) {lexeme = yytext(); return Separador;}

(\"[^\n,]*\" | \'[^\n,]*\') {lexeme = yytext(); return Constante_Literal;}

(";") {lexeme = yytext(); return Fim_De_Linha;}

 . {return ERROR;}
