Return-Path: <linux-rtc+bounces-2647-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 460839DF2DA
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Nov 2024 20:23:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0ABB9162D06
	for <lists+linux-rtc@lfdr.de>; Sat, 30 Nov 2024 19:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0C011A76D5;
	Sat, 30 Nov 2024 19:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j8D71myq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71EF78289;
	Sat, 30 Nov 2024 19:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732994583; cv=none; b=GcV49pBEZpOpqS7CPmmaNwzf25POzMuPQE/dlxaq7a2lu4i4sys62cXML5Nezsxn099HYfMDH1p7IlrrbpUVW3JcmpSQ1VOhhPRcrHUEUAjexwe0T2S8p1GBwfCaL1aAQtPlaKMbpp4ydWlWz+Y4I7uUKe7TxZbNDW5jr5+nAQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732994583; c=relaxed/simple;
	bh=VQIPNdwq6uhx/vJAkaXu8nvLcWxqacdw9hn7adRV6BA=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=FhcfGVq7Z9WbI7M2nSEJIBNYWFEr+8vHLRLA3bpibEZ8nHgTfBbijzzeoZgeDUWc+f79KeS/BA0rYP2Xi0H+XZxu9LFG7eyFh5/gEmFf/EgXMj9Kpd+dnthY32FuLshEMjhZ6qeFZ9bmhkI0u3bbhR82VE201Zmz8dGgb5jFAVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j8D71myq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 419D8C4CECC;
	Sat, 30 Nov 2024 19:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732994583;
	bh=VQIPNdwq6uhx/vJAkaXu8nvLcWxqacdw9hn7adRV6BA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=j8D71myqCdtrexPFe1bB1skY+XTpY5RpWNbcOi/8Bg9Cnm4vbPLZAh8/mVUFzHqa7
	 Xjyphn5+Eady4tApnMTq1k9lDjVNkVw6M3FeVzNNm046gCXSIrD/u/9SuEEJZ+sLNW
	 YDmzmVQsIw/jsHx7lZuN5rI4HHDs1n0FH8GSONfmQEU2Pmo886+1YQm+IaOP699ww7
	 yb7pVqoN114iRasi7U2ybaB3rN+kkf7ucgTHjCCb41fOUTvCw5aGAVj7ga+5jh/nm/
	 DeJR+1B2JFI4dWZRsoMPFgHalpEudM62qrG5KkDa/G5ClmvOklxNTGbb/H2NmffIbt
	 iHuDgb2mBYf+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F82380A944;
	Sat, 30 Nov 2024 19:23:18 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 6.13
From: pr-tracker-bot@kernel.org
In-Reply-To: <2024112921065012cef1c8@mail.local>
References: <2024112921065012cef1c8@mail.local>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <2024112921065012cef1c8@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.13
X-PR-Tracked-Commit-Id: e0779a0dcf41a6452ac0a169cd96863feb5787c7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0e287d31b62bb53ad81d5e59778384a40f8b6f56
Message-Id: <173299459691.2461771.13084725320069309331.pr-tracker-bot@kernel.org>
Date: Sat, 30 Nov 2024 19:23:16 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 29 Nov 2024 22:06:50 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.13

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0e287d31b62bb53ad81d5e59778384a40f8b6f56

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

