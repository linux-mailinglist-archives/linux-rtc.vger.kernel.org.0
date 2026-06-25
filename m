Return-Path: <linux-rtc+bounces-6763-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XTjfFvciPWp9xggAu9opvQ
	(envelope-from <linux-rtc+bounces-6763-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 14:45:43 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A00A56C5B32
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 14:45:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=SZ7tMWO4;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6763-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6763-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AA13C3001AD2
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Jun 2026 12:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1EA3E122D;
	Thu, 25 Jun 2026 12:45:40 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B42B2E8B83
	for <linux-rtc@vger.kernel.org>; Thu, 25 Jun 2026 12:45:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782391540; cv=none; b=ArIyI6HDPqt+zr0KARoazhiUyaMAmWGbFVIEXVCU8ZzaGmTED2VZN8VprXLpSAyoj7EV6Kr90jjRkEGyS4wjeddShZdYo2dTlgOioT12R6i74oUQnHW9D+JPUR2etT//M8EKVq7ehk5gj+HklNg7v867Y2b3H942lqw33FFPFlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782391540; c=relaxed/simple;
	bh=pp1LeeYHizjSAMV0ll5CQ9cLaVleWkpFGaBKnPuxnzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pCdMr4op/m2McND4yiFMvlZ/AjujJJAcasOz/3SSSWVCdGSdfgQF1ibYfnxIi0CuSU+PcOyS6+UWcmqDj8aPBrmf2cyNKySMBgMgjLmJzZn5Za/cOt6Wox9wR5G9F+mR8HjvG2yczdckeLXoJwBQ+f889/814IEjV7hO6truOto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SZ7tMWO4; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 45181C5CD50;
	Thu, 25 Jun 2026 12:45:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DD3915FF03;
	Thu, 25 Jun 2026 12:45:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1DC93104C9531;
	Thu, 25 Jun 2026 14:45:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782391530; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=gUW52pZmbMNvlesRhM/u9t4Ei5MiqeL83Sf2qXfDVXc=;
	b=SZ7tMWO46JzYY2vF3A7inqtLOPuaAjz39buh86uQJmg3uvvk5dnov1LjZ82ztgbU0uAzLq
	kNKVHT7pdSO5ybD6PBG+PkcuXHggXIlxLAShKfhZ92lQLtPLfswRaNJNhDR6pZJvMR6m2I
	ajPjQcb90GqK0TSUBrZda7OO5l4Buz/RsV0eOsf6lG0TUx/8eg3p3Zt9gszS2RDHACAwhj
	TWE/gg3Ssq//LBRxaXm//oJv3nrEv3Iz10t6joyxioLsVlj79j5pt8+omduzjZF5DgJwaq
	sU3n1/340/8yQJBJOyYolZamp16dlo9GYNzB8ZuMgbZmBWsGQgWuh4JQd5o6dg==
Date: Thu, 25 Jun 2026 14:45:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH] rtc: ds1307: update reference to removed
 CONFIG_RTC_DRV_DS1307_HWMON
Message-ID: <178239150740.1614151.18034253114462809597.b4-ty@b4>
References: <20260610054723.261008-1-enelsonmoore@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610054723.261008-1-enelsonmoore@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6763-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-rtc@vger.kernel.org,m:enelsonmoore@gmail.com,m:hkallweit1@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A00A56C5B32

On Tue, 09 Jun 2026 22:47:22 -0700, Ethan Nelson-Moore wrote:
> The CONFIG_RTC_DRV_DS1307_HWMON macro was removed in favor of
> CONFIG_HWMON in commit 6b583a64fd1e ("rtc: ds1307: simplify hwmon
> config"), but a reference to it remained in a comment. Correct this
> reference.
> 
> Discovered while searching for CONFIG_* symbols referenced in code but
> not defined in any Kconfig file.
> 
> [...]

Applied, thanks!

[1/1] rtc: ds1307: update reference to removed CONFIG_RTC_DRV_DS1307_HWMON
      https://git.kernel.org/abelloni/c/3c8f28578a0d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

