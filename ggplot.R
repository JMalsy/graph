library(ggplot2) 
install.packages("ggpubr")
library(ggpubr)
library(dplyr) #df <- filter(mtcars, mpg > 25)
install.packages("wesanderson")
library(wesanderson)
install.packages("tidyverse")
ylibrary(tidyverse)
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggpubr")

# replace XXXX with datasheet
a <- filter(X221026_HIO_ILC2_coculture, experiment=="XXXX")
b <- filter(X221026_HIO_ILC2_coculture, experiment=="XXXX")


# replace XXXXXXXXXXXXX with dataset for x axis
# replace YYYYYYYYYYYYYYY with dataset for x axis
# replace CCCCCCCCCCCCC with dataset to colorcode
ggplot(X221026_HIO_ILC2_coculture, aes(x = XXXXXXXXXXXXX, 
                                       y = YYYYYYYYYYYYY, 
                                       color= CCCCCCCCCCCCC )) +
  geom_jitter(size = 2, width = 0.1)+
  #geom_point(width = 0.5, position = position_dodge(0.7), stat = "summary", color="condition")+
  #remove # above for geom point
  #geom_smooth(position = "identity", stat="smooth", method = "loess", span = 1, level=0, size = 1)+
  #remove # above for linear regession analysis
  theme(
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(), 
    panel.grid.major = element_line(size = 0.125, linetype = 'solid', colour = "grey"),
    panel.grid.minor = element_line(size = 0.0625, linetype = 'solid', colour = "grey"),
    panel.background = element_rect(fill = "white", colour = "black",size = 0.5, linetype = "solid"), 
    axis.text.x = element_text(face="bold", size=12, angle = 45, vjust = 0.9, hjust = 1, color = "black"))+
  #scale_x_discrete(limits = c("AAAAAAAAAAA","BBBBBBBBBB","CCCCCCCCCC"))+
  #remove # above to determine groups on the x axis
  scale_fill_manual(values = c("#567079", "#909e5a", "#CF6900", "#873e62","#9A2E09", "#2C465D" , "#3B5530", "#361E2E","#500909", "#13242D", "#2A381D", "#A6314E", "#CF6970" ))+
  scale_color_manual(values = c("#567079", "#909e5a", "#CF6900", "#873e62","#9A2E09", "#2C465D" , "#3B5530", "#361E2E","#500909", "#13242D", "#2A381D", "#A6314E", "#CF6970"  ))+
  labs(y= " ", x = " ")+
  stat_summary(fun = "median", geom = "bar", fill = "transparent", color = "black", width= 0.4, size = 0.3)+
  stat_summary(fun = median,
               geom = "errorbar", width = 0.3, color = "black", size = 0.4,
               fun.max = function(x) median(x) + sd(x) / sqrt(length(x)),
               fun.min = function(x) median(x) - sd(x) / sqrt(length(x)))+
  stat_compare_means(comparisons = list(c("AAAAAAAAAAA","BBBBBBBBB"),
                                        c("BBBBBBBBBB","CCCCCCCCCC")
  ))

