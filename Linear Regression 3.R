> load("~/Downloads/linear_regression/dataSets/states.rds")
Error: bad restore file magic number (file may be corrupted) -- no data loaded
In addition: Warning message:
  file ???states.rds??? has magic number 'X'
Use of save versions prior to 2 is deprecated 
> setwd("~/Downloads/linear_regression 4/dataSets")
> states <- read_dta("~/Downloads/linear_regression 4/dataSets/states.rds")
Error: could not find function "read_dta"
> setwd("~/")
> > setwd("~/Downloads/linear_regression 4/dataSets")
Error: unexpected '>' in ">"
> > getwd()
Error: unexpected '>' in ">"
> setwd("~/")
> setwd("~/Downloads/linear_regression 4/dataSets")
> getwd()
[1] "/Users/markmiracle/Downloads/linear_regression 4/dataSets"
> states_rds <- read_dta("~/Downloads/linear_regression 4/dataSets/states.rds")
Error: could not find function "read_dta"
> states_rds <- readRDS("~/Downloads/linear_regression 4/dataSets/states.rds")
> View(states_rds)
> sts.en.met <- subset(states_rds, select = c("energy", "metro"))
> summary(sts.en.met)
energy          metro       
Min.   :200.0   Min.   : 20.40  
1st Qu.:285.0   1st Qu.: 46.98  
Median :320.0   Median : 67.55  
Mean   :354.5   Mean   : 64.07  
3rd Qu.:371.5   3rd Qu.: 81.58  
Max.   :991.0   Max.   :100.00  
NA's   :1       NA's   :1       
> plot(sts.en.met)
> cor(sts.en.met)
energy metro
energy      1    NA
metro      NA     1
> energy.mod <- lm(energy ~ metro, data=sts.en.met)
Warning messages:
  1: In doTryCatch(return(expr), name, parentenv, handler) :
  display list redraw incomplete
2: In doTryCatch(return(expr), name, parentenv, handler) :
  invalid graphics state
3: In doTryCatch(return(expr), name, parentenv, handler) :
  invalid graphics state
4: In doTryCatch(return(expr), name, parentenv, handler) :
  display list redraw incomplete
5: In doTryCatch(return(expr), name, parentenv, handler) :
  invalid graphics state
6: In doTryCatch(return(expr), name, parentenv, handler) :
  invalid graphics state
> energy.mod <- lm(energy ~ metro, data=states_rds)
> summary(energy.mod)

Call:
  lm(formula = energy ~ metro, data = states_rds)

Residuals:
  Min      1Q  Median      3Q     Max 
-215.51  -64.54  -30.87   18.71  583.97 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept) 501.0292    61.8136   8.105 1.53e-10 ***
  metro        -2.2871     0.9139  -2.503   0.0158 *  
  ---
  Signif. codes:  0 ???***??? 0.001 ???**??? 0.01 ???*??? 0.05 ???.??? 0.1 ??? ??? 1

Residual standard error: 140.2 on 48 degrees of freedom
(1 observation deleted due to missingness)
Multiple R-squared:  0.1154,	Adjusted R-squared:  0.097 
F-statistic: 6.263 on 1 and 48 DF,  p-value: 0.01578

> reg(energy.mod)
Error: could not find function "reg"
> plot(energy ~ metro, data=states_rds)
> abline(lm.out, col="red")
Error in abline(lm.out, col = "red") : object 'lm.out' not found
> plot(energy ~ metro, data=states_rds)
> abline(lm)
Error in int_abline(a = a, b = b, h = h, v = v, untf = untf, ...) : 
  cannot coerce type 'closure' to vector of type 'double'
> plot(energy ~ metro, data=states_rds)
> abline()
> abline(reg = "red")
Error in int_abline(a = a, b = b, h = h, v = v, untf = untf, ...) : 
  invalid a=, b= specification
In addition: Warning message:
  In int_abline(a = a, b = b, h = h, v = v, untf = untf, ...) :
  NAs introduced by coercion
> sts.en.met.inc <- subset(states_rds, select = c("energy", "metro", "income"))
Warning messages:
  1: In doTryCatch(return(expr), name, parentenv, handler) :
  display list redraw incomplete
2: In doTryCatch(return(expr), name, parentenv, handler) :
  invalid graphics state
3: In doTryCatch(return(expr), name, parentenv, handler) :
  invalid graphics state
> summary(sts.en.met.inc)
energy          metro            income     
Min.   :200.0   Min.   : 20.40   Min.   :23.46  
1st Qu.:285.0   1st Qu.: 46.98   1st Qu.:29.88  
Median :320.0   Median : 67.55   Median :33.45  
Mean   :354.5   Mean   : 64.07   Mean   :33.96  
3rd Qu.:371.5   3rd Qu.: 81.58   3rd Qu.:36.92  
Max.   :991.0   Max.   :100.00   Max.   :48.62  
NA's   :1       NA's   :1                       
> plot(sts.en.met.inc)
> cor(sts.en.met.inc)
energy metro income
energy      1    NA     NA
metro      NA     1     NA
income     NA    NA      1
> energy.income.mod <- lm(energy ~ metro + income, data=states_rds)
Warning messages:
  1: In doTryCatch(return(expr), name, parentenv, handler) :
  display list redraw incomplete
2: In doTryCatch(return(expr), name, parentenv, handler) :
  invalid graphics state
3: In doTryCatch(return(expr), name, parentenv, handler) :
  invalid graphics state
