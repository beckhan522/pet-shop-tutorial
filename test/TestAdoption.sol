pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
 // adoptionコントラクトを呼び出す飼い主
 Adoption adoption = Adoption(DeployedAddresses.Adoption());

 // 飼いたいペットID
 uint expectedPetId = 8;

 // 飼い主アドレス
 address expectedAdopter = address(this);

 // 飼いたいペットのテスト
 function testUserCanAdoptPet() public {
   uint returnedId = adoption.adopt(expectedPetId);

   Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
 }

 // 一つの飼い主のテスト
 function testGetAdopterAddressByPetId() public {
   address adopter = adoption.adopters(expectedPetId);

   Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
}

 // 全ての飼い主のテスト
 function testGetAdopterAddressByPetIdInArray() public {
   // 全ての飼い主アドレスを取得し、メモリに保存する
   address[16] memory adopters = adoption.getAdopters();

   Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
}

}
