Return-Path: <linux-rtc+bounces-2276-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EB89ADD82
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 09:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A03B8B20A29
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 07:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1773918A956;
	Thu, 24 Oct 2024 07:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhuBdO6W"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE793166F14;
	Thu, 24 Oct 2024 07:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729754733; cv=none; b=jqemoUUHFp30JG0miFGa7CTA0sN2q27rX23IyllBNPkbOtps84Iarm87b/2jkHHVrga5+IE4VzThE7vZyWtPXEY1/fWmGloY9YRYVE//zJ7iHveiyRnskcxn7MU86qbCj2eyZkmCurg0NVKvcmD6W58be80o6iRjigIGCHvf3CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729754733; c=relaxed/simple;
	bh=o8n3RC4zsUYNU7G9RLPOn4IbDAFu4sTmJjNO/3ODR68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TReCDspEf5snRZh5L03HCEOm8pBykO+lpb5BP37oLQFDGCIJ9q5W+/53vMLLbI6IKbLq99YcBXt5IBAqpMK0a3fBELQ52cOUoe8tqrMoFtIU6+EqP81JuGbLbnmJC/RYXwKvFJO/FfCQgKCX0FT0ppQHhbLJI6rAuWnwbRSBhqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhuBdO6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 730F5C4CEC7;
	Thu, 24 Oct 2024 07:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729754732;
	bh=o8n3RC4zsUYNU7G9RLPOn4IbDAFu4sTmJjNO/3ODR68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhuBdO6WR4Lk5uqTlPhH/VWcb4AqKq55eiMSoUy7iVptFAvPoER4Mpfmdrd3RMJmq
	 BzK56HxGfjQ2lCjW6eeSDBuxcLglmBFUjL/iykDV75q7mAu7MS4WpDDLkPo1MC/aCM
	 qRVAlWo7l/D9HOTA4lw+jBUsFLghcn1vdBBbiM19QjNOmwtc59UDqf9P64dbtv2Qlb
	 NmZT2zO4ZNk8mGNafNGaWr5s8GezHYrn+ASSmOuwONoOyb2mzq2BfoVTX6TlnfG73y
	 uoZeGF++FXxaH064ng+09oEDQBqw27JlYsJV5jLJbPe8prAq692GDIbj9B36HWjTZT
	 JGUCW+L1yx/bA==
Date: Thu, 24 Oct 2024 09:25:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc: Conor Dooley <conor@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lino Sanfilippo <l.sanfilippo@kunbus.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: pcf2127: Add
 nxp,battery-switch-over property
Message-ID: <pj3tgtsdsjsqqznxgzzmxrcozibqie6ubtythou7t23tfgde5w@t6nwxob4rjah>
References: <20241022092855.1609427-1-p.rosenberger@kunbus.com>
 <20241022092855.1609427-2-p.rosenberger@kunbus.com>
 <20241022-radiator-blemish-3819dd4d94e0@spud>
 <36f46d44-8852-4988-9ff9-5b8bf49e2aa8@kunbus.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <36f46d44-8852-4988-9ff9-5b8bf49e2aa8@kunbus.com>

On Thu, Oct 24, 2024 at 09:11:04AM +0200, Philipp Rosenberger wrote:
> On 22.10.24 18:35, Conor Dooley wrote:
> > On Tue, Oct 22, 2024 at 11:28:54AM +0200, Philipp Rosenberger wrote:
> > > The nxp,battery-switch-over property is used to control the switch-over,
> > > battery low detection and extra power fail detection functions.
> > > 
> > > The PCF2131 has a different default value for the PWRMNG bits. It is set
> > > to 0x7: battery switch-over function is disabled, only one power supply
> > > (VDD); battery low detection function is disabled.
> > > This is the opposite of the default of the PCF2127/PCA2129 and PCF2129.
> > > With the nxp,battery-switch-over the behavior can be controlled through
> > > the device tree.
> > > 
> > > Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
> > > ---
> > >   Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > > index 2d9fe5a75b06..5739c3e371e7 100644
> > > --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > > +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > > @@ -30,6 +30,16 @@ properties:
> > >     reset-source: true
> > > +  nxp,battery-switch-over:
> > > +    description:
> > > +      Battery and power related configuration. This property is used to set the
> > > +      PWRMNG bits of the Control_3 register to control the battery switch-over,
> > > +      battery low detection and extra power fail detection functions.
> > > +      The actual supported functions depend on the device capabilities.
> > > +    $ref: /schemas/types.yaml#/definitions/uint8
> > > +    minimum: 0
> > > +    maximum: 7
> > 
> > Beyond the fact that I dislike register-content properties like this, where
> > it is not possible to grok the meaning by reading the property, what
> 
> Yes, I'm not satisfied with this solution myself.
> There are three different functions, which can be configured in the
> register:
> - battery switch-over mode: standard; direct; disabled
> - battery low detection: enabled; disabled
> - extra power fail detection: enabled; disabled
> 
> I'm not sure what a proper way is to implement this in the devicetree.
> 
> > even makes this suitable for DT in the first place? Reading the commit
> > message this sounds like software policy, and that different users of
> > the same board might want to configure these register bits in different
> > ways.
> 
> It is less a software policy, but a configuration how the hardware is
> implemented. If the device has no battery, it is possible to disable the
> battery switch-over function. In this case the V_BAT must be connected to
> ground.

monitored-battery property already tells you this.

> If a battery is connected, the battery switchover will only work if the
> battery switch-over function is in standard mode or direct switching mode.
> Until now the driver has just ignored the PWRMNG bits. As the default was
> battery switching in standard mode. Thus all use cases worked good enough.
> Battery switching was working if a battery was connected. If no battery was
> connected it did no real harm (the rtc may have used a tiny bit more power
> then needed, I guess).

Why driver cannot use standard mode always? Or other way?

> With the new PCF2131 the default has changed to battery switch-over
> disabled. Now even with a battery attached, the rtc will lose time after a
> power cycle.
> I guess I should describe this better in the commit message.

In any case this is pcf2131 related, right? So compatible implies it.

Best regards,
Krzysztof


