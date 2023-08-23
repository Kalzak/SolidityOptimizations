# Gas Optimization Examples

This repository is my collection of tests to explore different Solidity/EVM gas optimizations.
I have put each optimization approach into tiers based on how complex/dangerous/obscure the approach is.
Not all of these are actually optimizations, some "optimizations" cost the same or more, we're just seeing what works or not.

There is one Solidity file per optimization, each containing an unoptimized and optimized contract. You can observe the savings yourself by running `forge test --gas-report`.

The following is a list of what optimizations have been tested so far:

### Tier1

|                                | Bad   | Good  | Improvement |
|--------------------------------|-------|-------|-------------|
| Storage packing                | 66538 | 22290 | Yes         |
| Constants                      | 247   | 147   | Yes         |
| Visibility (`pub`/`ext`/`pri`) | 478   | 478   | No          |
| Calldata vs memory             | 23040 | 22885 | Yes         |
| Caching                        | 3312  | 2323  | Yes         |

### Tier2

- `++i` vs `i++`
- Unchecked math
- Batch functions
- Skip zero storage initialize
- `<` and `>` vs `!=`
- Structs vs arrays

### Tier3

- Offchain calculations
- Multiple vs single `require`
- Word size types vs smaller types
- Short circuits

### Tier4

- Indexing events
- Not caching
- Inline swaps vs temp variable **(NoSavings)**
- Payable functions **(NoSavings)**

### Tier5

- Mining function selectors
- Mining deployment addresses
- Bitwise manipulations
- Gasleft branching

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
