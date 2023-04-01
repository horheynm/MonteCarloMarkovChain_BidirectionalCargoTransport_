### Computational Description

A stochastic model to predict protein movement was created, based on kinetics from published data. Experiments were verified by recapitulating the real-world experiments (minimize loss). 


### Biological Description

In cells, small molecules move by passive diffusion (brownian motion, ex. ink in a dye). However, large molecules require active force for movement. "Cars" inside cells can transport their "cargo" to a desired destination. These "cars" or proteins are called kinesin and dyenin.

<img src="src/img/img0.png" width="800"/>

### Why this study is important

Neurons communicate via the use of neurotransmitters. They are created using the ingredients that kinesin and dynein carries. Patients that do not have properly functioning kinesin and dynein are linked with Alzheimers, ALS, and other neurodegenerative diseases. Being able to predict the movement of these proteins may be helpful to develop novel drugs and tageting methods.

Here we have simulation results for two differnt proteins, kinesin-1 and dynein.
<img src="src/img/tugofwar.gif" width="800"/>

Key descoveries are

1. Detachment kinetics play a higher role in how a cargo is being trasported, rather than how strong (high stall force) or how fast (high forward stepping kinetics) 
2. Yildiz's data of 1 kinesin-1 vs 1 DDB were successfully recapitulated and hence we propose a theoretical coarse-grain model of how the cargo is transported

## How to run

Run PaperCodes > OpticalTrap.m for single molecule run-velocity, run-length for kinesin-1, kinesin-2 and cytoplasmic dynein
Run PaperCodes > TugOfWar.m for multi-motor cargo transport in kinesin-1, kinesin-2 and cytoplasmic dynein
Run Animation > test_cargo.m for animation

For visuals/presentation please check out this [link](https://docs.google.com/presentation/d/1deDom1l2jmYkOxjQe5uOUbkkLrrGXNAc-oXJMULMTSo/edit?usp=sharing)

For more info please contact kao110@g.harvard.edu
