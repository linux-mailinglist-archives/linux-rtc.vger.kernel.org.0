Return-Path: <linux-rtc+bounces-1911-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B32B9718F9
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Sep 2024 14:11:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A2A91C229FF
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Sep 2024 12:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 607CB1B6549;
	Mon,  9 Sep 2024 12:11:21 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371A5172BCE;
	Mon,  9 Sep 2024 12:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725883881; cv=none; b=Y4hoYkYlEBcVXoiwXP+qNrs8i3a6r+k2OYN39EOq+aI8jzQ4P+oXK+9YCbfuM4f+yik7OKJknxDNwogmq4q9Jojv2fUVPNMqIWahVgsciKuX29nPIvxUAvff6BRRm8RZ9+DWlzBgAUBd9ui2qEyVBZPHcNTXviHTaDZJHrq18H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725883881; c=relaxed/simple;
	bh=39bHDieju2KDrK1NVgP6S2Lyn0IKtZ3wRK9Z+78eCR0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jt+3stwVmgsUbJYMN1tFTE1frjmUeyc8/icVIRx38sbSi/e5SgUe6CJD2HVith6NkAvRModiLUDIAVO6eMVaCUroHELAdj79Xc3Oju3+CCX3u4l97BXHQQz3uTsxChb2gT7MEHdqPu3upjuIU2b4h2DLoFKRi1TwQrnqBxQ7TFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6b47ff8a59aso41071177b3.2;
        Mon, 09 Sep 2024 05:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725883877; x=1726488677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcqCtl6E7A4OPOryoegwZKV2Sgx5JBQZ+r80cmVrDm8=;
        b=QmQO2MwaqGQl4QsRSvyujyD401EJ6ohNMTZ3QzytKENK+zD+SK1xVVSfbmSmUmNImF
         /4YccT+P75hhLNMmfEWWvwOQkz3eDQI82bGQqZHWUgmVSnvrvPy9Mh02mxOilUr8AroB
         Oujuvxq6Afz6FoG9z6KEDaxnshpUl3Ul8z8yYJjHfuGostc5hFLwrwFNAxKlwTwsU6rp
         3CPiz6IltiNTsGefFCmWn/C7AAi8D2EkR9gtKIht6u5iBGXbGchV7wXtTBY4ri0nQjPp
         9mVwuz1u+w2mZrAy9snN+PvYuSn0kfsX0D0G3l6ypvCnI/NaVMoZs1i2BNm9SO4U4/MK
         VgLA==
X-Forwarded-Encrypted: i=1; AJvYcCUK/Znbi9GkSPXzXl0Qrpn3VmRmhxES4k/yf/0CswKJ9OybwTZ+81OVQqsJel7K3hkwnX1SF2wZ4levIMo4@vger.kernel.org, AJvYcCViwgLiolWg6S636ujbO4ahzCqGJpqk+ICROgyEgxkHjFuGA+OxE1wi+rTZWW0VhXm9LfnThXEgjtdW@vger.kernel.org, AJvYcCWzg0o022zlujWoyfgCegna9RJALm1kvA3gq/Ne90wUBMhgtUIWcBVe6ICUztFyziRJgdgp/vqaO8fA@vger.kernel.org, AJvYcCXC0bcWGCEOQQ+AXhum9IDlq+IUMVmWLyRlI3QAQ9JlCmu3LQ5NYPcMvDO36aBDcR/KIoNPYUU3E4ucsDqqnoSzFmQ=@vger.kernel.org, AJvYcCXmH8uYRiSM90qaStVnE7PQA2DJRhWGa6d1zZpCSrfnlW16L2iElTIFAxrrOS5KyKAfgFNhSk8CgQmW@vger.kernel.org
X-Gm-Message-State: AOJu0YzueTovKQ4KIQc5ItMbnBB+NAInvrIc3wpwkRAF2H2T8N7f4xfS
	R7mww10HS0bZClgP2kla17exA+3FzUIG0Dra5rQ+tRhC3pbCEpawWU2MSoDd
X-Google-Smtp-Source: AGHT+IGDII4HeTicxTe5FjVMRM0+oi+fdq5O0AyQMHadyK9M/YQm7V1LD1w2OYDOnLADgv4fSM1BGw==
X-Received: by 2002:a05:690c:b:b0:664:a85d:47c6 with SMTP id 00721157ae682-6db4516c241mr120039097b3.33.1725883876780;
        Mon, 09 Sep 2024 05:11:16 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db5c6229c2sm8912217b3.54.2024.09.09.05.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 05:11:16 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-690aabe2600so37544547b3.0;
        Mon, 09 Sep 2024 05:11:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4WC20Txrnk5UsddshTjusolfUINmyqmegAFCwBBgDfUGFYTC6G+hR0ugxjoi3BvndqTW7FRLK0IpR@vger.kernel.org, AJvYcCU8DmxoRTg2TW11bRaxVxpFrFf01zdaYGkzKuRd8/bBX3pRZJjzSAC9dOPFkICNIUaV50Q/+VkQU1J5@vger.kernel.org, AJvYcCVi7aLnIVlHeaUThepCI9jbWZQPhNVkgXKFLXBjdnMUIalAntWONUwFF/FBHG35LBF/z1e04tKLKb+7Hz7wxKw2azY=@vger.kernel.org, AJvYcCWjKgwvnAUHtt1HAKqIe02n6gz7KIXg+LXj81XovDV/8iFsfJYoygTAx9j1iv3ENSQc0KUCp6wq02Uy@vger.kernel.org, AJvYcCXgzB9ac6wgbNEm141XpyhpDXrUl8hHKBJZmegGxHqcVswBsnKjH+LCU1dZNyNimZYOSNXYFo9xoQu2AJAo@vger.kernel.org
