Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 267226B1EA
	for <lists+linux-rtc@lfdr.de>; Wed, 17 Jul 2019 00:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728681AbfGPWcQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 16 Jul 2019 18:32:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:57010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728601AbfGPWcQ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 16 Jul 2019 18:32:16 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6590217F9;
        Tue, 16 Jul 2019 22:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563316334;
        bh=lyaZPWMuZlefKWF7YWB6HVKNuBIrAxc+DmEusw8Ud/Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vNf37OR0RDfDRA/pA30R7v7uYmh+1IpmXebIprzX3BxwoSrlydN97MHm6oxem4sQQ
         LlrYpfLYwfEtoVDyhkmAEg5oezVsh/7hMHfEObVUHg9diycFqh71DMxFgIL4so284s
         3dXRKyEG8K3D2g2ZwMfzykw6fo8H8E6kdzvDwXVs=
Received: by mail-qt1-f172.google.com with SMTP id k10so21384166qtq.1;
        Tue, 16 Jul 2019 15:32:14 -0700 (PDT)
X-Gm-Message-State: APjAAAXS5yBQbSWtDdzB9F5/umSDGwMFdD/E7oHZGEewNi6Na8dZusVo
        H8aX33EMl8QB8RnvIivE4VmIWFnCZywU56Qv2w==
X-Google-Smtp-Source: APXvYqzMTIC9EQA8xp2dJA+iwx7B3YTOsDqzWXa25k+IfZ0s+trHnbNq6WfnsQJveUanqpenewkZRjviGzl57+0qGfM=
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr25318805qtc.300.1563316333903;
 Tue, 16 Jul 2019 15:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190716101655.47418-1-biwen.li@nxp.com> <20190716101655.47418-2-biwen.li@nxp.com>
In-Reply-To: <20190716101655.47418-2-biwen.li@nxp.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 16 Jul 2019 16:32:01 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+U=W_51qUDvOMPgexMOLuqTyYua5H6G-cwFnKCh8YmPg@mail.gmail.com>
Message-ID: <CAL_Jsq+U=W_51qUDvOMPgexMOLuqTyYua5H6G-cwFnKCh8YmPg@mail.gmail.com>
Subject: Re: [v5,2/2] Documentation: dt: binding: rtc: add binding for ftm
 alarm driver
To:     Biwen Li <biwen.li@nxp.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Yang-Leo Li <leoyang.li@nxp.com>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Tue, Jul 16, 2019 at 4:26 AM Biwen Li <biwen.li@nxp.com> wrote:
>
> The patch adds binding for ftm alarm driver

Bindings are for h/w, not drivers...

'dt-bindings: rtc: ...' for the subject prefix.

>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v5:
>     - None
>
> Change in v4:
>     - add note about dts and kernel options
>     - add aliases in example
>
> Change in v3:
>         - remove reg-names property
>         - correct cells number
>
> Change in v2:
>         - replace ls1043a with ls1088a as example
>         - add rcpm node and fsl,rcpm-wakeup property
>
>
>  .../bindings/rtc/rtc-fsl-ftm-alarm.txt        | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
>
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> new file mode 100644
> index 000000000000..fb018065406c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> @@ -0,0 +1,49 @@
> +Freescale FlexTimer Module (FTM) Alarm
> +
> +Note:
> +- The driver depends on RCPM driver
> +  to wake up system in sleep.
> +- Need stop using RTC_HCTOSYS or use the DT aliases
> +  to ensure the driver is not used as the primary RTC.
> +  (Select DT aliases defaultly)

This is Linux specific and not relevant to the binding.

> +
> +Required properties:
> +- compatible : Should be "fsl,<chip>-ftm-alarm", the
> +              supported chips include
> +              "fsl,ls1012a-ftm-alarm"
> +              "fsl,ls1021a-ftm-alarm"
> +              "fsl,ls1028a-ftm-alarm"
> +              "fsl,ls1043a-ftm-alarm"
> +              "fsl,ls1046a-ftm-alarm"
> +              "fsl,ls1088a-ftm-alarm"
> +              "fsl,ls208xa-ftm-alarm"
> +- reg : Specifies base physical address and size of the register sets for the
> +  FlexTimer Module and base physical address of IP Powerdown Exception Control
> +  Register.
> +- interrupts : Should be the FlexTimer Module interrupt.
> +- fsl,rcpm-wakeup property and rcpm node : Please refer
> +       Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +
> +Optional properties:
> +- big-endian: If the host controller is big-endian mode, specify this property.
> +  The default endian mode is little-endian.
> +
> +Example:
> +aliases {
> +       ...
> +       rtc1 = ftm_alarm0; /* Use flextimer alarm driver as /dev/rtc1 */
> +       ...
> +};

Drop the aliases part. It's not going to work when this is converted
to DT schema and the comment is Linux specific.

> +
> +rcpm: rcpm@1e34040 {
> +       compatible = "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
> +       reg = <0x0 0x1e34040 0x0 0x18>;
> +       fsl,#rcpm-wakeup-cells = <6>;

Before there are any users of this, either drop it if it is not
variable or the correct form would be '#fsl,rcpm-wakeup-cells'.

> +};
> +
> +ftm_alarm0: timer@2800000 {
> +       compatible = "fsl,ls1088a-ftm-alarm";
> +       reg = <0x0 0x2800000 0x0 0x10000>;
> +       fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> +       interrupts = <0 44 4>;
> +};
> --
> 2.17.1
>
