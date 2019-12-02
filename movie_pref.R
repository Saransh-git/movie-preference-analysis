data_survey = read.csv("~/Desktop/ADE_Project_People_survey/young-people-survey/responses.csv")

library(tidyverse)
colnames(data_survey)
data_tibble = as.tibble(data_survey)
data_horror = data_tibble %>% select(
  Music, Slow.songs.or.fast.songs, Movies, Horror, Psychology, Politics, Physics, Science.and.technology, 
  Theatre, History, Fun.with.friends, Darkness, Snakes, Spiders, Rats, Workaholism, Funniness, 
  Happiness.in.life, Internet.usage, Finances, Entertainment.spending, Age
)
colnames(data_horror) = c(
  'like_music', 'slow_fast_music', 'watch_movies', 'horror', 'psychology', 'politics', 'physics',
  'sci_and_tech', 'theatre', 'history', 'fun_with_friends', 'darkness', 'snakes', 'spiders', 'rats', 
  'work_in_spare_time', 'funny', 'happy_life', 'internet_usage', 'finances', 'entertainment_spend', 'age'
)
data_horror = data_horror %>% drop_na()

data_horror %>% 
  select(like_music , slow_fast_music , watch_movies,
           horror,
           psychology, politics, physics,
           sci_and_tech, theatre, history, 
         fun_with_friends,
           darkness, snakes, spiders, rats, 
           work_in_spare_time, funny, happy_life, internet_usage,  
           finances, entertainment_spend, age
) %>% filter(data_horror, like_music == 3 | slow_fast_music == 3| watch_movies == 3 |
               horror == 3 |
         psychology == 3 | politics == 3 | physics ==3 |
       sci_and_tech == 3| theatre ==3 |history ==3 
       |fun_with_friends == 3|
       darkness== 3| snakes== 3| spiders== 3| rats== 3| 
       work_in_spare_time== 3| funny== 3| happy_life== 3| internet_usage== 3| 
       finances== 3| entertainment_spend == 3| age== 3)


ggplot(data=data_horror) + geom_bar(mapping = aes(like_music, group=like_music, fill=like_music))
ggplot(data=data_horror) + geom_bar(mapping = aes(slow_fast_music, group=slow_fast_music, fill=slow_fast_music))
ggplot(data=data_horror) + geom_bar(mapping = aes(horror, group=horror, fill=horror))
ggplot(data=data_horror) + geom_bar(mapping = aes(psychology, group=psychology, fill=psychology))
ggplot(data=data_horror) + geom_bar(mapping = aes(politics, group=politics, fill=politics))
ggplot(data=data_horror) + geom_bar(mapping = aes(physics, group=physics, fill=physics))
ggplot(data=data_horror) + geom_bar(mapping = aes(sci_and_tech, group=sci_and_tech, fill=sci_and_tech))
ggplot(data=data_horror) + geom_bar(mapping = aes(theatre, group=theatre, fill=theatre))
ggplot(data=data_horror) + geom_bar(mapping = aes(history, group=history, fill=history))
ggplot(data=data_horror) + geom_bar(mapping = aes(fun_with_friends, group=fun_with_friends, fill=fun_with_friends))
ggplot(data=data_horror) + geom_bar(mapping = aes(darkness, group=darkness, fill=darkness))
ggplot(data=data_horror) + geom_bar(mapping = aes(snakes, group=snakes, fill=snakes))
ggplot(data=data_horror) + geom_bar(mapping = aes(spiders, group=spiders, fill=spiders))
ggplot(data=data_horror) + geom_bar(mapping = aes(rats, group=rats, fill=rats))
ggplot(data=data_horror) + geom_bar(mapping = aes(work_in_spare_time, group=work_in_spare_time, fill=work_in_spare_time))
ggplot(data=data_horror) + geom_bar(mapping = aes(funny, group=funny, fill=funny))
ggplot(data=data_horror) + geom_bar(mapping = aes(happy_life, group=happy_life, fill=happy_life))
ggplot(data=data_horror) + geom_bar(mapping = aes(internet_usage, group=internet_usage, fill=internet_usage))
ggplot(data=data_horror) + geom_bar(mapping = aes(finances, group=finances, fill=finances))
ggplot(data=data_horror) + geom_bar(mapping = aes(entertainment_spend, group=entertainment_spend, fill=entertainment_spend))
ggplot(data=data_horror) + geom_bar(mapping = aes(age, group=age, fill=age))


"Mean vaues or values at which division shall take place
 Music - 1,2,3,4 versus 5 , 
 Slow.songs.or.fast.songs- 1,2,3 versus 4,5
