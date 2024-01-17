Return-Path: <linux-rtc+bounces-546-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CD482FF48
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jan 2024 04:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03AC528A2FD
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jan 2024 03:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC3B1C13;
	Wed, 17 Jan 2024 03:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nr3tdwd+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF791864;
	Wed, 17 Jan 2024 03:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705461896; cv=none; b=McgRW+OhRDdwevO9hcZbz3WRFd3S0wRi5TULs1oLLni3CSiZsW/NCuVnnaYWuikGTZzt3gGk0EXmFGq+Vi9n/V3+b6CRPiSn6e6xf1WDSShIbp09AOdp0eO8K6RMWHpI7FexNRkwLmsoNwTUuAj5LMWycQvLZSQHqpjZNfeBSCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705461896; c=relaxed/simple;
	bh=O6UyS1EMd2El1cJhogceDXs4CkCPSiWrYf8da+BURv4=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=Y7TArAbL9Xd174a5mAXKsKdt1bja/5rc/8ntCZd8Did8xGMn8xBovLGeQd+Y6BE6voHCQtDpTwA3e2Sl9RVIaG0UpDl8FmQmTsS3uJU+7lUpRRN33sUWwaaGVpGoQ/m51VyUCzI8q1oI7ivsxdgk2k4/tJI/1hY+WIEpbIh2Lic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nr3tdwd+; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-59505514213so4692869eaf.0;
        Tue, 16 Jan 2024 19:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705461894; x=1706066694; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrR0tHpidkGB05XRXnhTobUQZ0agqDLMMD3A5T7XObQ=;
        b=nr3tdwd+uWj7vdRMTGMZN32aLCGnqoJBLQclPh7e1YbKFEtqTEZwrU3Z3x4Zut5ZLq
         nY1VLCByfWIUWNnCq8RCuhEzF8zdaVbs9SOwtOFKMYSEjR6aL1NleBKybAtW2P0rrdOi
         XLPFuirOz5Su4new/bhPZsuLx1T9HB4gbyhjU13ZUUr0MVhIZC0D+ztnRW34xG3FASRH
         YALeVZ1dW/waFUC3z8R2BrmvWtnKBSYmGGVcGo8SPk10bdiap7tVhoD9kSPHcZQWQyy9
         W84Jj8kmPLHwcBAKOg42ye3a3vKUmd4m59NkA+yBGWcu41HbaGx0Gitd+FShUaqPSA/g
         Z8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705461894; x=1706066694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hrR0tHpidkGB05XRXnhTobUQZ0agqDLMMD3A5T7XObQ=;
        b=jfeU+s071s/hrbHE/wsYi4uwcoFjkBCQb7mU4KjHA2tcV40yI1eOOK2sEBESYPepNb
         0KL+SNViVjd4oEVq400mJMq7yifiALstK3N1RJiKt/VasA/3R7bQTfEe41USOjOL5oOh
         W2zlAQYzClNx2YaDTz81w12JCuhOGyfyU3Cl/w4JbG2Mqjzf9SlCg+7P/b8yNjnaVPJO
         lDS3kJSJMZ1v7oTL2mBcBhKT7yXme+Jj85tnnTRrqcgXFRHH1I/IB9wl5LoyvIhA1pzL
         8N211pthXtrZ8lJhKvFcj3OEjBu/59KWZsetAje611BMJa7gqEnho3E4lb4DNKGhG0Yx
         7cbg==
X-Gm-Message-State: AOJu0YxYeK0GzKnvLFpNIi3/x27AkQEWMQH/Nn0OzKJL2mmoEfD69S7W
	D7Wfau+TySWsGMvWnDtmlvIs62rsF1UmfQJAK5gw9drE4j2S0k4ygdaU62qXfUhlBx+CGZkf5hW
	VaOJMCJfbHzckyPDDS5fgHXgapG0=
X-Google-Smtp-Source: AGHT+IHe61Kn+9uVBZYc7hWtmFOSFgviXZksDl/J4M/jJGlzviJV374++J1MEUvTailaIMHtaCZo+nTHk0X5WxMaD/o=
X-Received: by 2002:a05:6820:2a15:b0:599:27c8:d7f9 with SMTP id
 dr21-20020a0568202a1500b0059927c8d7f9mr76965oob.8.1705461893991; Tue, 16 Jan
 2024 19:24:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
 <20240115160600.5444-4-qiujingbao.dlmu@gmail.com> <f2b3dff2-ce0d-4ddb-ad61-74abf2c3022d@linaro.org>
 <CAJRtX8QFLoWnJBkepZrbneHX8qZdde=aw+zbdErVC91B=u==MA@mail.gmail.com>
 <007e8c14-13eb-4917-b9da-8d47d6c965c7@linaro.org> <CAJRtX8ROH4R_s1=ML5ka340PAE0SWJKK24yVWHw5gCd+7d9pkA@mail.gmail.com>
 <dfcf74a9-db76-43fe-9261-20bf7a993bc3@linaro.org> <CAJRtX8Tkie+ykLv8L2EgBQcy9tVP5Yz-_J_eHE-9N9hjt+6gkg@mail.gmail.com>
 <f99da95d-a6ab-4646-8ad8-8245e275639e@linaro.org>
