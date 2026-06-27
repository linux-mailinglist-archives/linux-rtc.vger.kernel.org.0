Return-Path: <linux-rtc+bounces-6769-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7t5AFgA9QGrxdwkAu9opvQ
	(envelope-from <linux-rtc+bounces-6769-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 27 Jun 2026 23:13:36 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 422866D2AC6
	for <lists+linux-rtc@lfdr.de>; Sat, 27 Jun 2026 23:13:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=HoasTjhd;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6769-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6769-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C98F2300A583
	for <lists+linux-rtc@lfdr.de>; Sat, 27 Jun 2026 21:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2CB37F8AD;
	Sat, 27 Jun 2026 21:13:19 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953F937FF53;
	Sat, 27 Jun 2026 21:13:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782594799; cv=none; b=DkdyPMAbhKUyPdDKKSBBdEo0fjI5mFsymR/xmuyVXsiVhSNYoThTHhQGTmn+CL2wsIMHscSftOGvTpm5qLck9uuFaefat/gwsTVo/l18JEj6pooyTJbvlINEt85PFmZv5mxDjKnKgFmq32ovIGaEUQfS9uajSv5HyMiPFMA19R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782594799; c=relaxed/simple;
	bh=8048SI3nKxrMwc+0fNNgVXPkGZBuXpupulLxgwnn7HM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=R4nLJTPHtYkt0Ois33IpOMKekXZ5bvtCAAy0JrN4BwvnqDz1vARRag3ak7jRYAGCe1WAr1oAzqHvqQT3u80R3QjnVKi6sgKIvjbdnOTsRF3JB4AMwJkXMy10e+VGKfZqXXmutwShOjKK1KVYP1yzo8z9tXWHmd5EM4V1+dcN6GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HoasTjhd; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4A31F000E9;
	Sat, 27 Jun 2026 21:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782594798;
	bh=5XsPvFFb3/WokPxnq6tWYJPkmad/O6mtyRdok2UMGj0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=HoasTjhdwKvLMH7vH3o0+ubnkIDqc7OfbivPyitVFOzavY5Nd2S7hwxgR1/fdqOz1
	 h++TEe3z9akAdQDZuTCZOOH5OzxISTJP4SHMWtcgOZA0DYBm9affdpgYuZDm3sfC9q
	 5Aq9HvlXSCgYlrFh5rcVdpi0qxj3+AvqBNYhwGTvv8Jxm0e2rJSMBwLc++u2idq6h6
	 ocTK3BJo887kq3Jv76OgQKdRKHxC18KvNgjrb05EDrbRZEv7Ii66tST1TX5rRPGpQ/
	 MObLpJujiL3scqShylO/hxZY6am9iCvxcgRtw61fXTd0TlrWDdQo0+7v/aWAttm+gm
	 PqAyRVKeuG8fg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93B713938452;
	Sat, 27 Jun 2026 21:13:05 +0000 (UTC)
Subject: Re: [GIT PULL] RTC for 7.2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20260626220226c3609b27@mail.local>
References: <20260626220226c3609b27@mail.local>
X-PR-Tracked-List-Id: <linux-rtc.vger.kernel.org>
X-PR-Tracked-Message-Id: <20260626220226c3609b27@mail.local>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-7.2
X-PR-Tracked-Commit-Id: 3c8f28578a0d68bc7fb91d881b832d55f734270c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: da7ca04e331e3e83f661e29c30d381a91e6ca245
Message-Id: <178259478421.1431938.7234379663395881763.pr-tracker-bot@kernel.org>
Date: Sat, 27 Jun 2026 21:13:04 +0000
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6769-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:torvalds@linux-foundation.org,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[pr-tracker-bot@kernel.org,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pr-tracker-bot@kernel.org,linux-rtc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 422866D2AC6

The pull request you sent on Sat, 27 Jun 2026 00:02:26 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-7.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/da7ca04e331e3e83f661e29c30d381a91e6ca245

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