Movies - 1,2,3,4 versus 5, ( Blocking )
Horror - 1,2 versus 3,4,5,  ( Response Variable)
Psychology - 1,2,3 versus 4,5 , 
Politics - 1,2 versus 3,4,5, 
Physics - 1 versus 2,3,4,5, 
Science.and.technology - 1,2,3 versus 4,5, 
Theatre - 1,2,3 versus 4,5, 
History - 1,2,3 versus 4,5, 
Fun.with.friends - 1,2,3, 4 versus 5, 
Darkness - 1,2 versus 3,4,5, 
Snakes - 1,2 versus 3,4,5, 
Spiders - 1,2 versus 3,4,5, 
Rats - 1,2 versus 3,4,5, 
Workaholism - 1,2 versus 3, 4,5, 
Funniness - 1,2,3 versus 4,5, 
Happiness.in.life - 1,2,3 versus 4,5, 
Internet.usage - few hrs versus all, 
Finances - 1,2,3 versus 4,5, 
Entertainment.spending - 1,2,3 versus 4,5, 
Age - above n below 18w
"
############################# Likert Plot ###############################
ques_list = c()
for (column_name in colnames(data_horror %>% dplyr::select(-age, -internet_usage))){
  ques_list = c(ques_list, rep(column_name, nrow(data_horror)))
}
responses = c()
for (column_name in colnames(data_horror %>% dplyr::select(-age, -internet_usage))){
  responses = c(responses, data_horror[[column_name]])
}
ggplot() + geom_bar(mapping=aes(ques_list, group=responses, fill=responses)) + scale_fill_continuous(
  name="Response Scale", labels= c("Strongly Disagree", "Disagree", "Neutral", "Agree", "Strongly Agree")) +coord_flip() + xlab("Questions") + ylab("Responses")

############################# Data Preparation ###############################
prepd_data <- data_horror %>%  mutate(like_music =if_else(like_music < 5, -1, 1))
prepd_data <- prepd_data %>%  mutate(slow_fast_music =if_else(slow_fast_music< 4, -1, 1))
prepd_data <- prepd_data %>%  mutate(psychology =if_else(psychology < 4, -1, 1))
prepd_data <- prepd_data %>%  mutate(politics =if_else(politics < 3, -1, 1))
prepd_data <- prepd_data %>%  mutate(physics =if_else( physics< 2, -1, 1))
prepd_data <- prepd_data %>%  mutate(sci_and_tech =if_else(sci_and_tech< 4, -1, 1))
prepd_data <- prepd_data %>%  mutate(theatre =if_else( theatre< 4, -1, 1))
prepd_data <- prepd_data %>%  mutate(history  =if_else( history < 4, -1, 1))
prepd_data <- prepd_data %>%  mutate(fun_with_friends =if_else( fun_with_friends< 5, -1, 1))
prepd_data <- prepd_data %>%  mutate( darkness=if_else( darkness< 3, -1, 1))
prepd_data <- prepd_data %>%  mutate( snakes=if_else( snakes< 3, -1, 1))
prepd_data <- prepd_data %>%  mutate( spiders=if_else( spiders< 3, -1, 1))
prepd_data <- prepd_data %>%  mutate( rats=if_else( rats< 3, -1, 1))
prepd_data <- prepd_data %>%  mutate( work_in_spare_time=if_else( work_in_spare_time< 3, -1, 1))
prepd_data <- prepd_data %>%  mutate( funny=if_else( funny< 4, -1, 1))
prepd_data <- prepd_data %>%  mutate( happy_life=if_else(  happy_life< 4, -1, 1))
prepd_data <- prepd_data %>%  mutate( finances=if_else( finances< 4, -1, 1))
prepd_data <- prepd_data %>%  mutate( entertainment_spend=if_else(entertainment_spend< 4, -1, 1))
prepd_data <- prepd_data %>%  mutate(internet_usage =if_else( internet_usage == "few hours a day", -1, 1))
prepd_data <- prepd_data %>%  mutate(age=if_else(age< 20, -1, 1))

