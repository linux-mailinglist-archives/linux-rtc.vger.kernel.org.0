Return-Path: <linux-rtc+bounces-1913-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3101D972B6F
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 10:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CAE6B24B01
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Sep 2024 08:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44399187FE8;
	Tue, 10 Sep 2024 08:02:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1CF174EFC;
	Tue, 10 Sep 2024 08:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725955363; cv=none; b=uSNvHt7BQbjC5S0BUfGyjUJkjTYa1bq6/dCc6bfTXCGRwDP5u9OnpIytAaDbzGx8wX8bEotiIBXnnnWtilA//DQx6uITs7lpv71/UeEATU0FXTrjihGZYA3DNDR2IQ8GVVbGnuFVgX9dAbgg+MgFLUlEpQW9amW+f3wKdWm2Cmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725955363; c=relaxed/simple;
	bh=bZQ56TI9jacC06ucCOzxlRB8MZhqw4u3oVbjFPOEG04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhohNAwFjzeYZPwm6uvID8OYbZPCVysGghyfko6ZAyzHqL1XnFt8MXnhwLsi3CSCLkyjnjD50+HRlACJTRbRA1/NwCMDJgvqGRcCt1Ff4Mr8CpFTkS6vODY6LBmhHzAx6/tozjtuKu4qVgPmvBFwnWfQzRea+uLQOTbycbSa0TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6b6b9867f81so2801497b3.1;
        Tue, 10 Sep 2024 01:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725955358; x=1726560158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzRdJw3jGdTpaaxC4oTRsBtst8mfyJSId4rDFBKOHV0=;
        b=hf/5DvQXc07ReeqJOh/x7w7aAifKsvC+Cdnd9Vr04mivTQCwXxg7QaHx0Dif6dvIYc
         LGgsuhkAhSpOhpqh/aQevJ5D+AfHqdNZVyHkErX612V9q0P4btxSZHX6gVpy6aSd8UF6
         nP+g553BD0iahWe7YGE6xY7wa8m3du/x1hu3GyHmp3bmEeFtvQS3Vl4ixTSWTfqQvCa7
         dFy7y5iBIkvWZjDQvGFMqRkOZOh0xJl+lgxCAI1woEsDYtIUHtPe8vCyaEnVLZW8rylT
         du1metny8dI9UDXW4XhgPTg6g/dgoK8vtfT0lAsZUecLtL7NihvvTBG436RoRQTSTwKr
         iMdA==
X-Forwarded-Encrypted: i=1; AJvYcCWOyNIeWSeKkHGVQzhTDNO2brNBi+Et8GUEiS4SLEqVPaSRiN79tCywtrTl9NHRhtfdYPEu8LWC0PMx505s64p1v2s=@vger.kernel.org, AJvYcCX+dPA3oZ2Pn8158a51PHSXdHzIlKdXtu09Xa8al0Ho02AL/nHlzY1JJbYp60rsXanZCYoZGGdQnBHs9IqI@vger.kernel.org, AJvYcCX/+ZcBEOcubMzYUh32DZw/oafIKJJ+lLZORGDr2f4XV8N8fd8p2kdjgW5UhG0iFCx6/T4NDp9a5iYn@vger.kernel.org, AJvYcCXod0PX0RBMUS32LY2LT4HyPu6jvbxcFRnVNJDvEj6mkfIpfwdvUlZwm0YlNCO+yipTHIYjO+m8C5Y/@vger.kernel.org, AJvYcCXqiMs1rEYsm1nBlJIj9A3+jU5cXD94zJo/w0G5/pHGmT8rVkLl9Z2pc4R4BLnZX/9bMpfj6p7YT1Am@vger.kernel.org
X-Gm-Message-State: AOJu0YzzehQ3ga3o16Hyvn7mkuxXvqR0QqTj5bdQxV0AKK5YpGiLSTY2
	qdWugiMRgn7subZUHxEwsnAdWAHMe6YKFpnf6VJHlzP0sPW0gadtQjbIF0Bi
X-Google-Smtp-Source: AGHT+IEDzeFJg++83VtrB6IWJnIkEpcY+S8zu/4dF6JnBPmVZ02H8azk96uClHp01u5ASpF5vIUQ+g==
X-Received: by 2002:a05:690c:dc5:b0:65f:d27d:3f6a with SMTP id 00721157ae682-6db44d61d1dmr158085997b3.7.1725955358109;
        Tue, 10 Sep 2024 01:02:38 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6db9648d551sm2189837b3.63.2024.09.10.01.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 01:02:37 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6b6b9867f81so2801127b3.1;
        Tue, 10 Sep 2024 01:02:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8EYR7jgyebhDZo2pAtd6e2eyhG3O2VUVw36sfXiUMPUnKbZN+yPb5CSD9j3fWUmbBK5n/yWP9Y454@vger.kernel.org, AJvYcCVO7uZSVziTLVhbZa/jj0dMctzRtiUoRktz1ONYwhUdH5vLilM5XIW7UCRHLFwr+lFASGdr/52VebTy@vger.kernel.org, AJvYcCWWFJS1hxlG1k45ou7p/89Y8U83wb8ut4tP7weBIgj6DL5lpnPEugFTN9S5zKCbnCl50w0waXmC7enBJxeAofesENU=@vger.kernel.org, AJvYcCXelkVbxMta2r+SPTIgeNe2QU/E4uMe/Gr9jy3t1Ej6LjV35xRzGw2QqGAR21vgHmVrB9hoBGzFH0omN2wm@vger.kernel.org, AJvYcCXzkTYygK8Xt7wG684wXki9BGuOsZF82qRMlOxUQLHHX1/UnC6q/wgvx9uJNbqlPIomwrsC9kcvZc9h@vger.kernel.org
