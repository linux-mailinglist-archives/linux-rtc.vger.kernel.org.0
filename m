Return-Path: <linux-rtc+bounces-3002-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A087A180E4
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 16:16:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F97E7A3CD7
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jan 2025 15:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35ECD1F3FF5;
	Tue, 21 Jan 2025 15:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wAhW53O7"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292FA1F4271
	for <linux-rtc@vger.kernel.org>; Tue, 21 Jan 2025 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472550; cv=none; b=kRiQ9O9xFmbDEESmty7hXbdpCz3R/y8eAK4oW0oZQ2Y8Y7c2d19Cs1embuo93dX1Tp6G1UAf+Flucktk3GaEWoPOB5fXCV80hFh5kgNNtqlowh7h6UPfdBpDpOIDycm8CY9QqZWR1BOF9T2e/w7eF5EWT2YeEZqP3ywoUKtYrlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472550; c=relaxed/simple;
	bh=VAOxaKNqT9HIaNEdqkFqK0wD2sSNhVsUuyIHNh+V45k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBRGEsNISYylaRVmIT8LkpikX+lxOolV5TmLzRGgqNg5UUyyAsVGcAF+VbP5OT+bkh933ui1z+wMK/T4Km0sSLIueF2k7YFK4VvENx7ayn2wrcd4QAZ1W7gdRtFcGTFhuYeJMHVJNLNtUh8T+F//nuK86KPiKWD4KCsm+i26IxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wAhW53O7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso42093705e9.1
        for <linux-rtc@vger.kernel.org>; Tue, 21 Jan 2025 07:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737472546; x=1738077346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SvugShSkE19vxPC4Zwoh2Wo9A7je9UiUf85WI3sjd/U=;
        b=wAhW53O7riyFjBWzTA0XG3pXPrXy9c02pflKCX2IOu2r5ayrm/fB1o6tVdiz4Zl6ot
         W0mCvl84m0ZlFCNQTEpq3tg3uxym7LUQYzGScOm1vLi+ZNYlFS1fBzEUx39LrY6mU6Db
         dGXdsDqhg4plmXopI8AsB8l3ssoFwCRfS+JwsrgwY9+SMYy2sz9PT+CFZG4SRC0BxeMA
         ITVD5WomLkjxNVRr4v38GdM/l0Sk3wnr9U1maoSy9XNriFsEnoirryNFIDgMFTeLh091
         nSdUFxCKymbeEuqrollzCDUEhnzmiZhLKd+RvhywOjqDhPbXek+3cpDDlECKnYBU4MNa
         qM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737472546; x=1738077346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvugShSkE19vxPC4Zwoh2Wo9A7je9UiUf85WI3sjd/U=;
        b=HrBSxf+DXWJq4FSTzWeUmBYgvVurlM0Lxne4z8hLu39Wr35BUgvChaC6FUQteiDne3
         qZ+JCMagtE1K1H9tJySce7oIomLywtpRFBXANMp8SosUrh8RPOACT12D6bqU8PdGGvCC
         CsPQ9fY1u56zEov5Pxy7xLY6sYm8s8GEofQFUwSjzY/ThJFf6CyikfkEDnsauJU4i7sf
         Q2Jr5mpQhClbCRhTYCgLb3XTSQcaquKoDEdA2F2kQi0pU5VTnheLXkS+QDA+OoTRT+HT
         AI470+xx0wzLwOwS7bFffVpejmkYiRpTCnqjMNbhkhzUG9psCR5TKULSpwMvEhUN90iD
         6pXA==
X-Forwarded-Encrypted: i=1; AJvYcCXKPc5s9B/JVQRiUVquSzC8n366+7GiD5TBT/i90WSdsRzi0g73bhOeS5X1IUBfggYPL4+wGIO3ows=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/kP0byJuqEiK9FAP/ifFEickH76KbZBNGPyFNMgApx7sQAcIW
	FWs1kaPLb8bnNil6zleF62QMRkdcK6pnbdeHHPG/K0hi0F3DxKTG/DmX9aQ6lzg=
