Return-Path: <linux-rtc+bounces-3493-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4F7A60D57
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 10:31:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E4BF16EDE0
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 09:31:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B091EB187;
	Fri, 14 Mar 2025 09:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EcwOuobH"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940821C861D;
	Fri, 14 Mar 2025 09:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741944684; cv=none; b=Sc19Qrm90aEyAkU2YC+frFzh1vEHwGFg74VVvN9sVl3UPKqeBSnQUdjNHyDXIfW7n9+HbjBrbMZvfYrcodbu0PNFc4a9hUemJeK3kbsRe5ebBOQiUl0bkP2q4GelDPvXH/A5TbvK+iCm3hEs1Hb0ku30P/8wmxjwz+zWkAQtyzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741944684; c=relaxed/simple;
	bh=EFG/RUQsEPWHQayDu6FgBejS5LjvkZoTkpo4V8Q+rn4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aewe+GiFk8jtq6Fe4msEbpNOq/GXt1K9I9qI2P6zh7wMZWYdDuKCMd1mQn6pjjjTeOijorh+2aocmOcML/mGLHCzWjynpY/RhWB/gtvSsbyOAg1+lEr7C217zhFzN3vq24aMMNVWX13rymFPqKZErUk62uCH2ocW4hXsK8WpsvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EcwOuobH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so12436135e9.1;
        Fri, 14 Mar 2025 02:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741944681; x=1742549481; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DgZq1Cihy2mEZuEesHcsZ2TIpT7DRI6TgV6LGAhY23M=;
        b=EcwOuobHgJI5yddMSiPDxZTR9B8CEPFXzwkQKUA8p4qBDfBcNXeK6xTqbNN3kE9xKF
         8VPgAeiGWz89A2Cb1d5XsRtbziNWeeFmaSMN42c99clFIKlqr1SyOZEEEPwyL+JbPP/j
         DfZHFCWX4tdftL3wYcb+nzeNDBQ85xw69ore/c3afGPDGXP3toCHgJmVRhwxA12f+5Cq
         Aofj2vJ74O/abtedjmvPhRRBqEpzW1RByPwjC8hqLIOK2NXmVajDVz8XyUovxZhHm56d
         lKvo6C/NppLlxpcRcpaH0KVGEI/4Cc2TE/g0hnyy3Jt+aAIrIticKo6v6lxSJ4Vl4HH8
         wquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741944681; x=1742549481;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DgZq1Cihy2mEZuEesHcsZ2TIpT7DRI6TgV6LGAhY23M=;
        b=xDsxRkMvIpt0yjXT/o4lDk6ATI9xFb/StyGZIicZhdrKaTGYkPef+dQn6PjojG/p+D
         jMub8a9i5fEA1PxZQdbpW6lMvO9RxMkv5vfON8b5xl4gIlbOmOkT7EZ4U4OOhkJ6n4oi
         LLQBmq+zLZFfiEsmh2Grzq03VVo04R+pKTDtvDHBm8/448ZIVdy3QY+CiJP/7UKbhjoW
         AW9pSsgspjtC5caGdillb2a5RNafM8Jx5y72QOegkw5D+tCH6+zkiSIIiCZv0WRBMtOr
         C2dd0+qbj4etcy6ZVn9wk1GhW1ohERaZPnScBrg+l1zIdVBYC0U4GMfuAyCivuI1+68W
         a+yg==
X-Forwarded-Encrypted: i=1; AJvYcCWoXr0gVZSyXrocDUtg4nbX2wyhNgMhTd/KUWJtGLoESh/4uKEUi2PCmTOzXssPUfcx+W7qYEdXGptS@vger.kernel.org, AJvYcCXQtFyXv85y1I1Yq3WOVPDinmAO04PcLEJ3VdyyoBg/knJqc59hZIR1M4I0mceNfNmlbhXLKOIM8dgg@vger.kernel.org
X-Gm-Message-State: AOJu0YzvPPRlIFsvXunNLKbkdojhZ3XsmfCdoGcEY+ZUogTg0fcJx9CJ
	Q4vLLJiw87k/qgyiGfsUwj43TysJUvx86Q6FmQjPuYADx9cPEWK/
