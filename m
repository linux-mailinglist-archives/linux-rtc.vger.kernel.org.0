Return-Path: <linux-rtc+bounces-6847-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rFAvMj5IRWoa+AoAu9opvQ
	(envelope-from <linux-rtc+bounces-6847-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 19:02:54 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D94086F01DE
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 19:02:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="PwApHo/8";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6847-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6847-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 700D73003836
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 16:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78603378D76;
	Wed,  1 Jul 2026 16:48:30 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD597224FA;
	Wed,  1 Jul 2026 16:48:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924510; cv=none; b=L+muGA4OSdvbWewa/n0Zo61pamptWjOkDdpewj11Cga6TnwTM12qhnJHVzf/VwTW59uSVmwKuWzKI6mf2f1m99hjy4eGcDnTwE7pmqq74rdLE2ll1ix9ujens47A5p56lPX/18onQdFQIwqb2c/WZMIabWWyIP2LeR3G8mRBm4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924510; c=relaxed/simple;
	bh=So/MCmm5KX3SWRRGF1/C9UEuaHtoVYdP+WKQe1ziy1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIWAQ5o3jE6Ai8k7suQ6MJ4c0jcWlgiorhr0cKQkSIDBt9qr52Mi7SyF+g6MLL1acmiebJnIc0iyYXFu7KA7pvDIC9K6IElerzg5IEYrR0uoOsZX6UDzoUOPo21rTn6tikSUs/+moY0ssNPZWO3GhwJN1ndly4sNSu71cjLcMGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PwApHo/8; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 223A0C4FECB;
	Wed,  1 Jul 2026 16:48:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EF9515FD9D;
	Wed,  1 Jul 2026 16:48:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 612B9104C948E;
	Wed,  1 Jul 2026 18:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782924504; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=qxtFhLzSHt+nahGfRB9UVm+Cbn4C6aY1wYx6sp3xHJA=;
	b=PwApHo/8B8Epz4Vt7aF8WpSL7rgkO6iJ2++Z5ARi/DD2CMEDZchzNpLSF+DlHBO9cH4qME
	K54lB9odaBwrcVe6ZDujZvDh/vnWlvDxtRxIa95VXY6b7rabchl5Jy16rlch6Qlgt13c71
	XjCn5pVC2upoxr4VDY9fDxkDYPJfDaKpK4A+lsYlm8WUoboO7/uNZf6ZCafdtNHXj7d8QT
	e3rHiScXuYFxNGxECrUnB78L1bco6nedN9qZ95hnVZ3Xwiqth+Mt+Yju2oI6rx13iWc7J8
	9B8gnokziJEoxfxQKkrZ7GJKDKmn7x7i8+NuJquh7LwajrdbGBL9So5/z/ATsQ==
Date: Wed, 1 Jul 2026 18:48:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
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
Message-ID: <20260701164821b7492eac@mail.local>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
 <20260701-bronze-jaguar-of-perfection-028bac@quoll>
 <45e8157be53c3d8827fcccece7f706968bc056d3.camel@posteo.de>
 <7de66163-369e-4118-af51-6913b565fa4b@kernel.org>
 <d06dd0726aa3795ae99df5fa8a9c05d6e2001efd.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d06dd0726aa3795ae99df5fa8a9c05d6e2001efd.camel@posteo.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-6847-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:uwe@kleine-koenig.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,kleine-koenig.org,lunn.ch,bootlin.com,gmail.com,lists.infradead.org,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D94086F01DE

On 01/07/2026 16:43:07+0000, Markus Probst wrote:
> On Wed, 2026-07-01 at 17:14 +0200, Krzysztof Kozlowski wrote:
> > On 01/07/2026 15:25, Markus Probst wrote:
> > > > > +
> > > > > +maintainers:
> > > > > +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> > > > 
> > > > This should be someone caring about this hardware.
> > > He does have the majority of commits on this driver (excluding merge
> > > commits and commits not exclusive to this driver), although most of
> > > them are pretty tiny.
> > > 
> > > Who would you suggest instead?
> > 
> > Someone adding features for this driver, maybe driver maintainers. But
> > if Alexandre is fine, you can leave him.
> > 
> > > > 
> > > > > +
> > > > > +description:
> > > > > +  The S-35390A is a CMOS 2-wire real-time clock IC which operates with the
> > > > > +  very low current consumption in the wide range of operation voltage.
> > > > > +
> > > > > +allOf:
> > > > > +  - $ref: rtc.yaml#
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: sii,s35390a
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +  sii,wakealarm-output-pin:
> > > > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > > > +    enum: [1, 2]
> > > > > +    description: |
> > > > > +      The output pin to wake up the system.
> > > > > +      Default will use the output pin for interrupt signal 2.
> > > > > +        <S35390A_OUTPUT_PIN_INT1> : Output pin for interrupt signal 1
> > > > > +        <S35390A_OUTPUT_PIN_INT2> : Output pin for interrupt signal 2
> > > > 
> > > > Does that mean device generates the interrupts?
> > > Yes.
> > > 
> > 
> > 
> > Then I think you miss interrupts property.
> From what I can tell the line is used to generate a system wakeup
> event.
> 
> There would be no obvious benefit of connecting it to an interrupt
> controller, so this property would be obsolete?
> 

Then you need proper wakeup-source support



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

