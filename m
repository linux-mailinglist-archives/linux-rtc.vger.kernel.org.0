Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 104EC274C12
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Sep 2020 00:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIVW26 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Sep 2020 18:28:58 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:34404 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbgIVW26 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Sep 2020 18:28:58 -0400
Received: by mail-ot1-f68.google.com with SMTP id h17so17171679otr.1;
        Tue, 22 Sep 2020 15:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ClEyF6YT/uBY6ngetqWoXu40MTV6oLWtuyfZ2xGB3Gk=;
        b=gSo5YUhzXZHK3LOSgRoPxv5/BdTlotNV2XMUF3fg0IS7O8CgruSaps0gAUa+/fOZS0
         T2/HKcr1ncI+MqBE5oUbCmYUpUm5f6nTco9TtB1Oyz6DSGyk/pu/DVvDuJGbEyPwBKdb
         d4FTjwYABGfJ9rmmsG1Ifeosvh+oG/LT/djaAl1kmWopDmF+/Arwe1Xy67hwXm/ZPQMm
         xeoT3dDvSYR93fxP7SdjT+azvdS1XgQuJbR+8auffX8PQpVq93MuvWc2Zvg1RuvyEPT9
         9q2f/WBOfM0egEBc4g8FEoD2y8feBAlXcaV2LSBQiGW5L/EsLHoO0xDZPuB1NM73FJXG
         4rOg==
X-Gm-Message-State: AOAM533nRQuOkd+AjIKmry5VssIUZOMgnez1+ko8W6KsbVtHdCubKnia
        CodMhgtQvC9TdnLFav5PLwBlxWEkGN+O0w==
X-Google-Smtp-Source: ABdhPJxOebDa0AkEuG4GC5KONv1/8xhk+bRsv0R6G8ob/HoaXNS7KEsxwIEM9t1sgPma0mw9Tj6rdw==
X-Received: by 2002:a9d:7d16:: with SMTP id v22mr4045603otn.372.1600813736694;
        Tue, 22 Sep 2020 15:28:56 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id y25sm7174569oti.26.2020.09.22.15.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 15:28:56 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id n61so17134470ota.10;
        Tue, 22 Sep 2020 15:28:55 -0700 (PDT)
X-Received: by 2002:a05:6830:14cb:: with SMTP id t11mr4447643otq.74.1600813735429;
 Tue, 22 Sep 2020 15:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200915073213.12779-1-biwen.li@oss.nxp.com> <20200915073213.12779-2-biwen.li@oss.nxp.com>
 <20200922030208.GY25109@dragon> <DB6PR0401MB2438ABB1DFE785F9EAADB69E8F3B0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
 <VE1PR04MB6687237BD5D137C4B9EC6DBD8F3B0@VE1PR04MB6687.eurprd04.prod.outlook.com>
 <DB6PR0401MB243883AEA75F615A0768D03E8F3B0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0401MB243883AEA75F615A0768D03E8F3B0@DB6PR0401MB2438.eurprd04.prod.outlook.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Tue, 22 Sep 2020 17:28:43 -0500
X-Gmail-Original-Message-ID: <CADRPPNSiYnj+H4_CoKKQcT2ROM32XRVHqwGYMAvuTAheTsK2pQ@mail.gmail.com>
Message-ID: <CADRPPNSiYnj+H4_CoKKQcT2ROM32XRVHqwGYMAvuTAheTsK2pQ@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH 2/5] arm64: dts: lx2160a-rdb: remove useless
 property of rtc
To:     Biwen Li <biwen.li@nxp.com>, V.Sethi@nxp.com, peter.newton@nxp.com
Cc:     Shawn Guo <shawnguo@kernel.org>,
        "Biwen Li (OSS)" <biwen.li@oss.nxp.com>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jiafei Pan <jiafei.pan@nxp.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Sep 21, 2020 at 10:56 PM Biwen Li <biwen.li@nxp.com> wrote:
>
> >
> >
> >
> > > -----Original Message-----
> > > From: Biwen Li <biwen.li@nxp.com>
> > > Sent: Monday, September 21, 2020 10:13 PM
> > > To: Shawn Guo <shawnguo@kernel.org>; Biwen Li (OSS)
> > > <biwen.li@oss.nxp.com>
> > > Cc: alexandre.belloni@bootlin.com; Leo Li <leoyang.li@nxp.com>;
> > > robh+dt@kernel.org; mark.rutland@arm.com; devicetree@vger.kernel.org;
> > > linux-kernel@vger.kernel.org; Jiafei Pan <jiafei.pan@nxp.com>; linux-
> > > rtc@vger.kernel.org
> > > Subject: RE: [EXT] Re: [PATCH 2/5] arm64: dts: lx2160a-rdb: remove
> > > useless property of rtc
> > >
> > > >
> > > > Caution: EXT Email
> > > >
> > > > On Tue, Sep 15, 2020 at 03:32:10PM +0800, Biwen Li wrote:
> > > > > From: Biwen Li <biwen.li@nxp.com>
> > > > >
> > > > > Remove useless property interrupts of rtc
> > > > >
> > > > > Signed-off-by: Biwen Li <biwen.li@nxp.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts | 2 --
> > > > >  1 file changed, 2 deletions(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > > > b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > > > index dce79018d397..e9e982176e07 100644
> > > > > --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > > > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rdb.dts
> > > > > @@ -171,8 +171,6 @@
> > > > >       rtc@51 {
> > > > >               compatible = "nxp,pcf2129";
> > > > >               reg = <0x51>;
> > > > > -             // IRQ10_B
> > > > > -             interrupts = <0 150 0x4>;
> > > >
> > > > If it's a correct description of hardware, I do not see why we would
> > > > need to remove it.
> > > Hi Shawn,
> > >
> > > Don't need use the interrupt, only read time from rtc.
> >
> > User probably will choose to use the alarm feature of the RTC and need the
> > interrupt property.  Is there any issue when the interrupt property is present?
> Generic interrupt controller on layerscape only support  IRQ_TYPE_LEVEL_HIGH and  IRQ_TYPE_EDGE_RISING(except SoC LS1043A, LS1046A),
> Not support IRQ_TYPE_LEVEL_LOW,

That is not true.  Although the GIC SPI only deals with level high and
rising edge, there is a separate IRQCR register on LX2160 that can
invert external interrupt.  If the current LX2160 code doesn't support
that, we need to fix it.  Adding Varun for this.  We probably can
extend the existing drivers/irqchip/irq-ls-extirq.c driver to support
LX2160.

And btw, the interrupt number 150 is obviously wrong too.  We probably
can remove it temporarily before the external interrupt is properly
supported on lx2160.

> In drivers/rtc/rtc-pcf2127.c
> ret = devm_request_threaded_irq(dev, alarm_irq, NULL,
> pcf2127_rtc_irq,
> IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> dev_name(dev), dev);
>
> >
> > >
> > > Best Regards,
> > > Biwen Li
> > > >
> > > > Shawn
> > > >
> > > > >       };
> > > > >  };
> > > > >
> > > > > --
> > > > > 2.17.1
> > > > >
