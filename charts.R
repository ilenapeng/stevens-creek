library(tidyverse)
library(extrafont)
library(ggimage)

# read in data
rain_df <- read_csv('rainfall.csv')
creeks_df <- read_csv('creeks.csv')

# define plot theme
plot_theme <- theme(
  text=element_text(family="Roboto", color="black"),
  axis.title=element_blank(),
  axis.text.x=element_text(face="bold", color="#727272"),
  axis.text.y=element_text(face="bold", color="#A2A2A2"),
  legend.title=element_text(face="bold", color="#727272"),
  legend.text=element_text(color="#727272"),
  plot.title=element_text(size=16, face="bold"),
  plot.caption=element_text(hjust=0, color="#868686", size=8),
  plot.margin=margin(1,1,1,1,"cm")
)

# create rainfall chart
rain_df$image <- "https://cdn.pixabay.com/photo/2019/09/11/01/04/water-droplet-4467596_1280.png"

rain_plot <- ggplot(rain_df, aes(x=Date, y=Precipitation)) +
  geom_image(aes(image=image), size=.03) +
  labs(
    title="The South Bay received 4.35 inches of rain during first part\nof rainy season",
    subtitle="Inches of precipitation in the San Jose area from December to mid-January",
    caption="\nChart: Ilena Peng · Source: National Weather Service",
    y="Precipitation (in)"
  ) +
  annotate("text", x = as.Date("2021-12-15", "%Y-%m-%d"), y = 2, label = "An atmospheric river brought\nover two inches of rain\nto the area", hjust=0, family='Roboto', size=3) +
  theme_minimal() +
  plot_theme

print(rain_plot)
ggsave("rainfall.png", rain_plot, width=7, height=6, unit="in")

# create creeks flow rate chart
creeks_df$DateTime <- as.Date(creeks_df$DateTime, "%m/%d/%Y")
# take max from each day
creeks_df <- creeks_df %>% group_by(DateTime, Loc) %>% summarise_all(max)

creeks_plot <- ggplot(creeks_df) +
  geom_point(aes(x=DateTime, y=Loc, size=FlowRate), color="#6debfb", alpha=0.5)  +
  labs(
    title="Some sections of the creek's water flow increased from nearly\nstagnant to over 100 cubic ft/second during the storms",
    subtitle="Maximum stream flow rate (cubic ft/second) each day in sections of Stevens Creek",
    caption="\nChart: Ilena Peng · Source: Valley Water",
    size="Flow Rate"
  ) +
  theme_minimal() +
  plot_theme

print(creeks_plot)
ggsave("creeks.png", creeks_plot, width=9, height=4, unit="in")