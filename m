Return-Path: <linux-rtc+bounces-2272-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6BF9ABA60
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Oct 2024 02:08:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FD211C22A42
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Oct 2024 00:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F948AD23;
	Wed, 23 Oct 2024 00:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="iUM+Zv40"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF992914
	for <linux-rtc@vger.kernel.org>; Wed, 23 Oct 2024 00:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729642088; cv=none; b=J/4C35+PWsGBdUIBuq5wtupvBqTGL9GaWmkKisSp7oXG3emVdQ/f8z6J/4sPvp7tD8kNd/HV+bAvvBtHRRzdpMBxmBGl+OIXmZdqIMVeiYe0phLilRKl5SnIOpm0wI/VHiByqr4Qx+2H1MUuAnixXQLIOPOYanXXYEeGdVPr6Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729642088; c=relaxed/simple;
	bh=UQAbXbkOAhARgZFMBQq796mjQiiEE/8JleG3+DUEYcE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQPfxSuZISpmYbDO2RqQCidI7K2yjTHuhpLXiRDiCqhI+ldJz7yOD6vRwAUrLsjF9WSv8Lex1Wesi5AlrJ86E3PmfbelKsj3RhGY4txwFzk07pw7P6XCN4Q5zzqLrD09priep4rRAL6KrAOoZna2YptM9teQMmXmXpITt7tjDrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=iUM+Zv40; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso896210666b.3
        for <linux-rtc@vger.kernel.org>; Tue, 22 Oct 2024 17:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1729642084; x=1730246884; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zvLG7lWTLy4qhLgf8MKM63Xm05WyCgQZoRXtbsojwUE=;
        b=iUM+Zv40D3bWH2+jXOy6E3NmL9IfR0zJ3o4QA/fJK40jNDteNuloUFAWYy+OuZDMSP
         hfpOnHIRjbM7w+0oL2k1HTXIn1FWy8ncZEdEQXTey9uXOjns720UG60yCY7kbpmUqx0C
         rhLskCxwGGEA/NVuAWQphruLTudspKzwsRKdc47h42kyEV4VHKaCLsPvaqVDRQ3vIXFN
         o51w2baJI/0sar000Y+u4y2+rKN39QmdgC4zYVluuG8YCQWDFR8A3s6RvLD9PvFnYavE
         e2gTs+swiFWp/YgXm0YYWGwPRqrc5v1o4wV6egircf3wUoqcGaBFL5mu5DOvQu1woJiU
         DK3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729642084; x=1730246884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zvLG7lWTLy4qhLgf8MKM63Xm05WyCgQZoRXtbsojwUE=;
        b=ApmCObEtaIlUA/XN1ziobmNMttgmDYvGWksW+d9C3+ve1SeAbgnW87ARn2IQAwtz0J
         wThTn4xniDcwVIk5pJQ/k7Fz94odiq9kgwfvvr3GtT+Ns6X2n0bqDVnDwS6CobXPk+sM
         QGTiPVDmiQb1TiIQqxbtIG8KngXDAcvfx1s4g0itQkgXCdX2RdwHAaa4oA+ACn0kvggx
         sQtIUum2S5VgH/dJ99UItyt0aZBZgJlROmAspq5TsHWEzPN2yU0mWiH759mqu/wgCm73
         Ucr1ghcBxtP3pPlJkoRWgLfEI58d6vfu45xjCZMkzH57yuA0pTTbY0vB+q3JZ43TgmmU
         VyKA==
X-Forwarded-Encrypted: i=1; AJvYcCW+ut4YLzxRH4XPzj79LAVjVhBoa05ugTjMxDwHFW8l0gRkd8fEkQkuVpKZs3iMzrO9N8xSjGZWopE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yylt3PBSbcn/AkQKu+SB2bmmoWUPTbgYNXdB4wNWB9Wryv74E6e
	lHGPyYjvKzjWNf6HyItPCAY2AZnIxbG0k0sxRbHdF0fnCDIl8DV2ebH6Q+a2frRQbfvyMWU2ru7
	UfuK6GpGiwMGfvWha80X0tdQdyZKXCIT1vC8=
