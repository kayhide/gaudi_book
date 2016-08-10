% 1.2
declare
V=9999*9999
{Browse V*V}

% 1.3
declare
fun {Fact N}
   if N==0 then 1 else N*{Fact N-1} end
end

{Browse {Fact 10}}
{Browse {Fact 100}}

declare
fun {Fact N}
   if N==0 then 1 else N*{Fact N-1} end
end

declare
fun {Comb N K}
   {Fact N} div ({Fact K}*{Fact N-K})
end

% 1.4
{Browse [5 6 7 8]}

declare
H=5
T=[6 7 8]
{Browse H|T}

declare
L=[5 6 7 8]
{Browse L.1}
{Browse L.2}

declare
L=[5 6 7 8]
case L of H|T then {Browse H} {Browse T} end
