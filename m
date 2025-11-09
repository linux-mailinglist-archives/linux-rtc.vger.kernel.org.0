Return-Path: <linux-rtc+bounces-5301-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DEAC4369F
	for <lists+linux-rtc@lfdr.de>; Sun, 09 Nov 2025 01:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 07F1B4E21A4
	for <lists+linux-rtc@lfdr.de>; Sun,  9 Nov 2025 00:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D00611E;
	Sun,  9 Nov 2025 00:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tITmx4/9"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE3022F01;
	Sun,  9 Nov 2025 00:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762646935; cv=none; b=hd9Rax5/OWYJAkWfbgNmuQNchavTgwrERmbJe1GyA/KCITPvmoH6yHz2esNEhYL0RDL8tyomDYOOU7DBQHiQ3isQHlynvCs3LXOJcm6arTVidspDEf5ghlyjWP0cqYQZmdc20znNHBKHgiCcY1Ndqmn3DwrrrE9nSoP1D4EMpfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762646935; c=relaxed/simple;
	bh=HyeDkMsF6SPNhn8tmfW4mmJyEAaJjADUzkr7cs1Q6LI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mpnqb5aBIjfdnn09Bqs3m5WIFC7H2w+doFs7gxTN6ivfPfmHt8txDPZMeBH6XDbNqV53YwC5nelHbCZT8mSG6g+FXou0wdLpAwmkc+LtWibFCLsxUq8bxflI7rqZnZcAb7Qc6s9/gRQgDzMU9vQqy9y4S6L0nZHC5dp7Or8ebu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tITmx4/9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C84FFC116C6;
	Sun,  9 Nov 2025 00:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762646934;
	bh=HyeDkMsF6SPNhn8tmfW4mmJyEAaJjADUzkr7cs1Q6LI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=tITmx4/9nv8fZO9VeijbwRvEPakSLeXyACqxIaQGCbjRjZMeenIZvTj7f5Fep77mP
	 MErtsVlI++wvNlsM85aXaoKyDw2ZWG8u6/x++QwXu0ivrcgGGrAC3QUvuHlnu3+TD2
	 s4ceU51RR6GjEkTMBmLsDNd1NkrPIqo9xHtFBM6C2jbHPRS+o7pGKZGlgxaKgWun8c
	 wBsOsK7zMlggS2Eiet5QABTka4D2Qp298gvGSJGiD1cYYrr3ofxpBgbwg0rsSKkYyP
	 3/E6GoGMYIY6S73BIC5rJCyWBbOcMSA4UXri/Nf9mpgsltAkPX/zA0dv1HyKrN4YB6
	 c9EqDXM55yV2g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD5C3A40FD8;
	Sun,  9 Nov 2025 00:08:27 +0000 (UTC)
Subject: Re: [GIT PULL] RTC fixes for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251108203908b1400ce8@mail.local>
References: <20251108203908b1400ce8@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251108203908b1400ce8@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.18-fixes
X-PR-Tracked-Commit-Id: 162f24cbb0f6ec596e7e9f3e91610d79dc805229
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 41d318c47fa2090dbca7329037e5d63abeddebdf
Message-Id: <176264690638.1423288.18113403375002676224.pr-tracker-bot@kernel.org>
Date: Sun, 09 Nov 2025 00:08:26 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 8 Nov 2025 21:39:08 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.18-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/41d318c47fa2090dbca7329037e5d63abeddebdf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

