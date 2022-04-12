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
    val date3 = (2021,01,20)
in 
(is_older(date1,date2),
is_older(date1,date3))
end

val ans1 = test1() (*expected: (true,false) *)

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
in 
(number_in_month(dataList,1),
number_in_month(dataList,3))
end

val ans2 = test2() (*expected: (2,0)*)

(*3*)
fun number_in_months(dateList: (int*int*int) list, monthList: int list) = 
if null monthList orelse null dateList 
then 0 
else 
    if number_in_month(dateList, hd monthList) <> 0
    then number_in_months(dateList, tl monthList) + number_in_month(dateList, hd monthList)
    else 
        number_in_months(dateList,tl monthList);


fun test3()=
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
    val date3 = (2023,01,25)
    val date4 = (1999,9,24)
    val dateList = [date1,date2,date3]
    val dateList2 = [date1,date2,date2,date4]
    val monthList = [1,2,3]
    val monthList2 = [1,9]
in 
(number_in_months(dateList,monthList),
number_in_months(dateList2,monthList2))
end 

val ans3 = test3(); (*expected: (3,2) *)

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
in 
(dates_in_month(dateList,1),
dates_in_month(dateList,4))
end 

val ans4 = test4(); (*expected: ([(2021,1,20),(2019,1,29)],[]) *)

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
    val dateList2 = [date1,date4,date4]
    val monthList = [1,2,3]
in 
(dates_in_months(dateList,monthList),
dates_in_months(dateList2,monthList))
end 

val ans5 =  test5(); (*expected: ([(2021,01,20),(2021,02,20),(2023,03,25)], [(2021,01,20)])*)

(*6*)
fun get_nth(lst: string list, n: int) =
if null lst 
then ""
else 
if n = 1 
then hd lst 
else 
get_nth (tl lst, n-1);

fun test6()=
let val str1 = "check1"
    val str2 = "check2"
    val str3 = "check3"
    val lst = [str1,str2,str3]
in
(get_nth(lst,2),
get_nth(lst,4))
end

val ans6 = test6(); (*expected: ("check2","")*)

(*7*)
fun date_to_string(date:int*int*int) = 
let val lst = ["January","February","March","April","May","June","July","August","September","October","November","December"]
in 
get_nth(lst,#2 date) ^ " " ^(Int.toString (#3 date)) ^ ", " ^ (Int.toString (#1 date))
end;

fun test7()=
let val date1 = (1991,8,24)
    val date2 = (2003,9,24)
in 
(date_to_string(date1),
date_to_string(date2))
end 

val ans7 = test7();(*expected: ("August 24, 1991","September 24, 2003")*)

(*8*)
fun number_before_reaching_sum(sum:int, lst: int list)=
if null lst 
then 0
else 
if(sum - hd lst > 0)
then 
number_before_reaching_sum(sum-hd lst, tl lst) + 1
else 
0;

fun test8()=
let val lst = [1,2,3,4,5]
    val sum = 15
    val lst2 = [10,5,1,5]
    val sum2 = 16
in 
(number_before_reaching_sum(sum,lst),
number_before_reaching_sum(sum2,lst2))
end 

val ans8 = test8(); (*expected: (4,2)*)


(*9*)
fun what_month(day:int)=
if day > 0 andalso day < 366 
then
let val lst = [31,28,31,30,31,30,31,31,30,31,30,31]
in 
number_before_reaching_sum(day,lst) + 1
end
else 
~1;

fun test9()=
let val day1 = 32
    val day2 = 91
    val day3 = 365
in
(what_month(day1),
what_month(day2),
what_month(day3))
end

val ans9 = test9(); (*expected: (2,4,12)*)

(*10*)
fun month_range(day1:int,day2:int) =
if day1 > day2
then []
else 
what_month(day1)::month_range(day1+1,day2);

fun test10()=
let val day1 = 80
    val day2 = 95
    val day3 = 230
    val day4 = 130
in
(month_range(day1,day2),
month_range(day3,day4))

end 

val ans10 = test10(); (*expected: ([3,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4],[]) *)

(*11*)

fun what_oldest_date(lst: (int*int*int) list) = 
if null lst 
then NONE  
else 
let 
    fun oldest_nonempty(lst: (int*int*int) list)=
    if null(tl lst)
    then hd lst 
    else  
        let val tl_ans = oldest_nonempty(tl lst)
        in 
            if is_older(hd lst, tl_ans)
            then hd lst
            else tl_ans
        end
in 
    SOME (oldest_nonempty lst)
end;

fun test11()=
let val date1 = (2021,01,20)
    val date2 = (2021,02,20)
    val date3 = (2019,04,29)
    val date4 = (2023,03,25) 
    val dateList = [date1,date2,date3,date4]
    val dateList2 = []
in 
(what_oldest_date(dateList),
what_oldest_date(dateList2))
end

val ans11 = test11(); (*expected: (SOME (2019,4,29),NONE) *)