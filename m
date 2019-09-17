Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82866B4B88
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2019 12:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbfIQKHg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Sep 2019 06:07:36 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.53]:21255 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbfIQKHg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Sep 2019 06:07:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1568714853;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=iK6ZribaTP6AqwYmoviw9/sFC3crW39UIKQ3QC1RuEs=;
        b=U74kA6O8Z4tHRS6kGXFwqMz9AY9fpHdVJ1i884w0hYYbSlynV+O61yHsOnkm9NzEFp
        uuc4adFDzFsXC93ruzwrC9yyHR8QkycH8N08TJYQFJ4vr4DGmV28TQtRJuAQ+4Xh1icj
        iMMbxaUQzpp4sINrh9KhEY9GppgYrY8liBj1Dz5TmCk9A3kFzjPaMPeHOrYY3asXVnTR
        nx6GZrS5TtJqCF7svJEHY4dNjAJsjNPrjLioyJ0E2s62cUQdUfqGWDj7ly1MYC/lbVOM
        LkAwkdu0M6Q+cJdlPpZNZiYS6esugePyoa5YoTN0olxDnT6YWnAG+PMwXae6Tof0UIkG
        saoQ==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp03-03.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.27.0 AUTH)
        with ESMTPSA id j02f91v8HA4QAMS
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Tue, 17 Sep 2019 12:04:26 +0200 (CEST)
Date:   Tue, 17 Sep 2019 12:04:26 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Simon Horman <horms+renesas@verge.net.au>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Brandt <chris.brandt@renesas.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Message-ID: <947531396.233366.1568714666222@webmail.strato.com>
In-Reply-To: <20190917083634.11510-1-horms+renesas@verge.net.au>
References: <20190917083634.11510-1-horms+renesas@verge.net.au>
Subject: Re: [PATCH] dt-bindings: rtc: rtc-sh: convert bindings to
 json-schema
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v7.10.1-Rev20
X-Originating-IP: 85.212.142.246
X-Originating-Client: open-xchange-appsuite
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


> On September 17, 2019 at 10:36 AM Simon Horman <horms+renesas@verge.net.au> wrote:
> 
> 
> Convert Real Time Clock for Renesas SH and ARM SoCs bindings documentation
> to json-schema.  Also name bindings documentation file according to the
> compat string being documented.
> 
> Also correct syntax error in interrupts field in example.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> * Based on v5.3
> * Tested using:
>   # ARCH=arm64 make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
>   # ARCH=arm   make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/bus/renesas,bsc.yaml
> ---
>  .../devicetree/bindings/rtc/renesas,sh-rtc.yaml    | 66 ++++++++++++++++++++++
>  Documentation/devicetree/bindings/rtc/rtc-sh.txt   | 28 ---------
>  2 files changed, 66 insertions(+), 28 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/rtc/rtc-sh.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml b/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
> new file mode 100644
> index 000000000000..07dbcd4436ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/renesas,sh-rtc.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/renesas,sh-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Real Time Clock for Renesas SH and ARM SoCs
> +
> +maintainers:
> +  - Chris Brandt <chris.brandt@renesas.com>
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,r7s72100-rtc  # RZ/A1H
> +      - const: renesas,sh-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 3
> +
> +  interrupt-names:
> +    items:
> +      - const: alarm
> +      - const: period
> +      - const: carry
> +
> +  clocks:
> +    # The functional clock source for the RTC controller must be listed
> +    # first (if it exists). Additionally, potential clock counting sources
> +    # are to be listed.
> +    true
> +
> +  clock-names:
> +    # The functional clock must be labeled as "fck". Other clocks
> +    # may be named in accordance to the SoC hardware manuals.
> +    true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/r7s72100-clock.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    rtc: rtc@fcff1000 {
> +        compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
> +        reg = <0xfcff1000 0x2e>;
> +        interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "alarm", "period", "carry";
> +        clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
> +                 <&rtc_x3_clk>, <&extal_clk>;
> +        clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
> +    };
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-sh.txt b/Documentation/devicetree/bindings/rtc/rtc-sh.txt
> deleted file mode 100644
> index 7676c7d28874..000000000000
> --- a/Documentation/devicetree/bindings/rtc/rtc-sh.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -* Real Time Clock for Renesas SH and ARM SoCs
> -
> -Required properties:
> -- compatible: Should be "renesas,r7s72100-rtc" and "renesas,sh-rtc" as a
> -  fallback.
> -- reg: physical base address and length of memory mapped region.
> -- interrupts: 3 interrupts for alarm, period, and carry.
> -- interrupt-names: The interrupts should be labeled as "alarm", "period", and
> -  "carry".
> -- clocks: The functional clock source for the RTC controller must be listed
> -  first (if exists). Additionally, potential clock counting sources are to be
> -  listed.
> -- clock-names: The functional clock must be labeled as "fck". Other clocks
> -  may be named in accordance to the SoC hardware manuals.
> -
> -
> -Example:
> -rtc: rtc@fcff1000 {
> -	compatible = "renesas,r7s72100-rtc", "renesas,sh-rtc";
> -	reg = <0xfcff1000 0x2e>;
> -	interrupts = <GIC_SPI 276 IRQ_TYPE_EDGE_RISING
> -		      GIC_SPI 277 IRQ_TYPE_EDGE_RISING
> -		      GIC_SPI 278 IRQ_TYPE_EDGE_RISING>;
> -	interrupt-names = "alarm", "period", "carry";
> -	clocks = <&mstp6_clks R7S72100_CLK_RTC>, <&rtc_x1_clk>,
> -		 <&rtc_x3_clk>, <&extal_clk>;
> -	clock-names = "fck", "rtc_x1", "rtc_x3", "extal";
> -};
> -- 
> 2.11.0

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

CU
Uli

>
