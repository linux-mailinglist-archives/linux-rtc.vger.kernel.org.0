Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D84A964CE3
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2019 21:43:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727959AbfGJTni (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jul 2019 15:43:38 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:33595 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbfGJTni (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Jul 2019 15:43:38 -0400
Received: by mail-oi1-f195.google.com with SMTP id u15so2609101oiv.0;
        Wed, 10 Jul 2019 12:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aBeg5u7rV+bMV5EqKauG05KOk0ihpzkj5CrP7OIiW7A=;
        b=iczZZC7y+hxpNMvIcOZRtbPqCEZYFSczj6ZM3y/g3jKHFC1PmtSUEhSlzumZSwmAY1
         ucGfvtrnj/nqlKYlTwvm6qDy6WplQ1XfCmSChxoTXmjif6Vk2YubNe4dsawBpqYLsKiQ
         YQpkxuHh3uk+90AjcN/RLdPiWeXoaFFX6evFUSFsx3Kaik7zmXuV6u/h32UK0oI/LwUZ
         CMU7NA7PdtwXc5SrakasQg/To796JDOWSuRRmOMmkLAaQHZd8i5B29ErbKpRxRPGvW88
         vM4F22818nI62pB46Zq5li8cxSTFtGbpm8keKSKc+r7bQF4miteclNMelmKqUgNZFqcU
         utyw==
X-Gm-Message-State: APjAAAXBIrP3yyPSTL3fmCds2VS/OI6IaQxDXHkAmbYdvWgKf4FVjviu
        2ZYVffwnea1oEF1wVeLifcgitx0R
X-Google-Smtp-Source: APXvYqxiu7sqTEGElu3MaaJKrMb0D6yZnrjapkZhNipwv7xY+vIqDLFwq3Y7ZoqpUnrsCurUPaNt+Q==
X-Received: by 2002:aca:edc6:: with SMTP id l189mr44881oih.86.1562787816462;
        Wed, 10 Jul 2019 12:43:36 -0700 (PDT)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com. [209.85.210.53])
        by smtp.gmail.com with ESMTPSA id b138sm1122585oii.7.2019.07.10.12.43.35
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 12:43:35 -0700 (PDT)
Received: by mail-ot1-f53.google.com with SMTP id q10so3347785otk.10;
        Wed, 10 Jul 2019 12:43:35 -0700 (PDT)
X-Received: by 2002:a9d:5510:: with SMTP id l16mr47230oth.63.1562787815427;
 Wed, 10 Jul 2019 12:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190705101800.44561-1-biwen.li@nxp.com> <20190705101800.44561-2-biwen.li@nxp.com>
In-Reply-To: <20190705101800.44561-2-biwen.li@nxp.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Wed, 10 Jul 2019 14:43:24 -0500
X-Gmail-Original-Message-ID: <CADRPPNTg52BNx6bN1P9+WQnf+gG8p2hnLuxWEUXoy1CSt55Npw@mail.gmail.com>
Message-ID: <CADRPPNTg52BNx6bN1P9+WQnf+gG8p2hnLuxWEUXoy1CSt55Npw@mail.gmail.com>
Subject: Re: [PATCH 2/2] Documentation: dt: binding: rtc: add binding for ftm
 alarm driver
To:     Biwen Li <biwen.li@nxp.com>, Rob Herring <robh+dt@kernel.org>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>,
        Xiaobo Xie <xiaobo.xie@nxp.com>,
        Jiafei Pan <jiafei.pan@nxp.com>, Ran Wang <ran.wang_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jul 5, 2019 at 6:26 AM Biwen Li <biwen.li@nxp.com> wrote:
>
> The patch adds binding for ftm alarm driver
>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>

Please add dts maintainer for binding patches.  I have added Rob.

> ---
>  .../devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt  | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
>
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> new file mode 100644
> index 0000000..0f330b4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> @@ -0,0 +1,33 @@
> +Freescale FlexTimer Module (FTM) Alarm
> +
> +Required properties:
> +
> +- compatible : Should be "fsl,ftm-alarm" or "fsl,<chip>-ftm-alarm", the
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
> +- reg-names: names of the mapped memory regions listed in regs property.
> +  should include the following entries:
> +  "ftm":    Address of the register sets for FlexTimer Module
> +  "pmctrl": Address of IP Powerdown Exception Control register

I assume we don't need this after we let the rcpm driver to deal with this.

> +- interrupts : Should be the FlexTimer Module interrupt.
> +- big-endian: If the host controller is big-endian mode, specify this property.
> +  The default endian mode is little-endian.

If it is optional as suggested by the description, put it in the
optinal property section.

> +
> +Example:
> +ftm_alarm0: timer@29d0000 {
> +       compatible = "fsl,ls1043a-ftm-alarm";
> +       reg = <0x0 0x29d0000 0x0 0x10000>,
> +             <0x0 0x1ee2140 0x0 0x4>;
> +       reg-names = "ftm", "pmctrl";
> +       interrupts = <0 86 0x4>;
> +       big-endian;
> +};
> --
> 2.7.4
>
