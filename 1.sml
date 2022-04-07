use "foo.sml";
fun pow(x:int,y:int) = 
if y = 0
then 1 
else x * pow(x,y-1)
fun cube (x:int)=
pow (x,3)
val ans = cube 4;

fun swap(pr: int*bool)=
(#2 pr, #1 pr);
swap(2,false);

fun sort_pair(pr: int * int)=
if (#1 pr) < (#2 pr)
then pr 
else (#2 pr, #1 pr);
sort_pair(2,1);

val e = [1,2,3];
fun sum_list (inp : int list) = 
if null inp 
then 0
else sum_list(tl inp) + hd(inp);
sum_list([1,2,3]);

fun append(xs: int list, ys: int list) = 
if null xs 
then ys 
else (hd xs) :: append(tl xs, ys);
append([1,2,3],[4,5,6]);

fun sum_pair_list(xs: (int * int) list)=
if null xs 
then 0 
else #1 (hd xs) + #2(hd xs) + sum_pair_list(tl xs);

sum_pair_list([(1,2),(3,4)]);

let val x = 1
in
    (let val x = 2 in x+1 end) + (let val y = x+2 in y+1 end)
end;
1::[2,3];

fun max(xs:int list) = 
    if null xs
    then NONE
    else 
        let val tailMax = max(tl xs)
        in if isSome tailMax andalso valOf tailMax > hd xs 
            then tailMax 
            else SOME (hd xs)
        end ;
max([6,1,2,19,2]);

isSome(NONE);
1=2;
val e1 = 2;
val e2 = 2;
e1=e2;
~7+3;