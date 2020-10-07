functor
import
    System Application
    Browser(browse:Browse)
    OS
define 

    fun {GenerateOdd S E}
        if S > E then
            nil
        elseif S mod 2 == 1 then
            S | {GenerateOdd S+1 E}
        elseif S mod 2 == ~1  then % Couldnt figure out how to OR the expressions 
            S | {GenerateOdd S+1 E}
        else
            {GenerateOdd S+1 E}
        end
    end 

    fun lazy {LazyGenerateOdd S E}
        if S > E then
            nil
        elseif S mod 2 == 1 then
            S | {LazyGenerateOdd S+1 E}
        elseif S mod 2 == ~1  then % Couldnt figure out how to OR the expressions 
            S | {LazyGenerateOdd S+1 E}
        else
            {LazyGenerateOdd S+1 E}
        end
    end 

    fun {Product S}
        case S of Head | Tail then
            Head * {Product Tail}
        else 
            1
        end
    end

    fun lazy {HammerFactory}
        {Time.delay 1000}
        {System.show "hammer"}
        if {RandomInt 1 10} == 5 then
            'defect' | {HammerFactory}
        else 
            'working' | {HammerFactory}
        end
    end

    fun {HammerConsumer HammerStream N}
        if N == 0 then 
            0
        else 
            case HammerStream of 'working' | Tail then
                1 + {HammerConsumer Tail N - 1}
            [] 'defect' | Tail then
                {HammerConsumer Tail N - 1}
            else
                0
            end
        end
    end

    fun lazy {BoundedBuffer HammerStream N}
        {System.show "buffer"}
        if N == 0 then
            HammerStream
        else
            case HammerStream of Head | Tail then
                Head | {BoundedBuffer Tail N - 1}
            end
        end
    end

    fun {RandomInt Min Max}
        X = {OS.rand}
        MinOS
        MaxOS
    in
        {OS.randLimits ?MinOS ?MaxOS}
        Min + X*(Max - Min) div (MaxOS - MinOS)
    end

    {Browse {GenerateOdd ~3 10}}
    {Browse {Product [1 2 3 4]}}
    {Browse thread {Product thread {GenerateOdd 0 1000} end } end}
    {Browse thread {Product thread {LazyGenerateOdd 0 1000} end } end}
/* 
    local HammerTimer B in
        HammerTime = {HammerFactory}
        B = HammerTime.2.2.2.1
        {System.show HammerTime}
    end

    local HammerTime Consumer in 
        HammerTime = {HammerFactory}
        Consumer = {HammerConsumer HammerTime 10}
        {System.show Consumer}
    end
*/

    local HammerStream Buffer Consumer in
        HammerStream = {HammerFactory}
        Buffer = {BoundedBuffer HammerStream 6}
        {Delay 6000}
        Consumer = {HammerConsumer Buffer 10}
        {System.show Consumer}
    end

    local HammerStream Consumer in
        HammerStream = {HammerFactory}
        {Delay 6000}
        Consumer = {HammerConsumer HammerStream 10}
        {System.show Consumer}
    end



end

/*
Task3:
The first three digits are: 100
The benefit of running on two seperate threads is that we don't have to wait for the 
entire list to be generated before we start multiplying. 

Task4:
It makes it slower becuase the list will be generated on demand, but it also uses less 
resources until it is needed. 
 */