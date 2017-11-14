# coefficient_bootstrap-
Are Expected Goal Models Biased in the NHL? 

In hockey analytics, shot attempt metrics have grown in popularity in recent years due to their ability to
project future player and team performance. However, metrics like Corsi (all shot attempts) and Fenwick
(all unblocked shot attempts) do not take into account shot quality. One approach to incorporating shot
quality into shot attempt metrics is to weight each unblocked shot attempt by its probability of being
converted into a goal. In this approach, a goal expectancy is assigned to unblocked shots based factors
such as the distance, angle, and whether the shot resulted from a rebound or off the rush. The resulting
metric is typically referred to as “Expected Goals” (xG) pioneered by Brian Macdonald, currently the
Director of Hockey Analytics for the Florida Panthers, which was in part based on a soccer expected goal
version.

Expected goals (xG) are better predictors of team and player performance than Corsi and +/- because
goals are random and scarce events. For reference, the NHL average expected goal on a given shot
hovered around 0.068 based on shooting percentage in 2015-2016. Also, it is important to realize that
expected goals are also influenced by pass sequences, quick touches, or traffic in front of the net, and not
just by player skill alone. Ryan Stimson, a contributor of Hockey Graphs, created The Passing Project,
which tracks the relationship between pass types (i.e behind the net or stretch passes) and shooting
percentage.

Expected goals differ from shot attempt metrics like Corsi or Fenwick in that the value assigned to a
particular shot attempt comes directly from a statistical model, typically logistic regression. To evaluate
players or teams in the 2016-17 season, it might seem reasonable to use an xG model trained on
previous seasons (e.g. data from 2007-08 to 2015-16). However, doing so could potentially lead to a
substantial amount of bias. What if goalies have systematically gotten better or worse at stopping
particular types of shots (e.g. better rebound control) or shots from particular areas of the ice over
time? What if players have gotten systematically better or worse at converting particular types of shots or
shots from particular areas of the ice over time? If this is true, it would be inappropriate to use an xG
model trained on previous seasons of data to evaluate players or teams in the current season. To date,
no one has explored this potential bias.

Read the entire article here: http://statsportsconsulting.com/main/wp-content/uploads/McCool_Otthac-1-1.pdf
