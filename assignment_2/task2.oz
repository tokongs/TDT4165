functor
import
    System
    Browser(browse:Browse)
define
    \insert List.oz
    fun {Lex Input}
        {String.tokens Input & }
    end

    fun {LexemeToRecord Lexeme}
        case Lexeme of "+" then
            operator(type:plus)
        [] "-" then
            operator(type:minus)
        [] "/" then
            operator(type:divide)
        [] "*" then
            operator(type:multiply)
        else
            number({String.toInt Lexeme})
        end
    end

    fun {Tokenize Lexems}
        {Map Lexems LexemeToRecord}
    end

    proc {Interpret Tokens}
        case Tokens of number(First)|number(Second)|operator(type:plus)|Tail then
            {Interpret number(First + Second) | Tail}
        [] number(First)|number(Second)|operator(type:minus)|Tail then
            {Interpret number(First - Second) | Tail}
        [] number(First)|number(Second)|operator(type:divide)|Tail then
            {Interpret number(First / Second) | Tail}
        [] number(First)|number(Second)|operator(type:multiply)|Tail then
            {Interpret number(First * Second) | Tail}
        [] number(First)|number(Second)|number(Third)|Tail then
            {Interpret number(First) | {Interpret number(Second) | number(Third) | Tail}}
        else
            {System.show Tokens}
        end
    end

    {Browse {Lex "1 2 + 3 *" }}
    {Browse {Tokenize {Lex "1 2 + 3 *"}}}
    {Interpret{Tokenize {Lex "1 2 3 +"}}}

end
