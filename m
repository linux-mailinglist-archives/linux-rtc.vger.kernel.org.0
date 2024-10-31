Return-Path: <linux-rtc+bounces-2393-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE659B76AD
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 09:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66B3EB2207E
	for <lists+linux-rtc@lfdr.de>; Thu, 31 Oct 2024 08:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5619F16A92E;
	Thu, 31 Oct 2024 08:44:14 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2469D517;
	Thu, 31 Oct 2024 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730364254; cv=none; b=UAq+ePN8ekdaQ7SV3oKstxs6pFNALqx8Hvy/u4cYl2vY4NQMm9VQHsn6sTX4CV5VKGY13dmnKVDjM/wrlLoVBizZbdUeqeA9+SSxEIa0B5PAZeV5/u/lF2oXsEjvg12Skwus3D/xluf9YpoMjistxAW7RooyEw7kNyiwZF24iVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730364254; c=relaxed/simple;
	bh=QTi2/SMZ4dJmIiVpVciPZx5YTBm0Qziu7Ff28Zc2gXw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V+WTs+l96+Vn3tlTjUp74eGYyyP0aI3AwjYMEeo+VNsssB6oCq485g3gwY9g+oWuw/yt9nH9VZVhS3gG5kW/ZZgbcK7dW2fd+H3HMQh0G2Umk+f7lNpeyxe1tdq6zEjth+KGQW2cFr1bWHJTbb8OUJB1ObEjow521P7tUibXyQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e5e5c43497so5391397b3.3;
        Thu, 31 Oct 2024 01:44:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730364248; x=1730969048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HfNhJxDYW/zYKMETRxr7Ku4lALqPP65///kXhuaXtfc=;
        b=utZMXzGbw6XOzzVWfb5IoSFNJiwz33dYneZTd1rS5ORzZ0/7Q/6XKxn97JCnHQcW91
         SYwwPsDUVW90yQFieyfgim/BNIQv/3fKlvVxniIXX9wqjDo4+zBeDmRvw4z2FgHHdcTX
         b3nnji9JmyIxEp5n7EnzQ2SuumbGnQSQ3dG0z2wpLD0MRw/K6pTLft68RZgu0yuZB0H9
         OhV/f6fmDVBzUERFjHnNe3Vvp8/5Hr9ozR4Qd0kV+oeF1pyhFhP8RR9J3ONQMkYxQXz2
         ZsTsBtnGnmh03gT7xWp7hxzGEbs2XsuyerRXlwvNl7vy0W25nBeiEZnG4QohG3L0FQwZ
         UmKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOwgPZx02Lasd605H0NTRIMPxiC2QXtqhydAhTTbZPaSzmv7E4Y/XizbgklawAAx+hghHJSLLA9g0d@vger.kernel.org, AJvYcCV3Nrcccc2YmVMAq5fYbfOr3vR9w9SAaaay1JQtUqdPgcNfpPktvtSF/SfGJeCV5jm3L+BScuXiph23HMBjqEzEjac=@vger.kernel.org, AJvYcCVmFaplpWe1MEjmCNU7B3si8CElJpYT5pMwd5+54svbiSX6zU+IOVEpsnw2Bsk/awxf8OViYjoW1vsa@vger.kernel.org, AJvYcCW9Sm3o1WyNWdhv4Hliwg3AOqZ34r0TTB8ydXJnkVc1P0dMgmYEWdGpS8NJbI1otYX6JE7QT6S5PPf8@vger.kernel.org, AJvYcCXNAbWEekG5iePdNEro0l9Be+TzYMKLdIBfR+Ffja1Xoe7jHsPemrz54qNwOmPmJoAmjuhJP9NVW1MOmoeF@vger.kernel.org
X-Gm-Message-State: AOJu0YzAz0y5fFIKecQakPpDYS8FvOpyeyn3CDcFh701nJFNqAr98a2p
	VjD/iAIKBIRJjWESA+kxwuxhcLJEjUC+nCGCNp2/5eZ4BGrzatwRS3ESaJtn
