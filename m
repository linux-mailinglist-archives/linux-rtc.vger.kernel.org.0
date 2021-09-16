Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4DE340D0F2
	for <lists+linux-rtc@lfdr.de>; Thu, 16 Sep 2021 02:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233749AbhIPAdp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 Sep 2021 20:33:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:36306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233569AbhIPAdl (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 15 Sep 2021 20:33:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8F75E6108F;
        Thu, 16 Sep 2021 00:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631752341;
        bh=cm/iyTSXpnrPd4Q/E5nuA4SvSZt8gVYF2DIwrEIdTs0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=F0QSL4r2TAbdKduhgGb6tkP8B2F7FPy1Hjswdx4eogohyecBdkpLuFcRfdwmJp0a0
         4Va39zYcfymduX1hiSlTTLImEDK2Ip3cl183WZe+0A49Lh4j/xD8rV8B6WI9VFj3FM
         DwgAaFxFGrViOJmIOmIZpAlrSDxbvRMuGVLFLmhaw7j4UPHrS813DFTFWTPgmUKAdG
         GiBxC9C59eZa7rrxtU0nDgLesv8IIOhSjdJGQ17mOckn0Shzg3r+0xeMq8TmHPw0XS
         R/7Jgy3q1JuicCSQcNlaoU4xYjtVzSufMreOM5v2DPE+wd9C7XNd8CtVEBGezstGgk
         TGXMnuoW75/EA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7FDA460A22;
        Thu, 16 Sep 2021 00:32:21 +0000 (UTC)
Subject: Re: [GIT PULL] RTC fixes for 5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YUEgl3kjnTSJhbCD@piout.net>
References: <YUEgl3kjnTSJhbCD@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <YUEgl3kjnTSJhbCD@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.15-fixes
X-PR-Tracked-Commit-Id: 13be2efc390acd2a46a69a359f6efc00ca434599
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 453fa43cdb8e0f4231ab84755fd2fc562823541b
Message-Id: <163175234146.18536.8415088467666068077.pr-tracker-bot@kernel.org>
Date:   Thu, 16 Sep 2021 00:32:21 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Wed, 15 Sep 2021 00:22:15 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.15-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/453fa43cdb8e0f4231ab84755fd2fc562823541b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
