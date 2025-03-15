Return-Path: <linux-rtc+bounces-3505-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2710CA632B2
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 23:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5019C16FA20
	for <lists+linux-rtc@lfdr.de>; Sat, 15 Mar 2025 22:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2EE61A3166;
	Sat, 15 Mar 2025 22:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MBmvZAVE"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBC41863E;
	Sat, 15 Mar 2025 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742078132; cv=none; b=MBkmXM1YjK+8YeQg6rwgnLlgKbsVdjzW5CQN39b+JLlD6Hk4hN6OI1sCERJ1xXrs4wZewCeTCgwfOCh3TvgQ7b+YQdIgsvKCgzohIbfe/fMUfPGy+S8eacOUrCDQZkzecnkWaQANqhxTGudll+jh00PwaQQ+3sdxpC2KjHAZoZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742078132; c=relaxed/simple;
	bh=APHiIY+8YjkreQ56brJKKPgeRYzDpb1lozz4o0qQBkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MZYwiREsGhYLLD4okhLQdsQULtBjHeW3KtHmThwCFxF88D6tWou3nTCitb65MLYDjRuzZkxxwWJM7HQlAVk6bv7NxbTOzxsrA2CSfPnjtNJ5/5Zoc3OO9cjUgRbUh1TUGVx1wBZbkc7InfjpTfxjVPLoIhXkxp6IEJ3e5MYVjRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MBmvZAVE; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e17d3e92d9so23932006d6.1;
        Sat, 15 Mar 2025 15:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742078129; x=1742682929; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i2SkKg6kOtxwoOkWdVxaGHyMDl15IMmbQ5ok+DaJJMQ=;
        b=MBmvZAVEmDSyumxjxz6xqPWeMpJNElNRio4X1ahAZZ8czjQKxiY+ZKDSQoYJa/dVzq
         RO1dHNTGAWKH8CoTN01vphfGgAYQ/NSP9PV5o72jEcpS3UCx4e363bXfLJrWWNAUPf1Z
         Lv4TcYk0oy/26KXyaE+LRoZUzYZoMp/UnnFi7imbxih8YuNkZ0PWVcwj629+LdIQi5oP
         iMQGJ6IzxpGm3QK1x+xkqLpHLBqOMHMVlNmG//HDdx2fTi0N5OfakoEceFYKKbyH6bRp
         MOZBJto+DgXzPP4gGGs1zBCkLp83lFIZQYDKL3KVGu3TNBcvhZ/qGTzGogp5cFB4WQKp
         zOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742078129; x=1742682929;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2SkKg6kOtxwoOkWdVxaGHyMDl15IMmbQ5ok+DaJJMQ=;
        b=asGRAt6LPo6gAvu+Xrb4qufEoPw+ojfZk0TylnDMc7NHfQO6zYcEMinVVw66t8rNDy
         7bmCl5S72bRD2M8Q9StfTJSfeSs001APn7ZyQBjLbG7aRnVR+v30PaC0TtGen1AceSxX
         KA5TSe0psSMDecYYtWkXNDh9NxQtyRTmUXKhvjFmPrcP0wc7IXUaRNp9V7fBSspqrdjA
         wa4DVA88eHLjUAW36Hy/9sD8EYB2ydxt5IpQf4RUw7coK7ZVr1ZNii0/sQqEELdMkA4P
         kiOWSl5CH4ZirXpxWNl6RfepbdjphWmbYxKa18rw9yRvnv3Bn3jUciP6s9krWBt982RF
         aCgw==
