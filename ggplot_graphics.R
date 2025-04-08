#ggplot graphics
#TEB
#27 March 2025

library(ggplot)
library(patchwork)
library(ggthemes)

#p1 <- gglpot(data= <DATA>) +
#  aes(<MAPPINGS>) +
#  <GEOM_FUNCTIOND>(aes(<MAPPINGS>),
#                   stat=<STAT>,
#                   position=<POSITION>) +
#  <COORDINATED_FUNCTION> +
#  <FACET_FUNCTION>

ggsave(plot=p1,
       filename="MyPlot",
       width=5,
       height=3,
       units="in",
       device="pdf")

d <- mpg #use built in mpg data drame
str(d)
table(d$fl)

#basic histogram plot
ggplot(data=d) +
  aes(x=hwy) +
  geom_histogram()

ggplot(data=d) +
  aes(x=hwy) +
  geom_histogram(fill="khaki", color="black")

#basic ??
ggplot(data=d) +
  aes(x=hwy) +
  geom_density(fill="mintcream", color="blue")


#basic scatter plot
ggplot(data=d)+
  aes(x=displ, y=hwy) +
  geom_point() +
geom+smooth() +
  geom_smooth(method="lm", col="red")

#basic box-plot
ggplot(data=d)+
  aes(x=fl, y=cty) +
  geom_boxplot() +

#basic barplot (logn format)
 ggplot(data=d) +
  aes(x=fl, y=) +


  #stopped paying attention get rest from notes oskay
library(ggplot2)
library(extrafont)
font_import()
fonts()