############################# Change to factors ###############################
prepd_data$like_music  = as.factor(prepd_data$like_music)
prepd_data$slow_fast_music  = as.factor(prepd_data$slow_fast_music)
prepd_data$psychology  = as.factor(prepd_data$psychology)
prepd_data$politics  = as.factor(prepd_data$politics)
prepd_data$physics  = as.factor(prepd_data$physics)
prepd_data$sci_and_tech  = as.factor(prepd_data$sci_and_tech)
prepd_data$theatre  = as.factor(prepd_data$theatre)
prepd_data$history  = as.factor(prepd_data$history)
prepd_data$fun_with_friends  = as.factor(prepd_data$fun_with_friends)
prepd_data$darkness  = as.factor(prepd_data$darkness)
prepd_data$snakes  = as.factor(prepd_data$snakes)
prepd_data$spiders  = as.factor(prepd_data$spiders)
prepd_data$rats  = as.factor(prepd_data$rats)
prepd_data$work_in_spare_time  = as.factor(prepd_data$work_in_spare_time)
prepd_data$funny  = as.factor(prepd_data$funny)
prepd_data$happy_life  = as.factor(prepd_data$happy_life)
prepd_data$internet_usage  = as.factor(prepd_data$internet_usage)
prepd_data$finances  = as.factor(prepd_data$finances)
prepd_data$entertainment_spend  = as.factor(prepd_data$entertainment_spend)
prepd_data$age  = as.factor(prepd_data$age)

########################### Regression Model #################################

"fit = lm(horror~like_music*slow_fast_music*psychology*politics*physics*
         sci_and_tech*theatre*history*
         fun_with_friends*darkness*snakes*spiders*rats*
         work_in_spare_time*funny*happy_life*internet_usage*
         finances*entertainment_spend*age, data=data_horror)
anova(fit)
"

fit = lm(horror ~ like_music*slow_fast_music + like_music*psychology + like_music*politics
         + like_music*physics + like_music*sci_and_tech + like_music*theatre + like_music*history
         + like_music*fun_with_friends + like_music*darkness + like_music*snakes + like_music*spiders
         + like_music*rats + like_music*work_in_spare_time + like_music*funny + like_music*happy_life
         + like_music*internet_usage + like_music*finances + like_music*entertainment_spend
         + like_music*age + slow_fast_music*psychology* + slow_fast_music*politics+slow_fast_music*physics +
           slow_fast_music*sci_and_tech+slow_fast_music*theatre+slow_fast_music*history+
           slow_fast_music*fun_with_friends+slow_fast_music*darkness+slow_fast_music*snakes+slow_fast_music*spiders+slow_fast_music*rats+slow_fast_music*
           work_in_spare_time+slow_fast_music*funny+slow_fast_music*happy_life+slow_fast_music*internet_usage+slow_fast_music
         *finances+slow_fast_music*entertainment_spend+slow_fast_music*age
         + psychology*politics + psychology*physics + psychology*sci_and_tech + psychology*theatre
         + psychology*history + psychology*fun_with_friends + psychology*darkness + psychology*snakes
         + psychology*spiders + psychology*rats + psychology*work_in_spare_time + psychology*funny
         + psychology*happy_life + psychology*internet_usage + psychology*finances
         + psychology*entertainment_spend + psychology*age + politics*physics +
           politics*sci_and_tech+politics*theatre+politics*history+
           politics*fun_with_friends+politics*darkness+
           politics*snakes+politics*spiders+
           politics*rats+politics*
           work_in_spare_time+politics*funny+politics*happy_life+politics*internet_usage+politics
         *finances+politics*entertainment_spend+politics*age + physics*sci_and_tech+physics*theatre+physics*history+
           physics*fun_with_friends+physics*darkness+
           physics*snakes+physics*spiders+
           physics*rats+physics*
           work_in_spare_time+physics*funny+physics*happy_life+physics*internet_usage+physics
         *finances+physics*entertainment_spend+physics*age + sci_and_tech*theatre+sci_and_tech*history+
           sci_and_tech*fun_with_friends+sci_and_tech*darkness+
           sci_and_tech*snakes+sci_and_tech*spiders+
           sci_and_tech*rats+sci_and_tech*
           work_in_spare_time+sci_and_tech*funny+sci_and_tech*happy_life+sci_and_tech*internet_usage+sci_and_tech
         *finances+sci_and_tech*entertainment_spend+sci_and_tech*age + theatre*history+
           theatre*fun_with_friends+theatre*darkness+
           theatre*snakes+theatre*spiders+
           theatre*rats+theatre*
           work_in_spare_time+theatre*funny+theatre*happy_life+theatre*internet_usage+theatre
         *finances+theatre*entertainment_spend+theatre*age + history*fun_with_friends+history*darkness+
           history*snakes+history*spiders+
           history*rats+history*
           work_in_spare_time+history*funny+history*happy_life+history*internet_usage+history
         *finances+history*entertainment_spend+history*age + fun_with_friends*darkness + fun_with_friends*snakes + fun_with_friends*spiders + fun_with_friends*rats
         + fun_with_friends*work_in_spare_time + fun_with_friends*funny + fun_with_friends*happy_life
         + fun_with_friends*internet_usage + fun_with_friends*finances + fun_with_friends*entertainment_spend
         + fun_with_friends*age + darkness*snakes+darkness*spiders+
           darkness*rats+darkness*
           work_in_spare_time+darkness*funny+darkness*happy_life+darkness*internet_usage+darkness
         *finances+darkness*entertainment_spend+darkness*age + snakes*spiders+
           snakes*rats+snakes*
           work_in_spare_time+snakes*funny+snakes*happy_life+snakes*internet_usage+snakes
         *finances+snakes*entertainment_spend+snakes*age + spiders*rats+spiders*
           work_in_spare_time+spiders*funny+spiders*happy_life+spiders*internet_usage+spiders
         *finances+spiders*entertainment_spend+spiders*age + rats*work_in_spare_time+rats*funny+rats*happy_life+rats*internet_usage+rats
         *finances+rats*entertainment_spend+rats*age + work_in_spare_time*funny+work_in_spare_time*happy_life+work_in_spare_time*internet_usage+work_in_spare_time
         *finances+work_in_spare_time*entertainment_spend+work_in_spare_time*age + funny*happy_life+funny*internet_usage+funny
         *finances+funny*entertainment_spend+funny*age + happy_life*internet_usage+happy_life
         *finances+happy_life*entertainment_spend+happy_life*age +
           internet_usage*finances+internet_usage*entertainment_spend+internet_usage*age
         + finances*entertainment_spend+finances*age + entertainment_spend*age + watch_movies
         ,data=prepd_data
) 

