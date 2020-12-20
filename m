Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 432AC2DF697
	for <lists+linux-rtc@lfdr.de>; Sun, 20 Dec 2020 19:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbgLTSxv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 20 Dec 2020 13:53:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:34838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727251AbgLTSxr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 20 Dec 2020 13:53:47 -0500
Subject: Re: [GIT PULL] RTC for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608490387;
        bh=yqitbonZJa3Na3ckq8UmY44LNyyxYcQC1vZTjazO8gU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=jNs0tA5bRYdzhceiwVj5+mZHgAT7WKUoVaCu9G2M9EYIWrebvT4wk8/DNLFLAg3vd
         lJLiE4btiME6Xpt6F4iwbuLOZbiAI1j7bZP15ktB4ahzXnweJm6TX8vQMqxBaUAAdk
         uB6E1olZT74SlWJyeqyliln8Vu6jdez64YTYeftRilg9HX5pcInH7RepYRQfoKmmhq
         lax7nMypacNc+mzfI47lY0xqAXmgfyIpC+D3BoWjF44Mi8vH3Ih5ZKtzTXArXfIIV1
         7jGCC/Ca7Z8cKPrG6gf+67PBLDFuN0XshoHeS8uYzG5fcprYnVN4X+iOYvC7fpM61q
         aYwVSuih9dqGQ==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201219221254.GA3604939@piout.net>
References: <20201219221254.GA3604939@piout.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201219221254.GA3604939@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.11
X-PR-Tracked-Commit-Id: 71ac13457d9d1007effde65b54818106b2c2b525
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f4a2f7866faaf89ea1595b136e01fcb336b46aab
Message-Id: <160849038758.26331.2758195491454598122.pr-tracker-bot@kernel.org>
Date:   Sun, 20 Dec 2020 18:53:07 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Sat, 19 Dec 2020 23:12:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f4a2f7866faaf89ea1595b136e01fcb336b46aab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
