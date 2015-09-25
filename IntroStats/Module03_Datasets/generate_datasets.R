# ********************
data(occupationalStatus)
N = sum(sum(occupationalStatus))
v = data.frame(N, 2)
vc = 1;
for (r in 1:8) {
  for (c in 1:8) {
    for (k in 1:occupationalStatus[r, c]) {
       v[vc, 1] = r;
       v[vc, 2] = c;
       vc = vc + 1;
    }
  }
}
# shuffle rows
v2 = v[sample(nrow(v)),]
names(v2) = c("FatherStatus", "SonStatus")
write.csv(v2, file="OccupationalStatus.csv", row.names = F);


# *******************************
data("UCBAdmissions")
N = sum(UCBAdmissions[1,,]) + sum(UCBAdmissions[2,,])
v = data.frame(Sex=factor(), Department=factor(), Accepted=factor())
levels(v$Sex) = c("Male", "Female")
levels(v$Department) = c("A", "B", "C", "D", "E", "F")
levels(v$Accepted) = c("Yes", "No")
vc = 1;
Departments = c("A", "B", "C", "D", "E", "F");
for (admit in 1:2) {
  if (admit == 1) {admit.type = as.factor("Yes");}
  else {admit.type = as.factor("No")}
  for (male in 1:2) {
    if (male == 1) {sex.type = "Male";} else {sex.type = "Female";}
    for (dept in 1:6) {
      for (student in 1:UCBAdmissions[admit,male,dept]) {
        v[vc,]$Sex = sex.type;
        v[vc,]$Accepted = admit.type;
        v[vc,]$Department = Departments[dept];
        vc = vc + 1;
      }
      
    }
  }
}
