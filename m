Return-Path: <linux-rtc+bounces-1563-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 276A1938690
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jul 2024 00:53:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C57D81F21291
	for <lists+linux-rtc@lfdr.de>; Sun, 21 Jul 2024 22:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D3F10A1F;
	Sun, 21 Jul 2024 22:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nM25YPlT"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC7D101DE;
	Sun, 21 Jul 2024 22:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721602425; cv=none; b=r7BwGrMd7ZbEcg+Xs2cepfUFHr212280oCf3Z3bKmi86CAk+ZlmArExNuUmC5yDcvR7zodrrJiALmp32qxV57Khy/5zC/eZhP71qIev9PTqxvUsmEtkrrFUI4ad2tuGVM6fFriz7hStWVVsnN0nzR2Fs55Ga9ZVtToDVLhFd5XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721602425; c=relaxed/simple;
	bh=mKXTGl2mJp7Q8+U4jE972bAfDltqiUKVlYb3GJnF3S8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kikCi2V2qfnGvsjF6Jw67oN8Ms10aW9qqMP8kS1/tHEjAKhk5zFn3nSK6SZbF9zulEE7HF0V9SnfoeAmERPwtx0RFgC5fUjaMBDD0pR2ebIuDLeVksf//LsaDVWV7Wd6QRrA2brK1FuDbHVcfTvhyjS5hq6EpjWr0eqIqeOgxNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nM25YPlT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7A46C4AF0B;
	Sun, 21 Jul 2024 22:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721602425;
	bh=mKXTGl2mJp7Q8+U4jE972bAfDltqiUKVlYb3GJnF3S8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=nM25YPlTTxldBxaYVcO2wQb6XzZXJ8BsKsq55EBe+i4HYcnOj/nK54qoYvq/p6iDZ
	 eTI8Jx2VRQBym+4pv350jQ7WsVy8NPF/130D3Wx1mcejOsxZFWoMwDZMQrcQfbgXbq
	 vRSs6uUziE1hPGviWq9khku7iAaeZy1xkqtGMdNyCrS1XHkLZvo8BWWHHqjdCrmYfK
	 g5O+R+0YzbFoMFa5B257uT4xlnTKILPE2VydMNy/bMUnfefz8r3Cx/YnR9epoINJLd
	 rIuXosPOyih4IMCKj2YjjEGDLH4FPGuVJ5LoLrQTyYQoaSOULU28RxkvgNuUc0+QZ/
	 uik4uxGRpbKzg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A019BC4332E;
	Sun, 21 Jul 2024 22:53:45 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 6.11
From: pr-tracker-bot@kernel.org
In-Reply-To: <2024072121574018084eea@mail.local>
References: <2024072121574018084eea@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2024072121574018084eea@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.11
X-PR-Tracked-Commit-Id: efa9c5be2caecae7dfa4f29c6ab3d4a2f341eb15
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7846b618e0a4c3e08888099d1d4512722b39ca99
Message-Id: <172160242565.10014.15854187125150289261.pr-tracker-bot@kernel.org>
Date: Sun, 21 Jul 2024 22:53:45 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Sun, 21 Jul 2024 23:57:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7846b618e0a4c3e08888099d1d4512722b39ca99

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

