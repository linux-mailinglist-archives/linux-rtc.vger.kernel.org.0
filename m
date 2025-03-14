Return-Path: <linux-rtc+bounces-3494-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E41A4A60D86
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 10:39:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31BF446087F
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 09:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA8281EEA30;
	Fri, 14 Mar 2025 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNlCXaC6"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F90E1DF261;
	Fri, 14 Mar 2025 09:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945163; cv=none; b=jS7NHnBCYwQUHcySNopBKlQEvwSd4yau+unWk4Q0H/kzR7r/s/Uf5T/57M3yjxITCZz0v7ShdaDejWQCfSor9gjH4SxhvcqysaAmeG2GHaEMRF/yZGXNzW2dHlJ9/sRwgLDDV5NS2ZjwcpuZWzuU1NXG88B5KScQOe+veVNDip0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945163; c=relaxed/simple;
	bh=5QVN7CNT/TzWa0C8un5ji1yuhk1EE722SrLc52k/u0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cs9YM7cGseoN74yDiGpba6uA9L7K8LIgypTbFWLTD4eAd2T9Se3erx3nwzjPXgsKqaSrtGdEOMZWIJmXJm3yvkLFjrK4wAtPQ6yCFtWfRoSApVWVHIOsOZr9yvNgdKU8Q+bNhp0CfAXF1vRVwlzZiyr/jT3Zp87J1DNnetKvnyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNlCXaC6; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c07b65efeeso162829485a.2;
        Fri, 14 Mar 2025 02:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741945159; x=1742549959; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pfevu07Vpa7hwgRCobCYOrdydWkG3wRjRYWAplZ0bYE=;
        b=NNlCXaC6Rbhfv1W6iGf+/ggL60Mw1QQlz0fcmTy30hViZiHe5Fhn8oq/G6FzISUg3N
         jneHDYOYa0Pe/M21EofXUcKpndmcW4ISLmwMOHORmNHj0sN8HGrdHXQTKKw4IMelgCIW
         Q2EqGLpHkxgEjS+Ej397hAADP2RJqzewb3YT08J8xH4PQq15AYFeJyzoI4DENWRvLxQo
         tqknMrM1m8K3bAD4xSE1RksaLXlLLtvqvrZFFxAAMQCchIdE2Lh53Qt+Y9qNin3lvaH2
         wshoaz5aeMdBTWGhkDRF85+sMofOcrkV2xevXDAtnd7beQde1VkndNmR1ibhLuPqp3GU
         DJlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945159; x=1742549959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfevu07Vpa7hwgRCobCYOrdydWkG3wRjRYWAplZ0bYE=;
        b=t6shEwBalt3kG4eWbYEnm8HkYovOZ86waFNIC4co1wuHN4VHORdhyoW5iBd9B+Dc+7
         wU88+XkD0SggHmzxJ5CkkfQ4W3XhvNZpodo9DnJUZMfqeVNrsMyFDQWYN8mdArwIPrzZ
         XGgV8kqMG8w42Qe0Rj/IYq9q7yFMLsF/lnxzXvxMSUM7WhWB3Nx32oI4KgRUVLMFW3mH
         xrW8z2JbMTou/TSYK69I5zOVrTIKY4GaD0sIQHDt2wTTspQLxLclxbsz0wvkvLdyxC10
         4N4suEXUzOH5xb7RmE0wHVVtg7tttuq1iommV6wJ+6BY5QRECUJ+rmiIdfoaLr8a/WeD
         NFKA==
X-Forwarded-Encrypted: i=1; AJvYcCVrQWEBHEnr4aRb19QNub9GzhJlmcZyTB0hltJ92ljKI+glcLUnL0wb5ZPQD0zdG4oM/eBDtzrQmU45@vger.kernel.org, AJvYcCWlbNYbJyabFedQwpwLxCRQzps4vTige+uUF/u2gTC6fSUbj/jc3A6BLJBsgIqQRhUfchyEzzvoji3N@vger.kernel.org
X-Gm-Message-State: AOJu0YweAaJGxpV+X8WvVkTHpbDW6POBOw2DdHqwYTqIEYK1h3ZHFzlm
	Yguwv5eOLoNbIFbPjdqX3WbQEG8LPdqPmy+NFtcWCBlurZ9+Rp+q
