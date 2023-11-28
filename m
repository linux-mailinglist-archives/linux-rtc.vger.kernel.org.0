Return-Path: <linux-rtc+bounces-362-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B29F37FBB5F
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Nov 2023 14:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6FF94282BEF
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Nov 2023 13:23:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB19858114;
	Tue, 28 Nov 2023 13:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8u9G0yD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DD5390;
	Tue, 28 Nov 2023 05:23:16 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-58d54fd8c5aso1517998eaf.2;
        Tue, 28 Nov 2023 05:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701177795; x=1701782595; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+D+kelET1lYqbh/KjJRYmV6h/cajU1QJXlzne6uJHw=;
        b=S8u9G0yDz4h+C0E6uhHuAynYfb+vsxUsK+FNwNRSYfU5v2RyUuWVSsJQLb0/F8nt5p
         pKqOep9sVzWJvnJNpmMgID0dzKcWNahPhhIXDSAbjdMafruRKa4HWBmEu/2GkJSw2BhF
         u43ibYV3ON6qxpo3eGBJ4oxUy9JK2y991hEvot8EDUQ/Db973ZyD0jMv/M16IoKGjFmS
         YaMM9oXzSVoOPItHHJt5ek6Y67q07vvujYhNB2jjtPiGgFw9VPJ789FsetytBAJfhnAP
         zJ27gDFDjDVZVVo+9dE8us3/Gd0Qh5VZtdu2L4VV9kio9X9Td8IHc+2NnHMBzgeUNj12
         azMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701177795; x=1701782595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z+D+kelET1lYqbh/KjJRYmV6h/cajU1QJXlzne6uJHw=;
        b=P0ki99roaR6aUWIzADL5e8mMxiXx0dZTy9NMstZNEeRdS42ejf6ExLSc/nZvmaz874
         L0dONPaQtlMk4LFm1NET9djAAtC20i1HYb2vKyFmrCCggkgPjCjd1rQW6hEUlhvBVJ5D
         1nLmsXIWfXNN90v5ctn36UDgbL/s59R8CZwAZkPdHV+MXhpcU+beqIYe7YZpKfb49KLs
         W6+AtVJs3BFtkAdVSowGqQgAxCf/UCMucZcA3bf0kNH4lUvRkrZ5zxKhyAFarjtFmorw
         NdzcNXDocy3+rB9eajbnMOfEA3acR8zGMvyUAuvIqeaZ8dtu3v2d6UFT1va8gyc0pNUh
         7/sg==
X-Gm-Message-State: AOJu0Ywx85F8/xlDj/gwdS/ZdPQ28zeEvpf+PYtpQiXTfYnU10jmOo8r
	cCked5d+SxFw9l8BDnFOitA443iKD3PAXv0lzJI=
X-Google-Smtp-Source: AGHT+IF+YMz6ll1sP40q174Fm9TYiVlVqsZPnobmdN/XMvXZnG9ddn0oUn+jFztkp4G5300CWS9GroRE72If5g8Vm3A=
X-Received: by 2002:a05:6820:1504:b0:58d:97fb:cce9 with SMTP id
 ay4-20020a056820150400b0058d97fbcce9mr5162214oob.0.1701177795285; Tue, 28 Nov
 2023 05:23:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231121094642.2973795-1-qiujingbao.dlmu@gmail.com>
 <20231121094642.2973795-4-qiujingbao.dlmu@gmail.com> <457b44f2-57b6-4811-ae43-b49a92d64d99@linaro.org>
In-Reply-To: <457b44f2-57b6-4811-ae43-b49a92d64d99@linaro.org>
From: jingbao qiu <qiujingbao.dlmu@gmail.com>
Date: Tue, 28 Nov 2023 21:23:04 +0800
Message-ID: <CAJRtX8Skn7y_=Zq9U0mk0msVAkQ0-EAvofzkmC-ZEA_Q8XLxgA@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: sophgo: add rtc dt node for CV1800B
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: a.zummo@towertech.it, alexandre.belloni@bootlin.com, 
	krzysztof.kozlowski+dt@linaro.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, conor+dt@kernel.org, robh+dt@kernel.org, 
	conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 21, 2023 at 6:00=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/11/2023 10:46, Jingbao Qiu wrote:
> > Add the rtc device tree node to CV1800B SoC.
> >
> > Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/=
dts/sophgo/cv1800b.dtsi
> > index df40e87ee063..89411c75b89a 100644
> > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > @@ -119,5 +119,13 @@ clint: timer@74000000 {
> >                       reg =3D <0x74000000 0x10000>;
> >                       interrupts-extended =3D <&cpu0_intc 3>, <&cpu0_in=
tc 7>;
> >               };
> > +
> > +             rtc: rtc-controller@05026000 {
> > +                     compatible =3D "sophgo,cv800b-rtc";
> > +                     reg =3D <0x05026000 0x1000>;
> > +                     interrupts =3D <17 IRQ_TYPE_LEVEL_HIGH>;
> > +                     interrupt-parent =3D <&plic>;
> > +                     clocks =3D <&osc>;
> > +             };
>
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check W=3D1` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sou=
rces-with-the-devicetree-schema/
> for instructions).

I will check it.

>
> Best regards,
> Krzysztof
>

Best regards,
Jingbao Qiu

