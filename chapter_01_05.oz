% 1.5
declare Pascal AddList ShiftLeft ShiftRight FastPascal
fun {Pascal N}
   if N==1 then
      [1]
   else
      {AddList {ShiftLeft {Pascal N-1}} {ShiftRight {Pascal N-1}}}
   end
end

fun {ShiftLeft L}
   case L of H|T then
      H|{ShiftLeft T}
   else
      [0]
   end
end

fun {ShiftRight L} 0|L end

fun {AddList L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
         H1+H2|{AddList T1 T2}
      end
   else nil end
end

% 1.7
fun {FastPascal N}
   if N==1 then
      [1]
   else L in
      L = {FastPascal N-1}
      {AddList {ShiftLeft L} {ShiftRight L}}
   end
end

% 1.8
fun lazy {Ints N}
   N|{Ints N+1}
end

declare
L={Ints 0}
{Browse L}

{Browse L.1}

case L of A|B|C|_ then {Browse A+B+C} end

fun lazy {PascalList Row}
   Row|{PascalList
        {AddList {ShiftLeft Row} {ShiftRight Row}}}
end

declare
L={PascalList [1]}
{Browse L}

{Browse L.1}
{Browse L.2.1}

fun {PascalList2 N Row}
   if N==1 then
      [Row]
   else
      Row|{PascalList2 N-1 {AddList {ShiftLeft Row} {ShiftRight Row}}}
   end
end

{Browse {PascalList2 10 [1]}}

% 1.9
declare OpList
fun {GenericPascal Op N}
   if N==1 then
      [1]
   else L in
      L={GenericPascal Op N-1}
      {OpList Op {ShiftLeft L} {ShiftRight L}}
   end
end

fun {OpList Op L1 L2}
   case L1 of H1|T1 then
      case L2 of H2|T2 then
         {Op H1 H2}|{OpList Op T1 T2}
      end
   else
      nil
   end
end

fun {Add X Y}
   X+Y
end

fun {FastPascal_ N}
   {GenericPascal Add N}
end

fun {Xor X Y}
   if X==Y then 0 else 1 end
end

{Browse {GenericPascal Xor 1}}
{Browse {GenericPascal Xor 2}}
{Browse {GenericPascal Xor 3}}
{Browse {GenericPascal Xor 4}}
{Browse {GenericPascal Xor 5}}
{Browse {GenericPascal Xor 6}}

% 1.10
thread P in
   % P={Pascal 30}
   P={Pascal 10}
   {Browse P}
end
{Browse 99*99}

% 1.11
declare X in
thread {Delay 3000} X=90 end
{Browse start}
{Browse X*X}

% 1.12
declare
C={NewCell 0}
C:=@C+1
{Browse @C}

declare
C={NewCell 0}
fun {FastPascal__ N}
   C:=@C+1
   {GenericPascal Add N}
end

% 1.13
declare
local C in
   C={NewCell 0}
   fun {Bump}
      C:=@C+1
      @C
   end
   fun {Read}
      @C
   end
end

{Browse {Bump}}
{Browse {Bump}}

declare
fun {FastPascal___ N}
   {Browse {Bump}}
   {GenericPascal Add N}
end

% 1.14
declare
fun {NewCounter} C Bump Read in
   C={NewCell 0}
   fun {Bump}
      C:=@C+1
      @C
   end
   fun {Read}
      @C
   end
   counter(bump:Bump read:Read)
end

declare
Ctr1={NewCounter}
Ctr2={NewCounter}

{Browse {Ctr1.bump}}
{Browse {Ctr2.bump}}
