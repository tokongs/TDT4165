functor
import
    System
define
    fun {Factorial N}
        if N == 0 then
            1
        else
            {Factorial N-1} * N
        end
    end

    {System.showInfo {Factorial 0}}
end
