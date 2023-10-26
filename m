Return-Path: <linux-rtc+bounces-130-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C127D79CC
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Oct 2023 02:50:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2208B281D20
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Oct 2023 00:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A4A417CF;
	Thu, 26 Oct 2023 00:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="U62Bw4+6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E8D17CB;
	Thu, 26 Oct 2023 00:50:13 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::227])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4564E5;
	Wed, 25 Oct 2023 17:50:10 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AD5E420004;
	Thu, 26 Oct 2023 00:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1698281409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kw/f9dk03toD/bngeKNCjlbBkW7ybBlC+GD5XNSlQw4=;
	b=U62Bw4+6YVbdcFQ/mTF87ZhhKowumwwb5pmSYNsclhWqH/0PEFUOXN4SY6PZUBjUVlmkBt
	MkUK+SE9NHQkTTA/iYN09gp+lNXhoRsKdbK0OQj6KDOS4IjUly+sb3YceetjVpIJRGnLnc
	Hcey3iTCzTQmUqtLj8TxhUrzMkW9NxkHOdKKBLU1UUlzeabr+ZecLrb39ndDuOjvwNAcAw
	GV37zJELG42qboEIAJfq85MXJHQpS1Ea/BSLiKwRYst/RfK3npwwQOY90uHd0/DGiJCnaM
	6LQAnIsGWrRTtAG+vX29KxgqdjEOoE1aHMgNaulWLiUJFEBr/rau5lf0t3YW7A==
Date: Thu, 26 Oct 2023 02:50:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: rtc: nxp,pcf8563: add hiz-output
 property
Message-ID: <20231026005008b8255799@mail.local>
References: <20231024-topic-pcf85363_hiz_output-v1-0-50908aff0e52@wolfvision.net>
 <20231024-topic-pcf85363_hiz_output-v1-2-50908aff0e52@wolfvision.net>
 <20231025222327c0b5d460@mail.local>
 <2f17c031-30f6-4242-b2a1-1628402b3091@wolfvision.net>
 <1c4a6185-fe09-45d1-900a-10abf48e3fc9@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c4a6185-fe09-45d1-900a-10abf48e3fc9@wolfvision.net>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 26/10/2023 01:23:21+0200, Javier Carrasco wrote:
> >>> +  hiz-output:
> >>> +    description:
> >>> +      Use enabled if the output should stay in high-impedance. This
> >>> +      mode will mask the output as an interrupt source.
> >>> +      Use sleep if the otuput should be only active in sleep mode.
> >>> +      This mode is compatible with any other output configuration.
> >>> +      The disabled value acts as if the property was not defined.
> >>> +    enum:
> >>> +      - enabled
> >>> +      - sleep
> >>> +      - disabled
> >>> +    default: disabled
> >>> +
> >>
> >> If instead of using a custom property, you consider this as what it
> >> actually is: pinmuxing, then everything else comes for free. With
> >> pinctrl, you can define different states for runtime and sleep and they
> >> will get applied automatically instead of open coding in the driver.
> 
> I am not sure if your solution would cover all my needs:
> 
> 1.- With pinctrl I can model the SoC pins, right? That would not stop
> the RTC output though, so the 32 kHz signal would be generated anyways
> even though the SoC would ignore it. That is one of the things I want to
> avoid.
> 

No, you would model the INTA pin.

> 2.- What happens if the RTC output is a clock for an external device
> that is only required when the SoC is in sleep mode? In that case I
> would like the RTC driver to control the output with the modes it provides.

Even if I doubt this is a valid use case, this would be possible as long
as the external device node has the correct pinctrl-* properties.


> >>
> >> Also, how you define this property means that everyone currently using
> >> this RTC is going to have a new warning that they should just ignore.
> >>
> >>
> > Thanks for your reply. The warning can only be triggered if the property
> > is defined, so in principle no one could have that warning yet. Only the
> > ones who actually define it and use an invalid value would get the warning.
> > 
> > On the other hand I did not consider your approach, which might make
> > this patch irrelevant. So I will have a look at it to make sure that it
> > achieves the same results.
> > 
> > Thanks again and best regards,
> > Javier Carrasco
> > 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