X-Google-Smtp-Source: AGHT+IHREmlZNggllNiAB6NqVYAXAlBDkuIxb2LcvFqtt/TcR1wJiIZcny7donmsDZTFyxNyOWDPWQ==
X-Received: by 2002:a05:690c:9a03:b0:6e2:985:f4df with SMTP id 00721157ae682-6ea52546b5cmr25125967b3.44.1730364248603;
        Thu, 31 Oct 2024 01:44:08 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55aca025sm1750027b3.4.2024.10.31.01.44.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 01:44:07 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ea339a41f1so5693017b3.2;
        Thu, 31 Oct 2024 01:44:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYTPIX3mTG5ugVPlxS/EbFc9w+lc7CPUYZxU84+ithAiJ+1ibQIhFdZkqQS4/iGs8JTJJCG/xUzgdE@vger.kernel.org, AJvYcCUefNsGVsuuWlsZZl9c/tlkKtCCbA3a3fdofyJ/4RNohy9sac3jjOaPbJZoiM+WviCVKLeVQUHpojPj@vger.kernel.org, AJvYcCV6t5IPEE7oVZc0fDQHgDB1V4krjVdsQhmH8JVnpXmZI/tvIQ99eGBeLZReEIGhgvV3p4iASxAiRcWIPcjQ6BhrTdk=@vger.kernel.org, AJvYcCXZCDrBbPyk4gYQ4ChV1Ger8uqnX80HfMYQFbOkI0fbo3v+Si51MZDrwDc2CaOF0hy0wchZNXnRYkIPHgwq@vger.kernel.org, AJvYcCXf34x3Q8WGsKw9GKbtkpjzaF2eD3sVRFaACIIB0ZnnjHPx905A15iuPCqqbv+3krIV+AKXmagjm3xW@vger.kernel.org
X-Received: by 2002:a05:690c:6910:b0:6e2:1090:af31 with SMTP id
 00721157ae682-6ea52323524mr27475337b3.3.1730364247060; Thu, 31 Oct 2024
 01:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-4-claudiu.beznea.uj@bp.renesas.com> <mg2ugyg65ke3tngzqyyixfkawf4iop4o373dc6fosy7bfydbe5@pm43dhkd7asu>
In-Reply-To: <mg2ugyg65ke3tngzqyyixfkawf4iop4o373dc6fosy7bfydbe5@pm43dhkd7asu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Oct 2024 09:43:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcw_UHAZRVGt=Tr0jv3NOPDibtPy1E-46Pq74YKFZxWg@mail.gmail.com>
Message-ID: <CAMuHMdUcw_UHAZRVGt=Tr0jv3NOPDibtPy1E-46Pq74YKFZxWg@mail.gmail.com>
Subject: Re: [PATCH v5 03/10] clk: renesas: clk-vbattb: Add VBATTB clock driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Claudiu <claudiu.beznea@tuxon.dev>, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, Oct 31, 2024 at 8:48=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On Wed, Oct 30, 2024 at 01:01:13PM +0200, Claudiu wrote:
> > From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >
> > The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
> > by the RTC. The input to the VBATTB could be a 32KHz crystal
> > or an external clock device.
> >
> > The HW block diagram for the clock generator is as follows:
> >
> >            +----------+ XC   `\
> > RTXIN  --->|          |----->| \       +----+  VBATTCLK
> >            | 32K clock|      |  |----->|gate|----------->
> >            | osc      | XBYP |  |      +----+
> > RTXOUT --->|          |----->| /
> >            +----------+      ,
> >
> > After discussions w/ Stephen Boyd the clock tree associated with this
> > hardware block was exported in Linux as:
> >
> > vbattb-xtal
> >    xbyp
> >    xc
> >       mux
> >          vbattbclk
> >
> > where:
> > - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
> > - xc, xbyp are mux inputs
> > - mux is the internal mux
> > - vbattclk is the gate clock that feeds in the end the RTC
> >
> > to allow selecting the input of the MUX though assigned-clock DT
> > properties, using the already existing clock drivers and avoid adding
> > other DT properties. If the crystal is connected on RTXIN,
> > RTXOUT pins the XC will be selected as mux input. If an external clock
> > device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
> > mux input.
> >
> > The load capacitance of the internal crystal can be configured
> > with renesas,vbattb-load-nanofarads DT property.
> >
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> > --- a/drivers/clk/renesas/Kconfig
> > +++ b/drivers/clk/renesas/Kconfig
> > @@ -237,6 +237,10 @@ config CLK_RZV2H
> >       bool "RZ/V2H(P) family clock support" if COMPILE_TEST
> >       select RESET_CONTROLLER
> >
> > +config CLK_RENESAS_VBATTB
> > +     bool "Renesas VBATTB clock controller"
>
> tristate

Good point.
However, does it work as a module, or would that break the RTC?

And this is missing

        depends on ARCH_RENESAS || COMPILE_TEST

which I can add while applying.

>
> > +     select RESET_CONTROLLER
> > +

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

