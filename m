Return-Path: <linux-rtc+bounces-5935-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mApTMjoQgmm9OwMAu9opvQ
	(envelope-from <linux-rtc+bounces-5935-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 03 Feb 2026 16:11:54 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D85CFDB1CE
	for <lists+linux-rtc@lfdr.de>; Tue, 03 Feb 2026 16:11:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B27963000B86
	for <lists+linux-rtc@lfdr.de>; Tue,  3 Feb 2026 15:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2052FF65B;
	Tue,  3 Feb 2026 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXz8bHsa"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FD4748F;
	Tue,  3 Feb 2026 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770130897; cv=none; b=KR6V2j1XhpnAdWFTtfZd3oPbd3wmTAqQ0dYmv45nfM4PoGdSHMDuLhWuViBeA6iMybrlufH6iE7F9adwli5pniHPhUk31K+K0ziRDrMZ83jpV4vfgl7Zjogz78OjXtFpkde3bIkms+CDvP5WyupEHoB+wuDicyiBs7bg4I65wy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770130897; c=relaxed/simple;
	bh=h+vW6w1gwRQ5jHQUB+Rc8ayw0OzI1szLyss3LSeszPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFgoOEdTy9NepfXl7EiN6q4eM9OzYgIZMPg62ZwF6r0XqAj5H18vB2frsWHKZFuC4+pNKatAIaY+EKWvZ5IvlLG+eZ71fbTTsE/TpsgBlWCOOfqyNPsvJKcKp4kDUjN+at6Up1brGa59RcAtel8OD9h1mMTpTaMB3kUWxFo8N8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXz8bHsa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03FFDC116D0;
	Tue,  3 Feb 2026 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770130897;
	bh=h+vW6w1gwRQ5jHQUB+Rc8ayw0OzI1szLyss3LSeszPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KXz8bHsa2DI2tJ64eOL9R8FUkkoXBfp06fMh5bbx00RuGCo/mrQCNj0RUTunwNY/o
	 8h+FL+WHNsxoKaPp7A4vq1W0pvB3YODMK7L8o0JjTg1Y8XY4ixvkyhY/8ELkV1L0AM
	 kfF/wmdLnjz5PRGtZD4OxBtrv0wBPOpMBOr8kTadS8OvRy+Yv5cy/iBKhw3rd1wBHF
	 56sTPs5NuI5mbMKiJsc3pP0cRWkmf+c5wQ8mhaAbHurAHlHd6pDs6h0SHtFNy5mY26
	 Ruvr80krV4/+P5DquCCJprGFNiGTpQ7SoccRdNqDCEqnPxd1G68qU1fs6viVAYdDDN
	 xbA6lU64XQrRg==
Date: Tue, 3 Feb 2026 09:01:36 -0600
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Tony Lindgren <tony@atomide.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 07/10] dt-bindings: input: cpcap-pwrbutton: convert to
 schema
Message-ID: <20260203150136.GA2294714-robh@kernel.org>
References: <20260125134302.45958-1-clamor95@gmail.com>
 <20260125134302.45958-8-clamor95@gmail.com>
 <8bd89524-dfc3-43b0-b0f2-cdb1cd51e1ac@baylibre.com>
 <CAPVz0n25ukBJ6=hmmR9nd4MBoPkHaHQ+ZHMXYxghYZdkB28_sg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n25ukBJ6=hmmR9nd4MBoPkHaHQ+ZHMXYxghYZdkB28_sg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-5935-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,analog.com,gmail.com,bootlin.com,atomide.com,vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-rtc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,devicetree.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D85CFDB1CE
X-Rspamd-Action: no action

On Sun, Feb 01, 2026 at 09:07:07AM +0200, Svyatoslav Ryhel wrote:
> сб, 31 січ. 2026 р. о 22:02 David Lechner <dlechner@baylibre.com> пише:
> >
> > On 1/25/26 7:42 AM, Svyatoslav Ryhel wrote:
> > > Convert power button devicetree bindings for the Motorola CPCAP MFD from
> > > TXT to YAML format. This patch does not change any functionality; the
> > > bindings remain the same.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../bindings/input/cpcap-pwrbutton.txt        | 20 ------------
> > >  .../input/motorola,cpcap-pwrbutton.yaml       | 32 +++++++++++++++++++
> > >  2 files changed, 32 insertions(+), 20 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> > >  create mode 100644 Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt b/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> > > deleted file mode 100644
> > > index 0dd0076daf71..000000000000
> > > --- a/Documentation/devicetree/bindings/input/cpcap-pwrbutton.txt
> > > +++ /dev/null
> > > @@ -1,20 +0,0 @@
> > > -Motorola CPCAP on key
> > > -
> > > -This module is part of the CPCAP. For more details about the whole
> > > -chip see Documentation/devicetree/bindings/mfd/motorola-cpcap.txt.
> > > -
> > > -This module provides a simple power button event via an Interrupt.
> > > -
> > > -Required properties:
> > > -- compatible: should be one of the following
> > > -   - "motorola,cpcap-pwrbutton"
> > > -- interrupts: irq specifier for CPCAP's ON IRQ
> > > -
> > > -Example:
> > > -
> > > -&cpcap {
> > > -     cpcap_pwrbutton: pwrbutton {
> > > -             compatible = "motorola,cpcap-pwrbutton";
> > > -             interrupts = <23 IRQ_TYPE_NONE>;
> > > -     };
> > > -};
> > > diff --git a/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
> > > new file mode 100644
> > > index 000000000000..643f6b2b1f13
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/input/motorola,cpcap-pwrbutton.yaml
> > > @@ -0,0 +1,32 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/input/motorola,cpcap-pwrbutton.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Motorola CPCAP PMIC power key
> > > +
> > > +maintainers:
> > > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > > +
> > > +description:
> > > +  This module is part of the Motorola CPCAP MFD device. For more details
> > > +  see Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml. The
> > > +  power key is represented as a sub-node of the PMIC node on the device
> > > +  tree.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: motorola,cpcap-pwrbutton
> > > +
> > > +  interrupts:
> > > +    minItems: 1
> >
> > Should this be maxItems: 1?
> >
> > > +    description: CPCAP's ON interrupt
> >
> > Or I suppose:
> >
> >   items:
> >     - description: ...
> >
> 
> Both options are perfectly fine for me, and I lean towards using
> "items: desc" but I would like to hear what schema maintainers would
> say, which layout is preferred in this case.

Either is fine. 'description' is fine if you have something specific 
about the interrupt to say. Saying what the interrupt is for is 
specific. So 'description' is good in this case.

Rob