X-Gm-Gg: ASbGncuAxfJXeDRX1KN03JHeWvbAgTytooRLL8xIIb9XNzG2CJCxhFUllC3nRcAWjhW
	0tW3lKxZnTsVoeNr1GBEVyng9mqWT61wBy9svLrkx6s4cXGaK2nooySIo13bPDEb0a2dEsFz6G/
	Lr9oaLrANMgnr0jZ9rXPVo4Kh3tifbw1QT+tSSzHIB/G798DYIVcDrrbr/g+saezS0uYZghUZlj
	d9URsJKYUpAhdS0cwAGgn7XB3qdaHOWjTXN078O3DYelFQmoHiEidlxqcE5XsZxgkT4JIIZaq4P
	HB7/CCgUDllDvhNF3WUD
X-Google-Smtp-Source: AGHT+IEvr/9zZBoMHVrdiXspi/YS5RCN+/h43b7k2lH9T05dCKjUpdrZxmZoQRHlNmQ78IiJMl6eJg==
X-Received: by 2002:a05:620a:4386:b0:7c3:d5c6:d34f with SMTP id af79cd13be357-7c57c80ef9dmr226283585a.32.1741945159129;
        Fri, 14 Mar 2025 02:39:19 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573c9c6f3sm225051585a.63.2025.03.14.02.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:39:18 -0700 (PDT)
Date: Fri, 14 Mar 2025 17:39:06 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <r7uyz4hvwxqzl7jv2wo5dll4pckkk4as5zbtc3w3aszpk652ps@nlmadkaorght>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
 <2d1995d39ac050eeb7cec4183ebdb307e520a7c7.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d1995d39ac050eeb7cec4183ebdb307e520a7c7.camel@gmail.com>

On Fri, Mar 14, 2025 at 10:31:09AM +0100, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Fri, 2025-03-14 at 08:51 +0800, Inochi Amaoto wrote:
> > On Sun, Mar 09, 2025 at 09:26:24PM +0100, Alexander Sverdlin wrote:
> > > Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> > > comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> > > machine to control chip power-on, power-off and reset. Furthermore, the
> > > 8051 subsystem is located within RTCSYS including associated SRAM block.
> > > 
> > > This patch only populates RTC sub-device.
> > > 
> 
> ...
> 
> > > +++ b/drivers/soc/sophgo/cv1800-rtcsys.c
> > > @@ -0,0 +1,63 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Driver for Sophgo CV1800 series SoC RTC subsystem
> > > + *
> > > + * The RTC module comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module,
> > > + * HW state machine to control chip power-on, power-off and reset. Furthermore,
> > > + * the 8051 subsystem is located within RTCSYS including associated SRAM block.
> > > + *
> > > + * Copyright (C) 2025 Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > + *
> > > + */
> > > +
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/property.h>
> > > +
> > > +static struct resource cv1800_rtcsys_irq_resources[] = {
> > > +	DEFINE_RES_IRQ_NAMED(0, "alarm"),
> > > +};
> > > +
> > > +static const struct mfd_cell cv1800_rtcsys_subdev[] = {
> > > +	{
> > 
> > > +		.name = "cv1800-rtc",
> > 
> > Make this a specifc one, like "sophgo,cv1800b-rtc"
> 
> Could it be that you mixed up device instance name and "compatible"?
> 
> Please refer to all other MFD cells with `grep -C3 -R -F "struct mfd_cell"`
> either in drivers/soc or in drivers/mfd, there are no vendor prefixes in the
> names.
> 

Yeah, I misunderstand this, but at least please specific name as 
"cv1800b-rtc". This is more accuracy.

Regards,
Inochi

