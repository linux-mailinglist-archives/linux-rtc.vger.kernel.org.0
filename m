Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AECB321EF1
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Feb 2021 19:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbhBVSN2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Feb 2021 13:13:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:37804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232002AbhBVSNY (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 22 Feb 2021 13:13:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 879DD64F03;
        Mon, 22 Feb 2021 18:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614017522;
        bh=HNoa34HJ9zUmxnh+A88rO94H5N62P2GQbAbVHsUVJj0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=MQ3jl/mbe+wmHrEhzjvHqxcg5nRC3X2cuSzvhv/5v6hB1HXmGD9nZntv0VxmacDHY
         0YHtbmcyBTieLb6CFZh0v4ZFcEpuvUPHla7pzxpiUu740MgKWOStwXlRuzhhWfQNn8
         FI04nwnmSBvnZZQTh8LWSduzp5VdI3x19dB2gmQjU15srKcBJWIiuh/ptaJ9BuuDWA
         40IjCJRLV3wF4uoFyZLBLZ7Y0s7Ot1P21r+Edc6adfEK/GMg1CneJUwNImZEv9LcIs
         bVtfVzZaOlB54+Ax40+efQWshjlQC0k4uHdv8jhWcW3eb4LrnKI/IzKx+DisAFLy8w
         vrkDfcfKJuz9g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 830F960982;
        Mon, 22 Feb 2021 18:12:02 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YDMBVCTgavxdqkj6@piout.net>
References: <YDMBVCTgavxdqkj6@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <YDMBVCTgavxdqkj6@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.12
X-PR-Tracked-Commit-Id: 49dfc1f16b03a6abc17721d4600f7a0bf3d3e4ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0328b5f2ef4af8ba060e64baa928c94037e7308f
Message-Id: <161401752253.943.9033238797631200126.pr-tracker-bot@kernel.org>
Date:   Mon, 22 Feb 2021 18:12:02 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Mon, 22 Feb 2021 01:56:52 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0328b5f2ef4af8ba060e64baa928c94037e7308f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
