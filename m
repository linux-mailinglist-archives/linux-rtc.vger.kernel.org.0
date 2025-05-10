Return-Path: <linux-rtc+bounces-4086-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C00AB259A
	for <lists+linux-rtc@lfdr.de>; Sun, 11 May 2025 00:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D7CF3BB028
	for <lists+linux-rtc@lfdr.de>; Sat, 10 May 2025 22:34:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9F8F20FA97;
	Sat, 10 May 2025 22:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSbaeVdp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2965420B7FA;
	Sat, 10 May 2025 22:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746916480; cv=none; b=g2SaBdUWByMcVIrD9P52K6+fUrXVFSOluuaz2+kaui2CDofxUvtmwejXIYPjCBVxq4+dfvpOObi0fhUFFYH1ghmSp/XK4eWcDXk4u9u9auYBgK4Wkur7zeLfcLupeTIRUzrjMyZSjiWlf4LucrZsRSmcJGshNaiae3ZKbamsB1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746916480; c=relaxed/simple;
	bh=VA+r8TlMvQ+zsu8dUJc/GlSJtmFEKUVcH9YdAOj/AH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iyBbgeQvr82o6U57RArw//SGkd8VPZ0m0GIgksoOy1EbEMPnQo1Q7ftGKJjwlhUZb4QKFxyXWelSBc9gJJlQ6lf4fvKQAAoQRJf8Cqqk0L5HQMWgOf+VQ+PBil/dHNSM9mkGm7xiVykci5hIgGbpXXVWHtgkYD2EXGR18LE7zbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSbaeVdp; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5b2472969so358519285a.1;
        Sat, 10 May 2025 15:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746916478; x=1747521278; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X9RqchaeKuSR9tb3CHmzTo6Ss78YKwXAQrXHYWmrF9A=;
        b=eSbaeVdpD/bP+aSc4/b/jEbSu+U7U+zjjKhdEQm3XAOGQWAC7cTk/7jKtx7aaGdYhp
         40GIsjJ2XWdcyQlnBA4T9n8/nTzucfMHJF6kEUOr4eMfw1KAtBgeO4pRd+sZAs0I4gcN
         NkJAm8VaAvcg3KkIQMgGDiBHsRbqPjzxOI05ZHvvGd5h3NSygpA1GSpVRaFb3gnmASxg
         Y9RFNTJiPSTP3VqVauui6eBp1i8uM26vs4KuYNyzrJ0Vts+LnOsYHxyqkGN/rJg6Id2K
         b9f6YAvGramDdPCaHRP+7FIj3378+MK1HclEiSMN6WdQ6eFn64Si4tQ8K8AE79DUUoH5
         TRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746916478; x=1747521278;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9RqchaeKuSR9tb3CHmzTo6Ss78YKwXAQrXHYWmrF9A=;
        b=Om894F2t4avSrHSEMBiRw2qOKDeATzFOLRYuS1SLdTzMoAFsNl7VrkD4jSkAMVLupQ
         BGlIMWTtBqsG/DiCgbaZqist1naZMPpdTpifMGZWl5banLfYJfwWEs7e6dDy15jEExkB
         dUSyDfbemRISNdgIOWby26WhjHW6yAdGAXbLHVWJtD9M11erxNWVXEk79n4yPU5bakLD
         jbqFUZjSw7BAwN4Hht5x/6JO0F6LO8Qm58QTsudqageuJF0TlqO5Gb1tQcCcSJRXuzq+
         jxuNmhyLG53+RZVg6UITPQyI8tIAEJD9kerhyk4+nNlDUx6/3FEqR++6MxgLkU5sDxrn
         WiHg==
X-Forwarded-Encrypted: i=1; AJvYcCVWWuMXvzL980CBPFpdoqelHuTooOx2y/8Lfk6gD2H0p5n3Z0OTDQ7CQvLRnVp/CAvIzbnIk602cms=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXQzBrMKafKsOe6o98zrvPFQ/6cqz+Bckbg2EqDY73beA7m/0a
	6Tr4WrRQXb3T8CAv3YlMFmPb+vK1aOlxtzrnrHDWo0566lSg1bjQ
X-Gm-Gg: ASbGncszY+Y7s7QgLzTXdYpcJuh+vHrqfdj8ONxDlNhfT1/N9YIOOaK7KyBbmdhobk9
	UvehcV/EsST+T7dl+6zJbJoYo5klu/tVHgQr+S6ZvWwVEmkN0hCxiaOTBmy9ST8EaV/U+mGk3cn
	wpO8RY92UnBycZ3ktXyZ4qMC+H7dvh1SutiSu1ap/3XT3TJndTd9pCleZxQ/Xt12boPs6iYRHf/
	5HbtdvarKQSSQ9ZYothx2ZRfdkHeQP/8pmyNNxvpFNzfoODZ7bAmJ0pz6bmPkGoMRv6P7PUJFRY
	M5CalysVcEia3Jf4qzFU8f0g41w=
