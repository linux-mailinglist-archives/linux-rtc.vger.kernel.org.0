Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3C6C111B7A
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Dec 2019 23:15:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbfLCWPE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 3 Dec 2019 17:15:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:60636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727537AbfLCWPD (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 3 Dec 2019 17:15:03 -0500
Subject: Re: [GIT PULL] RTC for 5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575411303;
        bh=fHtI9p6UNwIsiKVv3FQYmRUrqnDvZAIX3zj6XB7wXhQ=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=0iQnvkVMpCY96Tkq+fE2zIi3INf/c7uQmGDHcwievBY92eqw56dzC8m84lxMpvfGe
         eGBiJXplS7NT0JdLs301O8evhJXUuI8IScEIjehvOtq9nWNRgpKhw+C4TfABrBIhxd
         TM3v08HChnkw2wzx3rkjjvjniyeuRGOFwl9Uq6IA=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191202172906.GA1034578@piout.net>
References: <20191202172906.GA1034578@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191202172906.GA1034578@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.5
X-PR-Tracked-Commit-Id: f830f7cf4752f6f0db48777b7e16c010bdc95083
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4672c2f2026dbc46b20647803426561fe2d460ea
Message-Id: <157541130334.3528.17912772023821678801.pr-tracker-bot@kernel.org>
Date:   Tue, 03 Dec 2019 22:15:03 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Mon, 2 Dec 2019 18:29:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4672c2f2026dbc46b20647803426561fe2d460ea

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