In-Reply-To: <f99da95d-a6ab-4646-8ad8-8245e275639e@linaro.org>
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Date: Wed, 17 Jan 2024 11:24:43 +0800
Message-ID: <CAJRtX8Qxvpf_CTJG41U6JC3_qLL9raFxX3LD0LoPNhve=MDyFA@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] riscv: dts: sophgo: add rtc dt node for CV1800
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: alexandre.belloni@bootlin.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, chao.wei@sophgo.com, 
	unicorn_wang@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	dlan@gentoo.org, inochiama@outlook.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 12:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 16/01/2024 17:29, Jingbao Qiu wrote:
> > On Wed, Jan 17, 2024 at 12:03=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 16/01/2024 16:51, Jingbao Qiu wrote:
> >>>>> CV1800 is a RISCV based SOC that includes an RTC module. The RTC
> >>>>> module has an OSC oscillator
> >>>>
> >>>>
> >>>> I am not going to read pages of description. Please write concise re=
plies.
> >>>
> >>> Thanks, What I mean is that this hardware includes two functions, RTC
> >>> and POR. How should I describe their relationship?
> >>
> >> Your POR does not need to take any resources, so no need to describe a=
ny
> >> relationship.
> >>
> >> ...
> >>
> >>>>> Your suggestion is, firstly, the por submodule does not have any
> >>>>> resources, so it should be deleted.
> >>>>
> >>>> So where did you delete it? I still see it in this patch.
> >>>
> >>> Should I completely delete him? How can a por driver obtain device in=
formation?
> >>
> >> Delete completely.
> >>
> >> Device information? What is this? We already agreed you don't have any
> >> resources for POR.
> >>
> >> ....
> >>
> >>>> Device is only one thing, not two.
> >>>>
> >>>>>                     reg =3D <0x5025000 0x2000>;
> >>>>>                     interrupts =3D <17 IRQ_TYPE_LEVEL_HIGH>;
> >>>>>                     clocks =3D <&osc>;
> >>>>> };
> >>>>> However, in reality, the POR submodule does not use IRQ and CLK.
> >>>>> Please do not hesitate to teach. Thanks.
> >>>>
> >>>> I expect one device node. How many drivers you have does not matter:=
 you
> >>>> can instantiate 100 Linux devices in 100 Linux device drivers.
> >>>
> >>> I understand what you mean. A device node corresponds to multiple dri=
vers.
> >>> Should I completely delete the POR device tree node and add it when
> >>> submitting the POR driver?
> >>
> >> ? I wrote it in previous messages and twice in this thread. Completely
> >> delete. You do not add it back! Because if you ever intended to add it
> >> back, it should be added since beginning. I don't understand what
> >> submitting later would solve.
> >>
> >>> If that's the case, how can I explain that the rtc device tree node
> >>> uses the syscon tag?
> >>> How can I describe a POR device in DTS? POR is a submodule of RTC, an=
d
> >>> it also has corresponding drivers.
> >>
> >> I said, there is no need for POR in DTS, because you have nothing ther=
e.
> >> Why do you insist on putting it on DTS?
> >>
> >>> It's just that his resources are only shared with RTC's Reg.
> >>
> >> What resources? Reg? That's not a separate resource.
>
> I meant, separate from the RTC. I had impression that IO space is shared
> or mixed with RTC? If it is separate, why it wasn't listed?
>
> >
> > I'm very sorry about this.
> > But I found a binding file that only contains Reg and Compatible.
> >
> > rtc@80920000 {
> > compatible =3D "cirrus,ep9301-rtc";
> > reg =3D <0x80920000 0x100>;
> > };
> >
> > Link: Documentation/devicetree/bindings/rtc/cirrus,ep9301-rtc.yaml
>
> And?
>
> >
> >>
> >> To summarize: Drop POR from DTS and never bring it back, unless you co=
me
> >> with some different arguments, which you did not say already.
> >>
> >
> > You are right, if there is no por device tree node, how can the por
> > driver obtain the Reg?
>
> The same as currently. Does your POR node has reg? No, so according to
> your logic it cannot obtain address space.
>
> Children Linux devices share regmap with parent device.
>

Thanks, Power-On-Reset/POR driver requires Reg to complete its functions.
The compatible of POR is required in DTS to load the corresponding driver.
The POR driver was not submitted in the patch. However, this patch requires
the addition of RTC in DTS. Considering the future addition of POR
driver, I added a POR node.
I'm not sure why the POR node needs to be deleted, just because it
only has the compatible attribute?
Or maybe it's because I didn't submit the POR driver, so I need to
delete the POR node.
I found an example.

st: timer@fffffd00 {
    compatible =3D "atmel,at91rm9200-st", "syscon", "simple-mfd";
    reg =3D <0xfffffd00 0x100>;
    interrupts =3D <1 IRQ_TYPE_LEVEL_HIGH 7>;
    clocks =3D <&slow_xtal>;
    watchdog {
      compatible =3D "atmel,at91rm9200-wdt";
    };
};

Link:arch/arm/boot/dts/microchip/at91rm9200.dtsi:114

Like this, when the por driver insmod is activated, the por driver can
obtain the regs of the parent device.
Thank you again.

Best regards,
Jingbao Qiu

