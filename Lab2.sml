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

(*3*)
fun number_in_months(dateList: (int*int*int) list, monthList: int list) = 
if null monthList orelse null dateList 
then 0 
else if number_in_month(dateList, hd monthList) <> 0
    then number_in_months(dateList, tl monthList) + 1
    else 
        number_in_months(dateList,tl monthList);


fun test3()=
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
    val date3 = (2023,01,25)
    val dateList = [date1,date2,date3]
    val monthList = [1,2,3]
in number_in_months(dateList,monthList)
end 

val ans3 = test3(); (*expected: 2*)

(*4*)
fun dates_in_month(dateList: (int*int*int) list, monthNumber: int) = 
if null dateList 
then []
else 
    if (#2 (hd dateList)) = monthNumber
        then (hd dateList) :: dates_in_month(tl dateList,monthNumber)
    else dates_in_month(tl dateList,monthNumber)

fun test4()=
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
    val date3 = (2023,03,25)
    val date4 = (2019,01,29)
    val dateList = [date1,date2,date3,date4]
in dates_in_month(dateList,1)
end 

val ans4 = test4(); (*expected: [(2021,1,20),(2019,1,29)] *)

(*5*)
fun dates_in_months(dateList: (int*int*int) list, monthList: int list) = 
if null monthList 
then []
else 
    dates_in_month(dateList,hd monthList) @ dates_in_months(dateList,tl monthList)

fun test5()=
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
    val date3 = (2023,03,25)
    val date4 = (2019,04,29)
    val dateList = [date1,date2,date3,date4]
    val monthList = [1,2,3]
in dates_in_months(dateList,monthList)
end 

val ans5=  test5(); (*expected: [(2021,01,20),(2021,02,20),(2023,03,25)]*)