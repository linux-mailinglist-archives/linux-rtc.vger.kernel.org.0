Return-Path: <linux-rtc+bounces-6308-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0F4LGySs12kMRQgAu9opvQ
	(envelope-from <linux-rtc+bounces-6308-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 15:39:48 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F40203CB662
	for <lists+linux-rtc@lfdr.de>; Thu, 09 Apr 2026 15:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8683C303D08C
	for <lists+linux-rtc@lfdr.de>; Thu,  9 Apr 2026 13:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52FE42C21FE;
	Thu,  9 Apr 2026 13:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Gt+DdS+8"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1121D299959;
	Thu,  9 Apr 2026 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775741448; cv=none; b=IMEE4GIPInvsUrMRw8UdqDCUHDbag9Aab6nJUcXSk36lHgclyao2CuNNfUFRS7OU6VQKgCDpZwbRfqbHj3T0NjabhyX6isCNiZigg0eH3IJYOaurK8RbLBIRDvEYDLwdv+1CMKCbvGDHWquZKydbencbZceImIml4x8qrt469cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775741448; c=relaxed/simple;
	bh=xoWNC+9fj3k5xjF4v6BdKmGDQc6d15YKVxkkGQRRC50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExCq55/QDVVW95QPmEKJ/4FuT6hm2tUA7uGe72ynVG0ZT+Wg8k8ePewq8JwyzpTgH7vtHSafGD6gMo/5713xL0L0q+im/ODvXeZt/967ZGxraIH8sdAw2pEQM0PKoBDz7YoWVmvvsH6bCT6IlusHltcP9vbD9FzGDuYgfl0aYoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Gt+DdS+8; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 400D6C5C185;
	Thu,  9 Apr 2026 13:31:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6809E5FDEB;
	Thu,  9 Apr 2026 13:30:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 150E2104500B5;
	Thu,  9 Apr 2026 15:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775741443; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FfLf9FSJQ4bbwNckexl7akFIsYHUqdf4UFIJBjk7jgU=;
	b=Gt+DdS+85NbhlyHCtmfUuYrNwTpMkZ8ewS6xuIdlV2LbbNIkromilVSWoJ99XsMgfK95z6
	x44zRQaVCTbEEXJYmuH5ZvClzrF6SSK946ex3qwZLS0V3ESiAfEZUHUKM0kpnpQIXdveNe
	POv7VhGh5NzPLX7xcXd6T0YO1K4MCAoZ4G+XnnzLx7W34Y6WNqD9z75m6WKnbiJ8oECQ8X
	vhSlUDAkT/618naR3BauZorB/ivgxxPtnKWtlrCHIlMP4/fuaolcPxuK9ThFHZhDS5MWl8
	Qbqo6w6b8K8MhdCZny9AYliVrQTatBAcA98+gY3XFIWorSEsRxhsB3+H1Bu+Kw==
Date: Thu, 9 Apr 2026 15:30:36 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: David Wang <tomato1220@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, a.zummo@towertech.it,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrew@aj.id.au, avi.fishman@gmail.com, tmaimon77@gmail.com,
	tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
	benjaminfair@google.com, ctcchien@nuvoton.com, mimi05633@gmail.com,
	openbmc@lists.ozlabs.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	davidwang@quantatw.com
Subject: Re: [PATCH 1/2] dt-bindings: rtc: nct3018y: add nuvoton,ctrl-reg-val
 property
Message-ID: <20260409133036512b9819@mail.local>
References: <cover.1775717959.git.tomato1220@gmail.com>
 <ba0845c590eda42a28b3799a6f40294ba74a726e.1775717959.git.tomato1220@gmail.com>
 <a1e24b69-b90a-47d7-b952-bca45fcc6281@kernel.org>
 <CADSQSY1rAnZ69JAjosV_AWBw9OL77dyzHkewW5YGvpCZRwXq5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADSQSY1rAnZ69JAjosV_AWBw9OL77dyzHkewW5YGvpCZRwXq5A@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6308-lists,linux-rtc=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,towertech.it,aj.id.au,gmail.com,google.com,nuvoton.com,lists.ozlabs.org,vger.kernel.org,quantatw.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexandre.belloni@bootlin.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:url]
X-Rspamd-Queue-Id: F40203CB662
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 09/04/2026 15:44:43+0800, David Wang wrote:
> On Apr 9, 2026, at 15:23, Krzysztof Kozlowski wrote:
> >
> > On 09/04/2026 09:21, David Wang wrote:
> > > Add "nuvoton,ctrl-reg-val" vendor property to allow optional
> > > initialization of the RTC control register (0x0A).
> > >
> > > This allows platform-specific configurations like 24h mode and
> > > write ownership to be defined via Device Tree.
> > >
> > > Signed-off-by: David Wang <tomato1220@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > > index 4f9b5604acd9..0984dfb77170 100644
> > > --- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > > +++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> > > @@ -24,6 +24,10 @@ properties:
> > >
> > >    reset-source: true
> > >
> > > +  nuvoton,ctrl-reg-val:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: Initial value for the control register (0x0A).
> >
> > 24h mode is not a property of a board. I don't know what "write
> > ownership" is.
> >
> > Best regards,
> > Krzysztof
> 
> Hi Krzysztof,
> 
> Thanks for your feedback. Let me clarify these two points based on the
> NCT3018Y datasheet:
> 1. Regarding "write ownership": The NCT3018Y features two I2C
> interfaces (Primary and Secondary). The TWO (Time Write Ownership) bit
> in the control register determines which interface has the authority
> to write to the RTC. We need to ensure the interface connected to our
> SoC is granted this ownership during probe—especially for factory-new
> chips—to ensure the RTC is writable.

You need a write-access property. For NXP, we settled with
nxp,write-access.



> 2. Regarding "24h mode": This bit determines the internal data format
> in which time is stored within the RTC hardware. Setting this ensures
> the hardware's internal storage layout matches the driver's
> expectation from the start.

The driver needs to always write 24h mode but can support reading both.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

