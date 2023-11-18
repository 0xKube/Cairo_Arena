mod io;

use io::{SetTier, CharacterAttributes};
use starknet::{ContractAddress, ClassHash};

#[derive(Model, Drop, Serde)]
struct CharacterInfo {
    #[key]
    owner: ContractAddress,
    name: felt252,
    attributes: CharacterAttributes,
    strategy: ClassHash,
}

// models don't support Arrays yet, so we use a special counter model
#[derive(Model, Drop, Serde)]
struct Counter {
    #[key]
    counter: u32,
    arena_count: u32,
}

#[derive(Model, Drop, Serde)]
struct Arena {
    #[key]
    id: u32,
    owner: ContractAddress,
    name: felt252,
    current_tier: SetTier,
    character_count: u32,
    winner: ContractAddress
}

#[derive(Model, Drop, Serde, Clone)]
struct ArenaCharacter {
    #[key]
    arena_id: u32,
    #[key]
    character_count: u32,
    name: felt252,
    hp: u8,
    energy: u8,
    position: u8,
    attributes: CharacterAttributes,
    character_owner: ContractAddress,
    strategy: ClassHash,
}

#[derive(Model, Drop, Serde)]
struct ArenaRegistered {
    #[key]
    arena_id: u32,
    #[key]
    character_owner: ContractAddress,
    registered: bool,
}