> summary(energy.income.mod)

Call:
  lm(formula = energy ~ metro + income, data = states_rds)

Residuals:
  Min      1Q  Median      3Q     Max 
-229.68  -67.10  -32.28   13.01  550.65 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept)  459.212    107.533   4.270 9.41e-05 ***
  metro         -2.600      1.131  -2.300    0.026 *  
  income         1.823      3.821   0.477    0.635    
---
  Signif. codes:  0 ???***??? 0.001 ???**??? 0.01 ???*??? 0.05 ???.??? 0.1 ??? ??? 1

Residual standard error: 141.3 on 47 degrees of freedom
(1 observation deleted due to missingness)
Multiple R-squared:  0.1197,	Adjusted R-squared:  0.08223 
F-statistic: 3.195 on 2 and 47 DF,  p-value: 0.04999

> sts.en.met.green <- subset(states_rds, select = c("energy", "metro", "green"))
> summary(sts.en.met.green)
energy          metro            green       
Min.   :200.0   Min.   : 20.40   Min.   : 11.76  
1st Qu.:285.0   1st Qu.: 46.98   1st Qu.: 16.98  
Median :320.0   Median : 67.55   Median : 21.38  
Mean   :354.5   Mean   : 64.07   Mean   : 25.11  
3rd Qu.:371.5   3rd Qu.: 81.58   3rd Qu.: 26.34  
Max.   :991.0   Max.   :100.00   Max.   :114.40  
NA's   :1       NA's   :1        NA's   :3       
> plot(sts.en.met.green)
> cor(sts.en.met.green)
energy metro green
energy      1    NA    NA
metro      NA     1    NA
green      NA    NA     1
> energy.green.mod <- lm(energy ~ metro + green, data=states_rds)
> summary(energy.green.mod)

Call:
lm(formula = energy ~ metro + green, data = states_rds)

Residuals:
Min     1Q Median     3Q    Max 
-95.66 -46.12 -11.06  25.20 361.87 

Coefficients:
Estimate Std. Error t value Pr(>|t|)    
(Intercept) 203.79651   47.64448   4.277 9.73e-05 ***
metro         0.03276    0.55257   0.059    0.953    
green         5.48207    0.73892   7.419 2.45e-09 ***
---
Signif. codes:  0 ???***??? 0.001 ???**??? 0.01 ???*??? 0.05 ???.??? 0.1 ??? ??? 1

Residual standard error: 76.17 on 45 degrees of freedom
(3 observations deleted due to missingness)
Multiple R-squared:  0.5939,	Adjusted R-squared:  0.5758 
F-statistic:  32.9 on 2 and 45 DF,  p-value: 1.565e-09

> plot(energy ~ metro + income, data=states_rds)
Hit <Return> to see next plot: 
Hit <Return> to see next plot: 
> 
> plot(energy ~ metro + green, data=states_rds)
Hit <Return> to see next plot: 
Hit <Return> to see next plot: 
> sts.en.green.csat.tox <- subset(states_rds, select = c("energy", "green", "csat", "toxic"))
> summary(sts.en.green.csat.tox)
energy          green             csat            toxic        
Min.   :200.0   Min.   : 11.76   Min.   : 832.0   Min.   :  0.770  
1st Qu.:285.0   1st Qu.: 16.98   1st Qu.: 888.0   1st Qu.:  6.737  
Median :320.0   Median : 21.38   Median : 926.0   Median : 11.705  
Mean   :354.5   Mean   : 25.11   Mean   : 944.1   Mean   : 17.606  
3rd Qu.:371.5   3rd Qu.: 26.34   3rd Qu.: 997.0   3rd Qu.: 21.488  
Max.   :991.0   Max.   :114.40   Max.   :1093.0   Max.   :101.280  
NA's   :1       NA's   :3                         NA's   :1        
> plot(sts.en.green.csat.tox)
> cor(sts.en.green.csat.tox)
energy green csat toxic
energy      1    NA   NA    NA
green      NA     1   NA    NA
csat       NA    NA    1    NA
toxic      NA    NA   NA     1
> energy.green.csat.tox.mod <- lm(energy ~ green + csat + toxic, data=states_rds)
> summary(energy.green.csat.tox.mod)

Call:
  lm(formula = energy ~ green + csat + toxic, data = states_rds)

Residuals:
  Min       1Q   Median       3Q      Max 
-167.938  -36.389   -7.937   24.639  182.196 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept) 339.6225   125.4881   2.706  0.00964 ** 
  green         4.8516     0.5479   8.854 2.48e-11 ***
  csat         -0.1759     0.1370  -1.284  0.20590    
toxic         2.7853     0.4769   5.840 5.79e-07 ***
  ---
  Signif. codes:  0 ???***??? 0.001 ???**??? 0.01 ???*??? 0.05 ???.??? 0.1 ??? ??? 1

Residual standard error: 57.81 on 44 degrees of freedom
(3 observations deleted due to missingness)
Multiple R-squared:  0.7712,	Adjusted R-squared:  0.7556 
F-statistic: 49.44 on 3 and 44 DF,  p-value: 3.841e-14

> plot(energy ~ green + csat + toxic, data=states_rds)
Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  Hit <Return> to see next plot: 
  > 
  > sat.expense.by.percent <- lm(csat ~ expense*income,
                                 +                              data=states.data)
Error in is.data.frame(data) : object 'states.data' not found
> save.image("~/Downloads/linear_regression 4/dataSets/States_2.RData")
>
  