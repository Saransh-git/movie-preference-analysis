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
#prepd_data <- prepd_data %>%  mutate(Movies =if_else(Movies< 5, -1, 1))
#prepd_data <- prepd_data %>%  mutate(Horror  =if_else(Horror < 3, -1, 1))
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






