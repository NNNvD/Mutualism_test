# Dynamical Mutualism Model Simulation

This repository implements a data-generating version of the Dynamical Model of
General Intelligence introduced in the Santa Fe Institute's *Complexity Science
and Psychometrics* course material (Chapter 6: Mutualism Model). The original
chapter is distributed here as `2006-12689-006.pdf` for reference.

The provided R script recreates the mutualism simulation described in the
course, producing synthetic ability trajectories and the resulting positive
manifold of correlations across tests. Extensive inline comments have been
added to clarify how the differential equation system is constructed, how
participants are simulated, and how the output visualisations relate to the
model assumptions.

## Project purpose

This project exists solely to explore how materials from
[psychomodels.org](https://www.psychomodels.org/) can integrate with resources
curated by the [Item Response Warehouse](https://itemresponsewarehouse.org/).
The annotated code and documentation are intended to support uploading this
model to psychomodels.org for broader reuse and discussion.

## Getting started

1. Install the required R packages, including the `grindr` package from GitHub.
2. Run `mutalism_model_intelligence.r` to reproduce the simulations and
   visualisations from the mutualism model example.

The script installs its dependencies on first execution; subsequent runs can
comment out the installation lines if the packages are already available.

## Acknowledgements

This repository draws directly on the Santa Fe Institute course **Complexity
Science and Psychometrics** (Chapter 6: Mutualism Model), as authored by van der
Maas and colleagues. Their exposition provides the theoretical grounding and
original code on which this implementation is based.
