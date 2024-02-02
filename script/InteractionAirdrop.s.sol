// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Airdrop} from "../src/Airdrop.sol";

contract AirdropInstance {
    Airdrop airdrop = Airdrop(0xd3E5c6b50f1e7B36Ce2923f3f72a2B01172282eC);
}

contract SetAirdropTimeline is Script, AirdropInstance {
    uint256 startsAt = block.timestamp;
    uint256 endsAt = startsAt + 100000;

    function run() external {
        setTimeline();
    }

    function setTimeline() internal {
        vm.startBroadcast();
        airdrop.setAirdropTimeline(startsAt, endsAt);
        vm.stopBroadcast();
    }
}

contract GetTimeline is Script, AirdropInstance {
    function run() external view returns (uint256 startTimeIs, uint256 endTimeIs) {
        startTimeIs = airdrop.claimStartsAt();
        endTimeIs = airdrop.claimEndsAt();
        return (startTimeIs, endTimeIs);
    }
}

contract SetUsersAmount is Script, AirdropInstance {
    string addressFileName = "ethereum-addresses";
    string amountsFileName = "amounts"; 
    function run() external view {
        setUsersAMount();
    }

    function readInput(string memory input) internal view returns (string memory) {
        string memory inputDir = string.concat(vm.projectRoot(), "/script/input/");
        string memory chainDir = string.concat(vm.toString(block.chainid), "/");
        string memory file = string.concat(input, ".json");
        return vm.readFile(string.concat(inputDir, chainDir, file));
    }

    function setUsersAMount() internal view {
        string memory userList = readInput(addressFileName);
        string memory amounts = readInput(amountsFileName);
        string memory gg = "0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000006c000000000000000000000000000000000000000000000000000000000000006400000000000000000000000000000000000000000000000000000000000000c8000000000000000000000000000000000000000000000000000000000000012c000000000000000000000000000000000000000000000000000000000000019000000000000000000000000000000000000000000000000000000000000001f4000000000000000000000000000000000000000000000000000000000000025800000000000000000000000000000000000000000000000000000000000002bc0000000000000000000000000000000000000000000000000000000000000320000000000000000000000000000000000000000000000000000000000000038400000000000000000000000000000000000000000000000000000000000003e8000000000000000000000000000000000000000000000000000000000000044c00000000000000000000000000000000000000000000000000000000000004b00000000000000000000000000000000000000000000000000000000000000514000000000000000000000000000000000000000000000000000000000000057800000000000000000000000000000000000000000000000000000000000005dc000000000000000000000000000000000000000000000000000000000000064000000000000000000000000000000000000000000000000000000000000006a40000000000000000000000000000000000000000000000000000000000000708000000000000000000000000000000000000000000000000000000000000076c00000000000000000000000000000000000000000000000000000000000007d00000000000000000000000000000000000000000000000000000000000000834000000000000000000000000000000000000000000000000000000000000089800000000000000000000000000000000000000000000000000000000000008fc000000000000000000000000000000000000000000000000000000000000096000000000000000000000000000000000000000000000000000000000000009c40000000000000000000000000000000000000000000000000000000000000a280000000000000000000000000000000000000000000000000000000000000a8c0000000000000000000000000000000000000000000000000000000000000af00000000000000000000000000000000000000000000000000000000000000b540000000000000000000000000000000000000000000000000000000000000bb80000000000000000000000000000000000000000000000000000000000000c1c0000000000000000000000000000000000000000000000000000000000000c800000000000000000000000000000000000000000000000000000000000000ce40000000000000000000000000000000000000000000000000000000000000d480000000000000000000000000000000000000000000000000000000000000dac0000000000000000000000000000000000000000000000000000000000000e100000000000000000000000000000000000000000000000000000000000000e740000000000000000000000000000000000000000000000000000000000000ed80000000000000000000000000000000000000000000000000000000000000f3c0000000000000000000000000000000000000000000000000000000000000fa00000000000000000000000000000000000000000000000000000000000001004000000000000000000000000000000000000000000000000000000000000106800000000000000000000000000000000000000000000000000000000000010cc0000000000000000000000000000000000000000000000000000000000001130000000000000000000000000000000000000000000000000000000000000119400000000000000000000000000000000000000000000000000000000000011f8000000000000000000000000000000000000000000000000000000000000125c00000000000000000000000000000000000000000000000000000000000012c00000000000000000000000000000000000000000000000000000000000001324000000000000000000000000000000000000000000000000000000000000138800000000000000000000000000000000000000000000000000000000000013ec000000000000000000000000000000000000000000000000000000000000145000000000000000000000000000000000000000000000000000000000000014b40000000000000000000000000000000000000000000000000000000000001518000000000000000000000000000000000000000000000000000000000000157c00000000000000000000000000000000000000000000000000000000000015e0000000000000000000000000000000000000000000000000000000000000164400000000000000000000000000000000000000000000000000000000000016a8000000000000000000000000000000000000000000000000000000000000170c000000000000000000000000000000000000000000000000000000000000177000000000000000000000000000000000000000000000000000000000000017d40000000000000000000000000000000000000000000000000000000000001838000000000000000000000000000000000000000000000000000000000000189c0000000000000000000000000000000000000000000000000000000000001900000000000000000000000000000000000000000000000000000000000000196400000000000000000000000000000000000000000000000000000000000019c80000000000000000000000000000000000000000000000000000000000001a2c0000000000000000000000000000000000000000000000000000000000001a900000000000000000000000000000000000000000000000000000000000001af40000000000000000000000000000000000000000000000000000000000001b580000000000000000000000000000000000000000000000000000000000001bbc0000000000000000000000000000000000000000000000000000000000001c200000000000000000000000000000000000000000000000000000000000001c840000000000000000000000000000000000000000000000000000000000001ce80000000000000000000000000000000000000000000000000000000000001d4c0000000000000000000000000000000000000000000000000000000000001db00000000000000000000000000000000000000000000000000000000000001e140000000000000000000000000000000000000000000000000000000000001e780000000000000000000000000000000000000000000000000000000000001edc0000000000000000000000000000000000000000000000000000000000001f400000000000000000000000000000000000000000000000000000000000001fa40000000000000000000000000000000000000000000000000000000000002008000000000000000000000000000000000000000000000000000000000000206c00000000000000000000000000000000000000000000000000000000000020d00000000000000000000000000000000000000000000000000000000000002134000000000000000000000000000000000000000000000000000000000000219800000000000000000000000000000000000000000000000000000000000021fc000000000000000000000000000000000000000000000000000000000000226000000000000000000000000000000000000000000000000000000000000022c40000000000000000000000000000000000000000000000000000000000002328000000000000000000000000000000000000000000000000000000000000238c00000000000000000000000000000000000000000000000000000000000023f0000000000000000000000000000000000000000000000000000000000000245400000000000000000000000000000000000000000000000000000000000024b8000000000000000000000000000000000000000000000000000000000000251c000000000000000000000000000000000000000000000000000000000000258000000000000000000000000000000000000000000000000000000000000025e4000000000000000000000000000000000000000000000000000000000000264800000000000000000000000000000000000000000000000000000000000026ac0000000000000000000000000000000000000000000000000000000000002710000000000000000000000000000000000000000000000000000000000000277400000000000000000000000000000000000000000000000000000000000027d8000000000000000000000000000000000000000000000000000000000000283c00000000000000000000000000000000000000000000000000000000000028a00000000000000000000000000000000000000000000000000000000000002904000000000000000000000000000000000000000000000000000000000000296800000000000000000000000000000000000000000000000000000000000029cc0000000000000000000000000000000000000000000000000000000000002a30";
        string memory hh = "0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000006c000000000000000000000000b21385af6bfd19d0e787d718fb83559e515412eb000000000000000000000000911048b3da1687f1dd3dbf1a1bdae1243d6b7f92000000000000000000000000d73953bc13c031459f3856a9a5adce36bed18fdc000000000000000000000000fe5667e1192970b15282508eb86c9ca1b9f877bb000000000000000000000000b2a724fd9ceb574ac27e7a51c71979df203d60750000000000000000000000000ffc06c490b619d35f5c27d29240c5a83ecedbfc0000000000000000000000005ed2dc2b94e4a3aff3e23a36a47b70bf84dffc1800000000000000000000000032ab21b22df135403e3becde162ef47ade863d0e000000000000000000000000ab44e4ddd42314ab4f10a125b8a832278487d6bb00000000000000000000000051e029fcb7af024320bb5a9e469057fa8886818f0000000000000000000000006f76d9d1aadb6a26fac4ca4883dd3ee3d21da539000000000000000000000000573ac825be350c10e33b2233be76f23f4ba607e700000000000000000000000098f6dba2bf90af013a0c0945f2d4c268dfcadef8000000000000000000000000782ebc58ec15c24630ae4ad32b4cc128679d071e000000000000000000000000274734a17e40e88d036811966912d2818def075d00000000000000000000000089aa115549480a62fb1ad29c4d2f402296a3e721000000000000000000000000f39057423d611edfb605d0a1f6c9f230228c71f90000000000000000000000009bcf6baa5ba12d293d625c813538ed899f0118cd000000000000000000000000697c8f4dbca579e5c2acb371239ee3af90b06b320000000000000000000000000ff598b6610b73b4f500db38459fb80ebe03489400000000000000000000000068d366b0e4438947c174599c35a8def9bf033ae9000000000000000000000000219d9014cd1c0d7d8d0db4c2ee7ed46af016e32e000000000000000000000000069db41fea2d0328a4e890c6f81adab2f3e74f3b00000000000000000000000095e9264faafe13c8dd180dae26158ad95362c9d40000000000000000000000007187b937421a5fe1e8a124b5ff055ae05876759e00000000000000000000000073e8d310d7bb200923ccb0cb5bf1b6cb0baf932d000000000000000000000000f2a5a647a733996806f376101bef037880e0b1ab000000000000000000000000fca40bf3a215c67a19dd4783d5c31d594ae2a426000000000000000000000000f76859f9a150dbe99c279ed43ef4f09650e20f8c000000000000000000000000f48fb67d69aa43b00fbc322e78d1bf9b29c7ff400000000000000000000000005ea9e0a29e1160ac0a8cf9e2d876878c14e3259f0000000000000000000000000e2a4b9f62e4957ca93be781c240b5771f72049d000000000000000000000000452cdb8ccf2146ecfc3578bcb7d5c1ea951c4791000000000000000000000000daed563a1642f60657d472c2a30b6411930b42c0000000000000000000000000e372265e995cf83df813136bc98e3d7430bf483d0000000000000000000000006ee205e3a525d78eacce452ab9d69757fd8eefb4000000000000000000000000b80e039d2ba3ce7e069eb460e293ffc92e138f70000000000000000000000000d6ed1f2bce6a4c8cef0e269bf88f45bc25cdfc9200000000000000000000000039f1128e6c2467d12d5407150667c9c2236d2f53000000000000000000000000d2d458e9a4bb2ae35406311156deff405c3e75090000000000000000000000009e940af0c2cfac95f7193645e6eb7443146e0130000000000000000000000000b1e7e61d0a9527a0d88a3bb41f6588ee4b49d9b9000000000000000000000000337d8003de8cde5944602d2abf43240e8c632f8b0000000000000000000000005936a1631b92437ce9476ec87f151d4a18389962000000000000000000000000570856d6e06f183a90058422e35b5aee36a14f4f0000000000000000000000000e87ab93e9c38b86c7cbd3acebbb672d6e99ca8c000000000000000000000000fc0d282b8e885896b60227c278a4b945decabf420000000000000000000000004621305cc1493f9ca02778d1b9be455713c00a350000000000000000000000001dae11a1d4573205159ba28a1ffc50b8a3b39519000000000000000000000000d5f4c0440f83dd84b9d28af92b369a4b50e1b4b300000000000000000000000011369e7b1c5c8e5be7eea6730e0ed99a84a7d52800000000000000000000000002bbc94525cdd579939084883eca10305fc2504500000000000000000000000042f76428a1fe04807d5491b7396492d4f81dadae000000000000000000000000139934ae15f00b4b7a0aa73a5b1cf51dd54bca90000000000000000000000000d79b833cc8973e32531adaf801ae61bd698a3e7200000000000000000000000097ec08b6e8c01cabd8fd1a19352718044608dc820000000000000000000000008979b60eda5fa95c5fa82231ac5b1b485d7702cf000000000000000000000000c78fb70c0b99ab905cec7ae97e5ef573a3cdf52000000000000000000000000029378f5af1ed3b82c4f02b8d67a217246c047efc0000000000000000000000004482523f9554498a2468b8f9ff3a16eecee80e37000000000000000000000000fbda0ca5f5375b0302ff0f6ffd256ef81d464697000000000000000000000000f0093e21842b7f3b0a5fa78a1597f0bc763513e00000000000000000000000007983f6604e19894f1567bae508ee14750944d608000000000000000000000000d9f30cd6af8a719a2eb2d1e41be901a9d0e696d4000000000000000000000000c5dbdae75e809368fbbfd75782e5b2ee9c2f8f200000000000000000000000000752d762a067b11227a41cf546b06330a1481f25000000000000000000000000b1d2b478ce10dbddfb71db385bac32ed5a1647ec000000000000000000000000f4a2eff88a408ff4c4550148151c33c93442619e000000000000000000000000cce859ba2142675dc00f6e30f158b335f3c4d25d0000000000000000000000007a71e8175322580af9a43cf28e61cd81899cad1f00000000000000000000000035ee40bc27b6fa0b603fea36bca6fece1364c64e000000000000000000000000fb51fb600bc60121c7d2dfbc855fc0112e562a41000000000000000000000000d94bf2d1934da2248b97a6d974d2539f502811250000000000000000000000003c3417e244bf008c117eafb0bf010cd37956b763000000000000000000000000ef13a2c29f7a433aff08c60007bc276a64c7bdf500000000000000000000000032b0ccd7fd17f2a03fd0346378e750fe1c5e21940000000000000000000000002bd7c4b8f919bee1b4c29bf7ef19af396b14970f0000000000000000000000008a288f63b9de32feeedd4c3fc3347f026b599dd1000000000000000000000000ae15083b0de3c73add92ba939b9be6bddf350e72000000000000000000000000178bfa4d3e13903062bcea237f4ff9141f6e45710000000000000000000000002c9b54f442c149659faa97dfb0b6f810c88c3d8200000000000000000000000017e50b7398f14c12202686017bee3578e9a0e469000000000000000000000000a1df4222ddefc78b08d3259bf6b80dff4369c48c000000000000000000000000c7325983213485ca2c6aabfc845e1211057d7a500000000000000000000000008327d69aee8310b7e26fdfd36b3e947bf5fecdda000000000000000000000000978d212641ab0c377b674e69dc236fe57875912c00000000000000000000000085731955c510703486232b46d95a169dafb51bdb0000000000000000000000003c49c2a4b7c63121aace0f8a9cfb5117510b9098000000000000000000000000d559466cdea85bb2946d8a19f5487656817202c10000000000000000000000008c1aaeb0dd15d21aad6d45b243019f2839403b130000000000000000000000000277f59895820266b4baff35db8b7c3339c17a65000000000000000000000000d913d7352292ad90fd9d99ddf857022fda9d1ea9000000000000000000000000f2195bde6cdcb17aac7f3f33ca2f8cc2563a4695000000000000000000000000b8e1535a13cbdfc15c6d236053b56bde738e16dd000000000000000000000000d9bb47bdbf4d25f7b3dfb8d00e705d04cc518a340000000000000000000000001b5ac9992570b5166fcf95560bfe5ae88ea02c18000000000000000000000000bb1c74d714cdedd83aec1172d811710076d93ade000000000000000000000000e1c76a19033eb4120439e0b77cb241c353cac2bb00000000000000000000000049efd53dd7ae31a59427681740be2e0c4076d04d000000000000000000000000ec87103a7ec89c91eb046fa4ef22b1bde66023610000000000000000000000003340b0f9720c8e3453af84bff7ebed082a1752a500000000000000000000000068c314490f3d0a8333bc5671c5cc409dfdee7ead000000000000000000000000a75c909001742a6ab1ede66c6166bd1a2a5c9a8f000000000000000000000000eca2c67f9d97bce2b5972b28b5087c816d033ccc00000000000000000000000087b3c58fb53cb13657424941636f2eb217c4efd40000000000000000000000000c097d82998e34b563274171d5c5860d2bb948130000000000000000000000004bba330ea3ad838e616b55206246d23c5fe8d50b000000000000000000000000c6ad6c00877a05a0ac1bbd456e31792c6b561f8d";
        bytes memory userListEncoded = userList.parseRaw();
        console.log("readInput amounts", amounts);
        // airdrop.setUsersAmount(userList,amounts);
    }
}