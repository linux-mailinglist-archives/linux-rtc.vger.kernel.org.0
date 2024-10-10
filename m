Return-Path: <linux-rtc+bounces-2150-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A549A998C2D
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 17:46:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3602BB30D16
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Oct 2024 15:17:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD1851CBEB6;
	Thu, 10 Oct 2024 15:17:30 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1821CB312;
	Thu, 10 Oct 2024 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728573450; cv=none; b=Kc6XVjoTUaQrx7J81CPuavoYt7s00U6xq9qhcW2G6IR+eDJWxCy5hXCtyNb+hHNtmmBBgr4IsZ2jZAjTf+jPhMO08K6ME2AtkcvXPslzrKhNupxS0EwBxd8P+v92J9L53kBeUlLKwG8YJr/3/pNdHMHydEV8Jsyvr95IZPeSs5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728573450; c=relaxed/simple;
	bh=kAelzetrqpcRN5dm4O6YQ1TH+k97O3PeD6wil9BatBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcN3tbCsCOQBd97kIOVVut1UrgkAi/f5AORNyge9T5dQiykDA6YKkZod1KcF2wlNdClswzo8JxGqjRyDFK3eaK2Ay4xukkT7g0EovHD4RnrRPmq9425KKun2uvDMrOWGGDMl4FKEXzLkE8qbAjMKTnajAzoO3fKjHmL7rz9H1K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e2e4237da4so10363437b3.1;
        Thu, 10 Oct 2024 08:17:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728573445; x=1729178245;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+Dll4htdUB23BCtM34CclguCZewJgpq4mv0+9yv+gs=;
        b=GScR9ECKDf7vlokr5bVKCnNAlXbEgFYVlKKq+Ynv2E2rnX1yyCdv8COS6gNyev4H6D
         ZLX9ISBl+5yLGwjbrnrQV4oov7XKoMVl6GuwoY2ihUZpcWZWWAbCM3+n4YPLuMtae9R+
         NzUXJ76puhSrVBixE6RnotUbjE81g6DohIhEGDS5y4BboQgyjnkvfpU5DO0LAz44y+95
         A33CFBT9J+VOgjqDOlb4brpD6MfaEfFvuOg9AGpkTvsGCbcq9twFePZwgG/sELpjn435
         Rq7ZV0OsLGCjywZseeXHHV0SrByYreVu8n0RjurkLET4SysNGiZm6H4ibAnxKcjkMnAB
         dxCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqlrJjLgQDfJm159kmHf6RlUxucicsmjQzMvP0Sx5Q3q3vsGN2ZjXYmvMYl5NYUNL0G78mEE2uZz7V@vger.kernel.org, AJvYcCVcc6unLiQ5Tt7v2oR8CO5RfYPfgeZVM5zLs15iLagXUg0CUt8CHy2sEevNgd86Xnpj1tWtu6hzx3v/@vger.kernel.org, AJvYcCVg8MpXM+l0pzwnvaMhNl9K5XtNHsOgO/XFFEg7+E6T4tJDgyKeY/+P0S1wZAXMIn7EF3VUNclhBEdw@vger.kernel.org, AJvYcCWDBZ9iYUiguHwz2hwttAPrW1sgI9RYAm4Azlk98uft5vG2vDcfG6Mx7MbPMraQhkeyO/8ByRelyRHX7zgFjjTK3Mk=@vger.kernel.org, AJvYcCXhcQI6k07fGMOqG0W76nXg4Q0dW0iBq49M/Hyt7lhYicrDedKmHWvDZM/GmfbvjI2pQe8odoLjCg3aaOiL@vger.kernel.org
X-Gm-Message-State: AOJu0YxaOqdtXW4jZRPugAvczkwTNDKh384B9/W39cVcMBYOO4OUSwVR
	6Q7c/EGnVVl/RlqjNXV4mjM0g6Zh5jf6MIrax2ymR7VnjCdPL4ImkLxnU4Bq
X-Google-Smtp-Source: AGHT+IH91kgKmCZOzY7Bbhg6gRS3DlpUaEddKN7XcqQDDxdpnNqSvn0tZplJ0LLJGUJs+c23XET1wg==
X-Received: by 2002:a05:690c:3007:b0:6af:6762:eba1 with SMTP id 00721157ae682-6e32e20e20bmr31969927b3.20.1728573444918;
        Thu, 10 Oct 2024 08:17:24 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e332bad8afsm2394907b3.59.2024.10.10.08.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 08:17:24 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6e305c2987bso10215917b3.0;
        Thu, 10 Oct 2024 08:17:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVCVicTQBCo/ydHilSvQudrLjFBlS7XIOFQ4Nh3jW1jjVeQDl2iRzYenvXRC9lu6XlkdOvfTzBdxEsZLkKfH8+UyXU=@vger.kernel.org, AJvYcCVmZd4YDU0x56o3Wciw97cbU48auevTPraKHGzRnC4hctKbavZVdQq59GtTrNrMZU/bWHjcwInKQub8@vger.kernel.org, AJvYcCW10ujH9qKHEgwDYzqYbwYuW7jEBGfBza5fGW3kYkbMumwz4OewBXTvxfD9T7+0wYerQ6MVHRL32cx5TC6o@vger.kernel.org, AJvYcCWC3K424Md3KaHoCUqWejEA7MNiWE92jvYGzec1Tc85MePjT2M7ZD+KBqhMGhghzhWfKKK0x68IpaJ0@vger.kernel.org, AJvYcCWzmP47cNYBwBhU7bKFYTftMI7pLeL5m6FLevwS/bLAjBnoCkEN40WZx/YsmffLdr7fasAcPCgsSQx1@vger.kernel.org
X-Received: by 2002:a05:690c:5605:b0:6e2:b263:105b with SMTP id
 00721157ae682-6e32e445686mr46318437b3.41.1728573443947; Thu, 10 Oct 2024
 08:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com> <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Oct 2024 17:17:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXVOZ22N6KXFdHgPQQnqs0ujBbmQR+CQ4-ekdpQCzFUHA@mail.gmail.com>
Message-ID: <CAMuHMdXVOZ22N6KXFdHgPQQnqs0ujBbmQR+CQ4-ekdpQCzFUHA@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
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
> Add the DT node for the VBATTB IP along with DT bindings for the clock
> it provides.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v3:
> - dropped the child nodes of vbattb; along with this dropped ranges,
>   interrupt-names, #address-cells, #size-cells
> - added vbattb_xtal as input clock for vbattb

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
> @@ -160,6 +160,18 @@ i2c3: i2c@10090c00 {
>                         status =3D "disabled";
>                 };
>
> +               vbattb: vbattb@1005c000 {

Please insert this after serial@1004b800, to preserve sort order.

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
>                 cpg: clock-controller@11010000 {
>                         compatible =3D "renesas,r9a08g045-cpg";
>                         reg =3D <0 0x11010000 0 0x10000>;

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

