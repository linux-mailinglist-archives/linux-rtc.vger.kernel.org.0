Return-Path: <linux-rtc+bounces-6749-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 62uwAYZJPGrLmAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6749-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:17:58 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D016C169E
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:17:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=ihyhfUrD;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6749-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6749-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DE71304358E
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 21:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D883E5A30;
	Wed, 24 Jun 2026 21:16:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AB23E5EC0
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 21:16:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335788; cv=none; b=kMk0LeUYIcksvZGfZD+QYkGfJcx8JNfh8UQfewKXBiuRyTRatTVwKY7bRoDoKFzuw8M1ozrIOkMnGaa+PehH1DL3fFeTl0+SpjBJgemYOlEJ+rDRPfCnTNPMcjHcwpWaZ4C8+UE1nBPymJt6KNzy3JpOai1nGgcRjmXwVu7c0xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335788; c=relaxed/simple;
	bh=AgwBp4EJ2OJTLxSY2GuCLwHEATVqJ0yxgOOUWKgjO1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TzqJKAQPyjSYbumnRH13VPWcMjWKoyFeLVm/rioOQGG6P/SieIDFF7REa6XtVBSYR6BrGaj24x6d8RtTHYXwDPzLbw7DJzc55euFvUzu3p/zDy2uAgP2uV7Xy9DXw0chfwNL7R7YZWqOK2mXG/hYrO+WcedFp78Ry71SYTGrDas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ihyhfUrD; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7616F4E4082F
	for <linux-rtc@vger.kernel.org>; Wed, 24 Jun 2026 21:16:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43E18601C5;
	Wed, 24 Jun 2026 21:16:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94B0F106C84E1;
	Wed, 24 Jun 2026 23:16:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335785; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=vBH6xv7ZkxkHBWgfUR9uRW7RIajxlyL6Gwv9+5lzgWI=;
	b=ihyhfUrDPedUI5FP4ZV7tXSy0iuXl9nIPQP3HRjPaPi1uGIbPPtPYJSJ99R8KUDg4iTSjC
	9JXIOT+SGTF00BT7Hd7I65PkacTLr26gb7mqsMltGB/GkwlliTXYveFpfN+cd/FuJykCv5
	kVgs5c9YTAgbiErgWFIUJXF1lNDBzVe6Qs9sE5guaRkpxhnRFuo+fREx7g1IOXwuYI3pfg
	aeCkZWm6tm89HXjbhuz39OzH2ibsYDQPUnt61ok7rQzZsj20gZiAfg/gd1Kzcjz+vJ3K1L
	2DP40okNevtwFaM3biXSW2o4Q1cNRdK0UHZ3uQg2gLXtlWStXAFlZb7gMV+OBg==
Date: Wed, 24 Jun 2026 23:16:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Stepan Ionichev <sozdayvek@gmail.com>
Cc: daniel@thingy.jp, romain.perier@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: msc313: fix NULL deref in shared IRQ handler at
 probe
Message-ID: <178233558818.1517260.12796768179217211710.b4-ty@b4>
References: <20260511032703.48262-1-sozdayvek@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511032703.48262-1-sozdayvek@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6749-lists,linux-rtc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sozdayvek@gmail.com,m:daniel@thingy.jp,m:romain.perier@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:romainperier@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_CC(0.00)[thingy.jp,gmail.com,lists.infradead.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 70D016C169E

On Mon, 11 May 2026 08:27:03 +0500, Stepan Ionichev wrote:
> msc313_rtc_probe() calls devm_request_irq() with IRQF_SHARED and
> &pdev->dev as the cookie, but platform_set_drvdata() is only called
> later after the clock setup. With a shared IRQ line, another device
> on the same line can trigger the handler in that window. The
> handler does dev_get_drvdata() on the cookie, gets NULL, and
> dereferences priv->rtc_base in interrupt context.
> 
> [...]

Applied, thanks!

[1/1] rtc: msc313: fix NULL deref in shared IRQ handler at probe
      https://git.kernel.org/abelloni/c/a369f48be8de

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

