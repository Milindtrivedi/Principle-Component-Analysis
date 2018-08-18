# Principle-Component-Analysis
# Linear-Discriminant-Analysis

Generate Training and Test samples from a Mixture of Gaussians with three Gaussian mixtures given by: N(µ1,R1),N(µ2,R2),N(µ3,R3).
Corresponding mixture coefficients are π1=0.4,π2=0.3,π3=0.3. Assuming that the samples are drawn from the second and third Gaussian corresponds to features representing a singular object. Implement LDA and PCA algorithms. Evaluate the performance of this two algorithms including their sensitivity to the number of training samples, outliners and susceptibility to Over-Fitting.     

The parameters of Gaussian distributions are given as follows: 

                                     µ1 = [0.2 1.4]               R1 = [24.08    4.62               
                                                                         4.62    1.92]

                                     µ2 = [-7.5 0.5]              R2 = [1.92    4.62               
                                                                        4.62    24.08]
                                                                                                           
                                     µ3 = [2.5 5]                 R3 = [24.08    4.62               
                                                                         4.62    1.92]

Illustrate followings, 

[1] Sampling from the mixture of Gaussian
[2] Implementation of the Linnear Discriminant Analysis. 
[3] Implementation of the Principal Component Analysis. 
[4] Performance analysis


References,  

1) Bishop, C. M. (2006), Pattern Recognition and Machine Learning, Springer, ISBN-10:0-387-31073-8
2) Theodoridis, S. and Koutroumbas, K. (2008), Pattern Recognition, Academic Press (4th Edition) , ISBN: 978-1-59749-272-0  
