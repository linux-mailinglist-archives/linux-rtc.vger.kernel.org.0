Return-Path: <linux-rtc+bounces-2112-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4D799403C
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 10:00:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0B091C26307
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2024 07:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D301EF923;
	Tue,  8 Oct 2024 06:57:51 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FC71EF0BD;
	Tue,  8 Oct 2024 06:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728370671; cv=none; b=VAYQ0DtJJY2yNJw9DdE3kDo0Ma7vzl0egA/0QQkZbpqqanxkNfZ+efps83GrlR1QtIlVzHeCmN/4LMVU2sNQezN0vTDZswN8X7ohwlABN6vQ6kAp7nM2PllEQZSkadPM+blmgEhutTCk2lbxNYRrQL/1fruWQTjYLF2+FdygoVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728370671; c=relaxed/simple;
	bh=SyU94rkfKoXJiBl0fN8X11JbU7QWwLK7QcH2b+/qBfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAs4exZPLnWpZUZ17QC32zgiTdqHiahCg3S5y7yzLeScBhblM4/qcjiATcVnMeplq1jHOXQd7m1AsmdI62j5q8nbrw9SYVNAkhdP/SE42Ouw2WJRDIaZDAe65ESOLgQzmc49dBG7YJ1S8nLnxa7Yu46IxOQtMnqzkOMvAXsopRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e2772f7df9so41406577b3.2;
        Mon, 07 Oct 2024 23:57:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728370667; x=1728975467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AHYT7MBmSOZv+u8sV5s5vdJ0rOWyrq6tZ659w5YChk8=;
        b=vAqEJqWC9cQkBu2TxSvbmkU4fYIv6YHk+OIWoyKU73cbYIBjjqBOPj6bo0+2TBiZfn
         4zzCh4BmtdtC+INgx45wSTybk39a8rhm0eoqEEqddiSiy668OPU8Q2oU/+fyjYYn8E9D
         qI9iUVZ5CzIRouGeEk0Hqfe6v8VecEOBui5ywfCEEerReGoayPlSwZvU98PPf75hLFpE
         1AnV0mfsqdfARDyUe4riyVYCSr5zp9CQ/dF+vMBg/CDmTGG4szvDH4AasDhaLneE/SxO
         gbkGhXKRxJOC9SOEiUnK6f5mpqT1zdoBJczC8yAtcJkEO92ImmpLWaeIeWehNvcParGu
         lLRg==
X-Forwarded-Encrypted: i=1; AJvYcCUCiSsUS8/Onhi687vxRLNn2Oo2irsJWyHQhGJMG9SeVpf1zO7lHfUWCB6sMw6ac0omtaYtRz2VFqLN@vger.kernel.org, AJvYcCW8Q+FVD7pEidhTWxC8s7jZK06YgB56HsCPEKXjwMjfrGLhi9lDjIDoyF+GUAm+CPbCCV60cUJ7LTW71g==@vger.kernel.org, AJvYcCWWNTUjLrSqOLNTrgwNnz/KZGgJ7Oy+8KyaEmrkOpzIpcZ6YXmGPXEC7JNiwrJ7S/WeCnDyEgYwuGeULRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrKRyekrD1xuvKF4A5E6wwdgCQfVYJac56fnL5yCHCUyUOZjvU
	jwAq5Vr/rHSjND08+2EW7GgH4Fea/+mO2tbSNd/ZHaCfrKxwmFKCajLsOfYm
X-Google-Smtp-Source: AGHT+IF+Rwufm2zeBqOf2GqImZX3Y7Nm0zjF8kuNu+0GS07U0u63pZLtDIx3B1/oIQTbDnU4Jgroug==
X-Received: by 2002:a05:690c:6610:b0:6e2:4682:c641 with SMTP id 00721157ae682-6e2c6fcb709mr120868397b3.4.1728370667178;
        Mon, 07 Oct 2024 23:57:47 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e312f6da74sm911537b3.67.2024.10.07.23.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 23:57:46 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6dbb24ee2ebso52261527b3.1;
        Mon, 07 Oct 2024 23:57:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWauI+iH/tylzLK6Tdr+9TBPCnYQnbZYhxUqtQdoRgw7wpODEwjMO4QTtWe3xQ86SyaOUX1UwHvCR8FHNQ=@vger.kernel.org, AJvYcCXwyZ06hnDCDgMlk0ZJNwg7CJLOTLewW4tBspbb9MCsiktC9AJBHseDUIc9nbAII2zjHlsuZP7xyzti@vger.kernel.org, AJvYcCXz1Wn0R/mny3rqOP25PURsPHLp0P5/lQPweQWKPitZBXIFQXaJsZx5udcpdwzClEXpci0bfol/YNNcPw==@vger.kernel.org
X-Received: by 2002:a05:690c:2a93:b0:6af:eaaf:2527 with SMTP id
 00721157ae682-6e2c7024d93mr81351197b3.18.1728370665811; Mon, 07 Oct 2024
 23:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728340717.git.fthain@linux-m68k.org> <fb25eb97521363ab8a18d2fd499cb4c76209cebf.1728340717.git.fthain@linux-m68k.org>
In-Reply-To: <fb25eb97521363ab8a18d2fd499cb4c76209cebf.1728340717.git.fthain@linux-m68k.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Oct 2024 08:57:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsekSXJOEf6chaMBHiRt_4nNvKYOOmQVC=ODg0qccKKA@mail.gmail.com>
Message-ID: <CAMuHMdXsekSXJOEf6chaMBHiRt_4nNvKYOOmQVC=ODg0qccKKA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rtc: m48t59: Use platform_data struct for year
 offset value
To: Finn Thain <fthain@linux-m68k.org>
Cc: "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Daniel Palmer <daniel@0x0f.com>, 
	Michael Pavone <pavone@retrodev.com>, linux-m68k@lists.linux-m68k.org, 
	linux-rtc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Finn,

On Tue, Oct 8, 2024 at 12:43=E2=80=AFAM Finn Thain <fthain@linux-m68k.org> =
wrote:
> Instead of hard-coded values and ifdefs, store the year offset in the
> platform_data struct.
>
> Tested-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Finn Thain <fthain@linux-m68k.org>

Thanks for your patch!

> --- a/include/linux/rtc/m48t59.h
> +++ b/include/linux/rtc/m48t59.h
> @@ -56,6 +56,9 @@ struct m48t59_plat_data {
>         void __iomem *ioaddr;
>         /* offset to RTC registers, automatically set according to the ty=
pe */
>         unsigned int offset;
> +
> +       /* YY digits (in RTC) are offset, i.e. year is 1900 + yy_offset +=
 YY */
> +       time64_t yy_offset;

time64_t sounds like overkill to me...

>  };
>
>  #endif /* _LINUX_RTC_M48T59_H_ */

The rest LGTM.

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

