import numpy as np
from functions_rwsampler import samplechain, logposterior

if __name__ == "__main__":
    print("Now running our random walk sampler")
    xstart = np.zeros(2)
    res_dict = samplechain(xstart, logposterior, tchain=1000, scale=2.5)
    print("sampling done, we obtain a mean of %s and an acceptance proba of %s"% (np.array(res_dict["stateschain"]).mean(axis=0), np.array(res_dict["acceptance"]).mean()))

