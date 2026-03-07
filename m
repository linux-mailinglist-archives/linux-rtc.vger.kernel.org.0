Return-Path: <linux-rtc+bounces-6149-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJ33FNZsq2kodAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6149-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 07 Mar 2026 01:09:58 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16065228EA7
	for <lists+linux-rtc@lfdr.de>; Sat, 07 Mar 2026 01:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9A52D302C334
	for <lists+linux-rtc@lfdr.de>; Sat,  7 Mar 2026 00:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1EAA188596;
	Sat,  7 Mar 2026 00:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ujM/C0iu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F5B13C8E8
	for <linux-rtc@vger.kernel.org>; Sat,  7 Mar 2026 00:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772842187; cv=none; b=k4O7uvobz8XL7comNEczgRRV47VL1iR8k1r/lQg2nxD+BfEYM4Y6LcCk0tf1w3vAh5+f6wUtqbj3kvgEf9II1ThxzBpaoLT3VkRr0uxlbxCk4Y8Jv9i5qakNSEZDlttL5R2vGT/3qvTvkAdArd4JlgjKsRSjft3FdPWLF8Opvrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772842187; c=relaxed/simple;
	bh=Xod5TDatpNosX+9dF6j3RGrf8F9ANdZwsWtNdwJuEPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e0teVNNiya2XX1+ieqpaNd8qsvI+mDVDr3mJt5BgIrsjLWETcyva//x+3UhgdIHQSeQb/YwW/6cY893GedcBV1r2tLHw92vTB5a3NnMoNDo5odp1NyUTi+pUO7zfJl0tozCzBh/zuKKvB+ow5RgCEYfYq49O9xNObyfYMHUlYjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ujM/C0iu; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 43ACDC4043D
	for <linux-rtc@vger.kernel.org>; Sat,  7 Mar 2026 00:10:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE68F5FF92;
	Sat,  7 Mar 2026 00:09:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B82CC102F0D91;
	Sat,  7 Mar 2026 01:09:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772842182; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=C8rLGybudffOtHeoP9RDP82rOfmMQgZBlyUmz5V3v6Q=;
	b=ujM/C0iupxOzfvG4KWhYPGkUW0Y5TaI+a03hVTj2qH4falN0idH/7CO8Q6jo5hyTSq9lCB
	YKIKdobmR1V9x115fHEpjWc1k6fa/2sImLguVy/ldAuxdBQwKQJcEfbmf+ZK73P4mQgv/j
	+ifogFXtVFz1vYonWrA7X5S7RbHw+yJfbYwORgpOF06IgzM0qKcYgBHP6bWGztOEhjYDC+
	a7l8Zj44MN+3Ku5hahu1KB+l+dXboUaVTt/ul2XdldAMeUyKU3eDLR5oFAEbBkBTX80tKI
	yQrFJNZlZXYDIdECJwr6GUXgTXA4FhJ186i15y8vdXGVjxruLrtbSOLHoui1sQ==
Date: Sat, 7 Mar 2026 01:09:39 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Remove use of i2c_match_id in RTC
Message-ID: <202603070009395a8a4173@mail.local>
References: <20260305193545.796294-1-afd@ti.com>
 <20260305230725ffa875be@mail.local>
 <5c4c2470-70ee-4dd4-b769-9f26206145d4@ti.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c4c2470-70ee-4dd4-b769-9f26206145d4@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 16065228EA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6149-lists,linux-rtc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,bootlin.com:dkim,bootlin.com:url,mail.local:mid]
X-Rspamd-Action: no action

On 06/03/2026 09:01:00-0600, Andrew Davis wrote:
> On 3/5/26 5:07 PM, Alexandre Belloni wrote:
> > On 05/03/2026 13:35:39-0600, Andrew Davis wrote:
> > > Hello all,
> > > 
> > > RTC subsystem is one of the last still using i2c_match_id().
> > > This is a v2 but nothing is changed from last time. If I'm
> > > not sending this to the right folks let me know.
> > 
> > Do you mean that you intend to remove i2c_match_id from the kernel?
> > 
> 
> Yes, once I remove all users in the various subsystems (like RTC),
> I'll remove it from the I2C headers.
> 
> It should be replaced with functions like i2c_get_match_data()
> for reasons given in the commit messages.

Ok, this should have been made clear in the original cover letter, the
series would have looked a bit less like unnecessary churn.

> 
> Andrew
> 
> > > 
> > > Thanks,
> > > Andrew
> > > 
> > > Andrew Davis (6):
> > >    rtc: abx80x: Remove use of i2c_match_id()
> > >    rtc: m41t80: Remove use of i2c_match_id()
> > >    rtc: pcf2127: Remove use of i2c_match_id()
> > >    rtc: rs5c372: Remove use of i2c_match_id()
> > >    rtc: rv8803: Remove use of i2c_match_id()
> > >    rtc: rx8025: Remove use of i2c_match_id()
> > > 
> > >   drivers/rtc/rtc-abx80x.c  |  3 +--
> > >   drivers/rtc/rtc-m41t80.c  |  8 +-------
> > >   drivers/rtc/rtc-pcf2127.c | 23 +++++++----------------
> > >   drivers/rtc/rtc-rs5c372.c |  7 +------
> > >   drivers/rtc/rtc-rv8803.c  |  8 +-------
> > >   drivers/rtc/rtc-rx8025.c  |  4 +---
> > >   6 files changed, 12 insertions(+), 41 deletions(-)
> > > 
> > > -- 
> > > 2.39.2
> > > 
> > 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

