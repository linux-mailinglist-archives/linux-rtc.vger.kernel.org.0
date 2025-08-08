Return-Path: <linux-rtc+bounces-4655-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF3E6B1F0B3
	for <lists+linux-rtc@lfdr.de>; Sat,  9 Aug 2025 00:37:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C1E77B64B2
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Aug 2025 22:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD88828AB1A;
	Fri,  8 Aug 2025 22:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcsyL1bK"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0101E28A73B;
	Fri,  8 Aug 2025 22:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692637; cv=none; b=kxL8C9ThMVlHi3ZZqQcZKTsIZZGHYT4DujH9Z5ZnAUEDq++7mNi/RNIwlQucPcXqeAa8lDM1AZMa/mkBG3Ki4Oa+AxV4cIWOE+RNYNLSuQaZadtzWqbUCmUF3om29GEOrj2BSDnjKoAi8Sm/+dXIdIz8Xj73y6QLege3YEG+/bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692637; c=relaxed/simple;
	bh=eyTpBn+/UsLCK9d42tdanu30au/6f7TC4NaT+cwdwaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvhYPKGOV0ISDc2o5nlERGwrZ8DSPgpfLnWgZHuXygL560EBOmQRFSDkhtg9ecyU8eqAetVqUd9gj4n46ezD288TDIPXtbVnQygQ+OcjXp5hkaUJeDnyTJHoUjRdGDmIhZdU+/B5ZDa6+7ma5f7cuptkLDI+wtfDEdDpxITiq2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcsyL1bK; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e8fed231c24so418216276.3;
        Fri, 08 Aug 2025 15:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754692635; x=1755297435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u8PcdViVM9JE8IbZsZm/xllXdMrlzsbljuByQCZPh34=;
        b=LcsyL1bKiuZa3/d7fTIB0WXeFYJ3fq3Yj5XCqNrp/t4H05cHoSHflRVoD+UOSVbGok
         Ne2H3L3d0HBIOtCVzct2ZvldMc7VlZqjeigPa1ORwoLpjbsgKYLT6J9M6SuBvLBR/Lml
         V4P5WWPWnxcPck+2b+RG+z7szR3vJQBsEBnMuRhL0hrWI6ZhFi4RebKgUnMCkMq3CKeF
         YNlmzNf6kVbHqUSAVALFYKCrhmPCASHNownl2UB7FhUat6T/hSClXlwK33td1W3MzbdM
         afjl2p62w6koyIsBFNALu8ZYDVGAuV9R1CjE9aHIgoc29SWKAVpjlRy4scTMUydWtODN
         o4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754692635; x=1755297435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u8PcdViVM9JE8IbZsZm/xllXdMrlzsbljuByQCZPh34=;
        b=aRUcywmf1Qc+b6twWJx0291LuJiAwDL00NIJyP+KRxUex7dpcR6gDQdmC5EBrTrwJX
         59kQFCIM4bimY8ZsKNYelfVFc0dE2qCKH2c7lHxKx519gHavhiOB82GnWcPI+Gj5WaNR
         2fsJLdXD+WLWS7WmJgYcys3laNn2CkQEjv/GPvo5u+v7sU2YrZqgH+9mfU0/cnKwtgwE
         XRIhQ+ASdfL/cxgOIHKkw1uto/cu3VhBh3fJ7oEWy2ShTf1jU17itg77V1Hy33n8zkfF
         gIzme83nB1yVCAVKj+L3L+EwYmPiJk7BbGMKT4rvgUFMXA740WQyOc8ceuUqJFKoSQX2
         HWCw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ2pi1clbgwuu0hYVMgeGFa/4/uOxnL4Hvf3yredZ9yeBbmcG3Nw27hA6tBQ2QxB/nttKE47l2ALEcZm4=@vger.kernel.org, AJvYcCVHfChcQGNHqLUZO/vbsZRswfEyxGi0dZFLYFshWO8IDdO68vEDmVLYy04qroRi39CG+wCaBeRq2NzO@vger.kernel.org
X-Gm-Message-State: AOJu0Yz17q0bbxnUIhTqKp+17FplAJ4pcZ/auAIbxZx2MgInZxdYxp8K
	cX5iRJr7eH0enn0WG34ZllS55rT17HEYNVUB57DMxhFHljZo9sjn2LQKlugZQb1zzZjeBqQfOC9
	r635NnFsWcTii/cCs6P+QXORDvBXcw5w=
X-Gm-Gg: ASbGncvyVuS4WnaEK0Z1kIqx1F+bmRVo6wt+d+xZkY0ku0RXnzuVSqznsRMjWDJ7Nv1
	jAOh59Uc4SzpW9sozpa2Gx7fHDG1E+GRmsrOcvICiIx+o2oV1qbYaXqa0cbbc8id8OVEDaEGpBV
	PZP5inZlGER4hOd2wqs/tbETkT5s3ewCgFUGsB/2qPl7dQnI9SOuOMAcpYFENm+J74jSMWsFC/k
	0ZrdEo=
X-Google-Smtp-Source: AGHT+IH/XOBhWDGZF7tzd1bJiHZgTVQajMTE0Df6YY0Q1oHeFqhiksv2ysGW44ElsIxDlyJzzEz12bHe8e1R0ERq4zA=
X-Received: by 2002:a05:690c:6c87:b0:71a:2d5f:49d8 with SMTP id
 00721157ae682-71c0830fb07mr3640127b3.3.1754692634671; Fri, 08 Aug 2025
 15:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250804154750.28249-1-l.rubusch@gmail.com> <20250804154750.28249-2-l.rubusch@gmail.com>
 <20250804213213d4844d4e@mail.local> <CAFXKEHZn0XQMe6RBHDJzcGZy+JPpNpfidD1mT2MBmZ_WamFQKQ@mail.gmail.com>
 <202508052224366c9bb920@mail.local>
