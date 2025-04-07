Return-Path: <linux-rtc+bounces-3823-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF1A7F108
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Apr 2025 01:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E18941772E3
	for <lists+linux-rtc@lfdr.de>; Mon,  7 Apr 2025 23:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91BA228C99;
	Mon,  7 Apr 2025 23:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJI4q2tG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330971A3147;
	Mon,  7 Apr 2025 23:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744068897; cv=none; b=e13yDCteVoGC/vrwA8wrfq2etVwKpZ+vgZ3s59l66+dGmA5HULMDSPuqfumRukzDgQSR57TpJT7MxTcEknVjgU/V3HmaLmrUe0cJ3wK2VVGAp+EfIXX2Pkookc+xg8KPpSrNDigI8CnaJNWxIE70qhw0tT6rM0e4Hm3zwpwMP50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744068897; c=relaxed/simple;
	bh=HxTLhR5YyazcUPD3RztBrMcbn+ygyOpA405ju0k0ryc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jKZrZHXajvIZiEC07tib69Xi6q4HAdXWWWp7jOhYup89QQwvPtrRr6eBXcy1/fPuIHw5RlIc0GQ/4DMEU91auzhdeUF2MpActdtOz4AGgMk5gSPHPWd5I0/FT35yNQqtUtetHGn7oENttkK1HwO7BgJadhER3jG+5XJsbZL8EzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJI4q2tG; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c0e135e953so475477485a.2;
        Mon, 07 Apr 2025 16:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744068895; x=1744673695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpdIhZyR7Jkn/zvOFh7pNcs0X66PCzAzcCsJZ749W4g=;
        b=ZJI4q2tGzyCVhOY22dcrqFHH9iL+Bm0K7WwjZ7cII8MFKLmpqoIyru97oO0hr7a1cH
         Jc1QtdwScJtv7c3QLJ1p0bMUvlpW9zFmgYNYNLcn7SuVkyNjQ2PQzAk4OyQzX3yL3yiC
         3K1Ssyk8JBDNab9NsbMkBWV0fRMmswgQtcLL4pSgs06IXmDfgkkNUtyb+/l0yDjJEBb7
         SMvrf28iatFbdq3pwd936airqDS9MlK8drjjgSzMQfskNi/5OZfpy/pjRMY3MY+Dx2ZM
         jJVPxePtREYHasmNbIrQ0+qEjkQQgSzSjxO+HG9LFvsd08MEOAU+UD7B9Yf+TCt3Fx6z
         YgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744068895; x=1744673695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpdIhZyR7Jkn/zvOFh7pNcs0X66PCzAzcCsJZ749W4g=;
        b=VPsPsCv5VV6LnGa7qMlNxoK6w0Jcv726/aTE6CSZRgcCJjT6wIVYDV5vqwl1fsUSja
         NwgGPZq4es+pOOOCMmKw9FqHEH8vofts7fltEUbHsPRTyrx+DCRZQJPrK4I0e0jZXUO2
         fJFOKtEST2M1/NOEIO1jk+8KUmz99H8TZXTTtlN8pOUpeC3ZjjVCV1a3kbDo7z0L75BV
         Um6QOuxyXbWZxRFNEruv/+KY8F6lfz76MsxUxWKgvoLFl9qR4tNkIiBr7JPZnQ4yIqtU
         WgWpqKO/SrNNQUcim9JoPiSJIlnhKZ+pghRAEK0awCMD0+BkoorZq5Upy6XJ8y6YlBgb
         Wcpg==
X-Forwarded-Encrypted: i=1; AJvYcCV1MW+riU045RJOUuUMbw/LXhSArXgMPWTBn5HjEIScQuT/3g0RRRl88ei7WyI4egXT+LH7K/Ma7Vfy@vger.kernel.org, AJvYcCVUMfzD4yBN547Ys2gONxZmlxAHLE+0N2/qCATKpKdTBkqmtxCbiKLkbJqxAkVgTagdGVM8AX4pu+OvvZyj@vger.kernel.org, AJvYcCWH2OhxFzweq5/Zy07u+IpKVXUjuSONSdAmK1NQ1lPgyYwwvB4foIV9AfravWosoeIXdbEdC/u+B2eC@vger.kernel.org
X-Gm-Message-State: AOJu0YzLCMr3y3DwFGb4Rf0BVNL6f8t4VYaLDsTxVmdGm8rcPGqv2Fw8
	zs+UdE363qxrWnrLV+29BneJt7932f96Ded4fVWiV4f9tSEcEFYA5OqMf/9q
X-Gm-Gg: ASbGnctgYxIW5zUjsrgw6tluoxj4MvljGXR/WxBWA/yJF154PAR+2/7X8Opn7iBK/+b
	3pdUikzW228bOIVnAz4Q8nCJUlZbDBYNp9TE9WS68Myrmnw2n1XcGY2yq+PfAq0/XnvGVsrtAAa
	OlSQAViNvVUMFmAvcKrrSAayc/gSrKAD6kLvY0uNaq/VdanHpnsuzSyZGiJOcg34U5aIELMdHXj
	u5mOx+Bl1pskp29lF4l241iwuAxhn4zJ4C5PXpYUaXbXv8prDeJlVh1PpWNON3u+eeBbbJ7IE7+
	AZ/GoKwASEKxHIVObRl5
X-Google-Smtp-Source: AGHT+IELDfTjNUKlfaY71qFiTkaQeFH6uko8o6VC0/566T+WMs+1ocO1EyyVXl92Tw31XsERKCllmw==
X-Received: by 2002:a05:6214:212c:b0:6e6:61a5:aa54 with SMTP id 6a1803df08f44-6f0b754cc60mr157396126d6.44.1744068894916;
        Mon, 07 Apr 2025 16:34:54 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f00e585sm65551266d6.27.2025.04.07.16.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 16:34:54 -0700 (PDT)
Date: Tue, 8 Apr 2025 07:34:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Arnd Bergmann <arnd@arndb.de>, Yangyu Chen <cyy@cyyself.name>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 1/3] dt-bindings: soc: sophgo: add RTC support for
 Sophgo CV1800 series
Message-ID: <tay4sxc6vx3lgwywlz3nefxo3tlkj2lm6qwdozogz5agao2djh@wt2qtruopmy2>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
 <20250309202629.3516822-2-alexander.sverdlin@gmail.com>
 <vxjtdvy5vxhmqldgvt4mgeuor36gdjriiai7y3rej3tevuwisa@wpupxzhvc3tt>
 <a691fe4864debf7592010bc892066beb439c1740.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a691fe4864debf7592010bc892066beb439c1740.camel@gmail.com>

On Mon, Apr 07, 2025 at 07:29:37AM +0200, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Mon, 2025-04-07 at 09:09 +0800, Inochi Amaoto wrote:
> > > Add RTC devicetree binding for Sophgo CV1800 series SoC. The device is
> > > called RTC, but contains control registers of other HW blocks in its
> > > address space, most notably of Power-on-Reset (PoR) module, DW8051 IP
> > > (MCU core), accompanying SRAM, hence putting it in SoC subsystem.
> > > 
> > 
> > I think this is a mfd device, so why not moving this into mfd subsystem?
> 
> MFD is by far the most tricky subsystem to get into [1] ;-)
> SOC looks much more realistic [2]
> 
> [1] https://lore.kernel.org/all/20250306003211.GA8350@google.com/
> [2] https://lore.kernel.org/all/20250303-loud-mauve-coyote-1eefbb@krzk-bin/
> 

Cool, let's keep it.

LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

