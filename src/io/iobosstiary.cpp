/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019 Mark Samman <mark.samman@gmail.com>
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

#include "otpch.h"

#include "io/iobosstiary.h"
#include "utils/enums.h"
#include "creatures/monsters/monster.h"
#include "creatures/monsters/monsters.h"
#include "game/game.h"
#include "creatures/players/player.h"

extern Game g_game;
extern Monsters g_monsters;

void IOBosstiary::addBosstiaryKill(Player* player, MonsterType* mtype, uint32_t amount /*= 1*/)
{
    if (!mtype)
        return;
	uint16_t bossid = mtype->info.bossid;
	if (bossid == 0 || !player) {
		return;
	}
	uint32_t curCount = player->getBosstiaryKillCount(bossid);
	std::ostringstream ss;

	player->addBosstiaryKillCount(bossid, amount);

    BosstiaryCategory_t category = mtype->info.bosstiaryCategory;

    if ((category == BOSSTIARY_CATEGORY_BANE && curCount < BOSSTIARY_KILLS_BANE_PROWESS && (curCount + amount) >= BOSSTIARY_KILLS_BANE_PROWESS) ||
        (category == BOSSTIARY_CATEGORY_ARCHFOE && curCount < BOSSTIARY_KILLS_ARCHFOE_PROWESS && (curCount + amount) >= BOSSTIARY_KILLS_ARCHFOE_PROWESS) ||
        (category == BOSSTIARY_CATEGORY_NEMESIS && curCount < BOSSTIARY_KILLS_NEMESIS_PROWESS && (curCount + amount) >= BOSSTIARY_KILLS_NEMESIS_PROWESS)) {
        
        ss << "You unlocked the Prowess level for the boss '" << mtype->name << "'";
        player->sendTextMessage(MESSAGE_STATUS, ss.str());
        if (category == BOSSTIARY_CATEGORY_BANE) {
            addBossPoints(player, BOSSTIARY_POINTS_BANE_PROWESS);
        } else if (category == BOSSTIARY_CATEGORY_ARCHFOE) {
            addBossPoints(player, BOSSTIARY_POINTS_ARCHFOE_PROWESS);
        } else if (category == BOSSTIARY_CATEGORY_NEMESIS) {
            addBossPoints(player, BOSSTIARY_POINTS_NEMESIS_PROWESS);
        }

    } else if ((category == BOSSTIARY_CATEGORY_BANE && curCount < BOSSTIARY_KILLS_BANE_EXPERTISE && (curCount + amount) >= BOSSTIARY_KILLS_BANE_EXPERTISE) ||
        (category == BOSSTIARY_CATEGORY_ARCHFOE && curCount < BOSSTIARY_KILLS_ARCHFOE_EXPERTISE && (curCount + amount) >= BOSSTIARY_KILLS_ARCHFOE_EXPERTISE) ||
        (category == BOSSTIARY_CATEGORY_NEMESIS && curCount < BOSSTIARY_KILLS_NEMESIS_EXPERTISE && (curCount + amount) >= BOSSTIARY_KILLS_NEMESIS_EXPERTISE)) {
        
        ss << "You unlocked the Expertise level for the boss '" << mtype->name << "'";
        player->sendTextMessage(MESSAGE_STATUS, ss.str());
        if (category == BOSSTIARY_CATEGORY_BANE) {
            addBossPoints(player, BOSSTIARY_POINTS_BANE_EXPERTISE);
        } else if (category == BOSSTIARY_CATEGORY_ARCHFOE) {
            addBossPoints(player, BOSSTIARY_POINTS_ARCHFOE_EXPERTISE);
        } else if (category == BOSSTIARY_CATEGORY_NEMESIS) {
            addBossPoints(player, BOSSTIARY_POINTS_NEMESIS_EXPERTISE);
        }
    } else if ((category == BOSSTIARY_CATEGORY_BANE && curCount < BOSSTIARY_KILLS_BANE_MASTERY && (curCount + amount) >= BOSSTIARY_KILLS_BANE_MASTERY) ||
        (category == BOSSTIARY_CATEGORY_ARCHFOE && curCount < BOSSTIARY_KILLS_ARCHFOE_MASTERY && (curCount + amount) >= BOSSTIARY_KILLS_ARCHFOE_MASTERY) ||
        (category == BOSSTIARY_CATEGORY_NEMESIS && curCount < BOSSTIARY_KILLS_NEMESIS_MASTERY && (curCount + amount) >= BOSSTIARY_KILLS_NEMESIS_MASTERY)) {
        
        ss << "You unlocked the Mastery level for the boss '" << mtype->name << "'";
        player->sendTextMessage(MESSAGE_STATUS, ss.str());
        if (category == BOSSTIARY_CATEGORY_BANE) {
            addBossPoints(player, BOSSTIARY_POINTS_BANE_MASTERY);
        } else if (category == BOSSTIARY_CATEGORY_ARCHFOE) {
            addBossPoints(player, BOSSTIARY_POINTS_ARCHFOE_MASTERY);
        } else if (category == BOSSTIARY_CATEGORY_NEMESIS) {
            addBossPoints(player, BOSSTIARY_POINTS_NEMESIS_MASTERY);
        }
    }
}

