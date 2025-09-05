Return-Path: <linux-rtc+bounces-4846-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD040B45D4B
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 17:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 743897C0ADB
	for <lists+linux-rtc@lfdr.de>; Fri,  5 Sep 2025 15:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7BF31D74D;
	Fri,  5 Sep 2025 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="caWUVDQi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A1331D74A;
	Fri,  5 Sep 2025 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757087912; cv=none; b=gJxXv9u4yzkue67JRMCzVd0FLcGL61OJuq4V+t+M0NdiuCeUIMkqRTTz3LCzulqdTHoF0i1eZ9BTSdQ/oWsPNtQ9iVjm2xkvFCuju5eHzXx4qPFnw7A86P/eqeATS7gbP9fLSfM/EbsQXObb0VLy1giD5QW/JgycYKc2Xu3lNhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757087912; c=relaxed/simple;
	bh=Gkssjx7P/bAyz0VtCSvr9tXr9DYbBcgRRMnpcZszQzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cRL5/mPzwsRn+fXXzKpFzYpovWLav2T7Z19lTFJv0Vsm5e/Jhc6SuA/ZmKC3GVkbiMLkUq3QchbN+NfvcZgetWlq8M1GV8eslb0VxFuq6SYbemwNxDREoekRMD9co6agmkR02lDbsZHZme3AXCCkaJdA4liA1wC2EpDoknGkB3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=caWUVDQi; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7238b5d5780so30070697b3.0;
        Fri, 05 Sep 2025 08:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757087910; x=1757692710; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uyr/he5D9kITqeXJFA1SSytjH8QVrJJ6K4/PuDRtOx0=;
        b=caWUVDQirW2wvJ/8W0uYFNwTwUJO5yJvm0Jnl1XiVImjdIiDPlfdjcZ1SCwaxRyvVh
         BIKQ7cUxeycqeHGwMMrQZ8RxzeU/ZbEgH9lhKoMpy8VfeKBR/gB5LM9Y+hkBAlAVj9yr
         /Po5cE+LSxiIIEvFkmcI84cPi7A4qOMiCcId7S95oJNNgjNb2jzWbsPyxcJON5yT2aXL
         DPqO19hKIAK3gg6tRUBYv8HafLQb2Mg0UUKjrUqIPmQKGKZ5FK5ym76Jb7LqQh76FPRk
         WkoQF3c31MdCX4S5HCTWxJSF59AVXF1pc+DBU9iVdcieKs82N3uhkEL4aw8j3iCous67
         Rffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757087910; x=1757692710;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyr/he5D9kITqeXJFA1SSytjH8QVrJJ6K4/PuDRtOx0=;
        b=QnyWav3RRWDxiHONKxRbI7bcbTiL/C5i3TosO9bW1NfcynX3+ea5V67nQJtjFGZUwx
         GGSFFCPb3Z69TZmGKO+YUNe9wqx8cPZFdVVodj8R2Okjc4DCauzNDfruEBCPdZSQ0bpL
         u1F9K3oiI1bRULA2n2oZf9cfCow0Yk6UzMmwcyU7i4crokIukCvZ8C7F0iFUiI/m9Cor
         Dk8hy3YFtO7dm1eU+dsB47jWxG/EIb9Uj/amM/0h/VDlowaH+ZijOKUqxBXRLfjAcv0m
         w/IvwiiaFNelGTGcOTd/n9ZEt2XflUDZ/NkiawS487IEObwj/hgOz3GT/rYRHxviwqVK
         xQZw==
X-Forwarded-Encrypted: i=1; AJvYcCVPz+dvR60UrmwmgBU8H9gqS+ovhOOTm0qbiJwu018SEwP5Qs3hMdjohRZ5/dz3keaCi/c4GhaRGZlYdrU=@vger.kernel.org, AJvYcCVjNS72mEbH0dARkGyeqRpHYK8wbTTGjEq3mW/bfJe+jS36d6ESR8iF+1DoeJN/ZGRuB+7pcw+TvN74@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz2PegQu5jCT0hcPIwotTYLPkv+UeYI7NmrXQTJMiGnNk6E8OQ
	LYn8iH60M2KfwaEG0ST3C8HKftQNMVXTvG6jHbJF1Ew5f9F9HjYhsLrZZEl4Bz2qNaWxXMg1QGn
	ALnnVH6ze5Jec46lw1pwNCDLknIf7AsO+0co2
