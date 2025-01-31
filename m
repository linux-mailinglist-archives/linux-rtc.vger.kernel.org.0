Return-Path: <linux-rtc+bounces-3079-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A93EFA238B4
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Jan 2025 03:00:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4517A3A912B
	for <lists+linux-rtc@lfdr.de>; Fri, 31 Jan 2025 01:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE0E4437C;
	Fri, 31 Jan 2025 01:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5iwVe14"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B7B7081F;
	Fri, 31 Jan 2025 01:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738288791; cv=none; b=juikR5O91Ojc/yys0mg2C7RA2qcQNLlamega1CI+b6JtQigzfeenhqeIirxV5BQf0V8KjkPD16s2bMPB/VjirE7XGynZbEBBhQGGU3NgaHMuGCBo0quNQEOslQ/+9WDEVZ8tocKcUAA/Oi8SjWNtopxuwjcjzYNT/onOKWzBKuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738288791; c=relaxed/simple;
	bh=ttkPbFc2Wv9fHokbTogFz0YWrMcfve3ij+zz2xbVmrw=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=flO4Bm8xkdJGdNyR935eJgEoVWXDgUL+Nxrx1kvj4j9JEmUxQdhSdBhmzUN1PEVIeLK9PnQ3JK8T+W8PVghMQaADslakDJO4eZ95otnWoKL/dEnkR7WeCdJU8ZOVSC8dh1T1xywcYzHonwJGpeNGn2IjQX9b3/l+0XuSe++bNZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5iwVe14; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE60C4CED2;
	Fri, 31 Jan 2025 01:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738288791;
	bh=ttkPbFc2Wv9fHokbTogFz0YWrMcfve3ij+zz2xbVmrw=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=H5iwVe14nxyx6zBI++eW97EiwN018DjbFvraU6u4LlUS7hTDGqqP08+9RxgonrZKr
	 cj09eb/Xto721z/XPUT6WUD4cnYNCLi9+wrZvVwpgX8apBKjSCXUmwFCkSVUr8aMI9
	 6WE9RzCdWhwgZVZAjidJl9PMkjhi8HK6/pYcx1cMU3Ng4nZp2Y9ic3coWlAIoIw8nJ
	 oy6LDxEhiz30pNfbmDWIvGDXTN58hkg5vxJnCRy/2lnH0cL2LMjjCYLSHhEfFFvbDe
	 6ARZ81swB+d+w0VtseZuA3OV4EBI2aujb8c7XDphrTvwv3ktTHnbEiCnhZtUSuFI/R
	 7DNVk7St1Jy5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAFE8380AA66;
	Fri, 31 Jan 2025 02:00:18 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 6.14
From: pr-tracker-bot@kernel.org
In-Reply-To: <2025013022485633b00737@mail.local>
References: <2025013022485633b00737@mail.local>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <2025013022485633b00737@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.14
X-PR-Tracked-Commit-Id: 97274527e8dc709bbb4c7cb44279a12d085da9ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a9f04bde07a35530d53b71628cdc950dac86eab
Message-Id: <173828881747.1145982.6283865432029782405.pr-tracker-bot@kernel.org>
Date: Fri, 31 Jan 2025 02:00:17 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 30 Jan 2025 23:48:56 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.14

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a9f04bde07a35530d53b71628cdc950dac86eab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