uint32_t IOBosstiary::getRemovalCost(uint16_t removals)
{
    if (removals == 0)
        return 0;
    return (removals - 1) * 300000 + 100000;
}

void IOBosstiary::addBossPoints(Player* player, uint32_t amount)
{
	if (!player) {
		return;
	}
	uint32_t myPoints = player->getBossPoints();
	myPoints += amount;
	player->setBossPoints(myPoints);
}

uint32_t IOBosstiary::getBossPointsForLevel(uint16_t level)
{
    if (level <= 25) {
        return level * 10;
    } else if (level > 25 && level <= 75) {
        return 250 + (level-25) * 20;
    } else {
        uint32_t bossPoints = 1250;
        level -= 75;
        uint16_t last = 0;
        while (level > 0) {
            bossPoints += 25 + 5 * last;
            last++;
        }
        return bossPoints;
    }
}
uint16_t IOBosstiary::getLevelByBossPoints(uint32_t bossPoints)
{
    if (bossPoints <= 250) {
        return std::floor(bossPoints/10);
    } else if (bossPoints > 250 && bossPoints <= 1250) {
        bossPoints -= 250;
        return 25 + std::floor(bossPoints/10);
    } else {
        bossPoints -= 1250;
        uint16_t level = 75;
        uint32_t actualCost = 25;
        while (bossPoints >= actualCost) {
            level++;
            bossPoints -= actualCost;
            actualCost += 5;
        }
        return level;
    }
}

BosstiaryProgress_t IOBosstiary::getBosstiaryProgress(Player* player, uint32_t kills, BosstiaryCategory_t category)
{
    if (category == BOSSTIARY_CATEGORY_BANE) {
        if (kills >= BOSSTIARY_KILLS_BANE_MASTERY)
            return BOSSTIARY_PROGRESS_MASTERY;
        else if (kills >= BOSSTIARY_KILLS_BANE_EXPERTISE)
            return BOSSTIARY_PROGRESS_EXPERTISE;
        else if (kills >= BOSSTIARY_KILLS_BANE_PROWESS)
            return BOSSTIARY_PROGRESS_PROWESS;
    } else if (category == BOSSTIARY_CATEGORY_ARCHFOE) {
        if (kills >= BOSSTIARY_KILLS_ARCHFOE_MASTERY)
            return BOSSTIARY_PROGRESS_MASTERY;
        else if (kills >= BOSSTIARY_KILLS_ARCHFOE_EXPERTISE)
            return BOSSTIARY_PROGRESS_EXPERTISE;
        else if (kills >= BOSSTIARY_KILLS_ARCHFOE_PROWESS)
            return BOSSTIARY_PROGRESS_PROWESS;
    } else if (category == BOSSTIARY_CATEGORY_NEMESIS) {
        if (kills >= BOSSTIARY_KILLS_NEMESIS_MASTERY)
            return BOSSTIARY_PROGRESS_MASTERY;
        else if (kills >= BOSSTIARY_KILLS_NEMESIS_EXPERTISE)
            return BOSSTIARY_PROGRESS_EXPERTISE;
        else if (kills >= BOSSTIARY_KILLS_NEMESIS_PROWESS)
            return BOSSTIARY_PROGRESS_PROWESS;
    }
    return BOSSTIARY_PROGRESS_NONE;
}