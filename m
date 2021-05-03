Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB62E372066
	for <lists+linux-rtc@lfdr.de>; Mon,  3 May 2021 21:28:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbhECT3C (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 3 May 2021 15:29:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:48844 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229499AbhECT3C (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 3 May 2021 15:29:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B9A88613C0;
        Mon,  3 May 2021 19:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620070088;
        bh=nSIi51WCZex5z0zl2E4NE6zPKT2x98cd03ilPz2yxgk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=rX9QLc2waDqCV+dKzd5D/NUUZ+lzFWpMGknKd4gCF+2MfG8qUYf3KOAKuuaFwPkyg
         Sd3/19QEHDDfV11/fk7iSk/o6DfhhMpfCEXkQ4Wf+p8ZNXVUbC+H4icR+jmR4MSqIv
         JQNBspjuryhsFT7MKl5eczMxYnUyx+1Ge7OPz/PGmPn7UGAMZp31ZwHuR2CJUscJeZ
         Ufb5pwJIgUxpFPMbBKtRHf6feegyQ3wVxxN1c1N2O91hUuFKeHyWTqbXqBAbX6oxPf
         CSpAVo2WUgAp2+YH2kD+H+peeyeC1fTbhCzznF3DIR+1fSPlT79UcE+IR5GJ/PNVaX
         IA+8SqMmlZb6g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A4C0660987;
        Mon,  3 May 2021 19:28:08 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 5.13
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YI8hiepfYO8Pwhlu@piout.net>
References: <YI8hiepfYO8Pwhlu@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <YI8hiepfYO8Pwhlu@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.13
X-PR-Tracked-Commit-Id: 4d0185e67806a233c423c1668e87e137fbda192c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a7efd197bc7ff03076faf09d6325d7c3427893e3
Message-Id: <162007008861.496.9330109963286088743.pr-tracker-bot@kernel.org>
Date:   Mon, 03 May 2021 19:28:08 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Mon, 3 May 2021 00:02:49 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a7efd197bc7ff03076faf09d6325d7c3427893e3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
