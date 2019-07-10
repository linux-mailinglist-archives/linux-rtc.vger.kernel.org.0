Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3282964D7C
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2019 22:26:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbfGJU0X (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jul 2019 16:26:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727197AbfGJU0X (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 10 Jul 2019 16:26:23 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 51BC220693;
        Wed, 10 Jul 2019 20:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562790382;
        bh=O+bYbOvsbL9YAnSQuHo2cXKmXnxaBOokw0ed+mLJ3NE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VKxi7q3CLoy8r0jCaC4eKWHARHlR0tUFs2k8yPmwlYZIYS3GMACjl0lB4XwH24I9/
         vZaeMDVNbwbHmg6HNaHT1X9OpH/S/TFlW46Q5PO/EWczDUCcSZjluvqdlCql1ZEfD4
         9D+TZzaH2nZsTizxQ2MQuvp1YIQ6GjFEKJLs6gxI=
Received: by mail-qt1-f180.google.com with SMTP id 44so3896922qtg.11;
        Wed, 10 Jul 2019 13:26:22 -0700 (PDT)
X-Gm-Message-State: APjAAAULeJWFIbQr4GU68M5C1poqwNBK3uWUP+XW2nGM6fLijx6A0gGT
        WWFKYR4XRppLfKmDCta0Y2n0GmW1AnO77/9WDA==
X-Google-Smtp-Source: APXvYqwAjtEbE890QCGvV9/7B8+mjJlAA0PYJ02JaBqDlEwjZYfOylwFmKHq2pgemN8AMFjunT6LrW3kD4fW+BMKyZc=
X-Received: by 2002:ac8:368a:: with SMTP id a10mr25872845qtc.143.1562790381567;
 Wed, 10 Jul 2019 13:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190710110424.4254-1-biwen.li@nxp.com> <20190710110424.4254-2-biwen.li@nxp.com>
 <CADRPPNQ8nZQYq1ZXZ368LLeKnyrXpjB_X8XaHVhW890bw-tU6A@mail.gmail.com>
In-Reply-To: <CADRPPNQ8nZQYq1ZXZ368LLeKnyrXpjB_X8XaHVhW890bw-tU6A@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Jul 2019 14:26:10 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLr53neiaiOEpAcmAhDMnqCuxgPLC9qnFB2rZ4zRFxFLg@mail.gmail.com>
Message-ID: <CAL_JsqLr53neiaiOEpAcmAhDMnqCuxgPLC9qnFB2rZ4zRFxFLg@mail.gmail.com>
Subject: Re: [v2,2/2] Documentation: dt: binding: rtc: add binding for ftm
 alarm driver
To:     Li Yang <leoyang.li@nxp.com>
Cc:     Biwen Li <biwen.li@nxp.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jul 10, 2019 at 1:46 PM Li Yang <leoyang.li@nxp.com> wrote:
>
> On Wed, Jul 10, 2019 at 6:35 AM Biwen Li <biwen.li@nxp.com> wrote:
> >
> > The patch adds binding for ftm alarm driver
> >
> > Signed-off-by: Biwen Li <biwen.li@nxp.com>
>
> Looks like I commented the older version just now.  Adding Rob to this
> version too.

More importantly, re-send the patch to the DT list so patchwork tracks it.

>
> > ---
> > Change in v2:
> >     - replace ls1043a with ls1088a as example
> >     - add rcpm node and fsl,rcpm-wakeup property
> >
> >  .../devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt  | 40 ++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> >
> > diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > new file mode 100644
> > index 0000000..010984a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> > @@ -0,0 +1,40 @@
> > +Freescale FlexTimer Module (FTM) Alarm
> > +
> > +Note: The driver need work with RCPM driver to wake up system in sleep.
> > +
> > +Required properties:
> > +
> > +- compatible : Should be "fsl,ftm-alarm" or "fsl,<chip>-ftm-alarm", the

fsl,ftm-alarm should be a fallback, not on its own.

> > +              supported chips include
> > +              "fsl,ls1012a-ftm-alarm"
> > +              "fsl,ls1021a-ftm-alarm"
> > +              "fsl,ls1028a-ftm-alarm"
> > +              "fsl,ls1043a-ftm-alarm"
> > +              "fsl,ls1046a-ftm-alarm"
> > +              "fsl,ls1088a-ftm-alarm"
> > +              "fsl,ls208xa-ftm-alarm"
> > +- reg : Specifies base physical address and size of the register sets for the
> > +  FlexTimer Module and base physical address of IP Powerdown Exception Control
> > +  Register.
> > +- reg-names: names of the mapped memory regions listed in regs property.
> > +  should include the following entries:
> > +  "ftm":    Address of the register sets for FlexTimer Module

Says required, but not in the example. I'd just remove this as -names
is pointless when there is only 1 entry.

> > +- interrupts : Should be the FlexTimer Module interrupt.
> > +- fsl,rcpm-wakeup property and rcpm node : Please refer
> > +       Documentation/devicetree/bindings/soc/fsl/rcpm.txt
>
> Looks better.
>
> > +- big-endian: If the host controller is big-endian mode, specify this property.
> > +  The default endian mode is little-endian.
>
> Same comment about optional property.
>
> > +
> > +Example:
> > +rcpm: rcpm@1e34050 {
> > +       compatible = "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
> > +       reg = <0x0 0x1e34050 0x0 0x4>;
> > +       fsl,#rcpm-wakeup-cells = <1>;

1 cell here...

> > +}
> > +
> > +ftm_alarm0: timer@2800000 {
> > +       compatible = "fsl,ftm-alarm";
> > +       reg = <0x0 0x2800000 0x0 0x10000>;
> > +       fsl,rcpm-wakeup = <&rcpm 0x0 0x4000>;

...and 2 cells here.

> > +       interrupts = <0 44 4>;
> > +}
> > --
> > 2.7.4
> >
