Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F9E1BA88E
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Sep 2019 21:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729944AbfIVTFK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 22 Sep 2019 15:05:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:40726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728399AbfIVTFE (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 22 Sep 2019 15:05:04 -0400
Subject: Re: [GIT PULL] RTC for 5.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569179104;
        bh=t2PRAXUH8Td3/f/cV4lcabQFfzGauPOTFfEi3YdhAls=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Fdths6ad3oQ6Gfhq2YTd8fFLrvGIM6/87S7CudsvP4zpiwzoY9/59YVsS7VMt5liD
         n4qPduY0sRqmaQIZ7n/hCYQo4DzojcvLfT3YdF+qAZm/cy/MTrKyGHW5m8tAxj5VnL
         JDA/iSdoVTvisNlwXATViN2PilldddK4SaNZfTxA=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190922112052.GA22547@piout.net>
References: <20190922112052.GA22547@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190922112052.GA22547@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.4
X-PR-Tracked-Commit-Id: b99a3120f9a30e1429d8d634e18da8dff93340c6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9dbd83f665298c9dcf647f20d6d6488e9019114b
Message-Id: <156917910408.24588.10515279683439114587.pr-tracker-bot@kernel.org>
Date:   Sun, 22 Sep 2019 19:05:04 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Sun, 22 Sep 2019 13:20:52 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9dbd83f665298c9dcf647f20d6d6488e9019114b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