X-Received: by 2002:a05:690c:d18:b0:6af:eaaf:2527 with SMTP id
 00721157ae682-6db44dfed1amr147937807b3.18.1725955356625; Tue, 10 Sep 2024
 01:02:36 -0700 (PDT)
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
 <951b5c09c3ca2de3f0a28a078084f7dd.sboyd@kernel.org> <CAMuHMdWBT6AaH2_5qj+j4s8JeeO3qrhYUTCVG=s_J13nSzYPsQ@mail.gmail.com>
 <8fa43530daa941b059b2de1e15dd7773.sboyd@kernel.org>
In-Reply-To: <8fa43530daa941b059b2de1e15dd7773.sboyd@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Sep 2024 10:02:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW12EO=U2b93C=hkL3Z-ncf85X0-9KB4Ds9d5+b5MhLMw@mail.gmail.com>
Message-ID: <CAMuHMdW12EO=U2b93C=hkL3Z-ncf85X0-9KB4Ds9d5+b5MhLMw@mail.gmail.com>
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

On Mon, Sep 9, 2024 at 11:18=E2=80=AFPM Stephen Boyd <sboyd@kernel.org> wro=
te:
> Quoting Geert Uytterhoeven (2024-09-09 05:11:03)
> > On Sat, Sep 7, 2024 at 1:01=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> =
wrote:
> > > Quoting Geert Uytterhoeven (2024-09-06 00:28:38)
> > > >
> > > > My main objections are that (1) this approach is different than the=
 one used
> > > > for all other external clock inputs on Renesas SoCs, and (2) this r=
equires
> > > > duplicating part of the clocks property in all board DTS files.
> > >
> > > Can 'clock-ranges' be used here? Leave the cell as null in the SoC dt=
si
> > > file and then fill it in with clocks property at the parent node. I
> > > think you'd have to use clock-names for this though.
> >
> > "clock-ranges" does not seem to be well-documented...
>
> Yeah, I wasn't aware of it for years!
>
> > IUIC, your suggestion is to:
> >   1. Add "clock-ranges" to the /soc subnode,
> >   2. Completely leave out the "rtx" clock from the clocks property
> >      of the vbattb@1005c000 node,
> >   3. Add the following to the board DTS:
> >
> >         &soc {
> >                 clocks =3D <&vbattb_xtal>;
> >                 clock-names =3D "rtx";
> >         };
> >
> > Then, when resolving "rtx" for the vbattb@1005c000 node,
> > of_parse_clkspec() would iterate up and find the proper vbattb_xtal.
> > Is that correct? And probably that should be done for other external
> > clock inputs as well?
>
> Sounds about right.
>
> > Still, it looks a bit complicated and un-intuitive. And what about
> > e.g. carrier boards with a SoM, where some clocks are provided by
> > the SoM, and some by the carrier? In that case you still have to
> > override the clock and clock-names properties in the carrier .dts,
> > thus duplicating all clocks provided by the SoM.
>
> This is the same case as the board wanting to override the soc node?

Yes, but more complicated,

> When it's a SoM is there a node for the SoM? Is the clock on the SoM?
> Does this case exist? Hopefully this isn't a straw man.

E.g. the White Hawk CPU board[1] contains extal_clk, extalr_clk, and
scif_clk, so it would need something like:

    &soc {
            clocks =3D <&extal_clk>, <&extalr_clk>, <&scif_clk>;
            clocks-names =3D "extal", "extalr", "scif";
    };

The White Hawk Break-Out board[2] contains can_clk, so it would
need to append that, by overriding (duplicate + append):

    &soc {
            clocks =3D <&extal_clk>, <&extalr_clk>, <&scif_clk>, <&can_clk>=
;
            clocks-names =3D "extal", "extalr", "scif", "can";
    };

Currently, [1] does:

    &extal_clk {
            clock-frequency =3D <16666666>;
    };

    &extalr_clk {
            clock-frequency =3D <32768>;
    };

    &scif_clk {
            clock-frequency =3D <24000000>;
    };

And [2] does:

    &can_clk {
            clock-frequency =3D <40000000>;
    };

[1] arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi:
[2] arch/arm64/boot/dts/renesas/white-hawk-common.dtsi

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

