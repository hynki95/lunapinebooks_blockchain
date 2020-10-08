pragma solidity >=0.4.0 <0.7.0;

import "./Context.sol";
import "./Ownable.sol";

contract MyToken is Context, Ownable{
    
    uint256 public _totalSupply;
    string public _name;
    string public _symbol;
    uint256 public _decimals;

    mapping (address => uint256) public _balances;
    
    constructor (string memory name, string memory symbol) public{
        _name = name;
        _symbol = symbol;
        _decimals = 18;
        _mint(_msgSender(),1000*10**_decimals);
    }
    

    function _mint(address account, uint256 amount) public onlyOwner{
        require(account != address(0), "ERC20: mint to the zero address");
        _totalSupply = _totalSupply+amount;
        _balances[account] = _balances[account]+amount;
        emit Transfer(address(0), account, amount);
    }
    
    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(recipient != address(0), "ERC20: transfer to the zero address");
        _balances[_msgSender()] = _balances[_msgSender()]-(amount*10**_decimals);
        _balances[recipient] = _balances[recipient]+(amount*10**_decimals);
        emit Transfer(_msgSender(), recipient, amount);
        return true;
    }

    event Transfer(address indexed from, address indexed to, uint256 value);
}