X-Forwarded-Encrypted: i=1; AJvYcCV0A9dpG4l2Ik+uUcrO4z1KXYCB3wVfWLIdkJpDisdEIQ6ziFxAADG73S1waTz7vqXDhMOB/VmR5s2N@vger.kernel.org, AJvYcCX1fJZ3AivuTJHs0Y0/Tr2lf4bWGQm9tRL4rjQ90bbER/DJODkXm1fdBqgJ3ktDZ3KXf3ikKUCGkUyK+/ZE@vger.kernel.org, AJvYcCXtmBOm6K7IucrGYIS05Czidf92jOg8U8xiRWyf9e+UymVegZeokPDHgY5tnM3TAor0CXKjoogvhmeO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz10GbmmhiPeDfvepkjkJPm4g9qiSUKOYA+35CR1aIF05zeGqZ2
	5o91NZs9Bp4NuerwYnVcTtMdoppgdKmFzkhAC6hHXHmR/pf39LR8
X-Gm-Gg: ASbGncv1wvnoBSJf4mEed4yBxK5kI6Gakf8jEXVQpjJj/SaCip+e8IZE8paZPyZHUcF
	ZFeI5RWw+Emk3vMYIEMOtDr3rGXjkNNIBJvytORpFySx/JgbQJCsHyxkCEQvWZiMqQBrKIFyJ3r
	z0MKPT+9sDliflxw6YmktzfVLSdynEFhdaC9oYNDx5aGMv1FdtrLlxJp7KDPkdiVUxy1a5RZ/Na
	mmOH4+14lqWwI1ixIgTdRdFTQkgPRF/VOTBUB6C04UIsgBKOP7biyjtonDBgngbw73OQ0n2H+ho
	9UJQ2LoI8cqvPjEV6nsO
X-Google-Smtp-Source: AGHT+IEpEs9MMyWo4UFWnsSC1ycVCKzcnkBsNg5/cf5snQGc8DALFkkPjxGXFJ7wkX+/cV1Gc0bnvQ==
X-Received: by 2002:ad4:5ba9:0:b0:6e6:64e8:28e7 with SMTP id 6a1803df08f44-6eaeaa4c59emr119830586d6.15.1742078129061;
        Sat, 15 Mar 2025 15:35:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6eade24ea07sm39071576d6.66.2025.03.15.15.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 15:35:28 -0700 (PDT)
Date: Sun, 16 Mar 2025 06:35:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
Message-ID: <pnchvojzytndybmc6xjw4gh5kajsos76lq3lgvkjwqtukl2sya@wvmgw7zp4cqz>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
 <a824d6b57ce5a9180a45c3ff65b4b9051ecdc1cf.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a824d6b57ce5a9180a45c3ff65b4b9051ecdc1cf.camel@gmail.com>

On Sat, Mar 15, 2025 at 12:43:19PM +0100, Alexander Sverdlin wrote:
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
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> 
> ...
> 
> > > 
> > >   MAINTAINERS                        |  1 +
> > >   drivers/soc/Kconfig                |  1 +
> > >   drivers/soc/Makefile               |  1 +
> > >   drivers/soc/sophgo/Kconfig         | 24 ++++++++++++
> > >   drivers/soc/sophgo/Makefile        |  3 ++
> > >   drivers/soc/sophgo/cv1800-rtcsys.c | 63 ++++++++++++++++++++++++++++++
> > >   6 files changed, 93 insertions(+)
> > >   create mode 100644 drivers/soc/sophgo/Kconfig
> > >   create mode 100644 drivers/soc/sophgo/Makefile
> > >   create mode 100644 drivers/soc/sophgo/cv1800-rtcsys.c
> > > 
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 3eee238c2ea2..ac15e448fffb 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -22354,6 +22354,7 @@ L:	sophgo@lists.linux.dev
> > >   W:	https://github.com/sophgo/linux/wiki
> > >   T:	git https://github.com/sophgo/linux.git
> > >   S:	Maintained
> > 
> > > +F:	drivers/soc/sophgo/cv1800-rtcsys.c
> > 
> > Please change to the drivers/soc/sophgo/.
> > We should maintain all files under this.
> > 
> > >   N:	sophgo
> 
> I suppose my F: entry is actually superfluous because of the above
> N: entry and can be removed altogether?
> 

It is fine to tell others we do maintain these files, so it 
is fine for me to keep the entry point to "drivers/soc/sophgo/".

Regards,
Inochi

