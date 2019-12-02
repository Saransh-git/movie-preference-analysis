# Predicting Movie Preferences from Personality Traits and Interests

- Note: Refer to the complete report for detailed analysis. 
In this project, we tried to create experimental design such that we find factors of personality traits, interests, phobia and music preferences that influence the choice of horror movie/serial genre among people.

The survey data used in the report contained a wide range of questions, hence we first performed factor screening and then carried out various data analysis such as residual analysis, interaction effect exploration. This helped us to achieve useful results of common personality traits and interests which overlap with liking of Horror genre.
 
All the steps performed in this project can be implemented for extracting similar information about liking of other movie genres such as Sci-fi, Action, War, Comedy, etc.

##Introduction/ Recognition and Statement of the problem
Today, with increasing trend and popularity in online streaming services such as Netflix, Disney Plus, Amazon Prime , etc. everyone can choose and watch movies and serials of their own preferred genre. 
One of the movie or serial genre is Horror, but we all know it is not everyone’s favourite. When we are sitting in a group of friends there might be always someone who hate horror movies and other who might have finished watching all the released ones. This contrast liking of horror makes us sometimes wonder do people of certain interest hate horror movies. Hence, we thought to explore personality traits, phobias, music preferences and hobbies and Interests to find explainability towards liking of horror movies. 

The objectives to our experimental design are therefore three folds:
Factor screening: Identify the factors which most influence the affinity towards watching Horrors.
Optimization: If we are hosting a movie party and we are planning on screening a Horror, then we need to be sure about who to invite and who not to invite so as to not make anyone uncomfortable in the party. 
Generalization: The same experimental design can be extended over to learn the affinity towards other genres such as Comedies, Sci-fis, Actions, Thrillers etc.

##Design of Experiment

###Selection of the response variable

Given we are targeting the affinity towards Horrors, the response variable was chosen on a 5 way likert scale ranging from Strongly Disagree (1), Disagree (2), Neutral (3), Agree(4), Strongly Agree (5). Respondents were asked whether they enjoy watching Horror movies or not. The choice of a 5-way likert scale was to ease the collection of responses from respondents, as it becomes subjective and difficult if someone has to score their affinity on a continuous scale.
Choice of factors, levels and range

###Design factors

- Likes Music - This tells how much participant enjoys listening to music with 1 being enjoys least.
- Slow songs or fast songs- This tells whether the person prefer slow paced music(1) or fast paced music(5)
- Horror - This is our response variable with 1 means least preference to watch horror movies
- Psychology - This tells us the interest of participant in Psychology with 1 being least interested
- Politics -  This tells us the interest of participant in Politics with 1 being least interested
- Physics -  This tells us the interest of participant in Physics with 1 being least interested
- Science and Technology -  This tells us the interest of participant in Science and Technology with 1 being least interested
- Theatre -  This tells us the interest of participant in Theatre with 1 being least interested
- History -  This tells us the interest of participant in History with 1 being least interested
- Fun with friends - This tells us how much participant enjoys socializing with 1 being enjoys least
- Darkness - Participant has darkness phobia with 5 as maximum phobia
- Snakes - Participant has phobia of snakes with 5 as maximum phobia
- Spiders - Participant has phobia of spiders with 5 as maximum phobia.
- Rats - Participant has phobia of rats with 5 as maximum phobia.
- Workaholism - Tells how much participants like to work in spare time with 5 being love to do it.
- Funniness - Tells how much participants tries to be the funniest one, with 1 being least funny.
- Happiness in life - Tells how much happy participant is with life with 5 being 100% happy
- Internet usage - This tells how often participant uses internet and this variable has the following options - no time at all, less than an hour a day, a few hours a day and most of the day.
- Finances - tells how much participant saves money with 5 meaning saves as much as he/she can.
- Entertainment spending - This variable shows how much money is spent on partying and socializing with 5 being spends a lot. 
- Age - This tells about the age of participants.
 
###Allowed to vary factors

Alongside the design factors considered for the experiment, data was also collected for several other traits demonstrating Music preferences, Hobbies, Interests, Health habits, views on life, opinions and spending habits. As we were focused on what could possibly impact the affinity towards watching Horrors, we considered the design factors as mentioned above only for the analysis and left the others to vary across the respondents (treatment units).

