Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8467B2431C3
	for <lists+linux-rtc@lfdr.de>; Thu, 13 Aug 2020 02:50:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgHMAub (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 12 Aug 2020 20:50:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:37838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726131AbgHMAub (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 12 Aug 2020 20:50:31 -0400
Subject: Re: [GIT PULL] RTC for 5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597279831;
        bh=CmG50SFXiVxu5/LRUTzuIQlc5HKdf+/2VgcyxYGuUQk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=pRAjq2p2gaAf656f8QGWA62Cvbw6HUNXMDXQhNSWgjtc1BOTsI38qjSxRzQ1wqblK
         QdPuYmaB8kKUqyvJMN3nSudlm3l2tW7TlEo/ioVG7v7bpmc1Jcfn4UAeMY4Fxe+Hwx
         H2qOMzEnOr5e5w5kq1sfBnDqtXTiJydCfUqf/jfg=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200812213655.GA81005@piout.net>
References: <20200812213655.GA81005@piout.net>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200812213655.GA81005@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.9
X-PR-Tracked-Commit-Id: 27006416be16b7887fb94b3b445f32453defb3f1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dc06fe51d26efc100ac74121607c01a454867c91
Message-Id: <159727983093.29342.15187368040650362763.pr-tracker-bot@kernel.org>
Date:   Thu, 13 Aug 2020 00:50:30 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Wed, 12 Aug 2020 23:36:55 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dc06fe51d26efc100ac74121607c01a454867c91

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
