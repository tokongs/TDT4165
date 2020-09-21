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

    {Browse {Lex "1 2 + 3 *" }}
    {Browse {Tokenize {Lex "1 2 + 3 *"}}}

end
