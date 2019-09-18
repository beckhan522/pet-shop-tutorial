pragma solidity ^0.5.0;

contract Adoption {

  // ペットアドレスの配列
  address[16] public adopters;

  // ペット飼育
  function adopt(uint petId) public returns (uint) {
    require(petId >= 0 && petId <= 15);

    // この機能を呼び出した人またはスマートコントラクトのアドレス
    adopters[petId] = msg.sender;

    return petId;
  }

  // 複数ペット飼育
  function getAdopters() public view returns (address[16] memory) {
    return adopters;
  }

}
