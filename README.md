### Base Boundary Reference

| Dataset | Train/val boundary filename | Boundary configuration | Avg. segments (train / val) |
|---|---|---|---:|
| ActivityNet | `boundaries_act_{train,val}_avg36_cosine_promneg1p0_md1_sm1.json` | cosine; prominence -1.0; min. distance 1; smooth 1 | 36.07 / 36.31 |
| TVR | `boundaries_tvr_{train,val}_avg21_multi_scale_cosine_prom0p2_md2_sm1_from_train_current.json` | multi-scale cosine; prominence 0.2; min. distance 2; smooth 1 | 21.10 / 20.98 |
| Qvhighlights | `boundaries_qvh_{train,val}_avg72_multi_scale_cosine_prom1p3_md2_sm3_from_splitonly_t40_a1p5.json.gz` | multi-scale cosine; prominence 1.3; min. distance 2; smooth 3; split-only length regularization | 72.37 / 71.13 |

Qvhighlights uses the archived `.json.gz` boundary above; the same-named `.json` was later overwritten and has a different segment count.

![Table 1](rendered/table-1.png)

![Table 2](rendered/table-2.png)

![Table 3](rendered/table-3.png)

![Table 4](rendered/table-4.png)

![Table 5](rendered/table-5.png)

![Figure 1](rendered/figure-1-sumr.png)

![Table 6](rendered/table-6.png)

![Table 7](rendered/table-7.png)

![Table 8](rendered/table-8.png)
