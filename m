Return-Path: <linux-rtc+bounces-2302-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF1A9AE8BF
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 16:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3D1B1C214A0
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 14:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 519411FAC51;
	Thu, 24 Oct 2024 14:23:16 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581641E282B;
	Thu, 24 Oct 2024 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779796; cv=none; b=ELy5X01i43kwqT48J4prE9rgZNGgG60zWd4GcxrCGaQLRZaWfC58IGhwtJVi22uqpmtf0Y43QIE0WUPK/MoScHovRDTEebmDCwmGc1quxXEW9NEnJaw2nt8pP5S0cEWUjMmsW+bEl78YJQk4c53wxN5ddSCu5X2xfQaxtsYXVPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779796; c=relaxed/simple;
	bh=qYiNGztgFFsssAwXYWSYhYJgVgBfIlkOx04KiaexJrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FS7ilSTk/FKeVkl5fqXIJYK0vMX+xKIu8iMZQ9f8AgwX6xcEHBMlVzFVXOuHmwywGgRvoQLqe+jkAFaCzCJFvwUKjmD0Pt02zjK0T0XM3DbIex7bKAnUV9KpSY7laS4ZGnImcugx6oxfCCOQ3PaYOGTaz49hKNOykFxnGAM+QSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e2e32bc454fso1074273276.2;
        Thu, 24 Oct 2024 07:23:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779793; x=1730384593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+Mz6xZlUTUGeIwHcP14gw58OClKa4+sO2EvtfsAcwI=;
        b=i0b8Nv2JlMgbmfmY4M2vKcfqgfeq2xT9E7oyvp+biln9gaioAGjfRskJZzgn7H5GDP
         lzkqdkEKpN0W9x9YaMF/NFyASAvNzgP+TG50p7DvogPRKrP6jqjAjhuHhLE6wTpRALQA
         1260fQmTyKWC9gs3BihnlkqR9Qrc169yyvQperhariDGQzOb0/X9W/gKbCcsdy+z+1+w
         YGBhZAIGd+zxkq3+QZmo9lKpH12U3tAC/G9gRc77fRVC/wvGoyQNdt4GQ910U5cROeLw
         cKo2hj+fPTr/7NHzD4AEtI9a6uWnGn+PYC9rTUAt3eR7dGbGGsUBrdNWnaBP4UuF943V
         aCHw==
X-Forwarded-Encrypted: i=1; AJvYcCUG8+IYeu+BJPs8huodvmJ+2GbU55exncmudIp8aiLbE2Dicwjg+i0sXExeEtkPcsECX5OeIcQEjucF@vger.kernel.org, AJvYcCUJ1Zv9QGKoD3dg0eudOq3QLi4lvGULNFV/R+CielT8rmJgGi8TlF4i2ifVOvJ9QINAcibV9ZcvxHkT@vger.kernel.org, AJvYcCWB3448swfVc3lipDifsgeG5trr+s/KZpD2o4NR3euPDE5vOMyL0KwKL9dbPFjFUxaONEDKstcDNf8I@vger.kernel.org, AJvYcCWdkqoei8gUkqdrMpqzljGztbUDqHarTjZrr4e+TCZ/I7mTAfmUCuSkinfswE6+TB7IkAmNa1PtdldwUvqHlULE1CI=@vger.kernel.org, AJvYcCWkO+pJKvvaHdaZwY/NPnvsexKl/VyK3rOH4CY+hzNKXrpXhBnQV7qggid4IP4e6CviYvuJJnbfjlwfoBAv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+N2CNKqRJxfq3s3/XxzIOYM2eAk3O+AnZaRrlQXslZ3ofh3Wt
	z5a0YxCHBiQ181ZMvgKGRs+sAGSVjRnyHH2+yQAiLNW/ZXni9Naw8CjgpUXY
X-Google-Smtp-Source: AGHT+IG6ev6ibywOB2+BJqiyCZ4h3+Xz3GX1m2cvW3lHNbumgijqObTiVNJaknmHPSXwoJJNrd0phA==
X-Received: by 2002:a05:6902:2688:b0:e2e:3701:7824 with SMTP id 3f1490d57ef6-e2f22f1c60bmr2293830276.2.1729779792840;
        Thu, 24 Oct 2024 07:23:12 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdcaec280sm1982197276.43.2024.10.24.07.23.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:23:12 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e38fa1f82fso9247537b3.1;
        Thu, 24 Oct 2024 07:23:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUfTp1qUUkdQDHWm0SOSsOuWXceEvqsYWjpKc04hDh8l1lLNmGjqzzXljPf4FcUQ+qhDykoCXspkPFceiejBnewgjc=@vger.kernel.org, AJvYcCX8QlKrtSbADPMquyLAIseaLKG/9v59Tdclg7tPc7PknqliT/bwHeFJka6cAeAkN51CCBGVNa9Awh2d@vger.kernel.org, AJvYcCXNn5dB4+Nk4uJtuNIfYBE9XF0kEUYFeyJILGHT1kTL38hnVqYVnx8DNajlZ4M18iDz/+Y8vxmeSkTcpIx3@vger.kernel.org, AJvYcCXR8c/+fxLEcEvL2AME7d7Kpe1zExD60z2fmp1sGedeutC8doSoYrFAXrTNx5SW0Pjm2XWuXPwo8Q6J@vger.kernel.org, AJvYcCXidy05ku5+4j9M9Tl0L8RwweR0X0ozlHTVh9O0yeA18gkSNNhSJYW/tqKdA27SK3JHKDCheoHuM7RW@vger.kernel.org
X-Received: by 2002:a05:690c:6f8c:b0:672:e1f2:feef with SMTP id
 00721157ae682-6e866332642mr27085757b3.43.1729779791878; Thu, 24 Oct 2024
 07:23:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-11-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-11-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:22:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXWuwNx9u_VSQ3R2TbkrX=c_QLdQrk+=Ve81PFAsF9b9A@mail.gmail.com>
Message-ID: <CAMuHMdXWuwNx9u_VSQ3R2TbkrX=c_QLdQrk+=Ve81PFAsF9b9A@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] arm64: dts: renesas: rzg3s-smarc-som: Enable VBATTB
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, 
	magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Sat, Oct 19, 2024 at 10:48=E2=80=AFAM Claudiu <claudiu.beznea@tuxon.dev>=
 wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Enable the VBATTB controller. It provides the clock for RTC.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - added assigned-clocks, assigned-clock-parents properties
> - set vbattb_xtal status =3D "okay"
> - collected tags

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -346,6 +347,18 @@ mux {
>         };
>  };
>
> +&vbattb {
> +       assigned-clocks =3D <&vbattb VBATTB_MUX>;
> +       assigned-clock-parents =3D <&vbattb VBATTB_XC>;
> +       quartz-load-femtofarads =3D <12500>;
> +       status =3D "okay";
> +};
> +
> +&vbattb_xtal {
> +       clock-frequency =3D <32768>;
> +       status =3D "okay";

With status not disabled in r9a08g045.dtsi, this line should not be needed.

> +};
> +
>  &wdt0 {
>         timeout-sec =3D <60>;
>         status =3D "okay";

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

