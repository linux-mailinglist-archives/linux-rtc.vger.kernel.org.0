Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7600E1ED40B
	for <lists+linux-rtc@lfdr.de>; Wed,  3 Jun 2020 18:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726027AbgFCQQR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 Jun 2020 12:16:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725939AbgFCQQR (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 3 Jun 2020 12:16:17 -0400
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2CE0206E6;
        Wed,  3 Jun 2020 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591200976;
        bh=BoDLkq02THt+WbJVaiCCXtU5luclbfhVMmW4TS/e9Qg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0xIWs3b4/5BAZl5fKQdnqF63gWHhHFrLKLNd3bnlrXtYV3z5O3XIMZKKAeViSvDpj
         7QtQQmZgy6EEP1w0l1pRehQWLxi2AUoS7PW4Tszk7IMBO1IehQCvOH9ILZ2VVEHWlA
         elWvPMGVyHjgU46ArmjkTY1B+lAU3xRVTCndgAlI=
Received: by mail-ot1-f46.google.com with SMTP id h7so2340121otr.3;
        Wed, 03 Jun 2020 09:16:16 -0700 (PDT)
X-Gm-Message-State: AOAM531YoKakT/77tl1BZqmjNOs0g9IUw9CHRbb2QjFiODuL7kShC3/2
        /Mf4a3YtSAsj+NOlVEN1X5Ywuk7JgeGWqHalvA==
X-Google-Smtp-Source: ABdhPJygRbGJCR00jC843Jp0prKdRc4VE8QO7dAZqmdODfIB/KZwGlghUEPf3SCOdRw3ZaN+HGgzsMSbMQOZ9qnxXPM=
X-Received: by 2002:a05:6830:3104:: with SMTP id b4mr575554ots.192.1591200976092;
 Wed, 03 Jun 2020 09:16:16 -0700 (PDT)
MIME-Version: 1.0
References: <1591184925-13055-1-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1591184925-13055-1-git-send-email-Anson.Huang@nxp.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 3 Jun 2020 10:15:55 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKGibK00edV5eG8HR1A0ks7ojY5uNssaqtYwiGJWt+GuA@mail.gmail.com>
Message-ID: <CAL_JsqKGibK00edV5eG8HR1A0ks7ojY5uNssaqtYwiGJWt+GuA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: rtc: Convert imxdi rtc to json-schema
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Roland Stigge <stigge@antcom.de>,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>, devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Jun 3, 2020 at 5:59 AM Anson Huang <Anson.Huang@nxp.com> wrote:
>
> Convert the i.MXDI RTC binding to DT schema format using json-schema
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  .../devicetree/bindings/rtc/imxdi-rtc.txt          | 20 -----------
>  .../devicetree/bindings/rtc/imxdi-rtc.yaml         | 42 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 20 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/imxdi-rtc.yaml
>
> diff --git a/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt b/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
> deleted file mode 100644
> index c797bc9..0000000
> --- a/Documentation/devicetree/bindings/rtc/imxdi-rtc.txt
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -* i.MX25 Real Time Clock controller
> -
> -Required properties:
> -- compatible: should be: "fsl,imx25-rtc"
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- clocks: should contain the phandle for the rtc clock
> -- interrupts: rtc alarm interrupt
> -
> -Optional properties:
> -- interrupts: dryice security violation interrupt (second entry)
> -
> -Example:
> -
> -rtc@53ffc000 {
> -       compatible = "fsl,imx25-rtc";
> -       reg = <0x53ffc000 0x4000>;
> -       clocks = <&clks 81>;
> -       interrupts = <25 56>;
> -};
> diff --git a/Documentation/devicetree/bindings/rtc/imxdi-rtc.yaml b/Documentation/devicetree/bindings/rtc/imxdi-rtc.yaml
> new file mode 100644
> index 0000000..6e43926
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/imxdi-rtc.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/imxdi-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX25 Real Time Clock controller
> +
> +maintainers:
> +  - Roland Stigge <stigge@antcom.de>
> +
> +properties:
> +  compatible:
> +    const: fsl,imx25-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: rtc alarm interrupt
> +      - description: dryice security violation interrupt
> +    minItems: 1
> +    maxItems: 2
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks

Needs:

additionalProperties: false

(or if you have a top level $ref, 'unevaluatedProperties: false')

I fixed these up in what I applied already, but please check all of
yours pending and fix.

Rob
