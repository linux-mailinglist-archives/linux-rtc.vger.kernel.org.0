Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A91F131A01
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jan 2020 22:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgAFVFC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Jan 2020 16:05:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:34106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725298AbgAFVFC (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 6 Jan 2020 16:05:02 -0500
Subject: Re: [GIT PULL] RTC fixes for 5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578344701;
        bh=CwcOll8GlIdpYkGcLk7GwOvhneYVjZpDjkq/GoRGo10=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=nf+To8GtF2Q5iaxNVy6wn9+tcNKbDp3Cg42kwETQkfcZKxAZcaN8WyZaU2cn0F331
         IuekyDaofZZ0GK53vVCfiyHKZ/utR2piIPGJIS2Y7ZmfE8aXJ6gqu7GAhPW07t2ZHb
         aIAJ0qbjy9naGM08M7SekKD0eNJ71O5qqL53+mhY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200106001204.GA776560@piout.net>
References: <20200106001204.GA776560@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200106001204.GA776560@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
 tags/rtc-5.5-2
X-PR-Tracked-Commit-Id: f01f4ffdfb703694035870f94b10f6ef2523f8de
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b967793c96dde15cbcb07fb98238535682cc27f8
Message-Id: <157834470187.27503.3535855957825797000.pr-tracker-bot@kernel.org>
Date:   Mon, 06 Jan 2020 21:05:01 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Mon, 6 Jan 2020 01:12:04 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.5-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b967793c96dde15cbcb07fb98238535682cc27f8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
