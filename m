Return-Path: <linux-rtc+bounces-1212-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 273F08CF164
	for <lists+linux-rtc@lfdr.de>; Sat, 25 May 2024 23:08:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1618B20FBB
	for <lists+linux-rtc@lfdr.de>; Sat, 25 May 2024 21:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702F8127E05;
	Sat, 25 May 2024 21:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nitjBBxM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E5D12A157;
	Sat, 25 May 2024 21:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716671315; cv=none; b=OHUQmLFz53OL09PU/8MgfW+YqMtSYinEp3/PHHr/4Mf3ij68j6z7+0yn06jefQdJ51WaLKhoDsfTCGg4cTDKWohtyqZ0B/odzcbGEK1Nq5g5ZSp5RLv4W0B23d4h2zUePIejmLxqKZBQUz/dDi1PESH4IzHoGF7IP5hpKr5BGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716671315; c=relaxed/simple;
	bh=UpDXTwEfJaD6gbxdu9GvjjH6juGxuExU0YLhotloi/w=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=p1oKF162yo1yRCEkb7xmEcZgWfuUg7yka6Xik0jn+jwHOkUe/dkbOj41umKHQllaQ1OrfjEUe9MoeCCNbdGjohZu6MuLuSc5BoaP/hhhm0BCUX2IDb5vli8Orve9JCPh8P6AnEdT+3wMMd6swCQNaIZmOqhoau+25qOZTqj/9q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nitjBBxM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22A2AC32782;
	Sat, 25 May 2024 21:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716671315;
	bh=UpDXTwEfJaD6gbxdu9GvjjH6juGxuExU0YLhotloi/w=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nitjBBxM8LzzKExQjQuYMwEVm6VdqGmUm+XJ9/PbDpYH9PW/yxa3lwjam9laeS4E0
	 rJkjmlVrZE0G1WMsxaiRU4NOs94vjwfynVKVuG4MBKDQveAwYGej3XvX+hnbiv6QRc
	 qaffeEKjA5viM6FD3VVnH4GeO2MlKfa2+oOVSZhbpiMzkfjX3R5HW4sNuBH9hD7NlA
	 GX52NelybwOBrHMChgLVnK8Y6bo8l5s2Z3NedO/UByF8BexiwpKXx0pIgQ/7utsOCa
	 hGJFa6MtyGaq7M6v+dqlnQnjDN6JkGkDyvS8cNZhNn3/Rauq1F2B0FFNOg9EMsk01g
	 zwXYfFm+52+hA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1A4E8C43333;
	Sat, 25 May 2024 21:08:35 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 6.10
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240525080509a438f063@mail.local>
References: <20240525080509a438f063@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240525080509a438f063@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.10
X-PR-Tracked-Commit-Id: 4c9a91b94c126d6585fbf185807b26dca5166209
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 54f71b0369c9d8dcf23c13ddab2a097115c5f572
Message-Id: <171667131510.10959.9071937379968580362.pr-tracker-bot@kernel.org>
Date: Sat, 25 May 2024 21:08:35 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 25 May 2024 10:05:09 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/54f71b0369c9d8dcf23c13ddab2a097115c5f572

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

