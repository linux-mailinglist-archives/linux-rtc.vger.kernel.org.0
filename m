Return-Path: <linux-rtc+bounces-5088-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87586BCFB4D
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Oct 2025 21:08:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 93D6C4E9124
	for <lists+linux-rtc@lfdr.de>; Sat, 11 Oct 2025 19:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B741E28466E;
	Sat, 11 Oct 2025 19:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqOgk0D7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5BB283FFB;
	Sat, 11 Oct 2025 19:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760209702; cv=none; b=C26HnjF2jRZpns61WRAMx830/PhANKoplp+NXRkzOLcetA1CMaxtWIbmsgFeyRlOp4yG57CVzX00E7wydunxlUaOmiRbR1vriwsmBxDYYZw5n/jB5dtaBCWN5xBhWDYa81/t/r4tXGI0RfBMJKVKR6dd6mHAxRJyjaai4c2HWbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760209702; c=relaxed/simple;
	bh=XDSw0bZjm4wxB4PceEWxdRZ5cbt7pxcZl+DhMlyWrik=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=quG/TX5MdC7RXrkyt3DGnU9sviXKaSrZDGdK2HqZ+AbmCGSeRnRHLtWtjmcTn8URXZdXa47ov1jjDovfqxloBwmlOresXLfZ4qcOgUHeVthlHSzH77Pyyuazse/RQH/XSmje5kUm6m27p6GAOZJtS7l2bFSHMZ3Hy8hNHlNpDDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqOgk0D7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17838C113D0;
	Sat, 11 Oct 2025 19:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760209702;
	bh=XDSw0bZjm4wxB4PceEWxdRZ5cbt7pxcZl+DhMlyWrik=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=eqOgk0D7civOy5MzlOWYLoeDuoRZRyXjaCxcFMzl4DzSMHSb2OC+jKsgJcUI9CT3j
	 x+95d3a6Os0WxFmKM9T6Va6bmCUO9+HyU1KivLaqJQ6Me1f2ZgxXN53GDJhrU4u7fc
	 m6X0Z6krbGfyOD9eFCl2rr5Tl5m5iI2LQS5jki7xzG4syYJMBVePhSuBmUWV3hVBmS
	 dRwWXhruR1Uxw1/IBvGaruUJb7R/qm1pt/TTiR5y6CzR8LqVTYFFXPIWqI8/D9mpCS
	 GutJplPC+j9+/Nba1ptJSN0gCQhZmsQPRdhr2estPdFk6MTyxTkLRWO+lh93PgWGCh
	 OsiHB0pfQMmvQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33CF43809A18;
	Sat, 11 Oct 2025 19:08:10 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 6.18
From: pr-tracker-bot@kernel.org
In-Reply-To: <20251011162009a4f6040d@mail.local>
References: <20251011162009a4f6040d@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20251011162009a4f6040d@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.18
X-PR-Tracked-Commit-Id: 9db26d5855d0374d4652487bfb5aacf40821c469
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 98906f9d850e4882004749eccb8920649dc98456
Message-Id: <176020968883.1431021.14213406223567330950.pr-tracker-bot@kernel.org>
Date: Sat, 11 Oct 2025 19:08:08 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Sat, 11 Oct 2025 18:20:09 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.18

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/98906f9d850e4882004749eccb8920649dc98456

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

