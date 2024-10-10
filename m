Return-Path: <linux-rtc+bounces-2151-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC49998CEF
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 18:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8C0CB2CCF3
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 15:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185EA1CC888;
	Thu, 10 Oct 2024 15:22:26 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2801CC147;
	Thu, 10 Oct 2024 15:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728573746; cv=none; b=YvWLsvzZJHGULe6z2TFLJloG9EkgwjBytEJd+mxGKf8TIABWjqgwxgs+P6GEaQSr9hBU7n8pf4BFJ2loK9xpvMyZ+QqOWb01KKVO6sgXCslCM+P2+j6wsQy4IQbPx4STFJg0xgjGp1c+yt7k/VydMrmcvCwTp8+T7wQki04Thpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728573746; c=relaxed/simple;
	bh=s+8oKw9lYbGlfDOOh5Vzq21tMDHsDkvtvta/qIpwP5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nLJCgu2OmFUHsMq0xj8xSzSDZi9/1bYycDr52Ae5rzwlbvzKJvvtgcuM3akjQyD6q63M09P2VhuvzSCyK3kfXjqYKtycklS1x0b/fEougP1RpgFPE4W8BDnhLqF2jNKW18L8R4Vf+jfE9WQqUR1qgg70kGgc/lQQpwDxdQlwnpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e25f3748e0so12423947b3.0;
        Thu, 10 Oct 2024 08:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728573742; x=1729178542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jao0Svc0n55kg/+w0la34Wpf1syzLSX8vW8f7gdO0JU=;
        b=l1fGS1cwmCbUX0GNduwyHZaUEhPoKZvCu9wYU0yI6xtHTDr/zueWN/UqXFAPAALRyg
         T4B/uXfLIJG/YmmmBA6Tav9HiYcfsOMdkQ7lxYIo396Ptr7WJ1jct3NLWOixwmnZ/Xgt
         XFAyvUeDmFzEVb7ReVU+BPZCC7cCu7AmXxDvXxP/9c3TBWMfY7uuRxIqWbFKWacwBSfO
         AkHd0oQ3rFHUwUed13SF7lCIpjwyHh6h8xBigoSNyA5uBCroX+MFvuW8LJ2+2b/KNVph
         YvybPAhSUHuJkQRm/fvr3fG41E9e4iAFQLpUsk2rUuq2BTo4M4849+t6C4VhPZUmeWeh
         Mcow==
X-Forwarded-Encrypted: i=1; AJvYcCV1Jq13xRcGDXWT6FfkGxG05A0dfsNF5T0JzzK1gL5Qo5rJMnTYUiexvK78Cs8OlUBpk8Nvdybb2TAJ@vger.kernel.org, AJvYcCWCTZcQMTbkmvMZJ6cBQAnbSKZBkfjWCFL/RGIk4RNUJoW0Hz3GxUSOOEnSZDcSWayQ9gdvk6borXaKlFxA@vger.kernel.org, AJvYcCXil3BNsaGChils0SOQSr3IRiW43VLx3tl5BN6eymiXWR0/vjmF0wQwvDaFlVnLKQWKM0QVykVKrB8s@vger.kernel.org, AJvYcCXnxjcMPbPpzy8hgkjYVo7PV7JqqE9dCZjReJhC4+aiupUKnCb+w0GhGMZtSO4ubsOJczs4jCtC9bDA@vger.kernel.org, AJvYcCXsiPulz2UWDoBhWSKUGa+vhx0drRTrcJo8KuH4OrU2mvgnxYip3rMvEhnxfikVIv71CW6wuvDa+qBmdAIVSciqYLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqjW3LGSEQ2RDZf5ORXyuLLK/wsqMLVODbeA/BHiCTNHwW42Er
	HdmCUJMJX9kCj5kkpP7o4i6xiQBUQ2uGbeBxrV6//TwBsTxCs+zuL7IU48Z/
