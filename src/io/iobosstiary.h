/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019  Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#ifndef SRC_BOSSTIARY_H_LL0TBRNCOPYlMVlLL
#define SRC_BOSSTIARY_H_LL0TBRNCOPYlMVlLL

#include <map>
#include <string>

#include "utils/enums.h"
#include "creatures/monsters/monster.h"
#include "creatures/monsters/monsters.h"
#include "game/game.h"
#include "creatures/players/player.h"
#include "lua/scripts/luascript.h"

class Game;

class IOBosstiary
{
	public:
		void addBosstiaryKill(Player* player, MonsterType* mtype, uint32_t amount = 1);
		void addBossPoints(Player* player, uint32_t amount);
        BosstiaryProgress_t getBosstiaryProgress(Player* player, uint32_t kills, BosstiaryCategory_t category);
        uint32_t getRemovalCost(uint16_t removals);
        uint16_t getLevelByBossPoints(uint32_t bossPoints);
        uint32_t getBossPointsForLevel(uint16_t level);

};

#endif