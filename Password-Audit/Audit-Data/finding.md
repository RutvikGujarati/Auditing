### [S-#] STORING THE PASSWORD ON ON-CHAIN USING PRIVATE KEYWORD IS VISIBLE TO EVERYONE, IT IS NO LONGER PRIVATE FOR ONLY OWNER.

**Description:**  Data that stored on on-chain it is publically acceseble no metter that has visibility provided by contract. It only worked for contract not for humans readability.

The `PasswordStore::s_password` vaiable is intented to a private variable and only access through `PasswordStore::getpassword()` function, which should be only call by only owner.


**Impact:** Anyonne can read the Private password, severly breaking the fucntionality of the protocol.

**Proof of Concept:**  (proof of code)

1. create a local running chain
`make anvil`

2. deploy contract locally
`
make deploy
`

3. run the storge tool

use `1`  because `s_password` is in second storage slot

```
cast storage <Contract Address> 1 --rpc-url http://127.0.0.1:8545
```

Get output like this:
`0x436f6e74726163742d506173730000000000000000000000000000000000001a`

now you can parse to string using:

```
cast parse-bytes32-string 0x436f6e74726163742d506173730000000000000000000000000000000000001a
```
output:  `Contract-pass` which is the user password.

**Recommended Mitigation:** One could encrypt the password off-chain and then store encrypted password on-cahin. It could require user to remember another password off-chain to decrypt the password. Remove view fucntion for user to accedentilly send a transaction with the password that decrypt your password 