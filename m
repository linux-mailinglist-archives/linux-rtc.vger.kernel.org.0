Return-Path: <linux-rtc+bounces-3898-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F92A83A6C
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 09:12:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34B353B2904
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 07:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53AE3202C26;
	Thu, 10 Apr 2025 07:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iShsUab5"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82452045B0
	for <linux-rtc@vger.kernel.org>; Thu, 10 Apr 2025 07:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268950; cv=none; b=QgDTy03DhAHeocmUsWy8q2yhHGnojYf2tpkRHYwazAn7442r2ytFFAh6PdMHSvSoOSTq3bnz1Z8owX9GRH+5TP1UIcu6WH38KY5jrnHkjgjyey69q1rYAwr3gcUsxL0qstT1ttPEX3NmNVAzAgK5M/sU0OOATsI9hqRZzx9y3Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268950; c=relaxed/simple;
	bh=GDLZOHEysElKgwiPAIgHoePbj1Mc5+GUR0Afxq68uS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c67VKhjGSJWlAqrTwyU48/kGLHnPmR3rq8qUHxku1AI/lDrjPuWBOG330oKNAdJ4wibi6cGGCtLeVdLps2U338CmpT9FWOgGedY0IT2MNS5eiVWQqXgYhIbqPkynZRIjIufppLOFqYcxNjDGkQHMtpThPucyVD2VOpkEwB8Da2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iShsUab5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744268946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=amLwGhc2ehknmIFO95t2nUVDkHjyZ06DXoBWq9sLUuc=;
	b=iShsUab5mQnIU/fd4LjZUlBwoQUO/zb7cZYefgLLlxJulOOlD5FZ5jEeJqMRY2J0agtFm/
	OP83222oz0ikgci4et/O/GjFP/wYDHoecHEGTuSwOXDDxPrlJGBv7aeDSxTSgol9so5f3m
	9EPMj30jkuSwafu9uFK5AhrYZ2VrUoI=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-n5sppf3fPAiysrBiWZmCCw-1; Thu, 10 Apr 2025 03:09:04 -0400
X-MC-Unique: n5sppf3fPAiysrBiWZmCCw-1
X-Mimecast-MFC-AGG-ID: n5sppf3fPAiysrBiWZmCCw_1744268944
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-72b7d435614so134304a34.2
        for <linux-rtc@vger.kernel.org>; Thu, 10 Apr 2025 00:09:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744268944; x=1744873744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=amLwGhc2ehknmIFO95t2nUVDkHjyZ06DXoBWq9sLUuc=;
        b=KkW4BXRbwXiHRmm5CEPuLz7GoV3rxQaBSTyANYmtdc+vRFLnlkj6mWgIIk9MsmRrD4
         wCIFHrq6/czupiZDQLgHxuiCTSoGLJXz7qDS01DdAPxNxk/LHjjK9S6aOWQuSjkQLDW2
         Qz2h8vxolp1eXHP7mhfaqb9X7qNK7o2eENq3wDD2kyxCjEfaErrHF0aham0gW0kKX5gc
         DsHmE4fwWdQBWnxRzGXiiWdSQsqUypqjNpZBMCmEXc8gxocielIKJaD8/clLWMMOrOtp
         7Yd3ZjKHkMVaZeEoRXu/8QBhBauy3i5JOxFnrpbWm4+97htl0wmKTOlkknpWL2gbwSEs
         lhbg==
X-Forwarded-Encrypted: i=1; AJvYcCWDmrPsnPIgXDnivk8g2/brkOIhs+J8Hgp6rbCj0juFXFRmt5WMPGXkjJCF3mmJzPuJ5f/qUEgmrxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVRvEiZ8790LGs7+qvdxifFkwVI/EbvVM53fZu4Qebes4hgtIE
	VMYzyA121hiiWz7EqBuRA2BOq+lLTa3WVdd29pMdEkdAXIC42p8EFcmmtrGSmAlA7cUChLIpiDv
	HcitMqhYun8gj9fN3J/x1MlnPrddyMVN9JdUqhw+u6fUS53OwHjcJBP/+31bzVMW1KB3EGZrUZH
	0zBuXvoveenngHZvsb36xwk9MvIhYwyJcP
X-Gm-Gg: ASbGncuzZeZ8Tsi3MK+VT+eWCO8NQ8b5c89IkC/l1FXB6HBO4Og/ShERBTQg861Ciy4
	f4EK6+SJcue0wEvRNCJW54DjAkX8maoHAKsSxKp+7pfj380GK9d+H50PYL5BEUEUQNmPY
