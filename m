Return-Path: <linux-rtc+bounces-4233-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B67A5ACF3D8
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Jun 2025 18:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0991189BD79
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Jun 2025 16:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1802127511F;
	Thu,  5 Jun 2025 16:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlwqAWW8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DE5275112;
	Thu,  5 Jun 2025 16:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139886; cv=none; b=nDf7jlfIybvRNN56QUohWG5qY+ypCkK/VHJxEPiBHqGfw1LYnd5VP+6ybSRpTSGxBPElXvM8OKiMs459IVfSLdVJFM8XmufvX4lspbPIQWNMFe4S/GFNR80AA+fkdwnX8ArYFojiokOPOi0YzZweINQtFlARHRiFc+5MDO22jy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139886; c=relaxed/simple;
	bh=Ci+fU/H4NKaeRb7pQ43BuFkwZQO7xKVljkFIjr9AJmQ=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=mDFaE+l7CRoF3XUA5CndgLOnigph50gWegrBjc7t+UqUs3bMuDIWZE7I1U28BAnvFyIB0Rg9dn/qTpbQYtOzJwWRZ51zM4vizfUFBca264+HSW3ealAEdH0UKjYNrN0QZ1X3pPwTsqeNL4COMaul/pZzih+NlF9/Mj2gUAnf/Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlwqAWW8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3ADCC4CEEB;
	Thu,  5 Jun 2025 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749139885;
	bh=Ci+fU/H4NKaeRb7pQ43BuFkwZQO7xKVljkFIjr9AJmQ=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=rlwqAWW8I+E68KoYqJo7iOdvMFo+hoYto1sUbTybGqdjnoS2MeAvCkGYOfNlTcBNi
	 0q3Y8lq4rvMb9wGl8KCNzdQpE8WQYOuTYwJ1lM3WZjUeoqQ1URccUVRJaazE+JYKIP
	 uIjsdL7lRhd2/wXMPi4tahVzDGYPY/f8VDReWuPa3e+ns7+iLk+40JIKryL2WrawC/
	 7s/ICPwNw8UjhOudVCgJP4tBK05S3PDljG4dDRYRffWUWwrJh5anaFjI1IhhsFfzpy
	 jGu0fv96sl7A0nOzwQ4WSJU59abjvVYc4fO3TTox+psSLBzTlIyPTdzZ2XHpU4QS6x
	 n7iBgQ+3Zracw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD4338111D9;
	Thu,  5 Jun 2025 16:11:58 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 6.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <202506050924004af15615@mail.local>
References: <202506050924004af15615@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <202506050924004af15615@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.16
X-PR-Tracked-Commit-Id: 3d8b44b104fb5f93a853ae34fbcf8d840e4482f5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7fdaba912981e6fe7585517ccf3b5da59e17592e
Message-Id: <174913991767.3131347.4183833672669594858.pr-tracker-bot@kernel.org>
Date: Thu, 05 Jun 2025 16:11:57 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>

The pull request you sent on Thu, 5 Jun 2025 11:24:00 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-6.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7fdaba912981e6fe7585517ccf3b5da59e17592e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

