Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1CE6C02D
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2019 19:15:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387539AbfGQRPF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 17 Jul 2019 13:15:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:42034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387455AbfGQRPF (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 17 Jul 2019 13:15:05 -0400
Subject: Re: [GIT PULL] RTC for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563383704;
        bh=yYu+DMhid3avako9NRl33IEIsp58mDkbHa3Fppdi55M=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=PrwZcwGmcmz9+nZ0mPAcr+EF2GEocOx1dDR2nntj+CF6FW1VuP0zEm/yyL1PKbRG0
         ezxppyE8Olqbb1eDvnaZaZNZj1z0C9oCNIFbCsoOwf65Epx3R9Zpvm7wplZ8lgI7L/
         ZMKBWmA22EWcfGj3VTBsEwjNAh7yBjvNwZ8TeDYY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190716095405.GA2449@piout.net>
References: <20190716095405.GA2449@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190716095405.GA2449@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.3
X-PR-Tracked-Commit-Id: f0162d21cc8025c828fafe56ee25801f770f41da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: edafb6fe42cfa98f4abf8c63acc5f4db011ed7b9
Message-Id: <156338370440.30487.16542124068787249386.pr-tracker-bot@kernel.org>
Date:   Wed, 17 Jul 2019 17:15:04 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Tue, 16 Jul 2019 11:54:05 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/edafb6fe42cfa98f4abf8c63acc5f4db011ed7b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
