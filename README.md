# Recursions-SML
<h1></h1>
<table>
 <tr>
  <th>Problem No.</th>
  <th>Description</th>
  </tr>
 <tr> 
<th><a href="https://github.com/divyang2401/Recursions-Functional-Programming/blob/master/P_1.sml"> 1: </a></th>
  <th>An Integer x is said to be a prime power if and only if it can be written as p^k where p is a prime number and k>=1 is a positive integer. Define a function primepower which takes an integer n and checks whether n is a prime power.
</th>
</tr>
 <tr> 
<th><a href="https://github.com/divyang2401/Recursions-Functional-Programming/blob/master/P_2.sml"> 2:</a></th>
  <th>Define a function consec_ones which takes an integer and checks whether the binary representation of its absolute value has three consecutive ones.</th>
</tr>
<tr> 
<th><a href="https://github.com/divyang2401/Recursions-Functional-Programming/blob/master/P_3.sml"> 3:</a></th>
  <th>Define a function lsf which takes an integer n as input and returns the largest integer whose
square divides n.</th>
</tr>
<tr> 
<th><a href="https://github.com/divyang2401/Recursions-Functional-Programming/blob/master/P_4.sml"> 4: </a></th>
  <th>A directed graph can be represented by a list of pairs. Every edge is represented by a pair of two elements and the whole graph by a list of edges. For example, the following graph can be represented as {(1,2),(2,3),(3,1),(2,4)}.Define a function path which takes such a graph and two nodes as input and checks whether second node is reachable from the first.
</th>
</tr>
<tr> 
<th><a href="https://github.com/divyang2401/Recursions-Functional-Programming/blob/master/P_5.sml"> 5: </a></th>
  <th>Define a function mequal which takes two lists as inputs and checks whether they have same multiset of elements.</th>
</tr>
<tr> 
<th><a href="https://github.com/divyang2401/Recursions-Functional-Programming/blob/master/P_6.sml"> 6:</a></th>
  <th>Write a curried function alpha takes two lambd-expressions as input and checks whether they are alpha-equivalent. For instance, Abs(2,Abs(3,(V 3))) stands for lambda(v2).(lambda (v3).(v3)).</th>
</tr>
<tr> 
<th><a href="https://github.com/divyang2401/Recursions-Functional-Programming/blob/master/P_7.sml"> 7:</a></th>
  <th>Write a curried function eval which takes such as a list and an intger c as inputs and returns the value obtained by evaluating the polynomial at value c.
 
 a(0)+a(1)x+...+a(n)x^n
 
 eval [~1,3,5] 2, val it=25:int
 </th>
</tr>
<tr> 
<th><a href="https://github.com/divyang2401/Recursions-Functional-Programming/blob/master/P_8.sml"> 8:</a></th>
  <th>Define a function findpos which takes a list ls and a value x and returns its last(rightmost) position in the list: the output should be of type int option. If x does not occur in the list the output should be NONE.

findpos([2,4,8,8,4],4);
val it= SOME 4:int option

findpos(["its","a","mad","mad","mad","world"],"mad");
val it= SOME 4:int option

findpos([[1,3],[2,3],[2,2]],[3,1]);
val it= NONE:int option</th>
</tr>

</table>  
