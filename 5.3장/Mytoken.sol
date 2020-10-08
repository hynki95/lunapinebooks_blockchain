pragma solidity >=0.4.0 <0.7.0;

import "./Context.sol";
import "./Ownable.sol";

contract MyToken is Context, Ownable{
    
    uint256 public _totalSupply;
    string public _name;
    string public _symbol;
    uint8 public _decimals;
    
    mapping (address => uint256) public _balances;
    
    constructor (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;
        _decimals = 18;
    }
    
    
}
