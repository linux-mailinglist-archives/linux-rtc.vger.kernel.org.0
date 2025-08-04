Return-Path: <linux-rtc+bounces-4639-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 915D9B19A7C
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Aug 2025 05:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0F2E177AFD
	for <lists+linux-rtc@lfdr.de>; Mon,  4 Aug 2025 03:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7696922129B;
	Mon,  4 Aug 2025 03:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrdoJzR9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5082C21CC4B;
	Mon,  4 Aug 2025 03:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754277877; cv=none; b=p1PbYrZxk6R4GUk8XVeGt9C8w/2Y9Jc5tIRZcNZVbaCn14HtPd5gkmUOmMhMoPo4dkdyxNePFkSemRz3y8u43iaX14dCPaWzUh1zZPkJXdNl0cVjBAj9cJul2rstyhrJ+uOPdQKak1N59J3WYfjPBB75TXZXUMh3F9YbKu+7tGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754277877; c=relaxed/simple;
	bh=CVIT2zdnRgh4I4EbqTYsozwCJB/xGSDXxw64KQvsYEw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=uVcJZeLQmtawPgN3J/R7gnQ52VS9EYlZjxBlcy1Aaoej+Vts6HF7ih+cQHaKOX2BCEQLoZxXuCOPNjLM2L8zOY9grWKLR5wPFEFbpSEjDsMArTkFs/cWmp4vmn/2UMl/sBguczqa677z5Z9Zo3edyQicrt+mVd2Lvd/wAquLcFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrdoJzR9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32AB2C4CEEB;
	Mon,  4 Aug 2025 03:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754277877;
	bh=CVIT2zdnRgh4I4EbqTYsozwCJB/xGSDXxw64KQvsYEw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RrdoJzR9OJiZcL6/fbsJz2IM/HtgRAmVQV+UuiGOnwTbFyR6OgJhi1PVzbo72pI0k
	 K9Fxs9rJmnU2uoArhQeWWlRWUyYq5ZvVK0+dA4QbVejo3ioqlivHul6y6jEVgoV5y5
	 BISYwD1kyjRntwZYNPx/SUvcCUUDil+yt5V31IFGSUvwsE+8CFxGv0rvGFphXI5beV
	 SGG5sUlVyjLf5OVRu7ZplKUemVUOtRAx/VS2Np5FYHuFKOlbQx0z2BSVTmMWYtIYvr
	 BP3xVojrlh0NMEf6M+Cwex9MKKqorOfe4y1Iez+zN3tI6DQJsy9k3gKRxkkpXaNkcb
	 kSGA0pdEQixWA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF9C383BF56;
	Mon,  4 Aug 2025 03:24:52 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 6.17
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250804030054453a11b9@mail.local>
References: <20250804030054453a11b9@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250804030054453a11b9@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.17
X-PR-Tracked-Commit-Id: bb5b0b4317c9516bdc5e9a4235e3b5f1a73b7e48
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d2eedaa3909be9102d648a4a0a50ccf64f96c54f
Message-Id: <175427789157.630740.13149863476906562323.pr-tracker-bot@kernel.org>
Date: Mon, 04 Aug 2025 03:24:51 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 4 Aug 2025 05:00:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.17

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d2eedaa3909be9102d648a4a0a50ccf64f96c54f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

