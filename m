Return-Path: <linux-rtc+bounces-4400-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8431AEEB30
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Jul 2025 02:19:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F227B7A4E39
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Jul 2025 00:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0899527462;
	Tue,  1 Jul 2025 00:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uz8pOlGh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51C5DDBC;
	Tue,  1 Jul 2025 00:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751329163; cv=none; b=uHfuwbH23VJeB5TXWKzQc/+T5r0fgCCdLaII0je11v2stRX3n4hyCHzF0dUKl7kifMxeSbsQAdUCRQycMtY+w4fQ4f0+cvUb7JhDCPue2ULT4iCqzRMNayzXhL5hCMVU7P29Jpa2n1cPLyhi6Wg91XYCJeIrID7+PyiNap/ZIws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751329163; c=relaxed/simple;
	bh=jWEwShdXm9iq5GwiXeBLHtYQU7WULYC4JfoZ0z1hKwI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=Jh4MmjpHLRAFjBVz5DMX2v61MKt1HNDRP95sELYDWAl+fMk/r2Xtb6SFxI39WWjAhiFvOqDwCR7rHWDyOEyhpd6zZPkKQ001YoRWYVlUwSfVQDXTE7JnpO2vqAjp+pSU6e/w50kfn2Y6OjIDSsdT3nRWp6Mi3/ET3OLDYT0Mjno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uz8pOlGh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29DCC4CEE3;
	Tue,  1 Jul 2025 00:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751329163;
	bh=jWEwShdXm9iq5GwiXeBLHtYQU7WULYC4JfoZ0z1hKwI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=uz8pOlGht/QY+ghW+Ej7LX9a0k5kCEV2Sq7A0+caPLwg6/6RV5WkYNDLLVsrK9Mcl
	 yZ0/qEODp2XCeB6pjUjJF1A/lSNqOZOkDZNA7cwqXdFoCSNCcOARAg2npkOyV4audR
	 XvR7Vun0RnsSQyBeJCI33bN9WgZ2jB1GyFuea5bKUyNPqwAvKFa+/Iij5aunUBCKMt
	 3NDFhVs9OtIXmbJ3AVoM+ns6P3egpnS8CJK0VAamwHW484kOLNbfm3RtROFJdmhbP/
	 0jAja5o8+R0KrPtpKCynB/f3v/nm/xEvM0Mm9cvobYgWrObXhhYuYHDC+jc8XiyHsy
	 iKYo5ATnyifMQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF56383BA00;
	Tue,  1 Jul 2025 00:19:49 +0000 (UTC)
Subject: Re: [GIT PULL] RTC fixes for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <202506292215542e5ecbab@mail.local>
References: <202506292215542e5ecbab@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202506292215542e5ecbab@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.16-fixes
X-PR-Tracked-Commit-Id: 08d82d0cad51c2b1d454fe41ea1ff96ade676961
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4b424a3f7d91c4c694a36ecb30b978e30689cdae
Message-Id: <175132918849.3616005.9623045773063422606.pr-tracker-bot@kernel.org>
Date: Tue, 01 Jul 2025 00:19:48 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Mon, 30 Jun 2025 00:15:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.16-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4b424a3f7d91c4c694a36ecb30b978e30689cdae

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

