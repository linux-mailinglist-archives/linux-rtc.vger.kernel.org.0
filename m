Return-Path: <linux-rtc+bounces-6843-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pz0iBj4wRWqn8QoAu9opvQ
	(envelope-from <linux-rtc+bounces-6843-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 17:20:30 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 632446EF31C
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 17:20:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=bmYSG8aP;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6843-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6843-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F40F31B04B9
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 15:11:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5649E477992;
	Wed,  1 Jul 2026 15:11:21 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6204A409117;
	Wed,  1 Jul 2026 15:11:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782918681; cv=none; b=Oxkufhz02ijx50ABY1bVFKYPc6DKuDzHA0YwqiqSrPCEHSfH5wwWSPp6q0mgR761M7g1g/Ef6/356wvUBG8jKQju+cUCEil/kPN532GCd4bdbkmj/3vo32rUIL69c8EdQUoZbEcj7FpcQ/HxSkqbrhDYfhyu5gdPyIsNQ5fBdLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782918681; c=relaxed/simple;
	bh=ezei1IRHtvZjlBNnHExRqtdzBYaUMDA/AQ+kgrCd2rI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmJRBWXhaArCcpi/u4tBkPpbO/dSf2XiOBffxOolLjroNsBrfXurwkR1ewVM5bFHwWvQfaLKn4tj833vVqlA+VXoYbUOAWIiCnkDS7IaGBVLkiSUfRcob5AEgANuqma2eK3bkgEdCx642ATA/QdF1eNbYJgaGkeE7t0Iu01QDfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=bmYSG8aP; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 954224E40BEF;
	Wed,  1 Jul 2026 15:11:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6225360288;
	Wed,  1 Jul 2026 15:11:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 83A59104C9645;
	Wed,  1 Jul 2026 17:11:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782918674; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=lTbkb9PNizd9LGcvfest9O/hgUQd1NGIQ+sGEr29HOQ=;
	b=bmYSG8aPQ1KMoP6ZmgZ1bSZof92ublO7R9gPm+t76+Y5Njw35/HF8NL9fWBX4LUVcZ/ryT
	6Caxt2QsZnoYLoV7Gdz4LvdciZdayzpRxMD4jGAsmKQgBVED5om661WmI1a8sfjsu+ZxWD
	Aq7qAb9DOK4EKmMlMslyYVpfpHHdpqkFeXn8qHvARnsO3uw9HdZRRQunf9/wIc5sp1dbsr
	sc/5tppUdga8i6Xq4nJuoVTFDkSUmFWddsATN1vCT9f3K/JSOn8oUC7slzxuyp4Gynt1rI
	ZxgKQIvWjNbeUc29j2jG6VmcsKXa8x3S4dX4qmIclyjvC9pSDspGw0zlBpzX4A==
Date: Wed, 1 Jul 2026 17:11:11 +0200
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
Message-ID: <2026070115111192951db5@mail.local>
References: <20260630-rtc_s35390a_int1-v1-0-1b2239e16be2@posteo.de>
 <20260630-rtc_s35390a_int1-v1-1-1b2239e16be2@posteo.de>
 <20260701-bronze-jaguar-of-perfection-028bac@quoll>
 <45e8157be53c3d8827fcccece7f706968bc056d3.camel@posteo.de>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45e8157be53c3d8827fcccece7f706968bc056d3.camel@posteo.de>
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
	TAGGED_FROM(0.00)[bounces-6843-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:markus.probst@posteo.de,m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:uwe@kleine-koenig.org,m:andrew@lunn.ch,m:gregory.clement@bootlin.com,m:sebastian.hesselbarth@gmail.com,m:linux-arm-kernel@lists.infradead.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:sebastianhesselbarth@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,kleine-koenig.org,lunn.ch,bootlin.com,gmail.com,lists.infradead.org,vger.kernel.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,devicetree.org:url,mail.local:mid,bootlin.com:dkim,bootlin.com:email,bootlin.com:url,bootlin.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 632446EF31C

On 01/07/2026 13:25:41+0000, Markus Probst wrote:
> On Wed, 2026-07-01 at 09:35 +0200, Krzysztof Kozlowski wrote:
> > On Tue, Jun 30, 2026 at 07:22:21PM +0000, Markus Probst wrote:
> > > Synology NAS devices use the output pin for interrupt signal 1 to wake up
> > > the system.
> > > 
> > > Move devicetree bindings for sii,s35390a into its own file.
> > > Add sii,wakealarm-output-pin property to enable the use of the output
> > > pin for interrupt signal 1 for the wake alarm, which makes it possible to
> > > set an wake alarm on Synology NAS devices.
> > > 
> > > Signed-off-by: Markus Probst <markus.probst@posteo.de>
> > > ---
> > >  .../devicetree/bindings/rtc/sii,s35390a.yaml       | 54 ++++++++++++++++++++++
> > >  .../devicetree/bindings/rtc/trivial-rtc.yaml       |  3 --
> > >  MAINTAINERS                                        |  1 +
> > >  include/dt-bindings/rtc/s35390a.h                  |  9 ++++
> > >  4 files changed, 64 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> > > new file mode 100644
> > > index 000000000000..31a578673870
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/rtc/sii,s35390a.yaml
> > > @@ -0,0 +1,54 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/rtc/sii,s35390a.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: S-35390A 2-WIRE REAL-TIME CLOCK
> > > +
> > > +maintainers:
> > > +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> > 
> > This should be someone caring about this hardware.
> He does have the majority of commits on this driver (excluding merge
> commits and commits not exclusive to this driver), although most of
> them are pretty tiny.
> 
> Who would you suggest instead?

I can take it but the point of Krzysztof is mainly that the ones working
on the driver don't necessarily have to be the DT bindings maintainers
as both are well separated.

I mostly did clean ups in the driver, Lorenz Brun submitted something
way more interesting.

> > 
> > > +
> > > +description:
> > > +  The S-35390A is a CMOS 2-wire real-time clock IC which operates with the
> > > +  very low current consumption in the wide range of operation voltage.
> > > +
> > > +allOf:
> > > +  - $ref: rtc.yaml#
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: sii,s35390a
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  sii,wakealarm-output-pin:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [1, 2]
> > > +    description: |
> > > +      The output pin to wake up the system.
> > > +      Default will use the output pin for interrupt signal 2.
> > > +        <S35390A_OUTPUT_PIN_INT1> : Output pin for interrupt signal 1
> > > +        <S35390A_OUTPUT_PIN_INT2> : Output pin for interrupt signal 2
> > 
> > Does that mean device generates the interrupts?
> Yes.
> 
> Thanks
> - Markus Probst
> 
> > 
> > Best regards,
> > Krzysztof



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

