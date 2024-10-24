Return-Path: <linux-rtc+bounces-2300-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AFA9AE8B6
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 16:28:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 135E71F22EE3
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Oct 2024 14:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA081E9073;
	Thu, 24 Oct 2024 14:23:03 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEA21E3DE6;
	Thu, 24 Oct 2024 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779783; cv=none; b=VjiNCYd6tLounanZUsvncQAIpY+N2V+3UfcfxBL941tryZG7XFJhjlkC4JCmxu3qmQ/0SMLJ93CW0YSBIji8j/3lzlfMme7XtztiMCngO/QMVVLG3q11hoGOLvcdfGPkJht0V8f7TDERyEGLmgEdZMUTSJdunL/BoQ+9mBj4DiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779783; c=relaxed/simple;
	bh=fbRdKD9V61qJexYEvPcEfM+zOA562Nfv/r0U0fPJuKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KdLiyAVm/9eLzX8YwsRQdmf9HPowxty1vkiDLinjjwjs/zHiRhhmxcTM/tBUecA6Jj4mUSOjn3YkXhsDPEQX3HzySldhi6DxYW81c289Tu6WYdFfwhVn1rDUpRP8nvjDx4OHCQrBduonzTlrwHS9NhqHSTrkNXxss+6G1QCUuY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e2e33f614e1so1136503276.3;
        Thu, 24 Oct 2024 07:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729779778; x=1730384578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9w3r0ZE6sHyJMqYbvl55sla7p2voLmSiB1JDYM+8SL8=;
        b=JFIIVTOOtO6/mQk87EHc8WGZFBoaDbeOJ752aS++hbbzxLCLhjfQ79DgLtclUctIOG
         0k7EM3oICOeYF0OAaLhn52weNrxwmQ2T1ujkshP0AJ0dVCdKObr4VLuHmz7B4OAFdG7L
         X62LpyoAtbcAzzYfOo9Ze2ea4lAf6j+s3hb8B8p6VqgYGxpwdX+L/7f6rJ59wyi3Xaal
         ioDHSQCBGdM9CfsjGRij8ue1YycvsQPXWI62H6W37naSQPoytI94Iea+kI1P+vF+9YSc
         2nw7XdoclvYbAd0smy4Jgnz7/UPXhAxHlg7WCrJmLhwTnRwHiaIE/AMXlQu0Nt+L8Xby
         iSlg==
X-Forwarded-Encrypted: i=1; AJvYcCUnrMMj5ttQi/dVzZzPgRz2n3uwLqOUUf3jwrbj0n1AUpX8x29qedahTiqmskeSL5ubkPiGmO5nUpIk@vger.kernel.org, AJvYcCVJQ5/YAdfyat/i1lsfNB+744ayy7e/nSQl/dgQnsnNjHJ31UkSBUDr5ia2UN9gFWLHkfqMQufpUeGgShAmgTI1jgQ=@vger.kernel.org, AJvYcCVyRuuVJT0tr7q2Es/sH8rzISIxgRUJbdO7PimzBjCdV0EOv1+yU1zOylRBcsuZrucY6gtJ8SFxjjTA@vger.kernel.org, AJvYcCWEVs6NkRYbxOJ0Y+NHc5TFBrcQT9NRpW/AwMnQs2ZiuaERkkTXYuDpbqVEERgDoRM1sVJLwTEWHkBAPoKQ@vger.kernel.org, AJvYcCXW6kJwsgRr21XpXJnDrGmDL8kHJM8RC66M8/XaPuwO5OsRErbKrvnJZvksdQH1HvA2WuDw/56hBiU3@vger.kernel.org
X-Gm-Message-State: AOJu0YxMrC1X8ltvLvsejm7yOrB6P69s5s3Z9F6MWJ7Te+xVO2aJoVuV
	KmyXFdADtFmI8lNF4eZI/fBW9KcBSnVKb2c0lanfOHFPE9X8X0JjXtW8WDbh
