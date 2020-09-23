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

    fun {RightFold List Op U}
        case List of Head | Tail then
            {Op Head {RightFold Tail Op U}}
        else
            U
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

    % Sum fold
    {System.show {RightFold [1 2 3 4] fun {$ X Y} X + Y end 0}}
    % Length fold
    {System.show {RightFold [1 2 3 4] fun {$ X Y} 1 + Y end 0}}
end

/*
Task 1b)
Procedual abstractions are useful because it means we don't have to worry about how 
a procedure does something, just what it does. It also enables us to use higher level programming.

Task 1c)
The difference between a procedure and a functino is that a procedure does not return a value.

Task 3d)
They would give the same result because addition is an associative operation. While subtractions 
would be different because subtraction is not an associative operation. 

Task 3e)
1 would be a good value for U when trying to find the product because anything multiplied by 1 
would not change the result. 
 */