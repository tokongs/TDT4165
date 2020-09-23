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
end