# Short Gamma

An options-desk survival game powered by a checked reverse-mode automatic-differentiation engine.

**Play:** <https://asp53826.github.io/short-gamma/>

You inherit a short-volatility book with ten trading days remaining. Hedge the delta, quote incoming clients, manage transaction costs, and decide how to handle a discontinuous digital payoff. One risk number is deliberately misleading; recognizing why is part of the game.

## What makes it engineering, not decoration

- The browser pricing engine implements a compact reverse-mode tape.
- Black–Scholes prices and five Greeks are checked against Python-generated fixtures.
- Monte Carlo positions reuse fixed normals so cross-language comparisons are reproducible.
- A complete run is a seed plus an action log; replay must reproduce the final result.
- Invalid and forged actions are rejected by the simulation tests.
- The attract mode and bot comparisons are explicitly separated from player scores.

## Starting book

- Short 40 × 100 straddles expiring at the day-10 close.
- Short 25 × 95 puts with 30 days remaining.
- Short a $25,000 digital paying when spot finishes above 104.
- Approximately eight client calls, some informed.

## Controls

| Key | Action |
| --- | --- |
| Space | Run or pause |
| F | Flatten stock delta |
| B / S | Buy or sell 100 shares |
| 1 / 2 / 3 | Quote tight, quote wide, or pass |
| D | Change the digital-delta estimator |

## Run locally

```bash
make serve
```

Open <http://localhost:8000>. The game is static and has no build step.

## Verify it

Requires Node.js 22, Python 3.11+, and [uv](https://docs.astral.sh/uv/).

```bash
uv sync --dev
make test
```

The suite verifies pricing parity, tape shape, deterministic markets, replay, P&L attribution, quote-window enforcement, digital-delta behavior, and deterministic bots.

## Repository map

```text
docs/       browser game and pricing engine
src/aad/    Python reference implementation
tests/js/   parity, replay, and simulation tests
```

The game began as the interactive demonstration inside [`aad-greeks`](https://github.com/asp53826/aad-greeks). That repository remains the broader research and benchmarking project; this repository is the standalone game.

## Honest limitation

GitHub Pages is static, so public scores are stored in the player's browser rather than trusted by a shared server. The deterministic replay format is ready for a future verified leaderboard, but no global ranking is claimed here.

## License

MIT
