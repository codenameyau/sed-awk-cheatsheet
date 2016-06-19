# awk -f avg avg-grade.awk grades.txt

{
  total = $3 + $4 + $5;
  avg = total / 3;
  grade = "C";

  if (avg >= 90) grade = "A";
  else if (avg >= 80) grade = "B";
  else if (avg >= 70) grade = "C";
  else if (avg >= 65) grade = "D";
  else grade = "F";

  print $1, "=>", grade;
}
