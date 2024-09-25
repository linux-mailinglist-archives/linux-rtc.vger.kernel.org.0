Return-Path: <linux-rtc+bounces-2061-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 821C2986910
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Sep 2024 00:07:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A94B01C2487E
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Sep 2024 22:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35ED0146A93;
	Wed, 25 Sep 2024 22:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WOLl0L+n"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFBE1D5AD5;
	Wed, 25 Sep 2024 22:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727302065; cv=none; b=F7dhgo8Ct7tbGZaH4FLtLEc6clptqcSHTJyvath6+5YXdpjAQFrgfSd6tOTvne1LekdwwnJ+7JTlJblbGfYt+Pl99ivvDrg3t1cFeJb2XjAbDGmPd21G5Xe/Q9zl+cw2zVbJW622uSk8fWrGB0aalUo7lsGELFDODIiPDsMo4yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727302065; c=relaxed/simple;
	bh=6ZUJOIpfa15drcnzyKntRBk7+eLy4LEq+voBAoNZxGQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=SMQZ4XoU+6hcGbneh3KF7YwS6GcLt1Iol1cv30WDuf0y1p/i+LtlOFkV60x91avfpDIt5h8e+jC/XZM5SvCisivzhuyQhvFjUXNtzvmoV9B3qM+LroMLf4YEW0FOD/i2048MKTVCgd+/sTEiGk34hI0ijCUudQFxYzRlV6lGkxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WOLl0L+n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84B52C4CEC3;
	Wed, 25 Sep 2024 22:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727302064;
	bh=6ZUJOIpfa15drcnzyKntRBk7+eLy4LEq+voBAoNZxGQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=WOLl0L+nuhudKQgeUYWVd/ySEh5yt7IcJxI3K8aBwehm5aPUTy5RPq30V8bpbFhom
	 jSH6zRgtJRz0s8TLAI8oPQ6s4GnN7wWp4xdAP4/BoomPXg9c7lGya6F3pk3/ZkuNGk
	 JBHNduYZBydRyOizZbimyZc5oq+RJbC0w8cmezTKaV/jdJrzFyGXp2HPckPuY68eFy
	 brjlO85icNJPWtzNWjTzLXnb6m0x9Q6wSHuxRc/N/6x1Qk+jHqc9yHuMJw2aQWg905
	 7hEg+a5bKA7CRh9Nyy2F8fYfeWboAJKKBYZwdU9vBORPfPLYfjF5N7rbqqokWA/fmO
	 oXWZSfBB10CIw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3440E3809A80;
	Wed, 25 Sep 2024 22:07:48 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 6.12
From: pr-tracker-bot@kernel.org
In-Reply-To: <20240924222302cc712db4@mail.local>
References: <20240924222302cc712db4@mail.local>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20240924222302cc712db4@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.12
X-PR-Tracked-Commit-Id: 690286214916f32d75de2667ec0fcfa9c3f4eefb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b2149f948c2d60880f94a68cc784eeefe1e78b77
Message-Id: <172730206685.743114.8643371205767937432.pr-tracker-bot@kernel.org>
Date: Wed, 25 Sep 2024 22:07:46 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 25 Sep 2024 00:23:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b2149f948c2d60880f94a68cc784eeefe1e78b77

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

