Return-Path: <linux-rtc+bounces-6427-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMmvHzlp7mkxtgAAu9opvQ
	(envelope-from <linux-rtc+bounces-6427-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Apr 2026 21:36:25 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A6C46AF13
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Apr 2026 21:36:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C7A6300A7FF
	for <lists+linux-rtc@lfdr.de>; Sun, 26 Apr 2026 19:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0621C38F654;
	Sun, 26 Apr 2026 19:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6+YQTlP"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D792038F64F;
	Sun, 26 Apr 2026 19:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777232176; cv=none; b=T9GkNo+VwDJpanhgvkKCJxjf1uzLcGK6bCFddXRINGmNwszyY0xITeuiM2pD83WjTP77Vrnny2l7CbwJHaR8NTVTi1WaV6IyBO4x4q/CNddxWzfxbFJVKlCouiR8X22b4mDIlSCRmL5g+p07g/aAeZNeXti3s3v+6TRYacI2PLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777232176; c=relaxed/simple;
	bh=QgBC3+kLYrgdwv1LM78/yRljcSmsEfQByQlrOYxgs6k=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=J30WvOx/u9okm6SdqFTktymHGur3RwOTAAhAED28zOH/FWFtkibKVGEZxX8Ju+LuwvIG5cdZjqEnt81yU9VEWQ/pBw8SQ32sYgJEAQ3GtwtyTZqaxC/sxErYfQSNYj+sojCSPCPKz28mFoO+jnC+OPz+JQriOPN9RCDg/YttusI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6+YQTlP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBB63C2BCAF;
	Sun, 26 Apr 2026 19:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777232176;
	bh=QgBC3+kLYrgdwv1LM78/yRljcSmsEfQByQlrOYxgs6k=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=G6+YQTlPMCXyV1bSkuNbaBNATlUaW8IX2Y+6S406cQr26xm20sZgkyu6TEkG41VYg
	 6G3yDmL0iFcfKFSlpREtuvgbaoVGGb2OdmF2V3/CKaWFJkFB12MeboRpblvHxzrogv
	 ks3xnu381U1SY0Ci253S3n9SycR3BkIUaclridJ7yIEAOPU1NsAp63rOnrLh2RE61x
	 O7VS9Thp/ZKZkOCvqDVbJPGMDtuaYOilgOI4PNFGAy9f5j3pkKsWpVSQzVdkmVmHIj
	 bdVHerfxWJswol6arcLUpxxwi0aK98otaN8miD9F9hcBC7ZBfcjEKDg9Dx8JLMVgoP
	 NtP4njRwia+Pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEC738119E5;
	Sun, 26 Apr 2026 19:35:36 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 7.1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260425183335392f3a5c@mail.local>
References: <20260425183335392f3a5c@mail.local>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260425183335392f3a5c@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-7.1
X-PR-Tracked-Commit-Id: 0fedce7244e4b85c049ce579c87e298a1b0b811d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 211d5933141197b37a7501271e49e4b88540615f
Message-Id: <177723213496.2364874.14297237296436253618.pr-tracker-bot@kernel.org>
Date: Sun, 26 Apr 2026 19:35:34 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
X-Rspamd-Queue-Id: E9A6C46AF13
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6427-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-rtc@vger.kernel.org]

The pull request you sent on Sat, 25 Apr 2026 20:33:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-7.1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/211d5933141197b37a7501271e49e4b88540615f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