########################### Half Normal Plot #################################
library(unrepx)
hnplot(fit$effects, ID=TRUE)

########################### Model with Significant Factors #################################
fit_sig = lm(horror~slow_fast_music+
             theatre+
             fun_with_friends+
             snakes+
             happy_life+
             entertainment_spend+
             age+
             watch_movies+
             like_music*history+
             slow_fast_music:psychology+
             slow_fast_music*entertainment_spend+
             politics*age+
             sci_and_tech*finances+
             sci_and_tech*entertainment_spend+
             history*rats+
             darkness*snakes+
             darkness*spiders , data=prepd_data)
anova(fit_sig)

fit_reduce = lm(horror~slow_fast_music +  
                theatre+
                fun_with_friends +
                snakes +
                happy_life +
                entertainment_spend +
                age+
                watch_movies+
                entertainment_spend*sci_and_tech  +    
                darkness*spiders, data=prepd_data )
 
##################################### Residual Analysis #####################################

res = resid(fit_reduce)
ggplot() + geom_qq(mapping=aes(sample=res)) + geom_qq_line(mapping=aes(sample=res)) + labs(title="QQ plot")

pred =predict(fit_reduce)
ggplot() + geom_point(mapping = aes(pred, res)) + 
  xlab("Predicted values") + ylab("Residuals") + ggtitle("Residuals vs Predicted values")

ggplot(data = prepd_data) + geom_point(mapping = aes(slow_fast_music, res)) + 
  xlab("Slow or Fast Music") + ylab("Residuals") + ggtitle("Residuals vs slow_fast_music")

ggplot(data = prepd_data) + geom_point(mapping = aes(theatre, res)) + 
  xlab("Theatre") + ylab("Residuals") + ggtitle("Residuals vs Theatre")

ggplot(data = prepd_data) + geom_point(mapping = aes(fun_with_friends, res)) + 
  xlab("fun_with_friends") + ylab("Residuals") + ggtitle("Residuals vs fun_with_friends")
ggplot(data = prepd_data) + geom_point(mapping = aes(snakes, res)) + 
  xlab("snakes") + ylab("Residuals") + ggtitle("Residuals vs snakes")
ggplot(data = prepd_data) + geom_point(mapping = aes(happy_life, res)) + 
  xlab("happy_life") + ylab("Residuals") + ggtitle("Residuals vs happy_life")

ggplot(data = prepd_data) + geom_point(mapping = aes(entertainment_spend , res)) + 
  xlab("entertainment_spend ") + ylab("Residuals") + ggtitle("Residuals vs entertainment_spend ")

ggplot(data = prepd_data) + geom_point(mapping = aes(watch_movies , res)) + 
  xlab("watch_movies") + ylab("Residuals") + ggtitle("Residuals vs watch_movies")

ggplot(data = prepd_data) + geom_point(mapping = aes(age, res)) + 
  xlab("age ") + ylab("Residuals") + ggtitle("Residuals vs age ")

