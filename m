Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01759A5829
	for <lists+linux-rtc@lfdr.de>; Mon,  2 Sep 2019 15:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731259AbfIBNjs (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 2 Sep 2019 09:39:48 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35432 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731194AbfIBNjJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 2 Sep 2019 09:39:09 -0400
Received: by mail-wr1-f68.google.com with SMTP id g7so14103711wrx.2;
        Mon, 02 Sep 2019 06:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:in-reply-to;
        bh=rl1/ze6kx/CUskXwTtnQLspfVQPuMYTtTqShk05XrUg=;
        b=VaAk/s64C/XajP01q5KRSXCkcByra439P07kQUDRBR2xM4O+USdWHTRMaHWeAYnaT+
         LSINNNgqC+0S6mKs3NabrR77n4DUr1P1PfWbkQ+q2JGqRkYp1g2wYZbSNMJAsEhElE83
         kITdW3LiQA5VDPhVKdkuhPV3QejdzRvHtz54cF3bijPPLxX2FIKHs2+OPZCnTfMukkMj
         Xyce4hwIFvQ6AZmypbM1QP1Yi9S2IjUY+OkYH0/SOpXniOvTs5Oup7tmiY4VuYHBSojl
         mdIJHzTTjM95xZs6+Wybr42njwUil8WmEBTvQ5hczZ0KYsh142FAIW6E4ZXyVfxbgXQu
         yOeg==
X-Gm-Message-State: APjAAAUhrYaEbkoPaJNFf2gqdq7S65Yj61LnQFjAL5EIkh1jbRfT/vDV
        3QYaPyzX1G//vrzyiAr8pQ==
X-Google-Smtp-Source: APXvYqzsx1OHwq+enNcfrXd5T9LqvLOZuQM8cwOivIUua3i7l9LEHS3ykllvG2e6KcWTCqGzGABwWA==
X-Received: by 2002:adf:e784:: with SMTP id n4mr20000809wrm.144.1567431546044;
        Mon, 02 Sep 2019 06:39:06 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id a16sm7279173wmg.5.2019.09.02.06.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 06:39:05 -0700 (PDT)
Message-ID: <5d6d1b79.1c69fb81.29f0d.e042@mx.google.com>
Date:   Mon, 02 Sep 2019 14:39:04 +0100
From:   Rob Herring <robh@kernel.org>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        mark.rutland@arm.com, leoyang.li@nxp.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Martin Fuzzey <mfuzzey@parkeon.com>
Subject: Re: [1/2] dt-bindings: rtc: pcf85263/pcf85363: add some properties
References: <20190830091720.41156-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830091720.41156-1-biwen.li@nxp.com>
X-Mutt-References: <20190830091720.41156-1-biwen.li@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Aug 30, 2019 at 05:17:19PM +0800, Biwen Li wrote:
> Add some properties for pcf85263/pcf85363 as follows:
>   - interrupt-output-pin: string type
>   - quartz-load-capacitance: integer type
>   - quartz-drive-strength: integer type
>   - quartz-low-jitter: bool type
>   - wakeup-source: bool type
> 
> Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  .../devicetree/bindings/rtc/pcf85363.txt      | 31 +++++++++++++++++++
>  include/dt-bindings/rtc/pcf85363.h            | 15 +++++++++
>  2 files changed, 46 insertions(+)
>  create mode 100644 include/dt-bindings/rtc/pcf85363.h
> 
> diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> index 94adc1cf93d9..d83359990bd7 100644
> --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> @@ -8,10 +8,41 @@ Required properties:
>  Optional properties:
>  - interrupts: IRQ line for the RTC (not implemented).
>  
> +- interrupt-output-pin: The interrupt output pin must be
> +  "NONE", "INTA" or "INTB", default value is "NONE"
> +
> +- quartz-load-capacitance: The internal capacitor to select for the quartz:
> +	PCF85263_QUARTZCAP_7pF		[0]
> +	PCF85263_QUARTZCAP_6pF		[1]
> +	PCF85263_QUARTZCAP_12p5pF	[2] DEFAULT

We have a common property for this. Use it.

> +
> +- quartz-drive-strength: Drive strength for the quartz:
> +	PCF85263_QUARTZDRIVE_NORMAL	[0] DEFAULT
> +	PCF85263_QUARTZDRIVE_LOW	[1]
> +	PCF85263_QUARTZDRIVE_HIGH	[2]
> +
> +- quartz-low-jitter: Boolean property, if present enables low jitter mode
> +  which reduces jitter at the cost of increased power consumption.

These 2  need vendor prefixes.

> +
> +- wakeup-source: Boolean property, mark the chip as a wakeup source,
> +  independently of the availability of an IRQ line connected to the SoC.
> +  This is useful if the IRQ line is connected to a PMIC or other circuit
> +  that can power up the device rather than to a normal SOC interrupt.
> +
>  Example:
>  
>  pcf85363: pcf85363@51 {
>  	compatible = "nxp,pcf85363";
>  	reg = <0x51>;
> +
> +	interrupt-parent = <&gpio1>;
> +	interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
> +
> +	#include <dt-bindings/rtc/pcf85363.h>
> +	wakeup-source;
> +	interrupt-output-pin = "INTA";
> +	quartz-load-capacitance = <PCF85363_QUARTZCAP_12p5pF>;
> +	quartz-drive-strength = <PCF85363_QUARTZDRIVE_LOW>;
> +	quartz-low-jitter;
>  };
>  
> diff --git a/include/dt-bindings/rtc/pcf85363.h b/include/dt-bindings/rtc/pcf85363.h
> new file mode 100644
> index 000000000000..2c06c28eb5ff
> --- /dev/null
> +++ b/include/dt-bindings/rtc/pcf85363.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _DT_BINDINGS_RTC_PCF85363_H
> +#define _DT_BINDINGS_RTC_PCF85363_H
> +
> +/* Quartz capacitance */
> +#define PCF85363_QUARTZCAP_7pF		0
> +#define PCF85363_QUARTZCAP_6pF		1
> +#define PCF85363_QUARTZCAP_12p5pF	2
> +
> +/* Quartz drive strength */
> +#define PCF85363_QUARTZDRIVE_NORMAL	0
> +#define PCF85363_QUARTZDRIVE_LOW	1
> +#define PCF85363_QUARTZDRIVE_HIGH	2
> +
> +#endif /* _DT_BINDINGS_RTC_PCF85363_H */
> -- 
> 2.17.1
> 

