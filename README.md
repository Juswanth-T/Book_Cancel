# Hotel Room Booking — Solidity Smart Contract

A Solidity smart contract that automates hotel room bookings and enforces a tiered cancellation refund policy on the Ethereum blockchain. No intermediaries, no manual processing — the contract handles deposits and refunds transparently.

## Contract: `Task-2.sol`

### How It Works

**Booking:**
- A guest calls `Makepayment(uint Days)` and sends exactly **1 ether**
- The contract records the guest address, number of days, and checkout date
- A `Registration` event is emitted to confirm the booking

**Cancellation Refund Policy:**

| Notice Given | Refund |
|---|---|
| More than 7 days before checkout | Full refund (1 ether) |
| 2–7 days before checkout | Partial refund (0.5 ether) |
| Less than 2 days before checkout | No refund |

This tiered policy incentivizes early cancellations and protects the hotel from last-minute losses.

## Deployment

1. Open [Remix IDE](https://remix.ethereum.org/)
2. Paste the contents of `Task-2.sol`
3. Compile with Solidity `^0.5.x`
4. Deploy to a test network (Sepolia / Goerli) or a local Hardhat/Ganache instance

## Notes

- Uses `now` (deprecated in newer Solidity — equivalent to `block.timestamp`)
- Built as Task 2 of a blockchain summer camp assignment
