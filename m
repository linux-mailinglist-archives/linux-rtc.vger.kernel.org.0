Return-Path: <linux-rtc+bounces-3769-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECF5A7B255
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Apr 2025 01:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 567731884290
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Apr 2025 23:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1898188A3A;
	Thu,  3 Apr 2025 23:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7bD9qz6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0A915575C;
	Thu,  3 Apr 2025 23:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743722224; cv=none; b=tjsNAZBj3geUZ87wFRPy2eA24BrtVweRpMOQk+OMv+GZvRSwLHCxpdFtx8rJB6SF1kzmu0+8QqoD3K/RPQgvNViPdvDzy6uVZ6LCv1mhTTAGJMcj6mQsBPL/dAihQSj2QyobkwJHGw/mwUgsBuK1ga5o5TphDrJmm1EAzhK399c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743722224; c=relaxed/simple;
	bh=pfUsOMue1np+czJzowxP/O6wNRheorBpIAMsJU63PR8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=O0wpYcmL+owiSG2LXZU2bK6dUh6awpO+ArZkMiKGDxHTbWcmARhJe70b0hb3kzCwzE9d7ObhtoGDEF3ru23V0q9ue/0eRBv5k5npItFLC21V3TrcIkYDV0lsvr0Iy2rWEij5TNsQPE3UKzjC5Sqfp7HfsKld7NLQOmp7wU+Wuy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7bD9qz6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B118C4CEE3;
	Thu,  3 Apr 2025 23:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743722224;
	bh=pfUsOMue1np+czJzowxP/O6wNRheorBpIAMsJU63PR8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=X7bD9qz6xXMPB4JbMZHc3eSb13Sua5RWsm0jNYm9+FqRmpAWKvb9Ryn9yxGk1Ui0Y
	 sdTiDYLvs0NFg0TBGYsLIYJQITINXrqD4QiEETI6fF2AZL6aO8nG5K3Ocgve4a/RM3
	 gLMrSpfQCd1eDKuaSB8E+yF57Pp910hGS/fsSe3oz+1Kr+hrmRbwLlyLitD8Cjxl5u
	 aajuGhSAVdNtD5xDcdWVW1L9bWY38hWHuUD4JSSL8z6mNrwED7l9HxP6SxDHWBHN9x
	 YF/VK8qdiZuDxZPOBHbYhKfXPRTZGx1jc/36dtne04Kidyifgab0UvSboLBej8/RG6
	 2WxCuoAWnghwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE02380664C;
	Thu,  3 Apr 2025 23:17:42 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 6.15
From: pr-tracker-bot@kernel.org
In-Reply-To: <2025040223045505660f22@mail.local>
References: <2025040223045505660f22@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <2025040223045505660f22@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.15
X-PR-Tracked-Commit-Id: 424dfcd441f035769890e6d1faec2081458627b9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5916a6fbc0a5ccff977f56ca86af3d2750fb1cce
Message-Id: <174372226126.2716716.7367513915987469635.pr-tracker-bot@kernel.org>
Date: Thu, 03 Apr 2025 23:17:41 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 3 Apr 2025 01:04:55 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.15

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5916a6fbc0a5ccff977f56ca86af3d2750fb1cce

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