X-Gm-Gg: ASbGncssPhz3dAmcLzemcjxe2L4oqVRH00SCxzdycx7ngjyTNrq0EjxQ3ftfbac69Vu
	1uB/ldFxSq8NGBh6mNVAq9yOQJWAlz3bz+2UgN4IFClRtTFEjOo96W/aDfmwHwZnRQzvvDdqzL5
	zFrFmh+ME5txY8LAIt310v+a/vhTlT1pEOxFuVQ4xEL/my+HDbPa/+OmcApSg1+m7+IF922ohpM
	gp8SkI=
X-Google-Smtp-Source: AGHT+IG4uoSlJC+DulaAkZUs3kXkHvTEqzrMo7RATCWWNPLzsKsYjsrGcL8ATqrvdSsnBbYlAom9C0YC75iWXNl0Q0g=
X-Received: by 2002:a05:690c:891:b0:723:b1b8:fb94 with SMTP id
 00721157ae682-72542fd4b2dmr37022537b3.10.1757087909643; Fri, 05 Sep 2025
 08:58:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250825-rtc-irq-v1-1-0133319406a7@solid-run.com>
In-Reply-To: <20250825-rtc-irq-v1-1-0133319406a7@solid-run.com>
From: Bruno Thomsen <bruno.thomsen@gmail.com>
Date: Fri, 5 Sep 2025 17:58:13 +0200
X-Gm-Features: Ac12FXwRAVUryhexz2IJs0wb5qNUzWwzMx1wS5_ZZSuSy8hRpm8TuuYXs7K6hM4
Message-ID: <CAH+2xPBhD0=bv6ZJw-MjECJ9nGkwmuonxjCsx+qgXv+pdk13rw@mail.gmail.com>
Subject: Re: [PATCH] rtc: pcf2127: clear minute/second interrupt
To: Josua Mayer <josua@solid-run.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Den man. 25. aug. 2025 kl. 19.54 skrev Josua Mayer <josua@solid-run.com>:
>
> PCF2127 can generate interrupt every full second or minute configured
> from control and status register 1, bits MI (1) and SI (0).
>
> On interrupt control register 2 bit MSF (7) is set and must be cleared
> to continue normal operation.
>
> While the driver never enables this interrupt on its own, users or
> firmware may do so - e.g. as an easy way to test the interrupt.
>
> Add preprocessor definition for MSF bit and include it in the irq
> bitmask to ensure minute and second interrupts are cleared when fired.
>
> This fixes an issue where the rtc enters a test mode and becomes
> unresponsive after a second interrupt has fired and is not cleared in
> time. In this state register writes to control registers have no
> effect and the interrupt line is kept asserted [1]:
>
> [1] userspace commands to put rtc into unresponsive state:
> $ i2cget -f -y 2 0x51 0x00
> 0x04
> $ i2cset -f -y 2 0x51 0x00 0x05 # set bit 0 SI
> $ i2cget -f -y 2 0x51 0x00
> 0x84 # bit 8 EXT_TEST set
> $ i2cset -f -y 2 0x51 0x00 0x05 # try overwrite control register
> $ i2cget -f -y 2 0x51 0x00
> 0x84 # no change
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Bruno Thomsen <bruno.thomsen@gmail.com>

> ---
>  drivers/rtc/rtc-pcf2127.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 2e1ac0c42e9323dbc6793840a265e8a663e52568..3ba1de30e89c22ae07ea319d530b58adc25b520d 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -42,6 +42,7 @@
>  #define PCF2127_BIT_CTRL2_AF                   BIT(4)
>  #define PCF2127_BIT_CTRL2_TSF2                 BIT(5)
>  #define PCF2127_BIT_CTRL2_WDTF                 BIT(6)
> +#define PCF2127_BIT_CTRL2_MSF                  BIT(7)
>  /* Control register 3 */
>  #define PCF2127_REG_CTRL3              0x02
>  #define PCF2127_BIT_CTRL3_BLIE                 BIT(0)
> @@ -96,7 +97,8 @@
>  #define PCF2127_CTRL2_IRQ_MASK ( \
>                 PCF2127_BIT_CTRL2_AF | \
>                 PCF2127_BIT_CTRL2_WDTF | \
> -               PCF2127_BIT_CTRL2_TSF2)
> +               PCF2127_BIT_CTRL2_TSF2 | \
> +               PCF2127_BIT_CTRL2_MSF)
>
>  #define PCF2127_MAX_TS_SUPPORTED       4
>
>
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250825-rtc-irq-4d17b55204eb
>
> Best regards,
> --
> Josua Mayer <josua@solid-run.com>
>
>

