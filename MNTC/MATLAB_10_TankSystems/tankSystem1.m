function dC_dt = tankSystem1(t, C, ain_flow, ain_conc, ab, aout, bin_flow, bin_conc, ba, bout, VA, VB)

CA = C(1);
CB = C(2);
dC_dt = zeros(2, 1);
dC_dt(1) = (1/VA)*(-(ab+aout)*CA + ba*CB + ain_flow*ain_conc);
dC_dt(2) = (1/VB)*(-(ba+bout)*CB + ab*CA + bin_flow*bin_conc);
