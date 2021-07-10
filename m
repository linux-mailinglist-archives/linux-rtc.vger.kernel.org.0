Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B545F3C3743
	for <lists+linux-rtc@lfdr.de>; Sun, 11 Jul 2021 01:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbhGJX2Y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 10 Jul 2021 19:28:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229515AbhGJX2Y (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 10 Jul 2021 19:28:24 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 46F6161355;
        Sat, 10 Jul 2021 23:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625959538;
        bh=gTf2M+mLjp4xqfyBscrLPbx8BbNzNNwvgLn6uk/cBJ8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=BsjNG5VcHD3fsxZO+qxIfRiWh7GuxQem534J1pimha+SO+376h3AgnuoEL+l7x92R
         3CKsYCRw5wVZqahRXAxnDF8C0EQy9KPONekNhA+vkL9nVwscz+VOk/O78EgXnqJPHL
         eIg0WwfJms9yP6P34MINJb3Q7iysq72uDygGhtTpUe5K/yuC1KPCeKI3BKY7VXUOaC
         yP0Li21CxL9BMj53lIQoubRoa3oVb7EJhWGYOeiQdejoRF/FUaERrhlxhdwlOdy+Gv
         wOo6PozqyCsSmtFo5KH3LUKNX0Z9AXaPcl4JS+AH/hQdat+nZkPZQ7+uPalIfYC2/r
         pImv2pwbsR44A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 334EF60A08;
        Sat, 10 Jul 2021 23:25:38 +0000 (UTC)
Subject: Re: [GIT PULL] RTC changes for 5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YOoaQCvHNsCsUZnv@piout.net>
References: <YOoaQCvHNsCsUZnv@piout.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YOoaQCvHNsCsUZnv@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.14
X-PR-Tracked-Commit-Id: 4aa90c036df670b8757140e0dae2a94e7b0d42b4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: de5540965853e514a85d3b775e9049deb85a2ff3
Message-Id: <162595953814.3359.13213210647898768496.pr-tracker-bot@kernel.org>
Date:   Sat, 10 Jul 2021 23:25:38 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Sun, 11 Jul 2021 00:08:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/de5540965853e514a85d3b775e9049deb85a2ff3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
