Return-Path: <linux-rtc+bounces-6867-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id exgzFtIfRmp8KQsAu9opvQ
	(envelope-from <linux-rtc+bounces-6867-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:22:42 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 526DE6F4BE1
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:22:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=ERANWzcF;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6867-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6867-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E070C300DDC6
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ECF8426400;
	Thu,  2 Jul 2026 08:17:13 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AA74252BA
	for <linux-rtc@vger.kernel.org>; Thu,  2 Jul 2026 08:17:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782980233; cv=none; b=ehVsHXJKjecSSzd+RZLUzuatvlwF3EdqvVcNfR79RmFmTEBREK0CRJJN6Ald77lnUC9OVL574GPY0Z9nb+OVUvRH2I+8u4z+VqEcTMmFgPWawHwDz4nj0vpNczG4KT93cKpoAb2c9KjUNyBcA88PGRIrrhTNDS6Go5pNmg9O7pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782980233; c=relaxed/simple;
	bh=6XdmpY/pL+fHXGQV3gmPke5aow2UPDrA6F9fwFoc5OE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vDSmPR43QpOkK9oqrU6FO9BgCmplMp3JUilMIRMGrwGdcRXXbuY4SYiaPzvMidJfr+zCqYykRnG0AmFVtNhKI93GU98WzU7+JzEx5npmG2n0/dqa5VHUogbuidGN8naWx62FgzTh71VTweEyAORJiMyH5TJa57qtGKHsLPP+0ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ERANWzcF; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1F1CDC4FED4;
	Thu,  2 Jul 2026 08:17:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B62655FF03;
	Thu,  2 Jul 2026 08:17:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 90A3F104C96A5;
	Thu,  2 Jul 2026 10:17:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782980225; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gJc2ZXFFVkna7QBtpQqQx1joA9VijE2aSoSY4AV7Vrs=;
	b=ERANWzcFm1uj6GQ7c2DRm/HlQFI9/dQl5lNS9uP6do/bkXXYKUsaLzW7s16mpLsWOXhgV1
	gEpaCqZ/FI9OhjNAw6x14AdwKSR09BJLxabLEvPQneiA5h40NVu1QCtl4Zj4VMGA11qfZ8
	a8SRokCjPigVA2B5U3fQW4Fl8Z1xs1Pn/GvxN1FWTu/B7B3LWjqivUN3RDR+nOMRRgY6AX
	HM6XWG467tElfQGSE68i96OLTXCd2+S8nixInDL2Sz9f8PHwdpYuA8Tyn7y/3PAdtrIG8t
	APMseIuMqQdwAgeqvRK8b8Jg7u4PhXh7pDlpJsWDc535X9J8b1j0734RdnWmNg==
Date: Thu, 2 Jul 2026 10:17:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Markus Probst <markus.probst@posteo.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Add sii,wakealarm-output-pin
 property for S35390A
Message-ID: <202607020817017cde494f@mail.local>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
 <20260701-bronze-jaguar-of-perfection-028bac@quoll>
 <45e8157be53c3d8827fcccece7f706968bc056d3.camel@posteo.de>
 <7de66163-369e-4118-af51-6913b565fa4b@kernel.org>
 <d06dd0726aa3795ae99df5fa8a9c05d6e2001efd.camel@posteo.de>
 <20260701164821b7492eac@mail.local>
 <74b32ed0a700e3900c0f34d730b2b5b69eb2ca19.camel@posteo.de>
 <187099d0-5e09-49c2-b67d-8bd4366ff1a0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <187099d0-5e09-49c2-b67d-8bd4366ff1a0@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6867-lists,linux-rtc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:markus.probst@posteo.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:uwe@kleine-koenig.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[posteo.de,kernel.org,kleine-koenig.org,lunn.ch,bootlin.com,gmail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,bootlin.com:dkim,bootlin.com:url,bootlin.com:from_mime,mail.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 526DE6F4BE1

On 02/07/2026 08:09:55+0200, Krzysztof Kozlowski wrote:
> >> Then you need proper wakeup-source support
> > Wouldn't that break existing devicetrees?
> 
> How?
> 
> > 
> > The current driver allows to wake up the system, even without
> > having wakeup-source set.
> 
> Anyway, wakeup-source is already there in rtc, so this would be done. I
> don't get though, why there is no benefit of routing it to interrupt
> controller (interrupt controllers do wake up the system). Additionally,
> if you do not connect it to any interrupt, then how does it wake up the
> system?
> 

Some systems are routing the interrupt output of the RTC directly to the
PMIC and the PMIC is the one responsible for waking the rest of the
system, including the SoC.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

