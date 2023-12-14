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
        bytes memory num = abi.encode("this is what we want");
        return num;
    }

    //encoding with small space require for bytes .. 

    function packed()public pure returns(bytes memory){
        bytes memory string1 = abi.encodePacked("this is what we want");
        return string1;
    }
    //decoding with using funciton

    function encod() public  pure  returns(string memory){
          string memory name = abi.decode(Encoding(), (string));
        return  name;
    }

    //decoding with bytes 
    // function decodewithByte()public  pure  returns(string memory){
    //     string memory nmae2 = abi.decode((0x7468697320697320776861742077652077616e74), (string));
    //     return  nmae2;  //this is not possible
    // }

    //multi encode and decode
    function multiEncode ()public  pure  returns(bytes memory){
        (bytes memory string1)= abi.encode("this is hilarious","too much hilarious"); 
        return (string1);
    }

    //multi decode 

    function multidecode()public  pure returns(string memory ,string memory){
        (string memory newOne, string memory oldOne) = abi.decode(multiEncode(), (string,string));
        return  (newOne, oldOne);
    }

}
