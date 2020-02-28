# 183DApset1

Problem Set 1
Markov Decision Problem using Value/Policy Iteration

Collaborators
* I collaborated with Nathan March. Our join github repo can be found here:
    * https://github.com/nathanzmarch/183DApset1
* I did not consult any resources other than the lecture notes and videos.

1. MDP Problem
    * My state space S has one value for each spot on the map, and has a size of 30.
    * My action space has one value for each possible move: up, down, left, right, stop, and has a size of 5.
    * My sas probability has several cases
        * Case 1: endpoint is out of bounds or an obstacle &rarr; Return 0
        * Case 2: action is not moving.
            * s == s’ 	→ return 1
            * s != s’ 	→ return 0 
        * Case 3: All other cases
            * End point is in the correct direction → return <img src="https://github.com/nathanzmarch/183DApset1/blob/master/Equations/sasprob%20case%203a.png" alt="alt text" height="20px" align="center">
            * End point is in the wrong direction  → return <img src="https://github.com/nathanzmarch/183DApset1/blob/master/Equations/sasprob%20case%203b.png" alt="alt text" height="20px" align="center">
            
2. Planning Problem
    * I added the obstacles by adding additional cases in the isValidMove and isObstacle functions.
    * I added the rewards by adding a rewards function that returns a hardcoded number depending on the location.

3. Policy Iteration
    * The initial policy will contain a probability distribution for each space with action probabilities for each action in the order [up, down, left, right, stay]. These are initialized to [0, 0, 1, 0, 0] for every valid spot, and [0, 0, 0, 0, 1] for all spots that can no longer move left.
    * I displayed it by mapping the probabilities to a matrix of string symbols, then outputting it to the terminal. I display an “X” for all obstacles. 
    * I compute policy evaluation by repeatedly recalculating the value array until it converges, i.e. there is no change after one iteration. 
        * Value function: <img src="https://github.com/nathanzmarch/183DApset1/blob/master/Equations/policy%20iteration%20value.png" alt="alt text" height="20px" align="center">
        * Convergence: <img src="https://github.com/nathanzmarch/183DApset1/blob/master/Equations/policy%20iteration%20convergence.png" alt="alt text" height="20px" align="center">
    * I calculate the one-step lookahead by using the quality function Q to find the policy that gives me the best value at each step, given a values array.
        * <img src="https://github.com/nathanzmarch/183DApset1/blob/master/Equations/policy%20iteration%20prob%20distribution.png" alt="alt text" height="20px" align="center">
        * <img src="https://github.com/nathanzmarch/183DApset1/blob/master/Equations/policy%20iteration%20quality.png" alt="alt text" height="20px" align="center">
    * I calculate the optimal policy through policy iteration, where I repeat the loop function below until convergence.
        * <img src="https://github.com/nathanzmarch/183DApset1/blob/master/Equations/policy%20iteration%20value%20update.png" alt="alt text" height="20px" align="center">
        * Convergence: <img src="https://github.com/nathanzmarch/183DApset1/blob/master/Equations/policy%20iteration%20convergence%202.png" alt="alt text" height="20px" align="center">
    * I used tic and toc to calculate the runtime, which was around 0.271 seconds for a =10-9convergence requirement
    * The expected reward at the starting location can be found by running displayValues on the final values function
        * Expected Rewards: 5.1
        * Total Rewards: 4.7 (calculated using the gamma)
        * This is the path that our policy iteration suggested, but I believe that this is wrong as this path takes us close to the street, making it more rewarding to go the other way around as seen on the right. As such, I believe the expected rewards here are artificially high and don’t take into account error cases. 
        * Since the path is different and longer, the expected reward and actual reward should be different. I think expected reward might not necessarily be lower, as we aren’t skirting the street anymore, but the actual reward will be lower due to the longer path.

4. Value Iteration
    * I designed a value evaluation function that takes in a value array and returns a value array. I then loop and update the value using this evaluation function until there is no change. Finally, I use policyBackup to calculate the optimal policy.
        * Value function: <img src="https://github.com/nathanzmarch/183DApset1/blob/master/Equations/value%20iteration%20value.png" alt="alt text" height="20px" align="center">
        * Convergence: <img src="https://github.com/nathanzmarch/183DApset1/blob/master/Equations/value%20iteration%20convergence.png" alt="alt text" height="20px" align="center">
        * Policy Calculation: Same as 4(d)(i)
    * The optimal policy calculated by this is the exact same as the one in 4(e). The expected reward at the starting location can be found by running displayValues on the final values function
        * Expected Rewards: 5.1
        * Total Rewards: 4.7 (calculated using the gamma)
        * This is the path that our policy iteration suggested, but I believe that this is wrong as this path takes us close to the street, making it more rewarding to go the other way around as seen on the right. As such, I believe the expected rewards here are artificially high and don’t take into account error cases. 
        * Since the path is different and longer, the expected reward and actual reward should be different. I think expected reward might not necessarily be lower, as we aren’t skirting the street anymore, but the actual reward will be lower due to the longer path.
    * I used the same tic and toc timing function to calculate the runtime, which was around 0.09 seconds for a =10-9convergence requirement. This is significantly faster than policy iteration, which is to be expected.

5. Additional Scenarios

| gamma       | pe           | Result                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|-------------|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| High (0.99) | High (0.200) | With an extremely high discount factor, I noticed that the ideal policy is to go to the farther R=10 shop rather than the closer R=10 shop. This makes sense, as with a high discount factor the cost of taking an extra step is very low, making a high-reward endpoint more desirable.    The high error rate, however, made it so that it is still better to move away from the road.                                                                         |
| High (0.99) | Low (0.001)  | With an extremely high discount factor, I noticed that the ideal policy is to go to the farther R=10 shop rather than the closer R=10 shop. This makes sense, as with a high discount factor the cost of taking an extra step is very low, making a high-reward endpoint more desirable.    The low error rate, however, made it so that it is ok to move on the side of the road, as there is a very low chance of accidentally erroring onto the street.       |
| Low (0.01)  | High (0.200) | With an extremely low discount factor, I noticed that the ideal policy is to go to the closer R=1 square rather than the farther R=10 shop. This makes sense, as with a low discount factor the reward plummets with each additional step taken, making a quick-reward endpoint more desirable.   The high error rate, however, made it so that it is still better to move away from the road.                                                                   |
| Low (0.01)  | Low (0.001)  | With an extremely low discount factor, I noticed that the ideal policy is to go to the closer R=1 square rather than the farther R=10 shop. This makes sense, as with a low discount factor the reward plummets with each additional step taken, making a quick-reward endpoint more desirable.   The low error rate, however, made it so that it is ok to move on the side of the road, as there is a very low chance of accidentally erroring onto the street. |
