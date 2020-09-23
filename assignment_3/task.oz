functor 
import 
    Application 
    System 
define

    proc {QuadraticEquation A B C ?RealSol ?X1 ?X2}
        local 
            D = B*B - 4.0 * A * C
        in
            if D < 0.0 then
                RealSol = false
            elseif D > 0.0 then
                RealSol = true
                X1 = (~B + {Float.sqrt D}) / (2.0 * A)
                X2 = (~B - {Float.sqrt D}) / (2.0 * A)
            else 
                RealSol = true
                X1 = (~B + {Float.sqrt D}) / (2.0 * A)
            end
        end
    end

    fun {Sum List}
        case List of Head|Tail then
            Head  + {Sum Tail }
        else
            0
        end
    end

    local 
        RealSol
        X1
        X2
    in
        {QuadraticEquation 2.0 1.0 ~1.0 RealSol X1 X2}
        {System.show RealSol}
        {System.show X1}
        {System.show X2}
    end
    local 
        RealSol
        X1
        X2
    in
        {QuadraticEquation 2.0 1.0 2.0 RealSol X1 X2}
        {System.show RealSol}
        {System.show X1}
        {System.show X2}
    end

    {System.show {Sum [1 2 3 4]}}
end

/*
Task 1b)
Procedual abstractions are useful because it means we don't have to worry about how 
a procedure does something, just what it does. It also enables us to use higher level programming.

Task 1c)
The difference between a procedure and a functino is that a procedure does not return a value.


 */