X-Google-Smtp-Source: AGHT+IFGwQFw4FEH3AScjW7ONNe9OVnpDkYMdD2iqvI2k1ByxZwYNK9NyTad+4+/wiV1W3sxh2rdJQ==
X-Received: by 2002:a05:6902:1205:b0:e29:485:f57a with SMTP id 3f1490d57ef6-e2f2fbc10f6mr1855454276.43.1729779777747;
        Thu, 24 Oct 2024 07:22:57 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e2bdc96ab4csm1991441276.6.2024.10.24.07.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2024 07:22:56 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6e2e3e4f65dso11255237b3.3;
        Thu, 24 Oct 2024 07:22:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUU+3owLyACOlOjDbrT8QzAN21AJ3mkNoEOa2RibGhkqnj8inFL2MhmDFa0X11hGmDsHNmcdR2qn2aE@vger.kernel.org, AJvYcCUf8qRonwN9eOl6nX22yfJpam4BgLwkb0U5GcIA38DakUdfdaoqTabfSULzdnm68P8y+E2lU9zVP9WHrmSnYNlCxUI=@vger.kernel.org, AJvYcCUhv7TgdkU2Pg+oTOH4PW9mITHir67ZC4y6CYXyYZDS4/buFnE5JO5rYc5gbH5z5Iz3z8FCBmnUFYRc@vger.kernel.org, AJvYcCWP6cDUcATCbsenlL+KHAhzQKnlA1EFgeTnb402Y5bpGao8XNSDDrM+ZhgaXBXLzDk88k2f6VL3ZWqAxfch@vger.kernel.org, AJvYcCWPh8fwlZ7tCEHbmnMIBtgsVLbgcTqyrPrVoSeVTlqqeTBesMqY2fp2gzFK4rYGeLz2W+8qiYQUWTps@vger.kernel.org
X-Received: by 2002:a05:690c:61c6:b0:6e3:29ae:a3a5 with SMTP id
 00721157ae682-6e86630bba1mr27313797b3.34.1729779775364; Thu, 24 Oct 2024
 07:22:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019084738.3370489-1-claudiu.beznea.uj@bp.renesas.com> <20241019084738.3370489-9-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20241019084738.3370489-9-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Oct 2024 16:22:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXR1dONCFvCm=QekRaw6F-+W1v6-G+xdSWZVhEg0cRCQQ@mail.gmail.com>
Message-ID: <CAMuHMdXR1dONCFvCm=QekRaw6F-+W1v6-G+xdSWZVhEg0cRCQQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
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
> Add the DT node for the VBATTB IP along with DT bindings for the clock
> it provides.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v4:
> - used clock-controller for the vbattb node name
> - move the node near scif0 for ordering

Thanks for the update!

> - set the vbattb_xtal status as disabled to avoid having it exported
>   in linux with frequency =3D 0 in boards that don't use it

That is expected, and perfectly fine.
The clock is referenced from the vbattb node, so IMHO it should not
be disabled.

> - collected tags

> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -72,6 +72,18 @@ scif0: serial@1004b800 {
>                         status =3D "disabled";
>                 };
>
> +               vbattb: clock-controller@1005c000 {
> +                       compatible =3D "renesas,r9a08g045-vbattb";
> +                       reg =3D <0 0x1005c000 0 0x1000>;
> +                       interrupts =3D <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&=
vbattb_xtal>;
> +                       clock-names =3D "bclk", "rtx";
> +                       #clock-cells =3D <1>;
> +                       power-domains =3D <&cpg>;
> +                       resets =3D <&cpg R9A08G045_VBAT_BRESETN>;
> +                       status =3D "disabled";
> +               };
> +
>                 i2c0: i2c@10090000 {
>                         compatible =3D "renesas,riic-r9a08g045", "renesas=
,riic-r9a09g057";
>                         reg =3D <0 0x10090000 0 0x400>;
> @@ -425,4 +437,12 @@ timer {
>                 interrupt-names =3D "sec-phys", "phys", "virt", "hyp-phys=
",
>                                   "hyp-virt";
>         };
> +
> +       vbattb_xtal: vbattb-xtal {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               /* This value must be overridden by the board. */
> +               clock-frequency =3D <0>;
> +               status =3D "disabled";

Hence please drop this line.

> +       };
>  };

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

