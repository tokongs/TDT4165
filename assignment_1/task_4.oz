
functor
import
    System
define
    fun {Max Number1 Number2}
        if( Number1 > Number2) then
            Number1
        else
            Number2
        end
    end

    proc {PrintGreater Number1 Number2}
        {System.showInfo {Max Number1 Number2}}
    end
end