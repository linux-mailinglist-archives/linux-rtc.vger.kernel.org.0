Return-Path: <linux-rtc+bounces-372-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 193777FCA68
	for <lists+linux-rtc@lfdr.de>; Wed, 29 Nov 2023 00:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9DC47B213DC
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Nov 2023 23:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E28495DD;
	Tue, 28 Nov 2023 23:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="bRCYPx8M"
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1757E1A5;
	Tue, 28 Nov 2023 15:01:32 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 350AA60004;
	Tue, 28 Nov 2023 23:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701212491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gy5+wWjXgmLyDYNQ/I3zqQTEWmaeVqhCkQPBCljqylA=;
	b=bRCYPx8Mi+oYupXYeBmI4FBZvfn8XP6SsqWl77lfy8Bro9xS35o7Qn+66vtTzfr+U5bjUJ
	2gLpnONC/Pn15PtdledA/m6VsZ6rX3A+NC9064+1499LgI9ICIs2L+iQ/SxQGuvFo3GePI
	XgCSH/EyCzrHrqrGSrg7ANhw9vzwbq1UgGkywJTK0M9VbpDpkuR6O7MFupHp8Q+3nWX+mo
	/v25DaY9tQ+hbn3i1Qgt+4Zndi7oiz961R3bcSrHnRG/Jw9eDH5IGlJII7x0ucXBNZX4Eo
	P9gHuDeWO+r9x3U3/uJwwRGpX2UT1uN+oeNlOoF2CpUPQr4ZGiUoJMYVCmzyjA==
Date: Wed, 29 Nov 2023 00:01:28 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: jingbao qiu <qiujingbao.dlmu@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	a.zummo@towertech.it, krzysztof.kozlowski+dt@linaro.org,
	chao.wei@sophgo.com, unicorn_wang@outlook.com, conor+dt@kernel.org,
	robh+dt@kernel.org, conor@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rtc: add rtc controller support for Sophgo CV1800B
 SoC
Message-ID: <202311282301288a92d806@mail.local>
References: <20231121094642.2973795-1-qiujingbao.dlmu@gmail.com>
 <20231121094642.2973795-3-qiujingbao.dlmu@gmail.com>
 <09b29f1f-a42b-49f7-afca-f82357acd4c8@linaro.org>
 <CAJRtX8TU9Z3OXL1zw9+mGNhxugp_C2jo40k-s9V2byNCQeBoLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJRtX8TU9Z3OXL1zw9+mGNhxugp_C2jo40k-s9V2byNCQeBoLQ@mail.gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com

On 28/11/2023 21:22:52+0800, jingbao qiu wrote:
> >
> > > +     ret = cv1800b_rtc_softinit(rtc);
> > > +     if (ret)
> > > +             goto err;
> > > +     cv1800b_rtc_alarm_irq_enable(&pdev->dev, 1);
> > > +     rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> > > +     if (IS_ERR(rtc->rtc_dev)) {
> > > +             ret = PTR_ERR(rtc->rtc_dev);
> > > +             goto err;
> > > +     }
> > > +     rtc->rtc_dev->range_max = U32_MAX;
> > > +     rtc->rtc_dev->ops = &cv800b_rtc_ops;
> > > +
> > > +     return rtc_register_device(rtc->rtc_dev);
> 
> I find the commet of devm_rtc_device_register wirte
> “This function is deprecated, use devm_rtc_allocate_device and
> rtc_register_device instead”
> but all of code about this, they all use devm_rtc_device_register

They don't, they use devm_rtc_register_device

> function. So which one do you suggest I use?
> 
> > > +err:
> > > +     return dev_err_probe(&pdev->dev, ret, "Failed to init cv1800b rtc\n");
> >
> > Drop, just return.
> 
> ok
> 
> >
> > Best regards,
> > Krzysztof
> >
> 
> Best regards,
> Jingbao Qiu

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