X-Received: by 2002:a05:690c:64c7:b0:6b0:e813:753b with SMTP id
 00721157ae682-6db45272fd9mr131856427b3.38.1725883875698; Mon, 09 Sep 2024
 05:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-8-claudiu.beznea.uj@bp.renesas.com>
 <83fac884d749bda0cf0b346e4e869bc8.sboyd@kernel.org> <d8303146-89e0-4229-a3fe-9f3c42434045@tuxon.dev>
 <c744cf7a70a3f97722146215a7620cfb.sboyd@kernel.org> <CAMuHMdX40ROk2vZe9VHoiPDJCvtrjto+swkicv29LFyQ7zoVng@mail.gmail.com>
 <951b5c09c3ca2de3f0a28a078084f7dd.sboyd@kernel.org>
In-Reply-To: <951b5c09c3ca2de3f0a28a078084f7dd.sboyd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Sep 2024 14:11:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBT6AaH2_5qj+j4s8JeeO3qrhYUTCVG=s_J13nSzYPsQ@mail.gmail.com>
Message-ID: <CAMuHMdWBT6AaH2_5qj+j4s8JeeO3qrhYUTCVG=s_J13nSzYPsQ@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] arm64: dts: renesas: r9a08g045: Add VBATTB node
To: Stephen Boyd <sboyd@kernel.org>
Cc: alexandre.belloni@bootlin.com, claudiu beznea <claudiu.beznea@tuxon.dev>, 
	conor+dt@kernel.org, krzk+dt@kernel.org, magnus.damm@gmail.com, 
	mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Sat, Sep 7, 2024 at 1:01=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wrot=
e:
> Quoting Geert Uytterhoeven (2024-09-06 00:28:38)
> > On Thu, Sep 5, 2024 at 8:09=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> =
wrote:
> > > Quoting claudiu beznea (2024-09-04 05:17:30)
> > > > On 03.09.2024 22:48, Stephen Boyd wrote:
> > > > > The node name should be something like clock-<frequency> but if t=
he
> > > > > frequency is different per-board then I don't know what should ha=
ppen
> > > > > here.
> > > >
> > > > The frequency should be always around 32768 Hz but not necessarily =
exactly
> > > > 32768 Hz. It depends on what is installed on the board, indeed. RTC=
 can do
> > > > time error adjustments based on the variations around 32768 Hz.
> > > >
> > > > > Can you leave the vbattb_xtal phandle up above and then require
> > > > > the node to be defined in the board with the proper frequency aft=
er the
> > > > > dash?
> > > >
> > > > Is it OK for you something like this (applied on top of this series=
)?
> > >
> > > Yes, it's too bad we can't append to a property in DT, or somehow lea=
ve
> > > alone certain cells and only modify one of them.
> >
> > My main objections are that (1) this approach is different than the one=
 used
> > for all other external clock inputs on Renesas SoCs, and (2) this requi=
res
> > duplicating part of the clocks property in all board DTS files.
>
> Can 'clock-ranges' be used here? Leave the cell as null in the SoC dtsi
> file and then fill it in with clocks property at the parent node. I
> think you'd have to use clock-names for this though.

"clock-ranges" does not seem to be well-documented...

IUIC, your suggestion is to:
  1. Add "clock-ranges" to the /soc subnode,
  2. Completely leave out the "rtx" clock from the clocks property
     of the vbattb@1005c000 node,
  3. Add the following to the board DTS:

        &soc {
                clocks =3D <&vbattb_xtal>;
                clock-names =3D "rtx";
        };

Then, when resolving "rtx" for the vbattb@1005c000 node,
of_parse_clkspec() would iterate up and find the proper vbattb_xtal.
Is that correct? And probably that should be done for other external
clock inputs as well?

Still, it looks a bit complicated and un-intuitive. And what about
e.g. carrier boards with a SoM, where some clocks are provided by
the SoM, and some by the carrier? In that case you still have to
override the clock and clock-names properties in the carrier .dts,
thus duplicating all clocks provided by the SoM.

So I prefer the original approach, like is done for all other external
SoC clock inputs on Renesas SoCs.

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

