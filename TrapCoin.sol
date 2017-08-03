pragma solidity ^0.4.0;

contract TrapCoin {
    
    mapping(address => uint) balances;
    mapping(address => mapping(address => uint)) approved;
    uint supply;
    address deployer;
    
    //Constructor
    function TrapCoin(){
        
        deployer = msg.sender;
        
    }

    //Out of the ERC20 functions
    function GetMyBalance() returns (uint){
        
        return balances[msg.sender];
    }
    
    function GiveCoins(address _receiver, uint _value) returns (bool success){
        
        if(msg.sender==deployer && _value>0){
            
            balances[_receiver] += _value;
            supply += _value;
            return true;
            
        }else{
            
            return false;
            
        }
        
    }
     
    //ERC20 Functions
    
    function totalSupply() constant returns (uint totalSupply)
    {
        return supply;
    }
    
    function balanceOf(address _owner) constant returns (uint balance)
    {
        return balances[_owner];
    }
    
    function transfer(address _to, uint _value) returns (bool success){
        
        if(balances[msg.sender]>=_value && _value>0){
            
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            return true;   
            
        }else{
            //Transaction failed
            return false;
            
        }
    
    }
    
    function transferFrom(address _from, address _to, uint _value) returns (bool success)
    {
        
    }
    
    function approve(address _spender, uint _value) returns (bool success){
        
        if(balances[msg.sender] >= _value){
            
            approved[msg.sender][_spender] = _value;
            return true;
            
        }else{
            return false;
        }
        
    }
    
    function allowance(address _owner, address _spender) constant returns (uint remaining)
    {
        
        return approved [_owner][_spender];
        
    }
    
    event Transfer(address indexed _from, address indexed _to, uint _value);

    event Approval(address indexed _owner, address indexed _spender, uint value);
    
    
}