# Monte Carlo Markov Chain Simulation of How Large Molecules are Transported Inside the Cells 

This is repository has the codes used to simulate how large molecules (roughly nm to um scale). We used the Gillespie algorithm to design stochastic MCMC model in kinetics. 

The study has been published in *Traffic* and has been selected as the Editor's Choice for April, 2019. 

[Load‐dependent detachment kinetics plays a key role in bidirectional cargo transport by kinesin and dynein](https://onlinelibrary.wiley.com/doi/full/10.1111/tra.12639)

## Intro
In cells, small molecules move by passive diffusion. However, large molecules require active force for movement. One method that is being carrried out in cells is by "cars" inside the cells called kinesin and dynein.

<img src="/img/img0.png" width="800"/>

Neurons communicate with others via release and detection of neurotransmitters. The "cars" inside cells are responsible for transporting the ingredients required to make these ligands to its destination. Patients who has neuro-degenerative disease have shown to have dysfunction in this kinesin-dynein cargo transport mechanism.

Many experimental studies have done for single molecule (one car experiments), but in reality, the cargo is transported by teams of these "cars". Hence we developed a computational model to predict how the teams cooperate.

We verified our model by recapitulating published experimental results. 

Simulation results with a team of one kinesin-1 and three dynein are shown below:
<img src="/img/tugofwar.gif" width="800"/>


Key descoveries are 
1. Detachment kinetics play a higher role in how cargo is being trasported, rather than how strong (high stall force) or how fast (high forward stepping kinetics)
2. Yildiz's data of 1 kinesin-1 vs 1 DDB were successfully recapitulated and hence we propose a theoretical coarse-grain model of how the cargo is transported


## How to run

Run PaperCodes > OpticalTrap.m for single molecule run-velocity, run-length for kinesin-1, kinesin-2 and cytoplasmic dynein
Run PaperCodes > TugOfWar.m for multi-motor cargo transport in kinesin-1, kinesin-2 and cytoplasmic dynein
Run Animation > test_cargo.m for animation

For visuals/presentation please check out this [link](https://docs.google.com/presentation/d/1deDom1l2jmYkOxjQe5uOUbkkLrrGXNAc-oXJMULMTSo/edit?usp=sharing)


For more info please contact george.ohashi@gmail.com






  
