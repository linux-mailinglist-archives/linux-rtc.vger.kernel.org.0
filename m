Return-Path: <linux-rtc+bounces-5533-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B367BCBA5AF
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Dec 2025 06:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0E7B30071AB
	for <lists+linux-rtc@lfdr.de>; Sat, 13 Dec 2025 05:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B562A253351;
	Sat, 13 Dec 2025 05:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPa6M/7U"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D41F19DF62;
	Sat, 13 Dec 2025 05:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765605197; cv=none; b=RfSMRhJiGGfZ0BnysMtWq00L9kIGq55Y/8g7tql0B7XbGbJGlsJqDXVGk/iYA7O4objr0uDE0q4Whmjz30FZwMUdnkgUKe1Vmv+Tv11be7Vz7DdJF1MY001aHdeELnCEs9yddG3saGvd75LEBoIFpwkb0O+8ZbGV1UBTKhsGRrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765605197; c=relaxed/simple;
	bh=uFfI9cCDQ+I2HyIU+keRhQxMqMlpIefbhXLnqXyIDC0=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=hnmL/Ae597FZoevi84Z9uWZ6OLIo7LD8BB7GjQjInuLxINFBrO+fNMqkd+/k5noEaFGw1LlwEdABZq+HS9L3N/fVaVNVsvHimy1BVo2quS16Q483npVpEUtAmRqa0BfR/wZsyxvKSzbhcL90RATtKSIyugCdvzvn96RL4SBKdco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPa6M/7U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD62C4CEF7;
	Sat, 13 Dec 2025 05:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765605197;
	bh=uFfI9cCDQ+I2HyIU+keRhQxMqMlpIefbhXLnqXyIDC0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=RPa6M/7US8/6ZA0rdQmAzxbx0ShNhaZb1yJ1935bBaX0JJtE/G7qXKAyHdpZkKhaQ
	 NOWYtRwQHVCynPmfEDukNQ/C20DzYhm6DZtXdfr0rDIee1ddNn3G/YXA4P5IDSyN3J
	 xWkfeGtKOemFo7HuZrE2hu48UQ06E2HmfMwVFd93ZUlvCNwBqpn4U7BOYJnX2q0iTK
	 t2Z81f3P95qzC/ooZ3cS0B6bCOd8G4Y1LsMGvPalPivg0f/XMj+c4tgNE59DiN72Jc
	 9XNrQ11kh09/E42RodyA89I1CtipMIdLEcagkmADEXAUH4mLauFC6rSaSERsxvDtA4
	 zIqQy6jBNvIaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 79F29380A954;
	Sat, 13 Dec 2025 05:50:11 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 6.19
From: pr-tracker-bot@kernel.org
In-Reply-To: <2025121222483455e77b38@mail.local>
References: <2025121222483455e77b38@mail.local>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <2025121222483455e77b38@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.19
X-PR-Tracked-Commit-Id: 16bd954c93360145bc77cc601e350913fc28182d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d324e9a91502184e0ac201293a6ec0fbe10458ed
Message-Id: <176560501001.2419555.3825683450207384427.pr-tracker-bot@kernel.org>
Date: Sat, 13 Dec 2025 05:50:10 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Fri, 12 Dec 2025 23:48:34 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d324e9a91502184e0ac201293a6ec0fbe10458ed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