ggplot(data = prepd_data) + geom_point(mapping = aes(sci_and_tech, res)) + 
  xlab("sci_and_tech") + ylab("Residuals") + ggtitle("Residuals vs sci_and_tech")
ggplot(data = prepd_data) + geom_point(mapping = aes(darkness , res)) + 
  xlab("darkness") + ylab("Residuals") + ggtitle("Residuals vs darkness")

ggplot(data = prepd_data) + geom_point(mapping = aes(spiders , res)) + 
  xlab("spiders") + ylab("Residuals") + ggtitle("Residuals vs spiders")

##################################### Main Effect Plots ############################################
library(gplots)
plotmeans(prepd_data$horror~prepd_data$slow_fast_music, xlab='Slow Fast Music', ylab='Horror Movies Affinity', main='Main effect plot of Slow and Fast Music', barcol=F)
plotmeans(prepd_data$horror~prepd_data$theatre, xlab='Theatre', ylab='Horror Movies Affinity', main='Main effect plot of Theatre', barcol=F)
plotmeans(prepd_data$horror~prepd_data$fun_with_friends, xlab='Fun with Friends', ylab='Horror Movies Affinity', main='Main effect plot of socializing', barcol=F)
plotmeans(prepd_data$horror~prepd_data$snakes, xlab='Snakes phobia', ylab='Horror Movies Affinity', main='Main effect plot of snakes phobia', barcol=F)
plotmeans(prepd_data$horror~prepd_data$happy_life, xlab='Happy with life', ylab='Horror Movies Affinity', main='Main effect plot Happiness in life', barcol=F)
plotmeans(prepd_data$horror~prepd_data$entertainment_spend, xlab='Entertainment Expenditure', ylab='Horror Movies Affinity', main='Main effect plot of entertainment expenditure', barcol=F)
plotmeans(prepd_data$horror~prepd_data$age, xlab='Age', ylab='Horror Movies Affinity', main='Main effect plot of age', barcol=F)

##################################### Interaction Analysis ############################
interaction.plot(prepd_data$entertainment_spend,prepd_data$sci_and_tech,response=prepd_data$horror)
interaction.plot(prepd_data$darkness,prepd_data$spiders,response=prepd_data$horror)

##################################### Counter Plot ############################
slow_fast_music = seq(1,5, length.out = 20)
theatre = seq(1,5, length.out = 20)
fun_with_friends = seq(1,5, length.out = 20)
snakes = seq(1, 5, length.out = 20)
happy_life = seq(1, 5, length.out = 20)
entertainment_spend = seq(1, 5, length.out = 20)
age = seq(15, 30, length.out = 20)
sci_and_tech = seq(1, 5, length.out = 20)
darkness = seq(1, 5, length.out = 20)
spiders = seq(1, 5, length.out = 20)
entertainment_spend = seq(1, 5, length.out = 20)
new = data.frame(
  slow_fast_music=slow_fast_music, theatre=theatre, fun_with_friends=fun_with_friends, 
  snakes=snakes, happy_life=happy_life, entertainment_spend=entertainment_spend, age=age, 
  darkness=darkness, spiders=spiders, sci_and_tech=sci_and_tech
)
data_block_5 = prepd_data %>% filter(watch_movies == 5)
data_block_5$slow_fast_music = as.integer(data_block_5$slow_fast_music)
data_block_5$theatre = as.integer(data_block_5$theatre)
data_block_5$fun_with_friends = as.integer(data_block_5$fun_with_friends)
data_block_5$snakes = as.integer(data_block_5$snakes)
data_block_5$happy_life = as.integer(data_block_5$happy_life)
data_block_5$entertainment_spend = as.integer(data_block_5$entertainment_spend)
data_block_5$age = as.integer(data_block_5$age)
data_block_5$darkness = as.integer(data_block_5$darkness)
data_block_5$spiders = as.integer(data_block_5$spiders)
data_block_5$sci_and_tech = as.integer(data_block_5$sci_and_tech)
fit_block_5 = lm(horror~slow_fast_music +  
                   theatre+
                   fun_with_friends +
                   snakes +
                   happy_life +
                   entertainment_spend +
                   age+
                   entertainment_spend*sci_and_tech  +    
                   darkness*spiders, data=data_block_5 )
pred = predict(fit_block_5, new)
contour(new$slow_fast_music, new$fun_with_friends, sqrt(outer(pred, pred)), xlab="Slow and Fast music", ylab="Fun with Friends", main="Affinity to Horror movies")
contour(new$entertainment_spend, new$fun_with_friends, sqrt(outer(pred, pred)), xlab="Entertainment Expenditure", ylab="Fun with friends", main="Affinity to Horror movies")


