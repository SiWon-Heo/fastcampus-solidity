//SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

contract Array{
    // 배열 선언
    int[] public intList = [1,2,3,4,5];
    int[3] public int3List = [1,2,3];

    // 배열 탐색
    int public secondData = intList[1];

    // 배열 삽입, 삭제
    intList.push(5);
    int public lastData = intList.pop();
    delete intList[0];

    struct Product {
        string name;
        uint price;
    } 

    // 구조체 배열
    Product[] public productList;

}