### Statistical Description

We developed stochastic time-series algorithm, very similar to stocks going up/down, to predict the protein movements based on a probalistic approach - Monte Carlo Markov Chain and Gillespie Algorithm.

Its behavior can be simplified in four states:

- If the protein is ready (Market opening hours)
  1. Go up (stock goes up)
  2. Go down (stock goes down)
  3. Exit (Market closing time / Stock goes off the market)
- If the protein is not ready (Market closing hours)
  1. Get ready (9:30AM, market starts / Re-open the stock)

Our model was able to recapitulate real-world events, and was recognized as a first author, peer reviewed [publication](https://onlinelibrary.wiley.com/doi/full/10.1111/tra.12639), and has been selected as the [paper of the month](<https://onlinelibrary.wiley.com/doi/toc/10.1111/(ISSN)1600-0854.editors-choice>) for April 2019.

### Impact

A conventional model may only be able to predict the movement of one protein (one stock), indepedent from other proteins. However, we expanded this in two different ways:

1. Predict a proteins movement based on the behavior of other proteins
   - How much movement will we see? When is the best time to enter / exit based on other's performance?
2. Select empirical parameters to obtain a higher probability of a desired outcome
   - What can we do (artifically) to increase the probability of a protein going up/down more?

### Biological Description

In cells, small molecules move by passive diffusion (brownian motion, ink in a dye). However, large molecules require active force for movement. "Cars" inside cells can transport their "cargo" to a desired destination. These "cars" or proteins are called kinesin and dyenin.

<img src="/img/img0.png" width="800"/>

### Why this study is important

These proteins are responsible for transporting ingredients necessary to create "messages" for neurons to communicate (neurotransmitters). Being able to predict the movement of these proteins may be helpful to develop novel drugs/methods for neural-related diseases (Alzheimers, ALS, etc). People who do not have proper function of these proteins are linked with the above disease.

Here we have simulation results for two differnt proteins, kinesin-1 and dynein.
<img src="/img/tugofwar.gif" width="800"/>

Key descoveries are

1. Detachment kinetics play a higher role in how a cargo is being trasported, rather than how strong (high stall force) or how fast (high forward stepping kinetics)
2. Yildiz's data of 1 kinesin-1 vs 1 DDB were successfully recapitulated and hence we propose a theoretical coarse-grain model of how the cargo is transported

## How to run

Run PaperCodes > OpticalTrap.m for single molecule run-velocity, run-length for kinesin-1, kinesin-2 and cytoplasmic dynein
Run PaperCodes > TugOfWar.m for multi-motor cargo transport in kinesin-1, kinesin-2 and cytoplasmic dynein
Run Animation > test_cargo.m for animation

For visuals/presentation please check out this [link](https://docs.google.com/presentation/d/1deDom1l2jmYkOxjQe5uOUbkkLrrGXNAc-oXJMULMTSo/edit?usp=sharing)

For more info please contact george.ohashi@gmail.com
