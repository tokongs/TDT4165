functor
import
    System
define
    proc {Circle R}
        local Pi Area Diameter Circumference
        in
            Pi = 355.0/113.0
            Area = Pi*R*R
            Diameter = 2.0*R
            Circumference = Pi*Diameter
            {System.showInfo Pi}
            {System.showInfo Area}
            {System.showInfo Diameter}
            {System.showInfo Circumference}
        end
    end

    {Circle 5.0}
end