X-Gm-Gg: ASbGnct7YqiZBoy/U/M8V31o37c+MHr7/THwgTAcxxQu/fvXC09D94QsfrASkS2Dbgp
	W4Jlt5l81acJJ2W/DUms9ZOkXWYW9ThF30UK7uf/uHNMcR8IN0MyI+ojTow7MXagIaB0FVYb/Sa
	SJ7WiHz8teekoJPuFxSVwCgyZdXJJ90xljZFYZVfZwJlxEYl3w/IEeNCxIMWFGzGctcnXC/CP/w
	Cg+G/cBj3I7PR2wAzk72aYicrOEN8CRDBYlxnwlqeKBczwfAFI9n9s6RPyGs9puTwLgT+YCFQ0=
X-Google-Smtp-Source: AGHT+IGmWQgLP0oShFNos3lRgIKGS81KPZyyyfYAl5Ap+K5h/aBJR8EY+XcHucmV4GzqhIiM28AjlQ==
X-Received: by 2002:a05:600c:524c:b0:435:306:e5dd with SMTP id 5b1f17b1804b1-4389143a66dmr152559035e9.22.1737472546502;
        Tue, 21 Jan 2025 07:15:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890367b48sm182318395e9.0.2025.01.21.07.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 07:15:46 -0800 (PST)
Date: Tue, 21 Jan 2025 18:15:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
Message-ID: <bf81200d-4a08-4ed3-b67b-d2cb1c1df2dd@stanley.mountain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-3-08c50830bac9@nxp.com>
 <a0403834-1c2f-42b4-81f3-ca4123fd2a4e@stanley.mountain>
 <PAXPR04MB8459FB98E6C52DCF3BE76DC088E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459FB98E6C52DCF3BE76DC088E62@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Tue, Jan 21, 2025 at 02:35:59PM +0000, Peng Fan wrote:
> Hi Dan,
> 
> > Subject: Re: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
> > 
> > On Mon, Jan 20, 2025 at 10:25:35AM +0800, Peng Fan (OSS) wrote:
> > >  int __devm_rtc_register_device(struct module *owner, struct
> > > rtc_device *rtc) diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> > > index
> > >
> > c4a3ab53dcd4b7280a3a2981fe842729603a1feb..e0e1a488b795645d
> > 7c9453490d6c
> > > dba510cc5db5 100644
> > > --- a/drivers/rtc/dev.c
> > > +++ b/drivers/rtc/dev.c
> > > @@ -410,7 +410,8 @@ static long rtc_dev_ioctl(struct file *file,
> > >  		}
> > >  		default:
> > >  			if (rtc->ops->param_get)
> > > -				err = rtc->ops->param_get(rtc-
> > >dev.parent, &param);
> > > +				err = rtc->ops->param_get(rtc->priv ?
> > > +							  &rtc->dev :
> > rtc->dev.parent, &param);
> > 
> > This seems kind of horrible...  I can't think of anywhere else which does
> > something like this.
> > 
> > It would almost be better to do something like:
> > 
> > 	err = rtc->ops->param_get(rtc->priv ? (void *)rtc : rtc-
> > >dev.parent, &param);
> > 
> > The advatange of this is that it looks totally horrible from the get go
> > instead of only subtly wrong.  And it would immediately crash if you
> > got it wrong implementing the ->param_get() function pointer.
> 
> Thanks for help improving the code. I will include this in V2 and post
> out after we reach a goal on how to support the 2nd RTC on i.MX95.

Don't do what I said actually...  Let's find a better way.  I don't
know why rtc_class_ops function pointers take a device pointer instead
of an rtc_device pointer.  Or if they did take a device pointer why
not the &rtc->dev like you suggested?  But let's not do both like this.

Migrating all the function pointers is a lot of work but not impossible.

regards,
dan carpenter

