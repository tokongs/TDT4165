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
        case Lexeme of "+" then operator(type:plus)
        [] "-" then operator(type:minus)
        [] "/" then operator(type:divide)
        [] "*" then operator(type:multiply)
        [] "p" then operator(type:print)
        [] "d" then operator(type:duplicate)
        [] "i" then operator(type:negate)
        [] "^" then operator(type:inverse)
        else
            number({String.toFloat Lexeme})
        end
    end

    fun {Tokenize Lexems}
        {Map Lexems LexemeToRecord}
    end

    fun {InterpretWithStack Tokens Stack}
        local
            NewTokens
            NewStack
        in
            case Tokens of Head | Tail then
                NewStack = Head | Stack
                NewTokens = Tail
            else
                NewStack = Stack
                NewTokens = Tokens
            end
            case NewStack of operator(type:plus) | number(First) | number(Second) | Tail then {InterpretWithStack NewTokens number(First + Second) | Tail}

            [] operator(type:minus) | number(First) | number(Second) | Tail then {InterpretWithStack NewTokens number(First - Second) | Tail}

            [] operator(type:divide) | number(First) | number(Second) | Tail then {InterpretWithStack NewTokens number(First / Second) | Tail}

            [] operator(type:multiply) | number(First) | number(Second) | Tail then {InterpretWithStack NewTokens number(First * Second) | Tail}

            [] operator(type:negate) | number(First) | Tail then {InterpretWithStack NewTokens number(-First) | Tail}

            [] operator(type:inverse) | number(First) | Tail then {InterpretWithStack NewTokens number(1.0/First) | Tail}

            [] operator(type:duplicate) | number(First) | Tail then {InterpretWithStack NewTokens number(First) | number(First) | Tail}

            [] operator(type:print) | Tail then
                {System.show Tail}
                {InterpretWithStack NewTokens Tail}

            else
                if {Length NewTokens} == 0 then NewStack
                else {InterpretWithStack NewTokens NewStack}
                end
            end
        end

    end

    fun {Interpret Tokens}
        {InterpretWithStack Tokens nil}
    end

    {Browse {Lex "1 2 + 3 *" }}
    {Browse {Tokenize {Lex "1 2 + 3 *"}}}
    {Browse {Interpret{Tokenize {Lex "1 2 3 p + d"}}}}

end
