# Dynamical Mutualism Model Simulation
This repository implements the Dynamical Model of General Intelligence as discussed in Van der Maas' book *Complex Systems Research in Psychology* (Chapter 6: Mutualism Model).

The provided R script recreates the mutualism simulation described in the
book, producing synthetic ability trajectories and the resulting positive
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
1. Install the required R packages, including the `grind` package from GitHub.
2. Run `mutalism_model_intelligence.r` to reproduce the simulations and
   visualisations from the mutualism model example.

The script installs its dependencies on first execution; subsequent runs can
comment out the installation lines if the packages are already available.

## Acknowledgements
This repository draws directly on book the book *Complex Systems Research in Psychology* (Chapter 6: Mutualism Model), as authored by Van der
Maas. His exposition provides the theoretical grounding and
original code on which this implementation is based.