X-Google-Smtp-Source: AGHT+IFNxZ+WwsD8gTpXkGg65SNCLgE5qlBO7RTMUPiiYfAL7UnFJgwMfjv6YT79wlFJycMs0w8xeg==
X-Received: by 2002:a05:620a:d8d:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7cd01168e05mr1231923285a.58.1746916477861;
        Sat, 10 May 2025 15:34:37 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7cd00ff11d6sm318727185a.115.2025.05.10.15.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 15:34:37 -0700 (PDT)
Date: Sun, 11 May 2025 06:34:09 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15] rtc: sophgo: add rtc support for Sophgo CV1800 SoC
Message-ID: <u6ofni4aabs4jy4unh5nudgm6qieg5hsk3xt4725yiuumlspen@ypery534oe4q>
References: <20250507195626.502240-1-alexander.sverdlin@gmail.com>
 <dm4l3wfcuygmuylz6uqn2g7wztg4tyrjbm24hqcpffjnpkwany@ib2nvjibq2wl>
 <4d15d7b363869080da825ddc700e553a68928c85.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d15d7b363869080da825ddc700e553a68928c85.camel@gmail.com>

On Sat, May 10, 2025 at 04:30:07PM +0200, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Fri, 2025-05-09 at 06:21 +0800, Inochi Amaoto wrote:
> > On Wed, May 07, 2025 at 09:56:20PM +0200, Alexander Sverdlin wrote:
> > > From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> > > 
> > > Implement the RTC driver for CV1800, which able to provide time alarm.
> > > 
> > > Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> ...
> 
> > > +static int cv1800_rtc_probe(struct platform_device *pdev)
> > > +{
> > > +	struct cv1800_rtc_priv *rtc;
> > > +	int ret;
> > > +
> > > +	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
> > > +	if (!rtc)
> > > +		return -ENOMEM;
> > > +
> > > +	rtc->rtc_map = device_node_to_regmap(pdev->dev.parent->of_node);
> > > +	if (IS_ERR(rtc->rtc_map))
> > > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->rtc_map),
> > > +				     "cannot get parent regmap\n");
> > > +
> > > +	rtc->irq = platform_get_irq(pdev, 0);
> > > +	if (rtc->irq < 0)
> > > +		return rtc->irq;
> > > +
> > > +	rtc->clk = devm_clk_get_enabled(pdev->dev.parent, "rtc");
> > > +	if (IS_ERR(rtc->clk))
> > > +		return dev_err_probe(&pdev->dev, PTR_ERR(rtc->clk),
> > > +				     "rtc clk not found\n");
> > > +
> > > +	platform_set_drvdata(pdev, rtc);
> > > +
> > > +	device_init_wakeup(&pdev->dev, 1);
> > > +
> > > +	rtc->rtc_dev = devm_rtc_allocate_device(&pdev->dev);
> > > +	if (IS_ERR(rtc->rtc_dev))
> > > +		return PTR_ERR(rtc->rtc_dev);
> > > +
> > > +	rtc->rtc_dev->ops = &cv1800_rtc_ops;
> > > +	rtc->rtc_dev->range_max = U32_MAX;
> > > +
> > > +	ret = devm_request_irq(&pdev->dev, rtc->irq, cv1800_rtc_irq_handler,
> > > +			       IRQF_TRIGGER_HIGH, "rtc alarm", rtc);
> > > +	if (ret)
> > > +		return dev_err_probe(&pdev->dev, ret,
> > > +				     "cannot register interrupt handler\n");
> > > +
> > > +	return devm_rtc_register_device(rtc->rtc_dev);
> > > +}
> > > +
> > 
> > I wonder whether the rtc driver may need reset (maybe optional) for this?
> > If so, please add it.
> 
> I'm not sure which reset you are referring to... RTC module can carry out
> system-wide resets, but cannot be reset itself (as I understand).
> 

This is fine for me.

> Initially I was thinking about providing a reboot driver for Linux utilizing
> the RTC module but it turns out PSCI interface is not optional on ARM64, which
> means PSCI reset interface has to be provided by the firmware (I'm thinking
> about U-Boot) and Linux will rely on PSCI reboot.
> 

I am not familiar with PSCI, but there is a fact that preserve uboot may
be costly as the ram is limited. I think it may be fine to have a reboot
driver to provide power function at the same time. But if you find there
is a way to implement PSCI reboot, just do the thing you prefer.

Regards,
Inochi