X-Received: by 2002:a05:6871:aa02:b0:2bc:7800:f795 with SMTP id 586e51a60fabf-2d08df89f8fmr1138859fac.10.1744268943904;
        Thu, 10 Apr 2025 00:09:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFV7k/mN8K9PkeF1zrnmNQyY42ij6/Ta9Vt+S1Tvotewj97FjhmW+AVQ8NEnRyytx0H21vA7oYtnge7M2g8Aig=
X-Received: by 2002:a05:6871:aa02:b0:2bc:7800:f795 with SMTP id
 586e51a60fabf-2d08df89f8fmr1138849fac.10.1744268943490; Thu, 10 Apr 2025
 00:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403103346.3064895-1-ciprianmarian.costea@oss.nxp.com>
 <20250403103346.3064895-3-ciprianmarian.costea@oss.nxp.com>
 <CALE0LRs3VA9kLy4QSEOBCixZbptW4B4DVjZqbN=GDoONHq2oeA@mail.gmail.com>
 <9f982548-c5e3-45ed-963a-afb5256acf31@oss.nxp.com> <CALE0LRvUXck_FSP0jCZ1Ene-LCEa8MDFQWVCHGpOzd_yGk+v4g@mail.gmail.com>
 <64843c72-37e3-4080-880f-a020e372b521@oss.nxp.com>