###Nuisance factors

While we are interested in finding the most influencing factors, there can be variations in our analysis based on whether respondents like to watch movies overall or not. A respondent who is overall less likely to watch any sort of movie would also refrain from watching Horror. 

As a result, respondents were asked if they enjoy watching movies on a scale of 1 (Strongly Disagree) to 5 (Strongly Agree). The same has been treated as blocks on our analysis.
Uncontrollable factors not accounted

Other traits as we know there are many besides what we have considered in our experimental design. Also, that bringing in factors based on regions, genders etc. brings in subjectivity to the problem and such kind of factors are not accounted and deemed uncontrollable.

###Choice of experimental design

Given the first objective to our problem of screening influential factors, we restrict the levels/ treatments of factors to two levels each as described in Design factors. Also, given the presence of blocked variable in the form of watch movies or not, we have a blocking variable. Therefore, we initially deploy a fixed effects model to capture the main and interaction effects with a randomized block design. We are only considering the second order model and ignoring all the interaction effects involving more than two variables. This choice was made due to the presence of a lot of variables (~ 20 design factors),  considering all the possible effects would have taken an enormous amount of time to execute. Please refer to Appendix to see the full model considered.

##Data

We had such a data available from a public survey where the 1,010 respondents in the age group of 15-30 were asked to have a survey on several items covering the following traits:
Music Preferences (19 traits)
Movie Preferences (12 traits)
Hobbies & Interests (32 traits)
Phobias (10 traits)
Health Habits (3 traits)
Personality traits, views on life, and opinions (57 traits)
Spending habits (7 traits)
Demographics (10 traits)

As mentioned in Choice of factors, levels and range, we selected the 20 design factors and 1 blocking variable as per the consideration in our current experimental design.

Following are the results as obtained from survey against the 20 design factors on a scale of 1 (Strongly Disagree) to 5 (Strongly Agree).


##Analysis and Results
###Models

We ran the full model as described in Full Model. Below is the plot as obtained with Half-normal probability plot on effects obtained from the Full Model.

Alongside, the half-normal probability plot, we also performed ANOVA analysis on the effects obtained from the full model. The ANOVA output for full model has been omitted from the report due to its length. Following factors were found significant at 95% significance level.
Slow_fast_music
Theatre
Fun_with_friends
Snakes
Happy_life
Entertainment_spend
Age
Watch_movies (Block effect)
Like_music:history
Slow_fast_music:psychology
Slow_fast_music:entertainment_spend
Politics:age
Sci_and_tech:finances
Sci_and_tech:entertainment_spend
History:rats
Darkness:snakes
darkness:spiders

We fit the reduced model as obtained from the above analysis (described at Reduced Model 1). We further performed ANOVA analysis to find the significant factors at 95% significance and reduced our model further to Reduced Model 2.


##Conclusions

###Final Conclusions 
- We concluded interesting results that the people who are of more age in the interval of 15-30 years, who spend more on entertainment, like socializing with friends and listen to fast pace music, while less happy with their lives, less interest in theatre and have no phobia of darkness and snakes prefer to watch more horror movies. 

###Future Work
 - Firstly, in this project we worked only with horror movie preferences, using the same data all the steps could be repeated to find out the interests, traits and phobia of leading to interest in other genres of movies such as sci-fi, comedy, war, action, etc.
- For moving ahead with same problem statement to incorporate even better model we learnt from our residual plot analysis that ordinal regression can be performed in the future. As, it might be more suitable for the ordinal survey data we are dealing with in this project.

##References
- Parallel straight Lines on Residuals vs. Predicted Values Plot ...." 28 Jun. 2017, https://stats.stackexchange.com/questions/287669/parallel-straight-lines-on-residuals-vs-predicted-values-plot. Accessed 1 Dec. 2019.
- "Douglas C. Montgomery-Design and Analysis of Experiments ...." http://faculty.business.utsa.edu/manderso/STA4723/readings/Douglas-C.-Montgomery-Design-and-Analysis-of-Experiments-Wiley-2012.pdf. Accessed 1 Dec. 2019.
- MATH 567 - Design and Analysis of Experiments, Illinois Institute of Technology
- "ANOVA." 17 Sep. 2018, https://stat.ethz.ch/~meier/teaching/anova/. Accessed 1 Dec. 2019.

