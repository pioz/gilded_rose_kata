# Gilded Rose Requirements Specification

Hi and welcome to team _Gilded Rose_. As you know, we are a small inn with a
prime location in a prominent city ran by a friendly innkeeper named Allison.
We also buy and sell only the finest goods. Unfortunately, our goods are
constantly degrading in `quality` as they approach their sell by date.

We have a system in place that updates our inventory for us. It was developed
by a no-nonsense type named Leeroy, who has moved on to new adventures. Your
task is to add the new feature to our system so that we can begin selling a
new category of items. First an introduction to our system:

- All items have a `days_remaining` value which denotes the number of days we
  have to sell the items.
- All items have a `quality` value which denotes how valuable the item is.
- At the end of each day our system lowers both values for every item.

Pretty simple, right?
