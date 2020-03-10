Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73E3F1808F2
	for <lists+linux-rtc@lfdr.de>; Tue, 10 Mar 2020 21:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgCJURK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 10 Mar 2020 16:17:10 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:40370 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbgCJURJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 10 Mar 2020 16:17:09 -0400
Received: by mail-oi1-f195.google.com with SMTP id y71so9900942oia.7;
        Tue, 10 Mar 2020 13:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TepfMU12ngaZGfWbNFvmwR9hVezQFj2Now5HdZrqyu4=;
        b=MAlWxbQMNLWWC9P8QMAlwbnTXeUHr+B8wCFlherpg0AzyPeN+KOnhJlFLYMpkDPpOU
         58T7gWcw9ypogPyHrBYXjZCain/0ZsoVdDVzemMyVMfvNjsoUFdk1ubHFad3oH+9DHyH
         ahXD5IdaUIPjhGrST2jJMsq0SxbjBE6iibughMY8QBW9fOWvCldrHzReRZB5qypmXwyI
         MSH14uSKsvs+Qg9s7gZjxfWkrVsQC0S617QkHwP6aRMvw6UxaOZDNwpF3gpD5+RkEKRI
         d3v47nyrllbqkDHqMBY3V++WclDcrt77o/K/AP4PQ57IvE+GL2aZRRF1MD3mvdNjYnK+
         wn3A==
X-Gm-Message-State: ANhLgQ16CTog/bVzNBgs/vhXaMg1iSrYK/BM2Ifqu1c00UJC5nXpq1Sl
        PyL6TFpezpsZOd0y0PktWw==
X-Google-Smtp-Source: ADFU+vvZi3Wc3khoMI8YsXkDStp3Ap7La8yZEb6cDvR9LqlLDGYFEkbj63tHb9TF0rmn3zaaorK9tQ==
X-Received: by 2002:aca:ac46:: with SMTP id v67mr2512370oie.62.1583871428243;
        Tue, 10 Mar 2020 13:17:08 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h6sm7762867otq.63.2020.03.10.13.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 13:17:07 -0700 (PDT)
Received: (nullmailer pid 30625 invoked by uid 1000);
        Tue, 10 Mar 2020 20:17:06 -0000
Date:   Tue, 10 Mar 2020 15:17:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Rutland <mark.rutland@arm.com>, od@zcrc.me,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: rtc: Convert and update jz4740-rtc doc
 to YAML
Message-ID: <20200310201706.GA25562@bogus>
References: <20200302213953.28834-1-paul@crapouillou.net>
 <20200302213953.28834-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302213953.28834-3-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Mar 02, 2020 at 06:39:53PM -0300, Paul Cercueil wrote:
> Convert the jz4740-rtc doc to YAML, and update it to reflect the new
> changes in the driver:
> - More compatible strings are specified, with fallbacks if needed,
> - The vendor-specific properties are now properly prefixed with the
>   'ingenic,' prefix.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  .../bindings/rtc/ingenic,jz4740-rtc.txt       | 37 --------
>  .../devicetree/bindings/rtc/ingenic,rtc.yaml  | 87 +++++++++++++++++++
>  2 files changed, 87 insertions(+), 37 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt b/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
> deleted file mode 100644
> index 41c7ae18fd7b..000000000000
> --- a/Documentation/devicetree/bindings/rtc/ingenic,jz4740-rtc.txt
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -JZ4740 and similar SoCs real-time clock driver
> -
> -Required properties:
> -
> -- compatible: One of:
> -  - "ingenic,jz4740-rtc" - for use with the JZ4740 SoC
> -  - "ingenic,jz4780-rtc" - for use with the JZ4780 SoC
> -- reg: Address range of rtc register set
> -- interrupts: IRQ number for the alarm interrupt
> -- clocks: phandle to the "rtc" clock
> -- clock-names: must be "rtc"
> -
> -Optional properties:
> -- system-power-controller: To use this component as the
> -  system power controller
> -- reset-pin-assert-time-ms: Reset pin low-level assertion
> -  time after wakeup (default 60ms; range 0-125ms if RTC clock
> -  at 32 kHz)
> -- min-wakeup-pin-assert-time-ms: Minimum wakeup pin assertion
> -  time (default 100ms; range 0-2s if RTC clock at 32 kHz)
> -
> -Example:
> -
> -rtc@10003000 {
> -	compatible = "ingenic,jz4740-rtc";
> -	reg = <0x10003000 0x40>;
> -
> -	interrupt-parent = <&intc>;
> -	interrupts = <32>;
> -
> -	clocks = <&rtc_clock>;
> -	clock-names = "rtc";
> -
> -	system-power-controller;
> -	reset-pin-assert-time-ms = <60>;
> -	min-wakeup-pin-assert-time-ms = <100>;
> -};
> diff --git a/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> new file mode 100644
> index 000000000000..c18ed8ac263f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/ingenic,rtc.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ingenic SoCs Real-Time Clock DT bindings
> +
> +maintainers:
> +  - Paul Cercueil <paul@crapouillou.net>
> +
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +        - ingenic,jz4740-rtc
> +        - ingenic,jz4760-rtc
> +      - items:
> +        - const: ingenic,jz4725b-rtc
> +        - const: ingenic,jz4740-rtc
> +      - items:
> +        - enum:
> +          - ingenic,jz4770-rtc
> +          - ingenic,jz4780-rtc
> +        - const: ingenic,jz4760-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    const: rtc
> +
> +  system-power-controller:
> +    description: |
> +      Indicates that the RTC is responsible for powering OFF
> +      the system.
> +    type: boolean
> +
> +  ingenic,reset-pin-assert-time-ms:
> +    description: |
> +      Reset pin low-level assertion time after wakeup
> +      (assuming RTC clock at 32 kHz)
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32

You can drop this because standard units have a type already.

> +      - minimum: 0
> +      - maximum: 125
> +      - default: 60

And then move all there out of allOf.

> +
> +  ingenic,min-wakeup-pin-assert-time-ms:
> +    description: |
> +      Minimum wakeup pin assertion time
> +      (assuming RTC clock at 32 kHz)
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +      - minimum: 0
> +      - maximum: 2000
> +      - default: 100
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/jz4740-cgu.h>
> +    rtc_dev: rtc@10003000 {
> +      compatible = "ingenic,jz4740-rtc";
> +      reg = <0x10003000 0x40>;
> +
> +      interrupt-parent = <&intc>;
> +      interrupts = <15>;
> +
> +      clocks = <&cgu JZ4740_CLK_RTC>;
> +      clock-names = "rtc";
> +    };
> -- 
> 2.25.1
> 
