Return-Path: <linux-rtc+bounces-214-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BC37E1922
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Nov 2023 04:19:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21DABB20CC5
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Nov 2023 03:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B89BECA;
	Mon,  6 Nov 2023 03:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhFIp7np"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE79A55
	for <linux-rtc@vger.kernel.org>; Mon,  6 Nov 2023 03:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EDF5C433C9;
	Mon,  6 Nov 2023 03:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699240767;
	bh=wiqMzuMaV956d+3ym4s4C73aptfsfHg0OVa1RHrqErA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=OhFIp7npTfuK/j4dipGO2nnp97mw2uz9EL9eDFTpXb8uTM2udivLnR//XxEk0dCi4
	 mIYEqc8YqKm4v2lSai99AmciY1qvo/gX3KsAoFuwhnxRClHacVgWz2X84u1r6UoPgT
	 /EQZMit4+AX8xypeoVEW/tIdcLH3P01ByIHKrJfsiEJfmmLeXK7upi4bhfjw4XjOnZ
	 dRhEzZq9n9NtiCHPi5PJF6KbQCn803b1qzEn+XO5+/j2wkXuNHMzyaNH9/IOncsPtD
	 c7/fpbUjAuRxs4gM740vYDVKJcQ/g90zQS886MKj9raOws5XxZL3h3vFurFO37vkA2
	 XhHsVfztmBVrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 197F8C395FC;
	Mon,  6 Nov 2023 03:19:27 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 6.7
From: pr-tracker-bot@kernel.org
In-Reply-To: <20231105230218a45aa668@mail.local>
References: <20231105230218a45aa668@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20231105230218a45aa668@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.7
X-PR-Tracked-Commit-Id: cfb67623ce281e045ec11e3eddb1b68b879b53a1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d2f51b3516dade79269ff45eae2a7668ae711b25
Message-Id: <169924076709.12392.2756557352194646388.pr-tracker-bot@kernel.org>
Date: Mon, 06 Nov 2023 03:19:27 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 6 Nov 2023 00:02:18 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d2f51b3516dade79269ff45eae2a7668ae711b25

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

