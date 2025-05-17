// SPDX-License-Identifier: MIT
pragma solidity 0.8.19; // the '^' means we are ok to work with every version that is greater than 0.8.18


// 0xd9145CCE52D386f254917e481eB44e9943F39138 => contract address
contract SimpleStorage {

    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    uint256 myFavoriteNumber; // default = 0 and internal

    // dynamic array
    Person[] public listOfPeople;

    // static array 
    Person[1] public staticListOfPeople;

    // map

    mapping(string => uint256) public nameToFavoriteNumber;

    // memory keyword means that the data of the variable are stored only during the execution of the function, we dont pay gas to store it, they are not on the blockchain, 
    // but only in the RAM
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        Person memory newPerson = Person({
            name: _name,
            favoriteNumber: _favoriteNumber
        });

        listOfPeople.push(newPerson);
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // this function update something so it changes the state of the blockchain, so i have to pay gas
    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;

        myFavoriteNumber;
    }

    
    // view means that we only will view the state of the variable, here favoriteNumber
    function retrieve() public view returns(uint256) {
        return myFavoriteNumber;
    }
}