X-Google-Smtp-Source: AGHT+IF+4QbJlbfikIMGRQjJfTJNafD6q9VcZNamqjkxqlolhdhjxD9HTiMah4nBFKijj+UgfLPf9UwJGerFp7fgjng=
X-Received: by 2002:a17:907:3f1d:b0:a99:3c32:b538 with SMTP id
 a640c23a62f3a-a9abf94e684mr48837966b.42.1729642083589; Tue, 22 Oct 2024
 17:08:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022092855.1609427-1-p.rosenberger@kunbus.com> <20241022092855.1609427-3-p.rosenberger@kunbus.com>
In-Reply-To: <20241022092855.1609427-3-p.rosenberger@kunbus.com>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Wed, 23 Oct 2024 09:07:37 +0900
Message-ID: <CABMQnVLT10=4Y0yKaRj5=wnAr9abTsyPkXmB2XJPfK8CmR368w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] rtc: pcf2127: make battery switch-over configurable
To: Philipp Rosenberger <p.rosenberger@kunbus.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lino Sanfilippo <l.sanfilippo@kunbus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

2024=E5=B9=B410=E6=9C=8822=E6=97=A5(=E7=81=AB) 18:29 Philipp Rosenberger <p=
.rosenberger@kunbus.com>:
>
> The battery switch-over function of the PCF2127, PCA2129 and PCF2129
> have the opposite default behavior as the PCF2131. If the PCF2131 is
> used as replacement for one of the others, the battery switch-over will
> be disabled.
>
> Add nxp,battery-switch-over as an optional devicetree property to configu=
re
> the battery switch-over, battery low detection and extra power fail
> detection functions.
>
> The property reflects the value of the PWRMNG bits of the Control_3
> register.
>
> Signed-off-by: Philipp Rosenberger <p.rosenberger@kunbus.com>
> ---
>  drivers/rtc/rtc-pcf2127.c | 61 +++++++++++++++++++++++++++++----------
>  1 file changed, 46 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 9c04c4e1a49c..812764b65b34 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -48,6 +48,7 @@
>  #define PCF2127_BIT_CTRL3_BLF                  BIT(2)
>  #define PCF2127_BIT_CTRL3_BF                   BIT(3)
>  #define PCF2127_BIT_CTRL3_BTSE                 BIT(4)
> +#define PCF2127_BIT_CTRL3_PWRMNG_MASK          (BIT(5) | BIT(6) | BIT(7)=
)
>  /* Time and date registers */
>  #define PCF2127_REG_TIME_BASE          0x03
>  #define PCF2127_BIT_SC_OSF                     BIT(7)
> @@ -529,6 +530,49 @@ static int pcf2127_watchdog_init(struct device *dev,=
 struct pcf2127 *pcf2127)
>         return devm_watchdog_register_device(dev, &pcf2127->wdd);
>  }
>
> +static int pcf2127_battery_init(struct device *dev, struct pcf2127 *pcf2=
127)
> +{
> +       u8 val =3D 0xff;
> +       int ret;
> +
> +       /*
> +        * Disable battery low/switch-over timestamp and interrupts.
> +        * Clear battery interrupt flags which can block new trigger even=
ts.
> +        * Note: This is the default chip behaviour but added to ensure
> +        * correct tamper timestamp and interrupt function.
> +        */
> +       ret =3D regmap_update_bits(pcf2127->regmap, PCF2127_REG_CTRL3,
> +                                PCF2127_BIT_CTRL3_BTSE |
> +                                PCF2127_BIT_CTRL3_BIE |
> +                                PCF2127_BIT_CTRL3_BLIE, 0);
> +       if (ret) {
> +               dev_err(dev, "%s: interrupt config (ctrl3) failed\n",
> +                       __func__);
> +               return ret;
> +       }
> +
> +       ret =3D device_property_read_u8(dev, "nxp,battery-switch-over", &=
val);
> +       if (ret < 0)
> +               return 0;
> +
> +       if (val > 7) {
> +               dev_warn(dev,
> +                        "%s: ignoring invalid value for nxp,battery-swit=
ch-over: %u\n",
> +                        __func__, val);
> +               return 0;
> +       };

Please remove ';' .
Otherwise

Reviewed-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>

Best regards,
  Nobuhiro


--=20
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org / kernel.org}
   GPG ID: 32247FBB40AD1FA6

