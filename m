Return-Path: <linux-rtc+bounces-2094-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B3398EABC
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 09:47:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 792541C20EE4
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2024 07:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46EFF126C09;
	Thu,  3 Oct 2024 07:47:09 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C353FB8B;
	Thu,  3 Oct 2024 07:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727941629; cv=none; b=JkEzQiZ/sYGPeJKtMBzgjoihNmymEGc7oyVvkEHVU3ahHdJtEi93PAA4VfXlzjLvO2tCWC4KyWlQobhvogtpgt9WLN0zqStYzEgFoT4mFBpJDQvTgLqMIb9PzIgITcqGBXOqQrjn8u1XGHrDGoUs1KCJA3nqMgvD8Jcp3+W02nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727941629; c=relaxed/simple;
	bh=9kXNgXMlo+O9GxWSVjx22mYlm0TpHo7i0ZBexdpOinc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k3wq/Cy9Vg6ioBmiSNyCMih2wKfq2R3K25YRnL2pIPDCQ8x+Sl8/uQfbli7PIWUt5TUMG2C7acrFXi2D1lJUpAN33cB8Jd3WndH/m42nBeWNFXZxFKpkauSyNJQGDV4kDD25ZhvZfR0EhDp83H8/nRzzV/BMthAFqTNRvOkA3Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6db836c6bd7so5775407b3.3;
        Thu, 03 Oct 2024 00:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727941626; x=1728546426;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PL8aD+MG/imNTw34D01xIQdM1gaKMtSmA7IYK6O19Hg=;
        b=Eg9HF3LyWEU/FxObtrVcDynxzkWEF91jLo+KiDVVxfkZ28VFg119B15vOchBmgZNuY
         deVVUelkozjkS0atUqZ3vQ0jkPu8FapqOfDa7DoRz62a0BSYJKUF1TKVTXA+b5tPat8e
         wJnsQlgFJxYjKXHx1lIdjvFktxLOFtz3fVLHV4nBG/S3NDuXoNd6tIWvP+zkaZV9s17n
         43ALRDUO1yPcxNwulk9UFnDt6apuFFuFOWHzQrZ9q/glUReqIiVYT6Ldri/DmMlXSQOl
         lNS1SKP5jsq8JiNWYGvDKk0/KLqBFw62IiG89fHLia364sK+lwOKlMk3trrN007ZEGbz
         GcoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6g1gC9oVLf9u9O2Lk7goTgVAgYEngLSWgvkCL2vkIDQuaFX1Acz+98wRKT4QQovlQb2+/UoMPbAwl@vger.kernel.org, AJvYcCWnG6jKGG7/m6g8qGr4r7Q5eYIs4WlVH4OXAyUIkl9jQwMamYQEIRhoPjBnsguzAwJ1NAE6bzxNk9QwD4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlinQxsOKHOYnzfs8e6jP1WqdfwSxi87NZmS04WCIy0K5hIsao
	FHWxZ1wVdSsvEGTrDygxSoh0cJ7mBHspP/86/JHfZJKB6zltg8tavu6GGTRX
X-Google-Smtp-Source: AGHT+IFTidabUQVVSL93DivZj3Wyy8BeEaoCC7StqDFRuHv4HV1ooFkMC8hIo1jSQjGmhSa/C3Aedg==
X-Received: by 2002:a05:690c:10c:b0:6db:d5dd:af76 with SMTP id 00721157ae682-6e2a30503cbmr53520457b3.32.1727941625738;
        Thu, 03 Oct 2024 00:47:05 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bcf96422sm993217b3.89.2024.10.03.00.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Oct 2024 00:47:04 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ddd138e0d0so5524797b3.1;
        Thu, 03 Oct 2024 00:47:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUB0SbN5SOQ2F3sbPvZy6MMclUM85dLjtfdyIE9ub/Rkn34s2CFewlyXotbkNt7rrUmp2bGN3a8xDvlRMc=@vger.kernel.org, AJvYcCWq4NkR7EanRAChKFEBBkUxTArra8tYZOx2Lu2ylbKOIpwr/VAOAY6PMSilaVGwKUFoebVC5Hw7wCMD@vger.kernel.org
X-Received: by 2002:a05:690c:388:b0:6db:4536:85b9 with SMTP id
 00721157ae682-6e2a2e053eamr54840377b3.23.1727941624625; Thu, 03 Oct 2024
 00:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727925802.git.fthain@linux-m68k.org> <f9eedf61f64906006f57ac88bdc160e55bc40c8a.1727925802.git.fthain@linux-m68k.org>
In-Reply-To: <f9eedf61f64906006f57ac88bdc160e55bc40c8a.1727925802.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Oct 2024 09:46:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkcocokX7fgyt6baQdnr11F9a-apwNCAwTUf9Q2Ypauw@mail.gmail.com>
Message-ID: <CAMuHMdWkcocokX7fgyt6baQdnr11F9a-apwNCAwTUf9Q2Ypauw@mail.gmail.com>
Subject: Re: [PATCH 1/2] rtc: m48t59: Accommodate chips that lack a century bit
To: Finn Thain <fthain@linux-m68k.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Palmer <daniel@0x0f.com>, 
	Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Thu, Oct 3, 2024 at 5:27=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> w=
rote:
> The m48t59 driver is needed by both SPARC and MVME systems. Linux on
> MVME uses 1970 as "year zero" rather than 1968 that's used on SPARC.
> Add support for the MVME convention. Otherwise, the RTC on non-SPARC
> systems can only read and write dates between 1900 and 1999.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> --- a/drivers/rtc/rtc-m48t59.c
> +++ b/drivers/rtc/rtc-m48t59.c
> @@ -57,6 +57,17 @@ m48t59_mem_readb(struct device *dev, u32 ofs)
>         return readb(m48t59->ioaddr+ofs);
>  }
>
> +/*
> + * Sun SPARC machines count years since 1968. MVME machines running Linu=
x
> + * count years since 1970.
> + */
> +
> +#ifdef CONFIG_SPARC
> +#define YEAR0 68
> +#else
 +#define YEAR0 70
> +#endif

This causes a change in behavior on other non-SPARC platforms,
if any out-of-tree platform exists that uses this driver.

So I'd rather use:

    #elif defined(CONFIG_VME)
    #define YEAR0 70
    #else
    #define YEAR0 0
    #endif

> +
>  /*
>   * NOTE: M48T59 only uses BCD mode
>   */
> @@ -82,10 +93,7 @@ static int m48t59_rtc_read_time(struct device *dev, st=
ruct rtc_time *tm)
>                 dev_dbg(dev, "Century bit is enabled\n");
>                 tm->tm_year +=3D 100;     /* one century */
>         }
> -#ifdef CONFIG_SPARC
> -       /* Sun SPARC machines count years since 1968 */
> -       tm->tm_year +=3D 68;
> -#endif
> +       tm->tm_year +=3D YEAR0;

Upon closer look, the driver uses platform data, so a better solution
would be to add the year0 offset to struct m48t59_plat_data.

Another suggestion for improvement, not related to this patch,
would be to differentiate among M48T59, M48T02, and M48T08 by using
platform_driver.id_table and platform_device_id.driver_data, instead
of m48t59_plat_data.type.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

