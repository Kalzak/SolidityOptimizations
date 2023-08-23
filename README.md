# Gas Optimization Examples

This repository is my collection of tests to explore different Solidity/EVM gas optimizations.
I have put each optimization approach into tiers based on how complex/dangerous/obscure the approach is.
Not all of these are actually optimizations, some "optimizations" cost the same or more, we're just seeing what works or not.

There is one Solidity file per optimization, each containing an unoptimized and optimized contract. You can observe the savings yourself by running `forge test --gas-report`.

The following is a list of what optimizations have been tested so far:

### Tier1

| Optimization                   | Bad   | Good  | Improvement |
|--------------------------------|-------|-------|-------------|
| Storage packing                | 66538 | 22290 | Yes         |
| Constants                      | 247   | 147   | Yes         |
| Visibility (`pub`/`ext`/`pri`) | 478   | 478   | No          |
| Calldata vs memory             | 23040 | 22885 | Yes         |
| Caching                        | 3312  | 2323  | Yes         |

### Tier2

| Optimization       | Bad    | Good   | Improvement |
|--------------------|--------|--------|-------------|
| `i++` vs `++i`     | 2202   | 2152   | Yes         |
| Unchecked          | 2202   | 1612   | Yes         |
| Batch              |        |        | Only EOA    |
| Calldata vs memory | 2584   | 2545   | Yes         |
| Structs vs arrays  | 136765 | 135974 | Yes         |
| Unchecked          | 2202   | 1612   | Yes         |

### Tier3

| Optimization           | Bad    | Good   | Improvement |
|------------------------|--------|--------|-------------|
| Offchain calculations  | 28290  | 5412   | Yes         |
| Many vs single require | 295    | 270    | Yes         |
| Short circuits         | 419    | 409    | Yes         |
| Smaller datatypes `+=` | 279    | 258    | Yes         |
| Smaller datatypes `++` | 272    | 252    | Yes         |

### Tier4

| Optimization           | Bad    | Good   | Improvement |
|------------------------|--------|--------|-------------|
| Constructor            | 42381  | 42357  | Yes*        |
| Not caching            | 1929   | 1918   | Yes         |
| Emit string event      | 1350   | 1258   | Yes         |
| Emit word event        | 2353   | 1930   | Yes         |
| Inline swap vs tempvar | 170    | 170    | No          |

\*Deployment cost

### Tier5

| Optimization          | Bad     | Good    | Improvement |
|-----------------------|---------|---------|-------------|
| Bitwise recycle stack | 260     | 259     | Yes         |
| Bitwise use once      | 243     | 241     | Yes         |
| Function sig mining   |         |         | Only EOA    |
| Create2 addr mining   |         |         | Only EOA    |
| Gasleft branching     | 191321  | 116493  | Yes         |

### Tier6

- Just use Huff lmao

---

The following resources were used to help collect these optimizations:
- https://0xmacro.com/blog/solidity-gas-optimizations-cheat-sheet/    
- https://github.com/devanshbatham/Solidity-Gas-Optimization-Tips     
- https://pbs.twimg.com/media/FNl1jsbXIAc76m7?format=jpg&name=large    
- https://twitter.com/impliedvols/status/1572460030594781184/photo/2    
- https://www.rareskills.io/post/9-dangerous-techniques-to-win-solidity-gas-optimization-contests    
- https://github.com/jeffreyscholz/solidity-zero-finder-rust  
