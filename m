Return-Path: <linux-rtc+bounces-6758-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1jhTIpVRPGpbmggAu9opvQ
	(envelope-from <linux-rtc+bounces-6758-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:52:21 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD11E6C19CE
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:52:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=i54hbXub;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6758-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6758-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E77E3016931
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 21:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554FA1A5B8C;
	Wed, 24 Jun 2026 21:49:58 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFC113B7AE;
	Wed, 24 Jun 2026 21:49:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782337798; cv=none; b=epafSs+jV/YZw9dCL6wwNxeXSMBJMBBLx6N+tHBnAFes9AcughTloaWanlr/1FZxxSJftpy+WrxocN7++y0unUAoUCGfYi/6yBFQJApmiThyWenHAdmibMV6i/0Q4+YX9ZB9GZx1cXu8UkokLUNRkIZSB8fCOB4nRbGByiOv9e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782337798; c=relaxed/simple;
	bh=lyidH3m81wVMeYjFd40Snzd7vXWXQ1QgCJwmfuSW/SI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hH3hCQNqEhXNnA+9BpDWskADoGLZbeo8A3ua8dJ/8ITnBXnpd9Kfiwl7flU8NYKp5dCO3rKiyrXLWmtR4d4tZ+QmA3X/j+f0RPD3e4EHjbuhb3hCG8LhfcrPzlEoZMHtYYtGi4eO1XQ21KZRy5n8oeEFPzEVxctEi1RAsGnANjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=i54hbXub; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1A8FF1A094C;
	Wed, 24 Jun 2026 21:49:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CF80F601C5;
	Wed, 24 Jun 2026 21:49:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D96E8106C8468;
	Wed, 24 Jun 2026 23:49:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782337794; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mJDgUU9/Q/g9cKV1BrFjhs3UlIU9JnXeMFn3QDWI9qw=;
	b=i54hbXubMftgm2BVJuSag1EgRoTk6S5Ex8qdV/484CTjPHr2G9uwodyZx4oeq3NgNpZw6G
	gS6RSv0Y9u8lmKkOTcWljtYtdYRDhzP4kLOW0ktMDb0QT5vFf42R9BiDeRgNnEdo/P6IdY
	5S5E5Ch26qjmaeD8Yrm2aVdIf6Enw62/5H6ps8bD+c5PYg+cpggbzUIsEeBIrV/UlpdF3e
	Jhjx7bSCFdEnWLmKfgZpZLok+V7T5dnIKM2QZQbHNXyHtOd9jnXCe175d/wNu9R+U0UKL8
	IY0A1uoVPSIlHUN+Y8LVTxANoaftrZFnIP6EFTIUGuyePSc3Y+DgR0un9N9Xmw==
Date: Wed, 24 Jun 2026 23:49:51 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: bwalle@suse.de, akpm@linux-foundation.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: cmos: unregister HPET IRQ handler on probe failure
Message-ID: <178233778048.1530713.1322036724295080047.b4-ty@b4>
References: <20260623100848.2127281-1-haoxiang_li2024@163.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260623100848.2127281-1-haoxiang_li2024@163.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bwalle@suse.de,m:akpm@linux-foundation.org,m:haoxiang_li2024@163.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[suse.de,linux-foundation.org,163.com];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6758-lists,linux-rtc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD11E6C19CE

On Tue, 23 Jun 2026 18:08:48 +0800, Haoxiang Li wrote:
> cmos_do_probe() registers cmos_interrupt() as the HPET RTC IRQ
> handler before requesting the RTC IRQ and registering the RTC
> device. If either request_irq() or devm_rtc_register_device()
> fails afterwards, the error path leaves the HPET RTC IRQ handler
> installed. This leaves a stale handler behind and make a later
> hpet_register_irq_handler() fail with -EBUSY.
> 
> [...]

Applied, thanks!

[1/1] rtc: cmos: unregister HPET IRQ handler on probe failure
      https://git.kernel.org/abelloni/c/a5bb580df018

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

