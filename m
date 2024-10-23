Return-Path: <linux-rtc+bounces-2273-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC5F9ABFD2
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Oct 2024 09:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AE70B20998
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Oct 2024 07:08:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59557153BF8;
	Wed, 23 Oct 2024 07:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sXabRIzz"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2553A8D0;
	Wed, 23 Oct 2024 07:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729667224; cv=none; b=hmObecpNgfEQ5GnaLzINyaRZesEwEn9ZjjrBnoEjEDo7AuovbAEOlj9LQuQ8VVaMaezsDIVneXGoC9J9T5GD66cPfTyOElp1lIucfctnCzJTbwctaAivDTqsbHLi9UX8E3CkgPlEzGYK+MCwQQGs3Rnzwy32ul7YRFg5uK+XJmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729667224; c=relaxed/simple;
	bh=jZ6NwNmVZfV7ULD4jlOblJfA583fZK3j0KAMT/P6Wsw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ecV2ZyODRCDshqvy4WHrRjjmW22Un0atr+Ut4aNXAQFIJkQnDyO81OY0OnSFwVgZWu8gSdhkIAs+GVwhMd+JqnqgAz5nmXwZ2LEQ0IgLZYZDsP78DRUojwjERK96y6+5TQBUjL+kcfSMIM5CR0X4gD7ye/Xtc2/0Dff4Ts3EVLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sXabRIzz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B538C4CEC6;
	Wed, 23 Oct 2024 07:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729667223;
	bh=jZ6NwNmVZfV7ULD4jlOblJfA583fZK3j0KAMT/P6Wsw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sXabRIzzRLc+Ren3SbDkbHSRKkIoGn/a/hcvUxLhcqv2bVV0cvr5fKWgaqaSTwY2c
	 YSLOhKVImXQj4uIEJIRiko/yA2rBAc78Z83Bwe7NHz19QcP+ylhMc4JoVQd0IS1QLz
	 DMr/NyzjR+UCdxs+b7Z7qIJMoThhbk3Ab4R2G3WfBEO6pZ3PVRGTaEsYYaPLn9gxvj
	 hH0Fyo7hNc5iks8ZcefQh9BCElFr/XBsylyQZF+pKOQJNsxZwx898kpZsaJTo5fp84
	 ttAS6KDcq7MGCy1dPYz58ROoC8LLYwbhvbt4EuwnbvwuN3ECSg/prw64CoDKC5mwRy
	 6lm4m71YzvsHA==
Date: Wed, 23 Oct 2024 09:06:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Philipp Rosenberger <p.rosenberger@kunbus.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Lino Sanfilippo <l.sanfilippo@kunbus.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: pcf2127: Add
 nxp,battery-switch-over property
Message-ID: <sopwritiludrmxzupp3p62ngak3u7qekyam67qh23qnchjim4w@eft6y6kuuqbj>
References: <20241022092855.1609427-1-p.rosenberger@kunbus.com>
 <20241022092855.1609427-2-p.rosenberger@kunbus.com>
 <20241022-radiator-blemish-3819dd4d94e0@spud>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022-radiator-blemish-3819dd4d94e0@spud>

On Tue, Oct 22, 2024 at 05:35:55PM +0100, Conor Dooley wrote:
> On Tue, Oct 22, 2024 at 11:28:54AM +0200, Philipp Rosenberger wrote:
> > The nxp,battery-switch-over property is used to control the switch-over,
> > battery low detection and extra power fail detection functions.
> > 
> > The PCF2131 has a different default value for the PWRMNG bits. It is set
> > to 0x7: battery switch-over function is disabled, only one power supply
> > (VDD); battery low detection function is disabled.
> > This is the opposite of the default of the PCF2127/PCA2129 and PCF2129.
> > With the nxp,battery-switch-over the behavior can be controlled through
> > the device tree.
> > 
> > Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
> > ---
> >  Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > index 2d9fe5a75b06..5739c3e371e7 100644
> > --- a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> > @@ -30,6 +30,16 @@ properties:
> >  
> >    reset-source: true
> >  
> > +  nxp,battery-switch-over:
> > +    description:
> > +      Battery and power related configuration. This property is used to set the
> > +      PWRMNG bits of the Control_3 register to control the battery switch-over,
> > +      battery low detection and extra power fail detection functions.
> > +      The actual supported functions depend on the device capabilities.
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    minimum: 0
> > +    maximum: 7
> 
> Beyond the fact that I dislike register-content properties like this, where
> it is not possible to grok the meaning by reading the property, what
> even makes this suitable for DT in the first place? Reading the commit
> message this sounds like software policy, and that different users of
> the same board might want to configure these register bits in different
> ways.

Especially that according to commit msg this is model specific, so
compatible already defines different default value of this register.

Best regards,
Krzysztof


