// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;


contract B {
  struct Info {
    string name;
    uint256 id;
  }

  mapping (uint => Info) infos;


  constructor(Info memory info) {
   infos[0] = info;
  }

  function getInfo () public view returns(Info memory info) {
    return infos[0];
  }
}

// 0xf8e81D47203A594245E36C48e151709F0C19fBe8