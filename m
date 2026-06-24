Return-Path: <linux-rtc+bounces-6745-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id q73gFDdJPGq7mAgAu9opvQ
	(envelope-from <linux-rtc+bounces-6745-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:16:39 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A291A6C166C
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 23:16:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=1IqN3vJu;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6745-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6745-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8379304973E
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2026 21:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C213E5A30;
	Wed, 24 Jun 2026 21:15:55 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3803E5A34;
	Wed, 24 Jun 2026 21:15:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335755; cv=none; b=eQ8fKxHEWfULeA0MgLYH6T0nKKmNn8naoC+KmHGw52J5ZHjFY0dts/jaTk7ZnQTYvxF3GKLneh9Wl2iRacrM+aNKr0sI4JXFAaY6rJMZxmRXdV8+1aeGvBHx9LYljmaPqmgetJsNyV8ghtaGLkgTDd0c5yTFBzRjZvw+I6UfiWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335755; c=relaxed/simple;
	bh=z72s8fIxCDisst4GzRRp+ispJwc9yaF19tGtV/DZqn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h0ZodjiE903RpkiiEev+rUeQwan7Jji5ZjEcpDKuwo8Jg6sjHHuciufCdwvpu5H0PpTILUMkwLfJWR60O8R9gJTAa7EnIl8XCgiXF2d6zmwmR7UMMGPjIpn9uAAXBtCqho5k73M3UOwugPmP5lBi7qbPLfEYXxg5997nApeef0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1IqN3vJu; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3C93DC6B3B8;
	Wed, 24 Jun 2026 21:16:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 22AE2601C5;
	Wed, 24 Jun 2026 21:15:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9FD5B106C85A3;
	Wed, 24 Jun 2026 23:15:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782335752; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=fzEyUAkdtwsDGWDcus0Rb/IDW3je9WE2eQGLEcegO3Y=;
	b=1IqN3vJuyb0vKPDjR6RvttBzaJHyuUdItXuVk6MTrKEkqdYKb4IDWCH730jgPu66k2vCJM
	7WnZLUEHmWvXUm68RwV52L2dkTGHlTX/5UN0JdppUalyjkeJxQvLnY2ueTkRNyG1wch0Ne
	LrqA1NflR8Vg89yEXp9GVHYF2zSoPHiwuMGuP/ThMURWKcD7OurpXawK1SkMsPrgkLdLcy
	IZrguBaj34xdDRW3l1mffKUgNd0RGbzlerLVjV2oDcsewlf5wcKnGeKQHDVjvSuH7qU4X2
	WKKObQOw74wir9Ydm0rrO35atzWEcnlMGJWHihhn+ZEMO7OtytdjkEO4wizk3A==
Date: Wed, 24 Jun 2026 23:15:50 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: ryan@bluewatersys.com, akpm@linux-foundation.org,
	m.grzeschik@pengutronix.de, Denis.Osterland@diehl.com,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com, john.madieu@gmail.com
Subject: Re: (subset) [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake()
 with disable_irq_wake() on cleanup
Message-ID: <178233558810.1517260.13463842390127591656.b4-ty@b4>
References: <20260425154959.2796261-3-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260425154959.2796261-3-john.madieu.xa@bp.renesas.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6745-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:ryan@bluewatersys.com,m:akpm@linux-foundation.org,m:m.grzeschik@pengutronix.de,m:Denis.Osterland@diehl.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:john.madieu@gmail.com,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bluewatersys.com,linux-foundation.org,pengutronix.de,diehl.com,vger.kernel.org,bp.renesas.com,gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A291A6C166C

On Sat, 25 Apr 2026 15:49:59 +0000, John Madieu wrote:
> isl1208_setup_irq() calls enable_irq_wake() after a successful
> IRQ request, but the driver has no remove path that balances it.
> The driver is devm-only, so on unbind devm releases the IRQ -
> but enable_irq_wake() is not undone by IRQ release, so the wake
> count for that IRQ stays incremented.
> 
> Each rebind therefore leaks one wake reference; the leak doubles
> for the chip variant that has a separate evdet IRQ, since
> isl1208_setup_irq() is then called twice during probe.
> 
> [...]

Applied, thanks!

[2/2] rtc: isl1208: Balance enable_irq_wake() with disable_irq_wake() on cleanup
      https://git.kernel.org/abelloni/c/1afe4f19d6ad

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

