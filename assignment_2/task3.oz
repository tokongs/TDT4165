functor
import
    System
    Browser(browse:Browse)
define

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

    fun {InfixInternal Tokens ExpressionStack}
        {System.show ExpressionStack}
        case Tokens of number(Number) | Tail then {InfixInternal Tail Number | ExpressionStack}

        [] operator(type:plus) | Tail then
            case ExpressionStack of First | Second | ExTail then
                {InfixInternal Tail {VirtualString.toString &(#First#&+#Second#&)} | ExTail}
            end

        [] operator(type:minus) | Tail then
            case ExpressionStack of First | Second | ExTail then
                {InfixInternal Tail {VirtualString.toString &(#First#&-#Second#&)} | ExTail}
            end

        [] operator(type:multiply) | Tail then
            case ExpressionStack of First | Second | ExTail then
                {InfixInternal Tail {VirtualString.toString &(#First#&*#Second#&)} | ExTail}
            end

        [] operator(type:divide) | Tail then
            case ExpressionStack of First | Second | ExTail then
                {InfixInternal Tail {VirtualString.toString &(#First#&/#Second#&)} | ExTail}
            end

        else ExpressionStack
        end
    end

    fun {Infix Tokens}
        {InfixInternal Tokens nil}
    end
    {Browse {Tokenize {Lex "3.0 10.0 9.0 * - 0.3 +"}}}
    {Browse {Infix {Tokenize {Lex "3.0 10.0 9.0 * - 0.3 +"}}}}
end
