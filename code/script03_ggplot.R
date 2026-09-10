library(tidyverse)

iris %>% 
  ggplot(
    aes(x = Sepal.Length,
        y = Sepal.Width)
  )+geom_point()


# point figure  -----------------------------------------------------------

iris %>% 
  ggplot(
    aes(x=Sepal.Length,
         y=Sepal.Width,
         color=Species)
 )+geom_point()


iris %>% 
  ggplot(
    aes(x=Sepal.Length,
        y=Sepal.Width)
  )+
  geom_point(color= "darkgreen")


# line figure  ------------------------------------------------------------

df_x <- tibble(x = 1:50,
              y = x * 2)
df_x %>% 
  ggplot(
    aes(x=x,
        y=y)
  )+
  geom_line()

iris %>% 
  ggplot(
    aes(x=Sepal.Length
      )
  )+geom_histogram()


# box plot ----------------------------------------------------------------

iris %>% 
  ggplot(
    aes(x=Species,
        y=Sepal.Length)
  ) +
  geom_boxplot()

iris %>% 
  ggplot(
    aes(x=Species,
        y=Sepal.Length,
        color=Species)
  )+ 
  geom_boxplot()

## change inside box
iris %>% 
  ggplot(
    aes(x=Species,y=Sepal.Length,fill = Species)
  )+ geom_boxplot()

# exercise 
# Q1 using the "iris" data, identify the longest sepal.length using arrange() function 

iris %>% 
  arrange(desc(Sepal.Length))
#A 7.9 
#   Q2 using "iris" data, filter/select individuals with sepal.width greater than 3.0
iris %>% 
  filter(Sepal.Width > 3.0)
#   Q3 using the "iris" data, select the columns "petal.length" and "petal.width", and arrange the order of rows by "petal.length"
# Assign the result to object "df_petal" 

df_petal <- iris %>% 
  select(Petal.Length, Petal.Width) %>% 
 arrange(desc(Petal.Length)) 

# Q4 Calculate mean Sepal.width by species; assign the result to "df_mean" 
#- hint group_by() and summarize()

df_mean <- iris %>% 
  group_by(Species) %>% 
  summarize(mean(Sepal.Width))

#Q5 Create a point figure of Petal.width (y-axis) and Sepal.width (x-axis)
# with colors distinguishing species 
iris %>% 
  ggplot(aes(x=Sepal.Width, y=Petal.Length, color=Species))+
  geom_point()