X-Gm-Gg: ASbGncu/iOu6LRU714glmIA1u36gpXog99fZGrqxM49Q+p5OwGi05h1YFlIrHGqc32S
	onmqpSrFTqlHoRHnryRMfSdzZqJWE5U4nHftg0jNIS7c6SEUIpcg+dyBCP+V4tjtr1PeboRKsVb
	7o+h5YTEoiKidWSdAMfTRP/TlqRxjL2oaZ8mCDkJa8U1qQIjF/oF4PgIJS8TjvuEG5WejimwBu1
	iWOdbYMgBP2RvrKdy2yHVPmvYk+65MGr6Y9LX1Fo5/dApOx6LmFl+1Qu5NxlysSOlCUb5eYirkn
	cjjUbAN+yTk6MFkVqhnMMQt/m7+FpkRoD6/Wlsf9sITW9TdALKHwJctDQDS80g==
X-Google-Smtp-Source: AGHT+IG0nQfUihbWpCEv6X5UBbk7/FaQ6P3azQnp23XNoCBldqucN5qWH0TKNQJOpSr3KZzsS8ZAgQ==
X-Received: by 2002:a05:600c:1c17:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-43d1ecd2d21mr20134765e9.27.1741944680525;
        Fri, 14 Mar 2025 02:31:20 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffbcef5sm11197635e9.9.2025.03.14.02.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:31:20 -0700 (PDT)
Message-ID: <2d1995d39ac050eeb7cec4183ebdb307e520a7c7.camel@gmail.com>
Subject: Re: [PATCH v13 2/3] soc: sophgo: cv1800: rtcsys: New driver
 (handling RTC only)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Fri, 14 Mar 2025 10:31:09 +0100
In-Reply-To: <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
References: <20250309202629.3516822-1-alexander.sverdlin@gmail.com>
	 <20250309202629.3516822-3-alexander.sverdlin@gmail.com>
	 <fuc5zzq3izowktmafrhy5vkjddydxg5673ggr64ukh7v5knjmi@r6xozjxcw7r2>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Inochi!

On Fri, 2025-03-14 at 08:51 +0800, Inochi Amaoto wrote:
> On Sun, Mar 09, 2025 at 09:26:24PM +0100, Alexander Sverdlin wrote:
> > Add driver for Sophgo CV1800 series SoC RTC subsystem. The RTC module
> > comprises a 32kHz oscillator, Power-on-Reset (PoR) sub-module, HW state
> > machine to control chip power-on, power-off and reset. Furthermore, the
> > 8051 subsystem is located within RTCSYS including associated SRAM block=
.
> >=20
> > This patch only populates RTC sub-device.
> >=20

...

> > +++ b/drivers/soc/sophgo/cv1800-rtcsys.c
> > @@ -0,0 +1,63 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for Sophgo CV1800 series SoC RTC subsystem
> > + *
> > + * The RTC module comprises a 32kHz oscillator, Power-on-Reset (PoR) s=
ub-module,
> > + * HW state machine to control chip power-on, power-off and reset. Fur=
thermore,
> > + * the 8051 subsystem is located within RTCSYS including associated SR=
AM block.
> > + *
> > + * Copyright (C) 2025 Alexander Sverdlin <alexander.sverdlin@gmail.com=
>
> > + *
> > + */
> > +
> > +#include <linux/mfd/core.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/property.h>
> > +
> > +static struct resource cv1800_rtcsys_irq_resources[] =3D {
> > +	DEFINE_RES_IRQ_NAMED(0, "alarm"),
> > +};
> > +
> > +static const struct mfd_cell cv1800_rtcsys_subdev[] =3D {
> > +	{
>=20
> > +		.name =3D "cv1800-rtc",
>=20
> Make this a specifc one, like "sophgo,cv1800b-rtc"

Could it be that you mixed up device instance name and "compatible"?

Please refer to all other MFD cells with `grep -C3 -R -F "struct mfd_cell"`
either in drivers/soc or in drivers/mfd, there are no vendor prefixes in th=
e
names.

--=20
Alexander Sverdlin.


