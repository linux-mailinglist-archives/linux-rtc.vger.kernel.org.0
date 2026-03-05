Return-Path: <linux-rtc+bounces-6127-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPGyKbcMqmlbKQEAu9opvQ
	(envelope-from <linux-rtc+bounces-6127-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 00:07:35 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 078FA2192B5
	for <lists+linux-rtc@lfdr.de>; Fri, 06 Mar 2026 00:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A31EB30179FB
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2026 23:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5233644C5;
	Thu,  5 Mar 2026 23:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bLDW86XK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C9D36404B;
	Thu,  5 Mar 2026 23:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772752052; cv=none; b=VsmgVfuZ72Ce00FOChx2Zdsals4AhCLOJnIK6uZFGQ7NJg03vvZNSIv6T20r1sRgCeGlUDHAdbNlJY2eYoFA8U2Xe1fG6u8KJslD2teHYvfEJJ+5FD51XXgJ4TnsYq2cI4zAKkuMvHq0BdK9LJYvSDSVDGgcNRIrkncS8E17SHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772752052; c=relaxed/simple;
	bh=hKbxfzR3g19NUf0iNW0vaKFhXXxTnOUfH+C+HwVz3pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D0hTonfYG2cRwaw2+5a/04Jtegrkw2xzcZfo270vXp3CRP+CE1T6NYwV5611fAw3MJyPdKQOyn5i9ftZWzfuPmBVt+1FFshWylcIIB8F8ela4LkGw9fED6oDySiizMn1Ks22p8EvrsaKFIhuBhEM5/hFr3FPYfWrKmYRsfFEBAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bLDW86XK; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE29C4E4257D;
	Thu,  5 Mar 2026 23:07:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 922FC5FF89;
	Thu,  5 Mar 2026 23:07:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 57C3010368096;
	Fri,  6 Mar 2026 00:07:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772752046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=yvUW7ZKj8JcJsqFr8uhSmGWs6QOKx2QIKHu+jh1UmtY=;
	b=bLDW86XKjnGpleNZSVFBSBE/XxaFfoSJm7Qa9dYdZv8oJhyLDjUVZw8JhxlRQtORasZfUW
	Zglb+JbmoS7HGWOu+aJ3G4ob4+dwrhcrFQtFX1vV1tQU54vohYrsMRiLXBAPoPf/W+14K7
	Nl0tXHUEmfn2sec6D2OW9qBUD3qoRFhiZrA9n4ol7B8yVEUFNBfssh0GCTycE7B4hLThkT
	8biVop3rw6Me8mJo43p3mStrV/7pTkJ+ce1hbmpTnu52vt5elbPQslB7U7E+1z0Ucq56sM
	pvEJVPaGzQDpIDS9heraD84S9e9979b1IL8UVThsRUxt7WczraXLYAvpsgy1ZA==
Date: Fri, 6 Mar 2026 00:07:25 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Andrew Davis <afd@ti.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/6] Remove use of i2c_match_id in RTC
Message-ID: <20260305230725ffa875be@mail.local>
References: <20260305193545.796294-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305193545.796294-1-afd@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 078FA2192B5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6127-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.local:mid]
X-Rspamd-Action: no action

On 05/03/2026 13:35:39-0600, Andrew Davis wrote:
> Hello all,
> 
> RTC subsystem is one of the last still using i2c_match_id().
> This is a v2 but nothing is changed from last time. If I'm
> not sending this to the right folks let me know.

Do you mean that you intend to remove i2c_match_id from the kernel?

> 
> Thanks,
> Andrew
> 
> Andrew Davis (6):
>   rtc: abx80x: Remove use of i2c_match_id()
>   rtc: m41t80: Remove use of i2c_match_id()
>   rtc: pcf2127: Remove use of i2c_match_id()
>   rtc: rs5c372: Remove use of i2c_match_id()
>   rtc: rv8803: Remove use of i2c_match_id()
>   rtc: rx8025: Remove use of i2c_match_id()
> 
>  drivers/rtc/rtc-abx80x.c  |  3 +--
>  drivers/rtc/rtc-m41t80.c  |  8 +-------
>  drivers/rtc/rtc-pcf2127.c | 23 +++++++----------------
>  drivers/rtc/rtc-rs5c372.c |  7 +------
>  drivers/rtc/rtc-rv8803.c  |  8 +-------
>  drivers/rtc/rtc-rx8025.c  |  4 +---
>  6 files changed, 12 insertions(+), 41 deletions(-)
> 
> -- 
> 2.39.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

