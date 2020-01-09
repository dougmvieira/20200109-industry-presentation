---
title: <small> High-frequency options market making </small>
author:
- Douglas Vieira
- Imperial College London
- Supervisors&colon; Prof Rama Cont and Dr Mikko Pakkanen
date: 9 January 2020
---


# Introduction

## Literature

- Papers in options market making: [@stoikov2009option], [@el2015stochastic],
[@baldacci2019algorithmic],
- Our focus is in high-frequency markets,
- Our model is based on [@fodra2013high]
  - Market making of many assets
  - Allows stochastic volatility
  - Asymptotic solutions for small risk aversion
  
## Model features

- Challenges:
  - Stochastic volatility,
  - Quotes for the whole volatility surface,
  - Options liquidity is linked to moneyness/time to expiry,
  - Friction in the underlying market.
  
- Approximations:
  - Competitive prices/small risk aversion,
  - Small time horizon

# Do we need stochastic volatility?

## Heston model simulation (S&P 500)

## {data-background-iframe="20180528/heston.html"}

## Options small time dynamics

For a nice stochastic volatility model

$$ \begin{align}
dS_t & = \mu_t dt + \sigma(V_t) dW^1_t, \\
dV_t & = \alpha_t dt + \nu(V_t) dW^2_t, \\
\end{align} $$

a European-type option follows the small time dynamics

$$ \begin{align}
d\tilde S_t & = \sigma(V_0) dW^1_t, \quad
d\tilde V_t   = \nu(V_0) dW^2_t, \\
d\tilde C_t & = \Delta_0 d\tilde S_t + \mathcal V_0 d\tilde V_t \\
\end{align} $$

## Heston fit in data 

## {data-background-image="20200109/heston_fit.png" data-background-size=contain}

## {data-background-image="20200109/vols.png" data-background-size=contain}

## Empirical vs model Greeks

## {data-background-image="20200109/compare_deltas_call.png" data-background-size=contain}

## {data-background-image="20200109/compare_vegas_call.png" data-background-size=contain}

## {data-background-image="20200109/r2_call.png" data-background-size=contain}


# Market making strategy

## {data-background-iframe="20190226/skew_plot.html"}

## {data-background-iframe="20190226/spread_plot.html"}

## Model setup

- Price dynamics
$$ dC_{t, p} = \Delta_{t, p} \cdot dS_t, \quad
   dS_t = \mu_t dt + \sigma_t dW_t, $$

- Trade dynamics ($n^\mathrm{ask}$ and $n^\mathrm{bid}$ intensities)

$$ \begin{align}
\lambda_t^\mathrm{bid}(dp) & = e^{-\kappa_{t, p} \delta_{t, p}^\mathrm{bid}} A_t(dp), \\
\lambda_t^\mathrm{ask}(dp) & = e^{-\kappa_{t, p} \delta_{t, p}^\mathrm{ask}} A_t(dp). 
\end{align} $$

## Model setup (cont.)

- Inventory process

$$ q_t(dp) = \int_0^t n^\mathrm{bid}(ds \times dp)
           - \int_0^t n^\mathrm{ask}(ds \times dp), $$

- Cash process

$$ dX_t = \int_{\mathcal P} C^\mathrm{ask}_{t, p} n^\mathrm{ask}(dt \times dp) 
        - \int_{\mathcal P} C^\mathrm{bid}_{t, p} n^\mathrm{bid}(dt \times dp). $$

## Model setup (cont.)

- Wealth process

$$ Y_t = X_t + \int_{\mathcal P} C_{t, p} q_t(dp) $$

- Maximisation criterion

$$ \mathbb E \left[ Y_T - \frac{1}{2} \gamma \int_{(0, T] \times \mathcal P^2} q_{t-}(dp)q_{t-}(dq)d[C_p, C_q]_t \right] $$

## Optimal mid-price

$$ \begin{align}
\frac{ C^\mathrm{bid}_{t, p} + C^\mathrm{ask}_{t, p}}{2} = 
   & \mathbb E \left[ C_{T, p} \mid \mathcal F_t \right]
   - \gamma (T - t) \Delta_{t, p} \cdot \sigma_t \sigma_t^\top g_t \\
   & + o(T - t) + O(\gamma^2),
\end{align} $$

$$ g_t = \int_{\mathcal P} \Delta_{s, p} q_t(dp). $$
     
## Optimal half-spread

$$ \begin{align}
\frac{ C^\mathrm{ask}_{t, p} - C^\mathrm{bid}_{t, p}}{2} = 
  & \frac{1}{\kappa_{t, p}}
  + \frac{1}{2} \gamma (T - t) \Delta_{t, p} \cdot \sigma_t \sigma_t^\top
    \Delta_{t, p} \\ & + o(T - t) + O(\gamma^2).
\end{align} $$

## Structure of options spreads

#. Spread does not depend on base trade activity
#. Assume $\kappa_{t, p}$ is constant in moneyness
#. Linear regression gives us $\kappa$ and $\gamma$

## {data-background-image="20200109/optimal_spread.png" data-background-size=contain}

# Caveats

## Intraday effects

## {data-background-image="20200109/intraday_arrival.png" data-background-size=contain}

## Shape of intensity decay

## {data-background-image="20200109/intensities_fit.png" data-background-size=contain}

## Cross-impact

- The only cross-effect in the model is via the driving factors
- Spread of an option impacting trading activity of another option
- Idea for future research:
$$ \begin{align}
\lambda_t^\mathrm{bid}(dp) & = e^{-\int_\mathcal P \delta_{t, q}^\mathrm{bid} d\kappa_{t, p}(dq)} A_t(dp), \\
\lambda_t^\mathrm{ask}(dp) & = e^{-\int_\mathcal P \delta_{t, q}^\mathrm{ask} d\kappa_{t, p}(dq)} A_t(dp). 
\end{align} $$

# Conclusion

## Conclusion

- Stochastic volatility drives high-frequency options prices
- Small risk aversion gives explicit optimal quotes
- Optimal spreads compatible with data
- Conditional arrival rates exhibit intraday patterns
- Intensity decay might be better fit as a power law

## Thank you!

- Find this presentation and its source code at

<https://github.com/dougmvieira/presentations>

## References {.scrollable}
