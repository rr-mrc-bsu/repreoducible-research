import unittest
import numpy as np
from rwsampler.functions_rwsampler import logposterior, xstartdummy, proposaldist, samplechain

class TestRwsampler(unittest.TestCase):
    
    def test_dummy(self):
        self.assertTrue(True)

    def test_logposterior(self):
        self.assertAlmostEqual(logposterior(xstartdummy), -2.3871832107434003)

    def test_randomwalk(self):
        res = proposaldist(xstartdummy, seed=42)
        diff = np.linalg.norm(res-np.array([1.04967142, 0.98617357]))
        self.assertAlmostEqual(diff, 0)
    
    def test_chain(self):
        res_dict = samplechain(xstartdummy, logposterior, tchain=1000, scale=2.5, seedmaster=42)
        ar = np.array(res_dict['acceptance']).mean()
        musum = np.array(res_dict['stateschain']).mean()
        self.assertAlmostEqual(ar, 0.322)
        self.assertAlmostEqual(musum, 1.1354139204652403)

if __name__ == '__main__':
    unittest.main()
