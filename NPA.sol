pragma solidity ^0.4.25;


contract NPA {

    struct NPADat {
        uint id;
        string bankName;
        string borrowName;
        string asset;
        string sector;
        string date;
        int Auction_id;
       }
    NPADat [] public npa;
    uint public nextId;
       
       function create(string memory bankName, string memory bname, string memory asset, string memory sector,  string memory Date, int auctionId  ) public{
        npa.push(NPADat(nextId, bankName, bname, asset, sector, Date, auctionId));
        nextId++;
    }
    
    function readId(uint id) view public returns(uint, string memory, string memory, string memory, string memory, string memory, int){
        for(uint i=0; i<npa.length; i++){
            if(npa[i].id==id){
                return(npa[i].id, npa[i].bankName, npa[i].borrowName, npa[i].asset, npa[i].sector, npa[i].date, npa[i].Auction_id);
            }
        }
    }
    
    function readBank(string memory bankName) view public returns(uint, string memory, string memory, string memory, string memory, string memory, int){
        for(uint i=0; i<npa.length; i++){
            if(compareStrings(npa[i].bankName, bankName)==true){
                return(npa[i].id, npa[i].bankName, npa[i].borrowName, npa[i].asset, npa[i].sector, npa[i].date, npa[i].Auction_id);
            }
        }
    }
    
    
    function compareStrings (string memory a, string memory b) public view 
       returns (bool) {
  return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))) );

       }
       
    }