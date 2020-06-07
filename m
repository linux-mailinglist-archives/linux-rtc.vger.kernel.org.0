Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A263C1F105E
	for <lists+linux-rtc@lfdr.de>; Mon,  8 Jun 2020 01:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbgFGXUD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Jun 2020 19:20:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:60850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726922AbgFGXUD (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 7 Jun 2020 19:20:03 -0400
Subject: Re: [GIT PULL] RTC for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591572003;
        bh=TNNojJuRTYQcB7kszSbgG305WEICZvVReDOnu4sPol4=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=j5kMf1/F2O2P/UlWY5l+RdNwekOWAuMdfIAQ9QFt0rS7y1WRqi1RnJ63uxVYLl4To
         vfxV5Wmev+0P6gPb3pdC8Zq/KQVdJaU8I95XzSo0An+w2WBFZLTWCBqrUJpA7j3uBF
         o+U1xWnMa+XRxInwIX9gkLBdlkxEqWSl0u364/mc=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200607212943.GA1821798@piout.net>
References: <20200607212943.GA1821798@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200607212943.GA1821798@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.8
X-PR-Tracked-Commit-Id: 4601e24a6fb819d38d1156d0f690cbe6a42c6d76
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e8dff03aef6a76c5c9184ed1dd3c770d4ce9c885
Message-Id: <159157200305.17419.303594534018500335.pr-tracker-bot@kernel.org>
Date:   Sun, 07 Jun 2020 23:20:03 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Sun, 7 Jun 2020 23:29:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e8dff03aef6a76c5c9184ed1dd3c770d4ce9c885

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
