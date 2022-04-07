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

fun test1() =
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
in is_older(date1,date2)
end

val ans1 = test1() (*expected: true*)

(*2*)
fun number_in_month(dateList: (int*int*int) list, monthNumber:int) = 
if null dateList 
then 0
else 
    if #2 (hd dateList) = monthNumber 
    then number_in_month(tl dateList, monthNumber) +1
    else
        number_in_month(tl dateList, monthNumber);

fun test2() =
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
    val date3 = (2023,01,25)
    val dataList = [date1,date2,date3]
    val monthNumber = 2;
in number_in_month(dataList,1)
end

val ans2 = test2() (*expected: 2*)