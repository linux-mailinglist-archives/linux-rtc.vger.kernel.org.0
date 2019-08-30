Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 185C4A3458
	for <lists+linux-rtc@lfdr.de>; Fri, 30 Aug 2019 11:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727814AbfH3JpJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 30 Aug 2019 05:45:09 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:58203 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfH3JpI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 30 Aug 2019 05:45:08 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id BEBA1E000E;
        Fri, 30 Aug 2019 09:45:04 +0000 (UTC)
Date:   Fri, 30 Aug 2019 11:44:56 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com,
        leoyang.li@nxp.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: Re: [1/2] dt-bindings: rtc: pcf85263/pcf85363: add some properties
Message-ID: <20190830094456.GO21922@piout.net>
References: <20190830091720.41156-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190830091720.41156-1-biwen.li@nxp.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/08/2019 17:17:19+0800, Biwen Li wrote:
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

default value can't be none if there is an interrupts property. Also,
both pins can be enabled at the same time and this binding would prevent
that.
Finally, it may also be desirable to have some interrupts on one pin and
other interrupts on another pin e.g. alarms and timestamping on INTA
going to the SoC and only alarms on INTB going to a PMIC.

> +- quartz-load-capacitance: The internal capacitor to select for the quartz:
> +	PCF85263_QUARTZCAP_7pF		[0]
> +	PCF85263_QUARTZCAP_6pF		[1]
> +	PCF85263_QUARTZCAP_12p5pF	[2] DEFAULT
> +

The correct generic property is quartz-load-femtofarads.

> +- quartz-drive-strength: Drive strength for the quartz:
> +	PCF85263_QUARTZDRIVE_NORMAL	[0] DEFAULT
> +	PCF85263_QUARTZDRIVE_LOW	[1]
> +	PCF85263_QUARTZDRIVE_HIGH	[2]
> +

This has to take a value in ohm to be generic and then you don't need
the include file.

> +- quartz-low-jitter: Boolean property, if present enables low jitter mode
> +  which reduces jitter at the cost of increased power consumption.
> +

I think that property needs to be nxp specific.

> +- wakeup-source: Boolean property, mark the chip as a wakeup source,
> +  independently of the availability of an IRQ line connected to the SoC.
> +  This is useful if the IRQ line is connected to a PMIC or other circuit
> +  that can power up the device rather than to a normal SOC interrupt.
> +

This is already defined in bindings/power/wakeup-source.txt I guess you
can simply refer to it.

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

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