In-Reply-To: <64843c72-37e3-4080-880f-a020e372b521@oss.nxp.com>
From: Enric Balletbo i Serra <eballetb@redhat.com>
Date: Thu, 10 Apr 2025 09:08:44 +0200
X-Gm-Features: ATxdqUEYfOHsGy5Jrbi_fQ3817_pePcNUuq067wjia7PG6dtgzOqgrMwmsfbNEs
Message-ID: <CALE0LRtngtq0f=5aGqB2zxXqSstQudLbKkg6dDcFzEu16UVWDg@mail.gmail.com>
Subject: Re: [PATCH v9 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
To: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-rtc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux <s32@nxp.com>, imx@lists.linux.dev, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Eric Chanudet <echanude@redhat.com>, Bogdan Hamciuc <bogdan.hamciuc@nxp.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ciprian,

On Wed, Apr 9, 2025 at 4:58=E2=80=AFPM Ciprian Marian Costea
<ciprianmarian.costea@oss.nxp.com> wrote:
>
> On 4/9/2025 5:42 PM, Enric Balletbo i Serra wrote:
> > Hi Ciprian,
> >
> >
> > On Wed, Apr 9, 2025 at 4:26=E2=80=AFPM Ciprian Marian Costea
> > <ciprianmarian.costea@oss.nxp.com> wrote:
> >>
> >> On 4/9/2025 5:14 PM, Enric Balletbo i Serra wrote:
> >>> Hi Ciprian,
> >>>
> >>> Many thanks for your patch.
> >>>
> >>> On Thu, Apr 3, 2025 at 12:34=E2=80=AFPM Ciprian Costea
> >>> <ciprianmarian.costea@oss.nxp.com> wrote:
> >>>>
> >>>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> >>>>
> >>>> Add a RTC driver for NXP S32G2/S32G3 SoCs.
> >>>>
> >>>> RTC tracks clock time during system suspend. It can be a wakeup sour=
ce
> >>>> for the S32G2/S32G3 SoC based boards.
> >>>>
> >>>> The RTC module from S32G2/S32G3 is not battery-powered and it is not=
 kept
> >>>> alive during system reset.
> >>>>
> >>>> Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> >>>> Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
> >>>> Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> >>>> Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
> >>>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.c=
om>
> >>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >>>
> >>> I went through the code and it looks good to me, so:
> >>>
> >>> However, I did a basic rtctest selftest in my S32G-VNP-RDB3 board,
> >>> and some tests failed (it shows a small deviation), any idea what
> >>> could be wrong?
> >>>
> >>> This is the output of the test:
> >>>
> >>> # ./rtctest
> >>> TAP version 13
> >>> 1..8
> >>> # Starting 8 tests from 1 test cases.
> >>> #  RUN           rtc.date_read ...
> >>> # rtctest.c:59:date_read:Current RTC date/time is 28/01/2025 00:17:49=
.
> >>> #            OK  rtc.date_read
> >>> ok 1 rtc.date_read
> >>> #  RUN           rtc.date_read_loop ...
> >>> # rtctest.c:124:date_read_loop:Continuously reading RTC time for 30s
> >>> (with 11ms breaks after every read).
> >>> # rtctest.c:151:date_read_loop:Performed 2638 RTC time reads.
> >>> #            OK  rtc.date_read_loop
> >>> ok 2 rtc.date_read_loop
> >>> #  RUN           rtc.uie_read ...
> >>> #            OK  rtc.uie_read
> >>> ok 3 rtc.uie_read
> >>> #  RUN           rtc.uie_select ...
> >>> #            OK  rtc.uie_select
> >>> ok 4 rtc.uie_select
> >>> #  RUN           rtc.alarm_alm_set ...
> >>> # rtctest.c:262:alarm_alm_set:Alarm time now set to 00:18:31.
> >>> # rtctest.c:282:alarm_alm_set:data: 1a0
> >>> #            OK  rtc.alarm_alm_set
> >>> ok 5 rtc.alarm_alm_set
> >>> #  RUN           rtc.alarm_wkalm_set ...
> >>> # rtctest.c:334:alarm_wkalm_set:Alarm time now set to 28/01/2025 00:1=
8:34.
> >>> # rtctest.c:353:alarm_wkalm_set:Expected new (1738023515) =3D=3D secs=
 (1738023514)
> >>> # alarm_wkalm_set: Test terminated by assertion
> >>> #          FAIL  rtc.alarm_wkalm_set
> >>> not ok 6 rtc.alarm_wkalm_set
> >>> #  RUN           rtc.alarm_alm_set_minute ...
> >>> # rtctest.c:394:alarm_alm_set_minute:Alarm time now set to 00:19:00.
> >>> # rtctest.c:414:alarm_alm_set_minute:data: 1a0
> >>> # rtctest.c:420:alarm_alm_set_minute:Expected new (1738023541) =3D=3D=
 secs
> >>> (1738023540)
> >>> # alarm_alm_set_minute: Test terminated by assertion
> >>> #          FAIL  rtc.alarm_alm_set_minute
> >>> not ok 7 rtc.alarm_alm_set_minute
> >>> #  RUN           rtc.alarm_wkalm_set_minute ...
> >>> # rtctest.c:464:alarm_wkalm_set_minute:Alarm time now set to
> >>> 28/01/2025 00:20:00.
> >>> # rtctest.c:483:alarm_wkalm_set_minute:Expected new (1738023601) =3D=
=3D
> >>> secs (1738023600)
> >>> # alarm_wkalm_set_minute: Test terminated by assertion
> >>> #          FAIL  rtc.alarm_wkalm_set_minute
> >>> not ok 8 rtc.alarm_wkalm_set_minute
> >>> # FAILED: 5 / 8 tests passed.
> >>> # Totals: pass:5 fail:3 xfail:0 xpass:0 skip:0 error:0
> >>>
> >>> Best regards,
> >>>     Enric
> >>>
> >>
> >> Hello Enric,
> >>
> >> In order to obtain a better resolution/precision you could try to only
> >> use DIV512 hardware divisor instead of both DIV32 and DIV512.
> >>
> >
> > That makes the tests pass, so I'm wondering if by default you should
> > set DIV512 in platform data instead. With that change you can add my
> >
> > Tested-by: Enric Balletbo i Serra <eballetbo@kernel.org>
> >
>
> This change would decrease the RTC rollover time. Initially indeed only
> DIV512 was enabled, but during review [1] I've agreed enabling both
> hardware divisors to increase the RTC rollover time. Personally, I am ok
> with the current 1 second resolution capability.
>

I'd say that having rtc selftests failing will add a bit of headache
to those that run integration tests, as the test will need to be
marked as an exception. Another option would be to make the tests a
bit more flexible, but I'm not sure this is the right way. I guess we
can make this user configurable via a module parameter so the user has
the final decision. Just my two cents.

> Alexandre Belloni, are you ok with the current version of this driver ?
> Or should I send a V10 patch in which I enable back only the DIV512
> divisor in order to increase the RTC precision at the downside of losing
> rollover time.
>

Agree, up to the maintainer to decide.

Regards,
  Enric

> [1]
> https://lore.kernel.org/all/9f4fc9d8-ec7f-43b4-8bdd-01a4ba4855c5@oss.nxp.=
com/
>
> Regards,
> Ciprian
>
> > # ./rtctest
> > TAP version 13
> > 1..8
> > # Starting 8 tests from 1 test cases.
> > #  RUN           rtc.date_read ...
> > # rtctest.c:59:date_read:Current RTC date/time is 28/01/2025 00:00:34.
> > #            OK  rtc.date_read
> > ok 1 rtc.date_read
> > #  RUN           rtc.date_read_loop ...
> > # rtctest.c:124:date_read_loop:Continuously reading RTC time for 30s
> > (with 11ms breaks after every read).
> > # rtctest.c:151:date_read_loop:Performed 2656 RTC time reads.
> > #            OK  rtc.date_read_loop
> > ok 2 rtc.date_read_loop
> > #  RUN           rtc.uie_read ...
> > #            OK  rtc.uie_read
> > ok 3 rtc.uie_read
> > #  RUN           rtc.uie_select ...
> > #            OK  rtc.uie_select
> > ok 4 rtc.uie_select
> > #  RUN           rtc.alarm_alm_set ...
> > # rtctest.c:262:alarm_alm_set:Alarm time now set to 00:01:14.
> > # rtctest.c:282:alarm_alm_set:data: 1a0
> > #            OK  rtc.alarm_alm_set
> > ok 5 rtc.alarm_alm_set
> > #  RUN           rtc.alarm_wkalm_set ...
> > # rtctest.c:334:alarm_wkalm_set:Alarm time now set to 28/01/2025 00:01:=
17.
> > #            OK  rtc.alarm_wkalm_set
> > ok 6 rtc.alarm_wkalm_set
> > #  RUN           rtc.alarm_alm_set_minute ...
> > # rtctest.c:394:alarm_alm_set_minute:Alarm time now set to 00:02:00.
> > # rtctest.c:414:alarm_alm_set_minute:data: 1a0
> > #            OK  rtc.alarm_alm_set_minute
> > ok 7 rtc.alarm_alm_set_minute
> > #  RUN           rtc.alarm_wkalm_set_minute ...
> > # rtctest.c:464:alarm_wkalm_set_minute:Alarm time now set to
> > 28/01/2025 00:03:00.
> > #            OK  rtc.alarm_wkalm_set_minute
> > ok 8 rtc.alarm_wkalm_set_minute
> > # PASSED: 8 / 8 tests passed.
> > # Totals: pass:8 fail:0 xfail:0 xpass:0 skip:0 error:0
> >
> >
> > Thanks,
> >   Enric
> >
> >> Regards,
> >> Ciprian
> >>
> >>>> ---
> >>>>    drivers/rtc/Kconfig    |  11 ++
> >>>>    drivers/rtc/Makefile   |   1 +
> >>>>    drivers/rtc/rtc-s32g.c | 385 ++++++++++++++++++++++++++++++++++++=
+++++
> >>>>    3 files changed, 397 insertions(+)
> >>>>    create mode 100644 drivers/rtc/rtc-s32g.c
> >>>>
> >>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> >>>> index 0bbbf778ecfa..510dc2db745d 100644
> >>>> --- a/drivers/rtc/Kconfig
> >>>> +++ b/drivers/rtc/Kconfig
> >>>> @@ -2103,4 +2103,15 @@ config RTC_DRV_AMLOGIC_A4
> >>>>             This driver can also be built as a module. If so, the mo=
dule
> >>>>             will be called "rtc-amlogic-a4".
> >>>>
> >>>> +config RTC_DRV_S32G
> >>>> +       tristate "RTC driver for S32G2/S32G3 SoCs"
> >>>> +       depends on ARCH_S32 || COMPILE_TEST
> >>>> +       depends on COMMON_CLK
> >>>> +       help
> >>>> +         Say yes to enable RTC driver for platforms based on the
> >>>> +         S32G2/S32G3 SoC family.
> >>>> +
> >>>> +         This RTC module can be used as a wakeup source.
> >>>> +         Please note that it is not battery-powered.
> >>>> +
> >>>>    endif # RTC_CLASS
> >>>> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
> >>>> index 489b4ab07068..e4b616ecd5ce 100644
> >>>> --- a/drivers/rtc/Makefile
> >>>> +++ b/drivers/rtc/Makefile
> >>>> @@ -161,6 +161,7 @@ obj-$(CONFIG_RTC_DRV_RX8111)        +=3D rtc-rx8=
111.o
> >>>>    obj-$(CONFIG_RTC_DRV_RX8581)   +=3D rtc-rx8581.o
> >>>>    obj-$(CONFIG_RTC_DRV_RZN1)     +=3D rtc-rzn1.o
> >>>>    obj-$(CONFIG_RTC_DRV_RENESAS_RTCA3)    +=3D rtc-renesas-rtca3.o
> >>>> +obj-$(CONFIG_RTC_DRV_S32G)     +=3D rtc-s32g.o
> >>>>    obj-$(CONFIG_RTC_DRV_S35390A)  +=3D rtc-s35390a.o
> >>>>    obj-$(CONFIG_RTC_DRV_S3C)      +=3D rtc-s3c.o
> >>>>    obj-$(CONFIG_RTC_DRV_S5M)      +=3D rtc-s5m.o
> >>>> diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
> >>>> new file mode 100644
> >>>> index 000000000000..3a0818e972eb
> >>>> --- /dev/null
> >>>> +++ b/drivers/rtc/rtc-s32g.c
> >>>> @@ -0,0 +1,385 @@
> >>>> +// SPDX-License-Identifier: GPL-2.0-or-later
> >>>> +/*
> >>>> + * Copyright 2025 NXP
> >>>> + */
> >>>> +
> >>>> +#include <linux/bitfield.h>
> >>>> +#include <linux/clk.h>
> >>>> +#include <linux/iopoll.h>
> >>>> +#include <linux/of_irq.h>
> >>>> +#include <linux/platform_device.h>
> >>>> +#include <linux/rtc.h>
> >>>> +
> >>>> +#define RTCC_OFFSET    0x4ul
> >>>> +#define RTCS_OFFSET    0x8ul
> >>>> +#define APIVAL_OFFSET  0x10ul
> >>>> +
> >>>> +/* RTCC fields */
> >>>> +#define RTCC_CNTEN                             BIT(31)
> >>>> +#define RTCC_APIEN                             BIT(15)
> >>>> +#define RTCC_APIIE                             BIT(14)
> >>>> +#define RTCC_CLKSEL_MASK               GENMASK(13, 12)
> >>>> +#define RTCC_DIV512EN                  BIT(11)
> >>>> +#define RTCC_DIV32EN                   BIT(10)
> >>>> +
> >>>> +/* RTCS fields */
> >>>> +#define RTCS_INV_API   BIT(17)
> >>>> +#define RTCS_APIF              BIT(13)
> >>>> +
> >>>> +#define APIVAL_MAX_VAL         GENMASK(31, 0)
> >>>> +#define RTC_SYNCH_TIMEOUT      (100 * USEC_PER_MSEC)
> >>>> +
> >>>> +/*
> >>>> + * S32G2 and S32G3 SoCs have RTC clock source1 reserved and
> >>>> + * should not be used.
> >>>> + */
> >>>> +#define RTC_CLK_SRC1_RESERVED          BIT(1)
> >>>> +
> >>>> +/*
> >>>> + * S32G RTC module has a 512 value and a 32 value hardware frequenc=
y
> >>>> + * divisors (DIV512 and DIV32) which could be used to achieve highe=
r
> >>>> + * counter ranges by lowering the RTC frequency.
> >>>> + */
> >>>> +enum {
> >>>> +       DIV1 =3D 1,
> >>>> +       DIV32 =3D 32,
> >>>> +       DIV512 =3D 512,
> >>>> +       DIV512_32 =3D 16384
> >>>> +};
> >>>> +
> >>>> +static const char *const rtc_clk_src[] =3D {
> >>>> +       "source0",
> >>>> +       "source1",
> >>>> +       "source2",
> >>>> +       "source3"
> >>>> +};
> >>>> +
> >>>> +struct rtc_priv {
> >>>> +       struct rtc_device *rdev;
> >>>> +       void __iomem *rtc_base;
> >>>> +       struct clk *ipg;
> >>>> +       struct clk *clk_src;
> >>>> +       const struct rtc_soc_data *rtc_data;
> >>>> +       u64 rtc_hz;
> >>>> +       time64_t sleep_sec;
> >>>> +       int irq;
> >>>> +       u32 clk_src_idx;
> >>>> +};
> >>>> +
> >>>> +struct rtc_soc_data {
> >>>> +       u32 clk_div;
> >>>> +       u32 reserved_clk_mask;
> >>>> +};
> >>>> +
> >>>> +static const struct rtc_soc_data rtc_s32g2_data =3D {
> >>>> +       .clk_div =3D DIV512_32,
> >>>> +       .reserved_clk_mask =3D RTC_CLK_SRC1_RESERVED,
> >>>> +};
> >>>> +
> >>>> +static irqreturn_t s32g_rtc_handler(int irq, void *dev)
> >>>> +{
> >>>> +       struct rtc_priv *priv =3D platform_get_drvdata(dev);
> >>>> +       u32 status;
> >>>> +
> >>>> +       status =3D readl(priv->rtc_base + RTCS_OFFSET);
> >>>> +
> >>>> +       if (status & RTCS_APIF) {
> >>>> +               writel(0x0, priv->rtc_base + APIVAL_OFFSET);
> >>>> +               writel(status | RTCS_APIF, priv->rtc_base + RTCS_OFF=
SET);
> >>>> +       }
> >>>> +
> >>>> +       rtc_update_irq(priv->rdev, 1, RTC_IRQF | RTC_AF);
> >>>> +
> >>>> +       return IRQ_HANDLED;
> >>>> +}
> >>>> +
> >>>> +/*
> >>>> + * The function is not really getting time from the RTC since the S=
32G RTC
> >>>> + * has several limitations. Thus, to setup alarm use system time.
> >>>> + */
> >>>> +static int s32g_rtc_read_time(struct device *dev,
> >>>> +                             struct rtc_time *tm)
> >>>> +{
> >>>> +       struct rtc_priv *priv =3D dev_get_drvdata(dev);
> >>>> +       time64_t sec;
> >>>> +
> >>>> +       if (check_add_overflow(ktime_get_real_seconds(),
> >>>> +                              priv->sleep_sec, &sec))
> >>>> +               return -ERANGE;
> >>>> +
> >>>> +       rtc_time64_to_tm(sec, tm);
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>> +static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalr=
m *alrm)
> >>>> +{
> >>>> +       struct rtc_priv *priv =3D dev_get_drvdata(dev);
> >>>> +       u32 rtcc, rtcs;
> >>>> +
> >>>> +       rtcc =3D readl(priv->rtc_base + RTCC_OFFSET);
> >>>> +       rtcs =3D readl(priv->rtc_base + RTCS_OFFSET);
> >>>> +
> >>>> +       alrm->enabled =3D rtcc & RTCC_APIIE;
> >>>> +       if (alrm->enabled)
> >>>> +               alrm->pending =3D !(rtcs & RTCS_APIF);
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>> +static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned i=
nt enabled)
> >>>> +{
> >>>> +       struct rtc_priv *priv =3D dev_get_drvdata(dev);
> >>>> +       u32 rtcc;
> >>>> +
> >>>> +       /* RTC API functionality is used both for triggering interru=
pts
> >>>> +        * and as a wakeup event. Hence it should always be enabled.
> >>>> +        */
> >>>> +       rtcc =3D readl(priv->rtc_base + RTCC_OFFSET);
> >>>> +       rtcc |=3D RTCC_APIEN | RTCC_APIIE;
> >>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>> +static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm=
 *alrm)
> >>>> +{
> >>>> +       struct rtc_priv *priv =3D dev_get_drvdata(dev);
> >>>> +       unsigned long long cycles;
> >>>> +       long long t_offset;
> >>>> +       time64_t alrm_time;
> >>>> +       u32 rtcs;
> >>>> +       int ret;
> >>>> +
> >>>> +       alrm_time =3D rtc_tm_to_time64(&alrm->time);
> >>>> +       t_offset =3D alrm_time - ktime_get_real_seconds() - priv->sl=
eep_sec;
> >>>> +       if (t_offset < 0)
> >>>> +               return -ERANGE;
> >>>> +
> >>>> +       cycles =3D t_offset * priv->rtc_hz;
> >>>> +       if (cycles > APIVAL_MAX_VAL)
> >>>> +               return -ERANGE;
> >>>> +
> >>>> +       /* APIVAL could have been reset from the IRQ handler.
> >>>> +        * Hence, we wait in case there is a synchronization process=
.
> >>>> +        */
> >>>> +       ret =3D read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API=
),
> >>>> +                               0, RTC_SYNCH_TIMEOUT, false, priv->r=
tc_base + RTCS_OFFSET);
> >>>> +       if (ret)
> >>>> +               return ret;
> >>>> +
> >>>> +       writel(cycles, priv->rtc_base + APIVAL_OFFSET);
> >>>> +
> >>>> +       return read_poll_timeout(readl, rtcs, !(rtcs & RTCS_INV_API)=
,
> >>>> +                               0, RTC_SYNCH_TIMEOUT, false, priv->r=
tc_base + RTCS_OFFSET);
> >>>> +}
> >>>> +
> >>>> +/*
> >>>> + * Disable the 32-bit free running counter.
> >>>> + * This allows Clock Source and Divisors selection
> >>>> + * to be performed without causing synchronization issues.
> >>>> + */
> >>>> +static void s32g_rtc_disable(struct rtc_priv *priv)
> >>>> +{
> >>>> +       u32 rtcc =3D readl(priv->rtc_base + RTCC_OFFSET);
> >>>> +
> >>>> +       rtcc &=3D ~RTCC_CNTEN;
> >>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
> >>>> +}
> >>>> +
> >>>> +static void s32g_rtc_enable(struct rtc_priv *priv)
> >>>> +{
> >>>> +       u32 rtcc =3D readl(priv->rtc_base + RTCC_OFFSET);
> >>>> +
> >>>> +       rtcc |=3D RTCC_CNTEN;
> >>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
> >>>> +}
> >>>> +
> >>>> +static int rtc_clk_src_setup(struct rtc_priv *priv)
> >>>> +{
> >>>> +       u32 rtcc;
> >>>> +
> >>>> +       rtcc =3D FIELD_PREP(RTCC_CLKSEL_MASK, priv->clk_src_idx);
> >>>> +
> >>>> +       switch (priv->rtc_data->clk_div) {
> >>>> +       case DIV512_32:
> >>>> +               rtcc |=3D RTCC_DIV512EN;
> >>>> +               rtcc |=3D RTCC_DIV32EN;
> >>>> +               break;
> >>>> +       case DIV512:
> >>>> +               rtcc |=3D RTCC_DIV512EN;
> >>>> +               break;
> >>>> +       case DIV32:
> >>>> +               rtcc |=3D RTCC_DIV32EN;
> >>>> +               break;
> >>>> +       case DIV1:
> >>>> +               break;
> >>>> +       default:
> >>>> +               return -EINVAL;
> >>>> +       }
> >>>> +
> >>>> +       rtcc |=3D RTCC_APIEN | RTCC_APIIE;
> >>>> +       /*
> >>>> +        * Make sure the CNTEN is 0 before we configure
> >>>> +        * the clock source and dividers.
> >>>> +        */
> >>>> +       s32g_rtc_disable(priv);
> >>>> +       writel(rtcc, priv->rtc_base + RTCC_OFFSET);
> >>>> +       s32g_rtc_enable(priv);
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>> +static const struct rtc_class_ops rtc_ops =3D {
> >>>> +       .read_time =3D s32g_rtc_read_time,
> >>>> +       .read_alarm =3D s32g_rtc_read_alarm,
> >>>> +       .set_alarm =3D s32g_rtc_set_alarm,
> >>>> +       .alarm_irq_enable =3D s32g_rtc_alarm_irq_enable,
> >>>> +};
> >>>> +
> >>>> +static int rtc_clk_dts_setup(struct rtc_priv *priv,
> >>>> +                            struct device *dev)
> >>>> +{
> >>>> +       u32 i;
> >>>> +
> >>>> +       priv->ipg =3D devm_clk_get_enabled(dev, "ipg");
> >>>> +       if (IS_ERR(priv->ipg))
> >>>> +               return dev_err_probe(dev, PTR_ERR(priv->ipg),
> >>>> +                               "Failed to get 'ipg' clock\n");
> >>>> +
> >>>> +       for (i =3D 0; i < ARRAY_SIZE(rtc_clk_src); i++) {
> >>>> +               if (priv->rtc_data->reserved_clk_mask & BIT(i))
> >>>> +                       return -EOPNOTSUPP;
> >>>> +
> >>>> +               priv->clk_src =3D devm_clk_get_enabled(dev, rtc_clk_=
src[i]);
> >>>> +               if (!IS_ERR(priv->clk_src)) {
> >>>> +                       priv->clk_src_idx =3D i;
> >>>> +                       break;
> >>>> +               }
> >>>> +       }
> >>>> +
> >>>> +       if (IS_ERR(priv->clk_src))
> >>>> +               return dev_err_probe(dev, PTR_ERR(priv->clk_src),
> >>>> +                               "Failed to get rtc module clock sour=
ce\n");
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>> +static int s32g_rtc_probe(struct platform_device *pdev)
> >>>> +{
> >>>> +       struct device *dev =3D &pdev->dev;
> >>>> +       struct rtc_priv *priv;
> >>>> +       unsigned long rtc_hz;
> >>>> +       int ret;
> >>>> +
> >>>> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >>>> +       if (!priv)
> >>>> +               return -ENOMEM;
> >>>> +
> >>>> +       priv->rtc_data =3D of_device_get_match_data(dev);
> >>>> +       if (!priv->rtc_data)
> >>>> +               return -ENODEV;
> >>>> +
> >>>> +       priv->rtc_base =3D devm_platform_ioremap_resource(pdev, 0);
> >>>> +       if (IS_ERR(priv->rtc_base))
> >>>> +               return PTR_ERR(priv->rtc_base);
> >>>> +
> >>>> +       device_init_wakeup(dev, true);
> >>>> +
> >>>> +       ret =3D rtc_clk_dts_setup(priv, dev);
> >>>> +       if (ret)
> >>>> +               return ret;
> >>>> +
> >>>> +       priv->rdev =3D devm_rtc_allocate_device(dev);
> >>>> +       if (IS_ERR(priv->rdev))
> >>>> +               return PTR_ERR(priv->rdev);
> >>>> +
> >>>> +       ret =3D rtc_clk_src_setup(priv);
> >>>> +       if (ret)
> >>>> +               return ret;
> >>>> +
> >>>> +       priv->irq =3D platform_get_irq(pdev, 0);
> >>>> +       if (priv->irq < 0) {
> >>>> +               ret =3D priv->irq;
> >>>> +               goto disable_rtc;
> >>>> +       }
> >>>> +
> >>>> +       rtc_hz =3D clk_get_rate(priv->clk_src);
> >>>> +       if (!rtc_hz) {
> >>>> +               dev_err(dev, "Failed to get RTC frequency\n");
> >>>> +               ret =3D -EINVAL;
> >>>> +               goto disable_rtc;
> >>>> +       }
> >>>> +
> >>>> +       priv->rtc_hz =3D DIV_ROUND_UP(rtc_hz, priv->rtc_data->clk_di=
v);
> >>>> +
> >>>> +       platform_set_drvdata(pdev, priv);
> >>>> +       priv->rdev->ops =3D &rtc_ops;
> >>>> +
> >>>> +       ret =3D devm_request_irq(dev, priv->irq,
> >>>> +                              s32g_rtc_handler, 0, dev_name(dev), p=
dev);
> >>>> +       if (ret) {
> >>>> +               dev_err(dev, "Request interrupt %d failed, error: %d=
\n",
> >>>> +                       priv->irq, ret);
> >>>> +               goto disable_rtc;
> >>>> +       }
> >>>> +
> >>>> +       ret =3D devm_rtc_register_device(priv->rdev);
> >>>> +       if (ret)
> >>>> +               goto disable_rtc;
> >>>> +
> >>>> +       return 0;
> >>>> +
> >>>> +disable_rtc:
> >>>> +       s32g_rtc_disable(priv);
> >>>> +       return ret;
> >>>> +}
> >>>> +
> >>>> +static int s32g_rtc_suspend(struct device *dev)
> >>>> +{
> >>>> +       struct rtc_priv *priv =3D dev_get_drvdata(dev);
> >>>> +       u32 apival =3D readl(priv->rtc_base + APIVAL_OFFSET);
> >>>> +
> >>>> +       if (check_add_overflow(priv->sleep_sec, div64_u64(apival, pr=
iv->rtc_hz),
> >>>> +                              &priv->sleep_sec)) {
> >>>> +               dev_warn(dev, "Overflow on sleep cycles occurred. Re=
setting to 0.\n");
> >>>> +               priv->sleep_sec =3D 0;
> >>>> +       }
> >>>> +
> >>>> +       return 0;
> >>>> +}
> >>>> +
> >>>> +static int s32g_rtc_resume(struct device *dev)
> >>>> +{
> >>>> +       struct rtc_priv *priv =3D dev_get_drvdata(dev);
> >>>> +
> >>>> +       /* The transition from resume to run is a reset event.
> >>>> +        * This leads to the RTC registers being reset after resume =
from
> >>>> +        * suspend. It is uncommon, but this behaviour has been obse=
rved
> >>>> +        * on S32G RTC after issuing a Suspend to RAM operation.
> >>>> +        * Thus, reconfigure RTC registers on the resume path.
> >>>> +        */
> >>>> +       return rtc_clk_src_setup(priv);
> >>>> +}
> >>>> +
> >>>> +static const struct of_device_id rtc_dt_ids[] =3D {
> >>>> +       { .compatible =3D "nxp,s32g2-rtc", .data =3D &rtc_s32g2_data=
 },
> >>>> +       { /* sentinel */ },
> >>>> +};
> >>>> +
> >>>> +static DEFINE_SIMPLE_DEV_PM_OPS(s32g_rtc_pm_ops,
> >>>> +                        s32g_rtc_suspend, s32g_rtc_resume);
> >>>> +
> >>>> +static struct platform_driver s32g_rtc_driver =3D {
> >>>> +       .driver =3D {
> >>>> +               .name =3D "s32g-rtc",
> >>>> +               .pm =3D pm_sleep_ptr(&s32g_rtc_pm_ops),
> >>>> +               .of_match_table =3D rtc_dt_ids,
> >>>> +       },
> >>>> +       .probe =3D s32g_rtc_probe,
> >>>> +};
> >>>> +module_platform_driver(s32g_rtc_driver);
> >>>> +
> >>>> +MODULE_AUTHOR("NXP");
> >>>> +MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
> >>>> +MODULE_LICENSE("GPL");
> >>>> --
> >>>> 2.45.2
> >>>>
> >>>
> >>
> >
>


