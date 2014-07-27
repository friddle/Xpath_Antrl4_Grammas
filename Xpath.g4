grammar Xpath;

xpath:
   Select (Select|SelectNum|SelectFunc)*
    ;

AttributeExpr
    :
    '@' Identifier (MUL_ASSIGN|EQUAL) ValueIdentifier
    ;

Select:
    CHILD Identifier LEFT_COM AttributeExpr RIGHT_COM
    ;

SelectNum:
    LEFT_COM Digit RIGHT_COM
    ;

SelectFunc:
    SON Funs '()'
    ;


CHILD:  (SON|GRANDSON) ;
LEFT_COM: '[' ;
RIGHT_COM:  ']' ;
MUL_ASSIGN  : '*=';
EQUAL   : '=';
SON : '/' ;
GRANDSON : '//' ;
//Function Word
Funs:
    'text'
   |'regex' ;

NEWLINE:'\r'? '\n' {skip();} ;
WS  :   (' '|'\t')+ {skip();} ;

fragment
LetterOrDigit
    :   [a-zA-Z0-9$_] // these are the "java letters or digits" below 0xFF
    ;
fragment
Letter
    :   [a-zA-Z$_]
    ;
Identifier
    :   Letter LetterOrDigit*
    ;

ValueIdentifier
    :    [a-zA-Z0-9$_"']+
    ;

Digit
    :   [0-9]+
    ;
