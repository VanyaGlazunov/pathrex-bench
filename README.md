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

The table below summarizes Wikidata query measurements. All values are in seconds. The results are suplied for simple and complex (C) queries separetely. Slowdown is computed as the relation between each competitor's measurement and the corresponding LARPQ measurement.

| Measurement | MillenniumDB | LARPQ | Pathrex |
| --- | ---: | ---: | ---: |
| Total | 7.555623 | 1.526688 | 1.988198 |
| Mean | 0.075556 | 0.015578 | 0.020288 |
| Mean slowdown | 4.85 | 1.00 | 1.30 |
| Median | 0.000067 | 0.000227 | 0.000239 |
| Median slowdown | 0.30 | 1.00 | 1.05 |
| Total (C) | 1538.031720 | 901.564501 | 1115.516581 |
| Mean (C) | 2.885613 | 1.691491 | 2.092902 |
| Mean slowdown (C) | 1.71 | 1.00 | 1.24 |
| Median (C) | 0.041980 | 1.555902 | 1.962655 |
| Median slowdown (C) | 0.03 | 1.00 | 1.26 |

## Results

On simple queries, Pathrex is **3.72x faster** than MillenniumDB with **30%** overhead over raw LARPQ. On complex queries, Pathrex is **1.38x faster** than MillenniumDB with **24%** overhead over raw LARPQ. Overall, Pathrex keeps most of LARPQ's performance while staying faster than MillenniumDB on both query groups.

## Reproducibility
MillenniumDB was benchmarked according to the [la-rpq](https://github.com/SparseLinearAlgebra/la-rpq) guide. The rest is provided by Pathrex mesurements.
