import numpy as np
from scipy.stats import multivariate_normal

def proposaldist(xcurrent, scale=0.1):
    """
        A random work proposal. 
        Takes as input the current state of the chain and 
        returns a perturbation of the inital point
        the scale parameters controls the magnitude of 
        the random walk
    """
    d = xcurrent.size
    xproposed = xcurrent + np.random.normal(size=d)*scale
    return(xproposed)

def logposterior(xcurrent):
    """
        evaluates the log posterior (the target that we want to sample from)
        in the the point xcurrent
        here our logposterior is a gaussian in 2 dimensions, 
        centered in (1,1)
        with a variance of [2,1; 1,2]

    """
    assert xcurrent.size == 2, "the sampler works only in 2 dimensions!"
    mu = np.array([1., 1.])
    Sigma = np.array([[2., 1.], [1., 2.]])
    lp = multivariate_normal.logpdf(xcurrent, mean=mu, cov=Sigma)
    return(lp)

def samplechain(xstart, logposterior, tchain=1000, scale=0.1):
    res_dict = {"stateschain" : [xstart],  "acceptance": []}
    for tstep in range(tchain):
        xcurrent = res_dict["stateschain"][-1]
        xproposed = proposaldist(xcurrent, scale=scale)
        # calculates the log acceptance ratio
        logar = logposterior(xproposed)-logposterior(xcurrent) 
        logu = np.log(np.random.uniform())
        # check the acceptance
        if logar > logu:
            res_dict["stateschain"].append(xproposed)
            res_dict["acceptance"].append(1)
        else: 
            res_dict["stateschain"].append(xcurrent)
            res_dict["acceptance"].append(0)
    return(res_dict)

if __name__ == '__main__':
    xstart = np.zeros(2)
    res_dict = samplechain(xstart, logposterior, tchain=1000, scale=2.5)
    import matplotlib.pyplot as plt
    import seaborn as sns
    plt.plot(np.array(res_dict["stateschain"])[:,0]); plt.show()
    sns.kdeplot(np.array(res_dict["stateschain"])[:,0]); plt.show()
    # import ipdb; ipdb.set_trace()

