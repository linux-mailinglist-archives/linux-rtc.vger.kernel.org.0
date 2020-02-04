Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 696791516B2
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Feb 2020 09:05:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbgBDIFD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Feb 2020 03:05:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:36168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727004AbgBDIFD (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 4 Feb 2020 03:05:03 -0500
Subject: Re: [GIT PULL] RTC for 5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580803503;
        bh=C9ZIXkdQOj2tiHTCuXspMqR8xG3hB6U6ESXiyD40ZlU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=n/wOU2P/SUBysT7IkZ/DF5FMkM/Slx+BQpc8P0fYI2N4ZffTu7+Bnb9AG9Ejs9ej+
         vQ21Xh88DSgSvKdTjFQJD5qFwsnQapS4NBxX9DuxXA2Q3guttVcBUev02tyhtUAgDi
         wq1DmlcbCphNn0MK9IpPGZ3GAAsYEX4lykv4m5/4=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200203223240.GA63964@piout.net>
References: <20200203223240.GA63964@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200203223240.GA63964@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.6
X-PR-Tracked-Commit-Id: f45719240700398b63a165f6b7f3fbab04f0b052
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eadc4e40e68832fc61ae5e3ef2ef5cfcd9308b2c
Message-Id: <158080350294.18289.15866442909143805846.pr-tracker-bot@kernel.org>
Date:   Tue, 04 Feb 2020 08:05:02 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Mon, 3 Feb 2020 23:32:40 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eadc4e40e68832fc61ae5e3ef2ef5cfcd9308b2c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