In-Reply-To: <202508052224366c9bb920@mail.local>
From: Lothar Rubusch <l.rubusch@gmail.com>
Date: Sat, 9 Aug 2025 00:36:38 +0200
X-Gm-Features: Ac12FXwrj9u2mr9B3E8JKtkTjq0XV8wLc19QmZz6-lCwcXpxcioBMrR874zHxXU
Message-ID: <CAFXKEHZee0c4=ETwA=P_MP2+O+01s0dwS=5EjeK1Gkk3PRDNHg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] rtc: zynqmp: ensure correct RTC calibration
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: michal.simek@amd.com, srinivas.neeli@xilinx.com, linux-rtc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ivan Vera <ivan.vera@enclustra.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 12:24=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 05/08/2025 23:56:46+0200, Lothar Rubusch wrote:
> > On Mon, Aug 4, 2025 at 11:32=E2=80=AFPM Alexandre Belloni
> > <alexandre.belloni@bootlin.com> wrote:
> > >
> > > On 04/08/2025 15:47:50+0000, Lothar Rubusch wrote:
> > > > From: Ivan Vera <ivan.vera@enclustra.com>
> > (...)
> > > > diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> > > > index f39102b66eac..0c063c3fae52 100644
> > > > --- a/drivers/rtc/rtc-zynqmp.c
> > > > +++ b/drivers/rtc/rtc-zynqmp.c
> > > > @@ -331,9 +331,9 @@ static int xlnx_rtc_probe(struct platform_devic=
e *pdev)
> > > >               if (ret)
> > > >                       xrtcdev->freq =3D RTC_CALIB_DEF;
> > > >       }
> > > > -     ret =3D readl(xrtcdev->reg_base + RTC_CALIB_RD);
> > > > -     if (!ret)
> > > > -             writel(xrtcdev->freq, (xrtcdev->reg_base + RTC_CALIB_=
WR));
> > > > +
> > > > +     /* Enable unconditional re-calibration to RTC_CALIB_DEF or DT=
B entry. */
> > > > +     writel(xrtcdev->freq, xrtcdev->reg_base + RTC_CALIB_WR);
> > >
> > > Doesn't this forcefully overwrite the proper value that has been set
> > > from userspace and so trashes the time at each reboot?
> > >
> > Yes, it overwrites the calibration, i.e. counting 1sec in about 1sec.
> > No, the time/date is not actually "trashed" (I double-checked that
> > with timesyncd disabled, having and not having register content and
> > over several reboots keeping a bogus date/time - it psersistet in the
> > same time space. The current patch always overwrites the calib
> > register content. So, a manual userspace setting will be lost after
> > reboot. That's true.
>
> It is about 1sec on your platform because it didn't deviate too much
> from the expected value but what if another platform needs a way
> different value? Then you are introducing the same issue as the one you
> are trying to fix but it will have it at each reboot.
>
I guess you missunderstood me here a bit. I understand that every
scenario will need individual calibration especially over time.

> >
> > Would it rather make sense to extend it, say, instead of merely
> > checking whether the calibration register contains any data - which
> > could potentially be incorrect - also check for the presence of a
> > calibration property in the devicetree (or a similar property, since
> > 'calibration' may be deprecated)? If such a property exists, perform a
> > re-calibration based on the devicetree at every reboot. Otherwise,
> > retain the current behavior of checking whether the register is empty?
> >
> > > Isn't the proper way to reset it to simply set the offset from usersp=
ace
> > > again?
> > >
> > Hm.. I'm unsure if I understood you correctly. You mean the way as
> > described in AMD's link to perform the reset by executing the devmem
> > from Linux manually? If so, why is it preferable to adjust the RTC
> > calibration manually every time this happens, rather than to simply
> > put a correction value into the devicetree properties for problematic
> > setups? Or do I miss something, is there a config file for RTC
> > calibration for doing this persistently from Linux, that I'm not aware
> > of?
> >
> > Before, the devicetree properties seemed to have generally priority
> > over userspace settings. Now, after the calibration rework, this
> > priorization seems to have changed and a devicetree calib correction
> > for such problematic cases will generally be ignored, with a
> > recommendation by Xilinx/AMD (see link in cover letter) to execute a
> > devmem command from off Linux (...). I mean, can't this be elaborated
> > a bit more to allow for a persistent correction method?
>
> The value depends on each manufactured machine/board as it is supposed
> to correct for imprecision on the input clock which is either a crystal
> or derived from a crystal. This crystal may be more or less accurate and
> its accuracy will change over time notably because of temperature
> changes or simply because it is aging. Having the value in the device
> tree is as good as having it hardcoded in the driver which is not far
> from what your are doing here. It makes the feature useless.
>
Yes, I see your point.

> What I was suggesting is simply to do the right thing, compute the
> inaccuracy and correct it from userspace, using the proper interface
> that is sysfs or the RTC_PARAM_SET ioctl for RTC_PARAM_CORRECTION
> This has to be done regularly anyway so I guess it would catch and
> correct any corrupted value in the register.
>
The degradation over time and or temperature does not match the static
approach we took of our v1 patch. I modified it still a bit to keep userspa=
ce
configurations, and use the optional devicetree property for a correction. =
But
this does not cancel out your argumentation, since the approach is still st=
atic.
So, I have to agree, thanks.

Best,
L

> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

