Return-Path: <linux-rtc+bounces-6424-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMxRBkUK7Wk9egAAu9opvQ
	(envelope-from <linux-rtc+bounces-6424-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 20:39:01 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA8A467667
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 20:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5486430103A3
	for <lists+linux-rtc@lfdr.de>; Sat, 25 Apr 2026 18:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3001372B2F;
	Sat, 25 Apr 2026 18:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aHMUTR9j"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3300BA3D
	for <linux-rtc@vger.kernel.org>; Sat, 25 Apr 2026 18:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777142224; cv=none; b=lkXDXGNg8ARrO7baI4azC5d8wRkSjD/MOcEGwoH1uzK7csrvb97dVydE41XIEG+co/B9spfL/gAuU5Q5RKlt+Z5M9+n7ExlSESbX1xWkHKSBSD0V+ZZnkUizYQbtPFEP/rOQhfGKTuiY4p3GxyGFgmijOqeEG8Qg9c2795bIB8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777142224; c=relaxed/simple;
	bh=yQKdyHZ4N33P3RNm526pn6iL+q/tbXSD/Pk7sz+TWJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXdsSAhKFKwVVQv/uafZf3emlK50/nN72LEp5BWC+paQFEFRTelD0zkfZjEOUA68SW6SADWbwPyfcH5Zq6/R4y1fH8s90Yg7acdGodxcqYzayK0MhxSvmYNXvfU7VLdEitf5Rav3bMmtD/geLdblFcPrbDD37IA3AmAJU38pGWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aHMUTR9j; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 40C504E42B03;
	Sat, 25 Apr 2026 18:37:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECEDB60535;
	Sat, 25 Apr 2026 18:37:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ECDC310720E6D;
	Sat, 25 Apr 2026 20:36:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777142219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ygGiL08SISsUocfLcaOaYdbsvr1yTK/YMjXbsP0CopY=;
	b=aHMUTR9jWOCNL9rYYDiyV2r/mSuiSjYjgYsp0P5fb1BPlId6+zQ1d6jbTZpT7pFZl9iU3D
	TPZ/fmSWiidJ/SjLwuu0achtf1YSIF1t9TPw2/taC2LmZTU3O2DzW0FRc6O6c5mg5tAyla
	iKq/azt1ceedjdQNjGoCw1deZ6kb4QRjv3e+nEtunOsFPhOm9OjBlbu5Up6equVad4BM4m
	h0XHuq4hoWWkxlH/kRuUZX0mrLJ+Rcepn42oeSurFKC2GlDtmXgRZx74E2dyfAIV3oyRom
	oDF4KipR3dfC5EWekaZ/8aWU6JJd5rHsa5HEQWZRDS+sxEZMhfeWCjK0gZ11cA==
Date: Sat, 25 Apr 2026 20:36:57 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>,
	"ryan@bluewatersys.com" <ryan@bluewatersys.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"m.grzeschik@pengutronix.de" <m.grzeschik@pengutronix.de>,
	"Denis.Osterland@diehl.com" <Denis.Osterland@diehl.com>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: Re: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with
 disable_irq_wake() on cleanup
Message-ID: <202604251836574d655eb1@mail.local>
References: <20260425154959.2796261-1-john.madieu.xa@bp.renesas.com>
 <20260425154959.2796261-3-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB1134607A936EAE3F7F2185D3086282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY3PR01MB1134607A936EAE3F7F2185D3086282@TY3PR01MB11346.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 9FA8A467667
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,bluewatersys.com,linux-foundation.org,pengutronix.de,diehl.com,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-6424-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ozlabs.org:url,mail.local:mid,bootlin.com:dkim,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On 25/04/2026 16:39:16+0000, Biju Das wrote:
> Hi John,
> 
> > -----Original Message-----
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > Sent: 25 April 2026 16:50
> > Subject: [PATCH 2/2] rtc: isl1208: Balance enable_irq_wake() with disable_irq_wake() on cleanup
> > 
> > isl1208_setup_irq() calls enable_irq_wake() after a successful IRQ request, but the driver has no
> > remove path that balances it.
> > The driver is devm-only, so on unbind devm releases the IRQ - but enable_irq_wake() is not undone by
> > IRQ release, so the wake count for that IRQ stays incremented.
> > 
> > Each rebind therefore leaks one wake reference; the leak doubles for the chip variant that has a
> > separate evdet IRQ, since
> > isl1208_setup_irq() is then called twice during probe.
> 
> Is removal of RTC device possible [1]?
> 
> [1]
> https://patchwork.ozlabs.org/project/rtc-linux/patch/20230922081208.26334-1-biju.das.jz@bp.renesas.com/#3195765
> 

I'd say yes if this is not the RTC that is backing alarmtimer or
alarmtimer is not compiled in the kernel.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

