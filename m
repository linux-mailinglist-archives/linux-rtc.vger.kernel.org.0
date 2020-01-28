Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 895F114B97A
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Jan 2020 15:33:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgA1Ocq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Jan 2020 09:32:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:34028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727837AbgA1Ocp (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 28 Jan 2020 09:32:45 -0500
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D073324685;
        Tue, 28 Jan 2020 14:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580221965;
        bh=fA/B9G2d55+a4zcXyCidgiM1scGvdikipkUh8OpG4sQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=aPc+8DJ44URecMpBKGA6Krd3ddBfgQoZQELTra5XX16oVB7gKPIPj22Dgxj7CBf5+
         rpbV5ocO+1J1Jqo8qz3lO1l5WRi3Q7YuuN8Pki1c8JryD3JLjWYaJkH0WjhOWyA8Wp
         ZnFz0sndRQgZ6zjI5/XVlCDCnk3CLh39+RLlbn3A=
Received: by mail-qt1-f182.google.com with SMTP id h12so10398693qtu.1;
        Tue, 28 Jan 2020 06:32:44 -0800 (PST)
X-Gm-Message-State: APjAAAXcCl0cBqxAbZ3M1+xVS11dVuHk1GzgmjWiObYKYEX6tzLK2mWw
        27PWbFyYcHC9b5CggRe2gPEc5xLWeJt80hVk8Q==
X-Google-Smtp-Source: APXvYqzxJnZDHkxRQDe9t+Eah8Fx57BBszoCD+dphD/GZrMOT/aXuj/TVsyJGpZsYv/1fLKoBTwELyq9kDRKgm/tJlU=
X-Received: by 2002:aed:2344:: with SMTP id i4mr21770697qtc.136.1580221963861;
 Tue, 28 Jan 2020 06:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20191229204421.337612-1-alexandre.belloni@bootlin.com> <20191229204421.337612-2-alexandre.belloni@bootlin.com>
In-Reply-To: <20191229204421.337612-2-alexandre.belloni@bootlin.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 28 Jan 2020 08:32:32 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+nQbZkY_oDhCCTGr02xWxUXvCVaWZ8KZHkDhsgawM_wA@mail.gmail.com>
Message-ID: <CAL_Jsq+nQbZkY_oDhCCTGr02xWxUXvCVaWZ8KZHkDhsgawM_wA@mail.gmail.com>
Subject: Re: [PATCH 2/9] dt-bindings: rtc: at91rm9200: convert bindings to json-schema
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Eugen Hristev <Eugen.Hristev@microchip.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, Dec 29, 2019 at 2:45 PM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Convert Real Time Clock for Atmel/Microchip SoCs bindings documentation
> to json-schema.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  .../bindings/rtc/atmel,at91rm9200-rtc.txt     | 17 --------
>  .../bindings/rtc/atmel,at91rm9200-rtc.yaml    | 42 +++++++++++++++++++
>  2 files changed, 42 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
>
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.txt b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.txt
> deleted file mode 100644
> index 5d3791e789c6..000000000000
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.txt
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -Atmel AT91RM9200 Real Time Clock
> -
> -Required properties:
> -- compatible: should be: "atmel,at91rm9200-rtc" or "atmel,at91sam9x5-rtc"
> -- reg: physical base address of the controller and length of memory mapped
> -  region.
> -- interrupts: rtc alarm/event interrupt
> -- clocks: phandle to input clock.
> -
> -Example:
> -
> -rtc@fffffe00 {
> -       compatible = "atmel,at91rm9200-rtc";
> -       reg = <0xfffffe00 0x100>;
> -       interrupts = <1 4 7>;
> -       clocks = <&clk32k>;
> -};
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> new file mode 100644
> index 000000000000..55bd87e884d3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/atmel,at91rm9200-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel AT91 RTC Device Tree Bindings
> +
> +allOf:
> +  - $ref: "rtc.yaml#"
> +
> +maintainers:
> +  - Alexandre Belloni <alexandre.belloni@bootlin.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,at91rm9200-rtc
> +      - atmel,at91sam9x5-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    rtc@fffffe00 {
> +        compatible = "atmel,at91rm9200-rtc";
> +        reg = <0xfffffe00 0x100>;
> +        interrupts = <1 4 7>;
> +        clocks = <&clk32k>;

clocks is not documented.

Looks like this landed in linux-next now and breaks 'make dt_binding_check':

/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.example.dt.yaml:
rtc@fffffe00: 'clocks' does not match any of the regexes:
'pinctrl-[0-9]+'

Rob
