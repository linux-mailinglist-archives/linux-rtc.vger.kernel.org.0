Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D35E819E6D6
	for <lists+linux-rtc@lfdr.de>; Sat,  4 Apr 2020 19:50:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbgDDRuE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 4 Apr 2020 13:50:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:40072 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726207AbgDDRuE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 4 Apr 2020 13:50:04 -0400
Subject: Re: [GIT PULL] RTC for 5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586022603;
        bh=3co9XQw3TWh9y/PQMoal8PPNA0Rih4jHpa1w3Pjc1Hw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=cIMOOBjC3xqjuj4lRwQD4fIDTImQHtZ2UdwXqwguo1JKEAKeyT61yF1g7CCVAarTB
         YyutgE6jRg4IxI30lEyUc+ame6KRBmdQAq/PfyJfvIIf8CogzccCnUh0vCUdzcfiva
         ngLudLPjkB0+oM9aTjKieKQ6MVx4/b9jXLRPX2q8=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200404125106.GA12183@piout.net>
References: <20200404125106.GA12183@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200404125106.GA12183@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.7
X-PR-Tracked-Commit-Id: 1821b79d6a7d6973d1630e71380da8bb5e95f3a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bdabb68931b9360bf18b498062f1ac90bec46633
Message-Id: <158602260363.31764.15398236531410518745.pr-tracker-bot@kernel.org>
Date:   Sat, 04 Apr 2020 17:50:03 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Sat, 4 Apr 2020 14:51:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bdabb68931b9360bf18b498062f1ac90bec46633

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
