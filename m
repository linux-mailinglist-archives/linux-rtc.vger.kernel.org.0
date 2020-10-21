Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71D4829524E
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Oct 2020 20:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439031AbgJUSfJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 21 Oct 2020 14:35:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:44238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392431AbgJUSfJ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 21 Oct 2020 14:35:09 -0400
Subject: Re: [GIT PULL] RTC for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603305308;
        bh=E5IsMeaMoFuZe+PiVfyYvZi0W2Lbd8VHhUJ5bgGjx1k=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=yj4F9BziNMnxIw4Ifx0nnh/jIWyXK/VKdR5OCsMms+Z9tCGwqOKsje5XCeJvAk9q+
         gDSiWWGFKmqBFulBnQnPNlE+vddillwdm6bOZMsK7G/wJ89qIrrGZkBFpkQBK9ucPz
         PRko1lLmnBE3QgeUffEdD9l10p+ky0Yo85kfyx7M=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201021082320.GA1457765@piout.net>
References: <20201021082320.GA1457765@piout.net>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201021082320.GA1457765@piout.net>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.10
X-PR-Tracked-Commit-Id: 35331b506f6c67a0b4042fac1ae2785cef9ac8c3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b7769c45b8d95f1c70b9dec38c8de8ad229ce222
Message-Id: <160330530875.16606.6752108185683007620.pr-tracker-bot@kernel.org>
Date:   Wed, 21 Oct 2020 18:35:08 +0000
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The pull request you sent on Wed, 21 Oct 2020 10:23:20 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b7769c45b8d95f1c70b9dec38c8de8ad229ce222

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
