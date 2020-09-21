functor
import
    System
    Browser(browse:Browse)
define
    fun {Lex Input}
        {String.tokens Input & }
    end

    
    {Browse {Lex "1 2 + 3 *" }}

end
