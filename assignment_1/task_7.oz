functor
import
    System
    Browser(browse:Browse)
define
    fun {Length List}
        case List of Head | Tail then
            {Length Tail} + 1
        else
            0
        end
    end

    fun {Take List Count}
        if Count == 0 then
            nil
        else
            if Count >= {Length List} then
                List
            else
                case List of Head | Tail then
    	            Head | {Take Tail Count-1}
    	        end
            end
        end
    end

    fun {Drop List Count}
        if Count >= {Length List} then
            nil
        else
            if Count == 0 then
                List
            else
                case List of Head | Tail then
                    {Drop Tail Count - 1}
                end
            end
        end
    end

    fun {Append List1 List2}
        if {Length List1} == 0 then
            List2
        else
            case List1 of Head | Tail then
                Head | {Append Tail List2}
            end
        end
    end

    fun {Member List Element}
        if {Length List} == 0 then
            false
        else
            case List of Head | Tail then
                if Element == Head then
                    true
                else
                    {Member Tail Element}
                end
            end
        end
    end

    fun {Position List Element}
        case List of Head | Tail then
            if Head == Element then
                0
            else
                1 + {Position Tail Element}
            end
        end
    end

    {Browse {Length [1 2 3 4 5 6]} }
    {Browse {Take [1 2 3 4 5 6] 3} }
    {Browse {Drop [1 2 3 4 5 6] 3} }
    {Browse {Append [1 2 3] [4 5 6]}}
    {Browse {Member [1 2 3] 2}}
    {Browse {Member [1 2 3] 5}}
    {Browse {Position [1 2 3 4 5] 4}}
end