X-Google-Smtp-Source: AGHT+IGi2lqjdHiYuBMfImEnw66tasFC/37QTnDnra998ZrrgJyc4jpTeigb0L62IUL4na2Ugq+7Pw==
X-Received: by 2002:a05:690c:85:b0:6e2:1a26:2974 with SMTP id 00721157ae682-6e3224ed762mr58939827b3.39.1728573742141;
        Thu, 10 Oct 2024 08:22:22 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332b618b7sm2439047b3.3.2024.10.10.08.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 08:22:21 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e2908e8d45eso912241276.2;
        Thu, 10 Oct 2024 08:22:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVOIeH+NZooRpc/cZi8MJnhrk4KUmQvYvoBJFexrG6Byost/j9BTs8fuzgF6cLshI4Uj15Ro6Ga7VTF@vger.kernel.org, AJvYcCVqaAADrQzkxESdzFb9WZqg6+qrnfD7LFHqHL55Ke3F8K+CYMXppYwiVEx7nnbGWBKVqs/RQ03q5LKF@vger.kernel.org, AJvYcCW2HZXxd4e5YEvMbUQQSu8Lrq0laA80C+WHNx8JJzDXUXT0BBV0k28UwTZVMj0tcHKN6ConpuLmK9s7@vger.kernel.org, AJvYcCW8+N/lsgwe536TMgYPwVLVBzkw+i7HNYvjunQcAuEgqTaQ756IAdCKUVNiatIUn/KpaKUUFPtNZBFHIdk7fJtPhwE=@vger.kernel.org, AJvYcCWvYIbIvqw7XR6u6ws606IUiLvRHdFxr9uQdiGETsiepj/SzZrz8vfcmBialrLx/wTcFkPmTWWf6i//AqZp@vger.kernel.org
X-Received: by 2002:a05:690c:47c1:b0:6e3:1837:4860 with SMTP id
 00721157ae682-6e3221c2589mr45632497b3.13.1728573741351; Thu, 10 Oct 2024
 08:22:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-9-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-9-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 17:22:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqno3vO9T0FtHnNL2afWP4abSE4vmf8vkLRRndg=ws7A@mail.gmail.com>
Message-ID: <CAMuHMdVqno3vO9T0FtHnNL2afWP4abSE4vmf8vkLRRndg=ws7A@mail.gmail.com>
Subject: Re: [PATCH v3 08/12] arm64: dts: renesas: r9a08g045: Add RTC node
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

On Fri, Aug 30, 2024 at 3:02=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add the DT node for the RTC IP available on the Renesas RZ/G3S SoC.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - added CPG clock, power domain, reset
> - and assigned-clocks, assigned-clock-parents to configure the
>   VBATTCLK
> - included dt-bindings/clock/r9a08g045-vbattb.h

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -160,6 +161,22 @@ i2c3: i2c@10090c00 {
>                         status =3D "disabled";
>                 };
>
> +               rtc: rtc@1004ec00 {

Please insert this after serial@1004b800, to preserve sort order.

> +                       compatible =3D "renesas,r9a08g045-rtca3", "renesa=
s,rz-rtca3";
> +                       reg =3D <0 0x1004ec00 0 0x400>;
> +                       interrupts =3D <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names =3D "alarm", "period", "carry";
> +                       clocks =3D <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&=
vbattb VBATTB_VBATTCLK>;
> +                       clock-names =3D "bus", "counter";
> +                       assigned-clocks =3D <&vbattb VBATTB_MUX>;
> +                       assigned-clock-parents =3D <&vbattb VBATTB_XC>;

Don't the assigned-clock* properties belong in the board DTS?
In addition, I think they should be documented in the DT bindings,
and be made required, so board developers don't forget about them.

> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg R9A08G045_VBAT_BRESETN>;
> +                       status =3D "disabled";
> +               };
> +
>                 vbattb: vbattb@1005c000 {
>                         compatible =3D "renesas,r9a08g045-vbattb";
>                         reg =3D <0 0x1005c000 0 0x1000>;

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

