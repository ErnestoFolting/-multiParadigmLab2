(*year month day*)

(*1*)
fun is_older(firstDate: int*int*int ,secondDate: int*int*int) =
if #1 firstDate < #1 secondDate 
then true
else if #2 firstDate < #2 secondDate andalso #1 firstDate = #1 secondDate 
then true 
else if #3 firstDate < #3 secondDate andalso #1 firstDate = #1 secondDate andalso #2 firstDate = #2 secondDate
then true 
else false;

is_older((2021,01,20),(2021,02,20));