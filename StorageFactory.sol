// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{

    // type visibility name
    SimpleStorage[] private listOfSimpleStorageContracts;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorage);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        // to interact with a contract i need:
        // - the address of the contract
        // - the ABI => Application Binary Interface

       require(_simpleStorageIndex < listOfSimpleStorageContracts.length, "index out of range");

        SimpleStorage simpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        simpleStorage.store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        require(_simpleStorageIndex < listOfSimpleStorageContracts.length, "index out of range");

        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }


/*
    // view function to retrieve a SimpleStorage with the security check of the index (require)
    function getSimpleStorage(uint256 _index) public view returns (SimpleStorage) {
        require(_index < listOfSimpleStorageContracts.length, "prout");
        
        return listOfSimpleStorageContracts[_index];
    }
*/
}