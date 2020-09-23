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

    fun {SumTailRec List}
        case List of First | Second | Tail then
            {SumTailRec First + Second | Tail}
        [] Head | Tail then Head
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

    fun {Quadratic A B C} 
        fun {$ X} A*X*X + B*X + C end
    end

    fun {LazyNumberGenerator StartValue}
        StartValue | fun {$} {LazyNumberGenerator StartValue + 1} end
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

    {System.show{{Quadratic 3 2 1}2}}

    {System.show {LazyNumberGenerator 0}.1}
    {System.show {{LazyNumberGenerator 0}.2}.1}
    {System.show {{{{{{LazyNumberGenerator 0}.2}.2}.2}.2}.2}.1}

    {System.show {SumTailRec [1 2 3 4]}}
    {Application.exit 0}
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

Task 4b)
Every time LazyNumberGenerator is executed it generates a list of two elements.
The first is the start value, the next is an anonymous function which calls LazyNumberGenerator
with StartValue + 1 

Task 6b)
The benefit og tail recursion in Oz is that we reduce the stack depth which reduces the memory
footprint of out execution. 

Task 6c)
No, not all compiler will do the optimization needed to gain the benefits of tail recursion. 
 */