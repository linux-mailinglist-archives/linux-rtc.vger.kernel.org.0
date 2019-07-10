Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6761764CEA
	for <lists+linux-rtc@lfdr.de>; Wed, 10 Jul 2019 21:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726708AbfGJTqL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 10 Jul 2019 15:46:11 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:44565 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbfGJTqL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 10 Jul 2019 15:46:11 -0400
Received: by mail-ot1-f66.google.com with SMTP id b7so3347247otl.11;
        Wed, 10 Jul 2019 12:46:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BxExLGJghxg2B7i0n80p9r0YFAgFtHpoh5hsuKWRqGo=;
        b=qPBc9CMgcL/XbAUYVJgN0YLzm+NDzoifWbh5GWizrBxc/jJ1aQifURzCVJb8LlLKqE
         0ullmBz8JamJLPCp6PB8CxkF9tMXI2V0/1BTbMIkfgNHolwcxbwI6aUw2ZeJtxNBp89E
         gNB5BOOi1KilH2RVWXIUld2aCq10PoUurUgtqgFDJvX2UU+fkeza36zB44dXKdrbXhaj
         094z74YXnuBph3pE1shFjvzDs5ZvOAnTK5oVIbSlJgqPoeUGrAsu0mvmoGnbipSpgMLm
         A36AmCLrtN0g6wbI+izHweBazEYIWKrawsM1HBOp/VAvngQxIX3yVkh2W+uC7eCdsOd7
         +/xA==
X-Gm-Message-State: APjAAAWB0kvFPnxafVoAv4DEfD3Bbp34NHkSqm52v4EfH1l1aJW8VAN4
        3sUbqaKRfxYyi9wDy0c9bSDal01X
X-Google-Smtp-Source: APXvYqyQiCAjT4jf+G106JWtRDemkIo7F58D7Pe2nU3yH51Ea38cafrX9icsaGbptVMcjioOqwcZnQ==
X-Received: by 2002:a05:6830:1516:: with SMTP id k22mr40810otp.189.1562787970236;
        Wed, 10 Jul 2019 12:46:10 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id q82sm946837oif.30.2019.07.10.12.46.09
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 12:46:09 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id q20so3394318otl.0;
        Wed, 10 Jul 2019 12:46:09 -0700 (PDT)
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr34994otk.221.1562787969461;
 Wed, 10 Jul 2019 12:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190710110424.4254-1-biwen.li@nxp.com> <20190710110424.4254-2-biwen.li@nxp.com>
In-Reply-To: <20190710110424.4254-2-biwen.li@nxp.com>
From:   Li Yang <leoyang.li@nxp.com>
Date:   Wed, 10 Jul 2019 14:45:58 -0500
X-Gmail-Original-Message-ID: <CADRPPNQ8nZQYq1ZXZ368LLeKnyrXpjB_X8XaHVhW890bw-tU6A@mail.gmail.com>
Message-ID: <CADRPPNQ8nZQYq1ZXZ368LLeKnyrXpjB_X8XaHVhW890bw-tU6A@mail.gmail.com>
Subject: Re: [v2,2/2] Documentation: dt: binding: rtc: add binding for ftm
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

On Wed, Jul 10, 2019 at 6:35 AM Biwen Li <biwen.li@nxp.com> wrote:
>
> The patch adds binding for ftm alarm driver
>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>

Looks like I commented the older version just now.  Adding Rob to this
version too.

> ---
> Change in v2:
>     - replace ls1043a with ls1088a as example
>     - add rcpm node and fsl,rcpm-wakeup property
>
>  .../devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt  | 40 ++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
>
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> new file mode 100644
> index 0000000..010984a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> @@ -0,0 +1,40 @@
> +Freescale FlexTimer Module (FTM) Alarm
> +
> +Note: The driver need work with RCPM driver to wake up system in sleep.
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
> +- interrupts : Should be the FlexTimer Module interrupt.
> +- fsl,rcpm-wakeup property and rcpm node : Please refer
> +       Documentation/devicetree/bindings/soc/fsl/rcpm.txt

Looks better.

> +- big-endian: If the host controller is big-endian mode, specify this property.
> +  The default endian mode is little-endian.

Same comment about optional property.

> +
> +Example:
> +rcpm: rcpm@1e34050 {
> +       compatible = "fsl,ls1088a-rcpm", "fsl,qoriq-rcpm-2.1+";
> +       reg = <0x0 0x1e34050 0x0 0x4>;
> +       fsl,#rcpm-wakeup-cells = <1>;
> +}
> +
> +ftm_alarm0: timer@2800000 {
> +       compatible = "fsl,ftm-alarm";
> +       reg = <0x0 0x2800000 0x0 0x10000>;
> +       fsl,rcpm-wakeup = <&rcpm 0x0 0x4000>;
> +       interrupts = <0 44 4>;
> +}
> --
> 2.7.4
>
