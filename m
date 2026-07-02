Return-Path: <linux-rtc+bounces-6876-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eYbPJ9MkRmq0KgsAu9opvQ
	(envelope-from <linux-rtc+bounces-6876-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:44:03 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA176F4ED7
	for <lists+linux-rtc@lfdr.de>; Thu, 02 Jul 2026 10:44:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="saszGIV/";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6876-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6876-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AF4E3025917
	for <lists+linux-rtc@lfdr.de>; Thu,  2 Jul 2026 08:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DCB8416CE2;
	Thu,  2 Jul 2026 08:35:26 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E35342A798;
	Thu,  2 Jul 2026 08:35:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782981326; cv=none; b=E8pwrMJbRGYVo5i5m3CaTxmsDXvbqVPUK3D5C2A9lQoAl/9SrbFf+GTS0mRl8dqr4+WVxunfqnL56QFY0h8VaAxWtC0d7A/XSQLT8b7JjmK6bYcyjvNr0Z1lh/tDz9za3pHezIoNANIzYE9hyDFbw46EJcVD36zHB8R1fJWub3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782981326; c=relaxed/simple;
	bh=Ui5nKZ9kIlm2Qxi2QG/TTlT978eJ07IL4k6NbZcpY2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uM8M5r6vjXBymwxYafXUu01Jcd9QnPOd13TYp9Ugrwk2Rpv1eZz0LlfQ/WKiPRljKzm0Pxbn4WTi96dn8EtIM/JSaT0hT/9OuYWhgu4fca+gxsntUd7Xrx1uwK8A376LgfXRw1glstIKmJWrCxRx1xZfhYAoy1nixJqnhGwXtjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=saszGIV/; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DC97B4E40C29;
	Thu,  2 Jul 2026 08:35:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B12185FF03;
	Thu,  2 Jul 2026 08:35:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 486C3104C960E;
	Thu,  2 Jul 2026 10:35:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782981321; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=v3XoWcvCU8wzeGoOynPkYxwnAByrmkOU41swl4JF6g4=;
	b=saszGIV/t7Y7j0JCiRiMUZrrUjHgBxZCHRP9SZrxi6DyLprb0yS0sqEUUCgbVRd1j2kDc0
	mmV+Laa54Jw23TXNMja9633XtjD8NiBsMe3Kp2lBv2d+oAdyoaAQaSjr/yx/Rw3AXjVS48
	/7gmJKz2k6Xxff3YAjAbIvnU7lUZF9MhDwYr/j0imQtjLeJiPpaCC0fbG5OYSbto/VEO02
	MwGmNXVAzg2tf90MBY0RClJyont9a5FyoivIAuz6GiJYx8vrtvTv3ImtWQwrkR/i5SPe0F
	XNqBBcQuTOxaC+xM5I56CdSoyn18G8woFKkwT49z17GjmweTSDTvd+qX8fls7w==
Date: Thu, 2 Jul 2026 10:35:17 +0200
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
Message-ID: <20260702083517a6b67a86@mail.local>
References: <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
 <20260701-bronze-jaguar-of-perfection-028bac@quoll>
 <45e8157be53c3d8827fcccece7f706968bc056d3.camel@posteo.de>
 <7de66163-369e-4118-af51-6913b565fa4b@kernel.org>
 <d06dd0726aa3795ae99df5fa8a9c05d6e2001efd.camel@posteo.de>
 <20260701164821b7492eac@mail.local>
 <74b32ed0a700e3900c0f34d730b2b5b69eb2ca19.camel@posteo.de>
 <187099d0-5e09-49c2-b67d-8bd4366ff1a0@kernel.org>
 <202607020817017cde494f@mail.local>
 <887cb4e9-d60d-47b5-9110-e00d18e9e46c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <887cb4e9-d60d-47b5-9110-e00d18e9e46c@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-6876-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:markus.probst@posteo.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:uwe@kleine-koenig.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[posteo.de,kernel.org,kleine-koenig.org,lunn.ch,bootlin.com,gmail.com,lists.infradead.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.local:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFA176F4ED7

On 02/07/2026 10:20:20+0200, Krzysztof Kozlowski wrote:
> On 02/07/2026 10:17, Alexandre Belloni wrote:
> > On 02/07/2026 08:09:55+0200, Krzysztof Kozlowski wrote:
> >>>> Then you need proper wakeup-source support
> >>> Wouldn't that break existing devicetrees?
> >>
> >> How?
> >>
> >>>
> >>> The current driver allows to wake up the system, even without
> >>> having wakeup-source set.
> >>
> >> Anyway, wakeup-source is already there in rtc, so this would be done. I
> >> don't get though, why there is no benefit of routing it to interrupt
> >> controller (interrupt controllers do wake up the system). Additionally,
> >> if you do not connect it to any interrupt, then how does it wake up the
> >> system?
> >>
> > 
> > Some systems are routing the interrupt output of the RTC directly to the
> > PMIC and the PMIC is the one responsible for waking the rest of the
> > system, including the SoC.
> 
> Yeah, then the PMIC has interrupt line to the SoC and the PMIC is the
> wakeup-source, not RTC.
> 

This would be case 3 of Documentation/devicetree/bindings/power/wakeup-source.txt

> Best regards,
> Krzysztof

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

