# Results of Pathrex benchmarks
This repository contains benchmarks for pathrex.

## Datset

**Wikidata** --- This dataset was present in [MillenniumDB path query challenge](https://github.com/MillenniumDB/path-query-challenge). It contains:
   - 610 millions of edges
   - 91 millions of vertices
   - 1400 unique labels

## Machine
The benchmarks were conducted on a Yandex Cloud vm with the following specifications.
- CPU: Intel Xeon Processor (Icelake), 32 logical cores;
- RAM: 192 Gb, 3600 MHz, DDR5;
- OS: Linux Ubuntu 22.04;

## Competitors
* [MillenniumDB](https://github.com/MillenniumDB/MillenniumDB) is a graph database demonstrating state-of-the-art performance among other competitors and that might cache the data to execute queries out of the RAM.
* [LARPQ](https://arxiv.org/abs/2412.10287) Raw readth-first-search-based algorithm that leverages linear algebra for evaluating single-source regular path queries.
* [Pathrex](https://github.com/SparseLinearAlgebra/pathrex) LARPQ run within Pathrex Rust library and CLI for evaluating and benchmarking

## Benchmark Summary

The table below summarizes Wikidata query measurements. All values are in seconds. The results are suplied for simple and complex(C) queries separetely.

| Measurement | MillenniumDB | LARPQ | Pathrex |
| --- | ---: | ---: | ---: |
| Simple total | 7.555623 | 1.526688 | 1.988198 |
| Simple mean | 0.075556 | 0.015578 | 0.020288 |
| Simple median | 0.000067 | 0.000227 | 0.000239 |
| Complex total | 1538.031720 | 901.564501 | 1115.516581 |
| Complex mean | 2.885613 | 1.691491 | 2.092902 |
| Complex median | 0.041980 | 1.555902 | 1.962655 |

## Results

Pathrex demonstrates competitive performance on the Wikidata benchmark. It keeps the complete library/CLI execution path within about **24%** overhead over raw LARPQ. As a result, Pathrex remains about **3.8x faster** than MillenniumDB on simple queries and about **1.4x faster** on complex queries while including graph/query preparation and Rust-side orchestration.

## Reproducibility
MillenniumDB was benchmarked according to the [la-rpq](https://github.com/SparseLinearAlgebra/la-rpq) guide. The rest is provided by Pathrex mesurements.
