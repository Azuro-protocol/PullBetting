// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.4;

interface IPoolBetting {
    enum ConditionState {
        CREATED,
        RESOLVED,
        CANCELED
    }

    struct Condition {
        address oracle;
        bytes32 ipfsHash;
        uint128[2] totalNetBets;
        uint64[2] outcomes;
        uint64 outcomeWin;
        uint64 startsAt;
        ConditionState state;
    }

    event BettorWin(address indexed bettor, uint256[] tokenId, uint128 amount);

    event ConditionCreated(
        address indexed oracle,
        uint256 indexed conditionId,
        uint64 startsAt
    );
    event ConditionResolved(uint256 indexed conditionId, uint64 outcomeWin);
    event ConditionCanceled(uint256 indexed conditionId);

    event NewBet(
        address indexed owner,
        uint256 indexed tokenId,
        uint256 indexed conditionId,
        uint64 outcome,
        uint128 amount
    );

    error OnlyOracle();

    error WrongFee();
    error WrongToken();
    error WrongOutcome();
    error SameOutcomes();
    error ConditionExpired();

    error ConditionNotExists(uint256 conditionId);
    error ConditionNotStarted(uint256 conditionId);
    error ConditionStillOn(uint256 conditionId);
    error ConditionStarted(uint256 conditionId);
    error ConditionResolved_(uint256 conditionId);
    error ConditionAlreadyResolved(uint256 conditionId);
    error ConditionCanceled_(uint256 conditionId);
    error ConditionAlreadyCanceled(uint256 conditionId);

    error AmountMustNotBeZero();
    error ZeroBalance(uint256 tokenId);
    error NoDAOReward();
}
