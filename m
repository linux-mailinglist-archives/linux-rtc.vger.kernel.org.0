Return-Path: <linux-rtc+bounces-2227-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57DD49A2057
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2024 12:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 750271C225CC
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Oct 2024 10:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3914F1DA636;
	Thu, 17 Oct 2024 10:51:48 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F811D0BB2;
	Thu, 17 Oct 2024 10:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729162308; cv=none; b=eDQQOanlC3GMT00YNAeYDE0jJ0YuX4YehK6vzQFfg7rDKjpApI2+Q5QSyNWZ0fEIzjiXjZ0PPaj39Jd73gpnSuSGI0KaTu3Tr971QRVhuyOOtr95lyHynPs4XqPcgh7xeD73lQdOwOY1f5i9ScfXCXNVFKF5t67s6uZ8k5Yx9u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729162308; c=relaxed/simple;
	bh=zY+uk+aAatDZlz5Cn7VpJu+Jnxu/LfrViXi9cxr5PVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MHDhDMI/gbmv67U5EEX8KZhrBb7BBEXB+dHPALmhzUlRP1C8tH3SmMYKFzRSTa6I7g9vZl/4VI2XZACzkSsZSflP9+bDgydgyBEEIejz8PgpHaUaXN6IV78hKGZiy8MbvM8Hp75ea/vHHQX4xtJ/O701W4vxRGrFYfq8Vrnyx7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e3881042dcso7640897b3.0;
        Thu, 17 Oct 2024 03:51:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729162302; x=1729767102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c/Rn5aCLNvGx9gUSZup2cfLF7KXibljCJu1/uoo9Dyk=;
        b=q3SfAaGP50rFu6Qxg/eNU4HWooIGpB4Zc3ATn4IgVWjKU1dAGKCxidF9oiQv5QMMho
         8WkPlVibPRTg+rmOPqmNxcbCg5KJU+hyhsI48pHYA+Kc5iktFnSjDNNwsAyKPb9raCO3
         z0gSwSHj+OIc1gp68q4JfdDqL6ASEbBElZXIIVC8xwxtj1rkZ9jVQyk0oE/BLAN36YO0
         mPxU0JRPibz1kf68KcJFpAGfDeh/kaxeJlEwjirSqO7kTTkzN5oGXA74k0kwrDrEuHpS
         qnijZsjHQk1m4zlaqZt0uVljRwYwnR1iWjvr654J07NFL6FO6UG6a/4BI7E8XIhEdLWR
         +/tg==
X-Forwarded-Encrypted: i=1; AJvYcCUzWIvkCMYhKD8PADUouObFi65EpFb43mlK7LXkr+TT7otR1L3jI/PqOasV/chZJLR6wvjm4yapx7QK@vger.kernel.org, AJvYcCVr4D5PJjKgWZj3Utai8HV7S1/B7QyjwNQ1H5HNxSYAtl8uKZ4EMyIOf+v7XTroc644jxt3u55jHnwI@vger.kernel.org, AJvYcCVtPkPQwBEglhzsIA/ns3BVWA9IxATo7/l1U+yeLQRx96j+SGfvj5/D3ShFY3UBKW4Rm095tXcswGtNnH2jv3j59eQ=@vger.kernel.org, AJvYcCWEmupHMOzt3iz2v1GtiY1l0U/4aL3Bsau1ZklaHxP69BHRv8hyuh6/orAn/9uyGekW8pF7qSafZCX7Tdjl@vger.kernel.org, AJvYcCWTsHaBigY0PKMSAgXawx5AZJ59nJ/qQcLv7ztmoylNcZtAk4hFdXg+Ladx1PRwhdt01Bj8lw/CWvbQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyWTbRGYbuOVHNRslGH8dZndmCSXZEyaFMVHIUT0tm+r8iMRxj8
	skpt1nsupYwVmQjco4vd0hSyixOFZSFxyLB+PasfjFZ/A74rITPBupKH6K58
X-Google-Smtp-Source: AGHT+IFDpSqaCjwH430C3EskcPu0kL3fJ4p0fhvy4MvUi7Qd+k6V9CYO7McrD5KeIRiX2ZbniJX2cA==
X-Received: by 2002:a05:690c:9a06:b0:6e2:313a:a022 with SMTP id 00721157ae682-6e3644beaf2mr169032807b3.33.1729162301954;
        Thu, 17 Oct 2024 03:51:41 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e3c5d2625fsm10647557b3.126.2024.10.17.03.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Oct 2024 03:51:41 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e3cdbc25a0so9680897b3.2;
        Thu, 17 Oct 2024 03:51:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU5XTy8+QUMm7LSgg7XW4TFLv4eg4OnLOJ1n4u7wMX+7WfylC9XlFbYf2+3MKFBsdie85AM+JGmvZeu@vger.kernel.org, AJvYcCUZlcTOPc3Qate9WyWWwotsia3Vd1C4nmNd+z+7dL5uKgMRl/D+pMAr2Mz1/cPhxTEjNhBclMvr/BwM@vger.kernel.org, AJvYcCV/1Hau++gFQWBHLnzaWQT413dJwDk7gYh2Fkapl2axeTIa/IB8Z7qwXiHo/oXAw59iikuRZGu4/aB05ru2@vger.kernel.org, AJvYcCWacTaFYB/OaWH1X7mTU2R5OoGFvat/hvUuJkOOVH0YZgD+ox2L9twQFih+IyGv0PrR1+G/RXatXEng@vger.kernel.org, AJvYcCWrojFNDlJmionZ4rt3APR9Pm2eXspPNUZo/pXNGdlEUTcqHydrGy90YOJqahHFjJt2LUxxdK/4fg+xU8R6WY/IQKs=@vger.kernel.org
X-Received: by 2002:a05:690c:ec4:b0:6dd:d1f0:d433 with SMTP id
 00721157ae682-6e36410a243mr163635487b3.7.1729162299930; Thu, 17 Oct 2024
 03:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-7-claudiu.beznea.uj@bp.renesas.com> <ZxDqzeA2mz0Ml6cZ@shikoro>
In-Reply-To: <ZxDqzeA2mz0Ml6cZ@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Oct 2024 12:51:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU=o0MzQUoEs5-HrEVP-snXN-hUef1K3U8Ppj18P6HVCg@mail.gmail.com>
Message-ID: <CAMuHMdU=o0MzQUoEs5-HrEVP-snXN-hUef1K3U8Ppj18P6HVCg@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] rtc: renesas-rtca3: Add driver for RTCA-3
 available on Renesas RZ/G3S SoC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Oct 17, 2024 at 12:45=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> sorry for being late to the game. I just noticed this series and
> wonder...

> ... if it has been considered to expand the existing rtc-sh driver? The
> register set looks identical up to RMONAR. From that on, it looks a
> different. Maybe the different offsets and bit positions could be
> abstracted away by some sh_rtc_{read|write} helper? Or is there some
> other new handling which makes re-using rtc-sh cumbersome?

Yes it has ;-)

https://lore.kernel.org/linux-renesas-soc/1c733190-bd46-43d0-8f3d-62e0ed5fd=
e42@tuxon.dev

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

