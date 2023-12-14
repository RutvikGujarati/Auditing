// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;
    uint256 public store;
    uint256 public constant value= 4;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {   
        number++;
    }

    //falback and recieve

    fallback() external payable{}

    receive() external payable{}

    //abi encoding

    function Encoding()public pure returns(bytes memory){
        bytes memory num = abi.encode("hii");
        return num;
    }

    //encoding with small space require for bytes .. 

    function packed()public pure returns(bytes memory){
        bytes memory string1 = abi.encodePacked("this is what we want");
        return string1;
    }
}
