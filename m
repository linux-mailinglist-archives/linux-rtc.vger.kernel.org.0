Return-Path: <linux-rtc+bounces-1657-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDD3943503
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 19:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CA561F23718
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 17:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 530A81BD01D;
	Wed, 31 Jul 2024 17:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVglhXZQ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B881BDC8;
	Wed, 31 Jul 2024 17:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722446887; cv=none; b=IAQJ4u2SOwcu1Tjr6kNRPi0g61yjfR6C1sA3xdrXm3KpGDxFG4WswuTJM/7YFpOTXVzb/WNu9RXo8CoMG4M+TCtlPeubp/BzzLlIQ+0GEQ4VM0KuBgEgM3DJDUDkiTmXCJmLQSkiGDGK5yFSM3QJ5PEGAvyJbHGTZ3dU48xDkCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722446887; c=relaxed/simple;
	bh=v42xTc0oCCwicMaNmmOfMJfqEsCKrbNyJaEIMbAOXxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GmAkDb3tUMKSWAUm9EMcUTC7zTPUz8YpAh6397Xt1FFAOY4soIBniNnOB7Zj7u9auAfs9hBb6bl0IuevEyBWBxRWeG0K7X9vbGJxPiZU8RUlbTlVJxdrAfGLl1TaWBW+VIHVzG3uENRUB+Itl7BFekdHbnAf8O8+VLue1c2rnnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVglhXZQ; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3db18102406so4241339b6e.1;
        Wed, 31 Jul 2024 10:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722446885; x=1723051685; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DRt+wirySSP/0rxSfCYSdxmXJCuEIe74VBuQeagotrY=;
        b=gVglhXZQKliekxy96S2497VCmm1G+vBf5iOrV8qxr3OTDgHvJrv8A0fDY4T65qBV9I
         TTPfPJKNxt2wvs4ywBORjp45l2K2ai/YT8dzepY1rBKfq0LAmQ8AhyRNcd8XxEFNwJOR
         m/I6Ljbgg5LhIKsbYlccGAqNwictf9nGiAc57k41Eb+vIRI2V5oz3FgPhMEcSooXc5c/
         LZ6NCP6kj/6cboLiDXiTvEBZdfRNfwqYQQbZMSuzxOpOg10AvIar45zwkiUj1lpI4A8J
         C5ZpFq2CIbLH/8KHLlSNnmkwhp96XSSG4EJy/81Jox9QlDu/aJ+iGE4RKBA5jHXB9uig
         knaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722446885; x=1723051685;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRt+wirySSP/0rxSfCYSdxmXJCuEIe74VBuQeagotrY=;
        b=vSVR/+Vg9mpqmVzVvgWJWJBUgxMNQbGohZd0LcAYfF33jfifnN1RKF+U0tCVLwUHPr
         ssaHqogWv4w8hYduDjXc2vwgktvaPtX7MXSthJ7MUoYOXVWpsMBIm3sqYZfZCaCBqxlF
         ABXwnS3vGuroS7gIo+MO9a2/Km+ypJuoP/hEBh4WtVHZlqOByxlJ2pWe1CCiidV8VA68
         3fRCC4VzhnBuU7WEdFEvO3yUsCU7cWK+YKj+HP/7lDgFuQVmK5cHNscAqgvjPC6VFet1
         I+seaBqbzvS3mWJERjeNxbo0NVfqHgeWqDb+NKHVX2wBIXnlcBKux4QWYjEu0VE0GWRw
         Q1vA==
X-Forwarded-Encrypted: i=1; AJvYcCUtE+CW0+8RiFqCFxVwec+5Piq3Qjr1toD6qYBF1JMFZQn7Ec9VgbarPEf+6xUH/3/F8xxH3hrWHJZvW0C7deK6YFgJHJ92jCAuGXuRjWu8Eg7M0JRmb8lGvSkbpNcLSJZXjMMpKzCFMwjvXIR3yNsfQvMgSqV1BU3IjV/VdUOwElZg5VCSSlkKPt6gHPEZemEMMzhkxuagwdwFUlRLpsZ/nTJ+e+7DPUXwhrhK2n2jXukqxAhDUhuUtCU=
X-Gm-Message-State: AOJu0YwKWvIPX199zQ6/6U7UoOppTOYthIyv8RkbrHipki7aUvhJhnmH
	JfNk08NtjbNXEWlNi2/Q8c9f0yhWhCNM44dLCGFvC3gtYnjgVx5q
X-Google-Smtp-Source: AGHT+IFJbEbhXaPmjuoxCmR+/hmNt9JvEc6afSJEmUV9Ud116y5IbhnecHFxJGgYOSL+laQhmm8OlQ==
X-Received: by 2002:a05:6808:30aa:b0:3d9:4147:4e38 with SMTP id 5614622812f47-3db23cb417fmr16579228b6e.36.1722446884744;
        Wed, 31 Jul 2024 10:28:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:1da7:72de:e91f:aa85])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f8273af7sm9200866a12.30.2024.07.31.10.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 10:28:04 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:28:01 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM module
Message-ID: <Zqp0IZfUobg6dq8G@google.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
 <20240731-imx95-bbm-misc-v2-v7-7-a41394365602@nxp.com>
 <ZqpCwOhXiLzxK43-@pluto>
 <PAXPR04MB84598B36C6721748FB98905088B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84598B36C6721748FB98905088B12@PAXPR04MB8459.eurprd04.prod.outlook.com>

Hi Peng,

On Wed, Jul 31, 2024 at 03:37:18PM +0000, Peng Fan wrote:
> Hi Cristian,
> 
> > Subject: Re: [PATCH v7 7/7] input: keyboard: support i.MX95 BBM
> > module
> > 
> > On Wed, Jul 31, 2024 at 08:56:11PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > The BBM module provides BUTTON feature. To i.MX95, this module is
> > > managed by System Manager and exported using System
> > Management Control
> > > Interface(SCMI). Linux could use i.MX SCMI BBM Extension protocol
> > to
> > > use BUTTON feature.
> > >
> > > This driver is to use SCMI interface to enable pwrkey.
> > >
> > > +}
> > > +
> > > +static void scmi_imx_bbm_key_remove(struct scmi_device *sdev) {
> > > +	struct device *dev = &sdev->dev;
> > > +	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
> > > +
> > > +	device_init_wakeup(dev, false);

I do not believe you need to reset the wakeup flag on driver unbind, as
well as in the error handling path of probe(). If this is needed then
driver core should do this cleanup (maybe it already does?).

> > > +
> > > +	cancel_delayed_work_sync(&bbnsm->check_work);
> > > +}
> > > +
> > 
> > ..so in v6 I asked you to add a cancel_delayed_work_sync() on the
> > removal path, BUT I missed, my bad, that indeed above there was
> > already a call to cancel_delayed_work_sync() associated to a
> > devm_add_action_or_reset....so now we have 2....also you should try
> > not to mix devm_add_action_or_reset and plain .remove methods..use
> > one or the other.
> 
> Thanks for your detailed reviewing on this. I will wait to see if Sudeep
> has any comments to patch 1-4. If no comments, I will not do a new
> version to this patchset.
> 
> If v7 patch 1-4 are good for Sudeep to pick up, I will separate this patch
> out as a standalone one for input subsystem maintainer.

If you remove the duplicated cancel_delayed_work_sync() in remove() and
unneded device_init_wakeup(dev, false); then you can merge the input
patch with the rest of them with my:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

