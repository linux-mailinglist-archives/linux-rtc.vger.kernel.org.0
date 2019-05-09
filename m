Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBE8519510
	for <lists+linux-rtc@lfdr.de>; Fri, 10 May 2019 00:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727219AbfEIWPE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 9 May 2019 18:15:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:42280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727215AbfEIWPE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 9 May 2019 18:15:04 -0400
Subject: Re: [GIT PULL] RTC for 5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557440103;
        bh=HR9k27RukiNS7295rpPWPj8IBMw3MQXBHVTb19a7odc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=KZ2PGvlOmCDCiHkOYvP82sAv6hZmBwfmdhhxyAACA8Xfk+I4rP8ivzfgNFQxALl2k
         AD1zsiP0KN36AbmwePw9KwKszdAWySG8FCxAuuD9UbclPTgaQiLk7gXdG06zumIY/8
         gYr5Sj7ac3kIXqP9Gccy6OX8rawOfNL+wMwB4oUU=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190509210340.GA23061@piout.net>
References: <20190509210340.GA23061@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190509210340.GA23061@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.2
X-PR-Tracked-Commit-Id: dacb6a4035a010e41abaf81c1cfe2beadfb05ec8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8e4ff713ce313dcabbb60e6ede1ffc193e67631f
Message-Id: <155744010342.23477.10954246669924043219.pr-tracker-bot@kernel.org>
Date:   Thu, 09 May 2019 22:15:03 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Thu, 9 May 2019 23:03:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8e4ff713ce313dcabbb60e6ede1ffc193e67631f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
