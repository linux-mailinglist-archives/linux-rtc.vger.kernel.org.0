Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08FCAB49BE
	for <lists+linux-rtc@lfdr.de>; Tue, 17 Sep 2019 10:45:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730351AbfIQIpJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 17 Sep 2019 04:45:09 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:39495 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726564AbfIQIpJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 17 Sep 2019 04:45:09 -0400
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 2351324000A;
        Tue, 17 Sep 2019 08:45:05 +0000 (UTC)
Date:   Tue, 17 Sep 2019 10:45:04 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com,
        leoyang.li@nxp.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Martin Fuzzey <mfuzzey@parkeon.com>
Subject: Re: [v4,1/2] dt-bindings: rtc: pcf85263/pcf85363: add some properties
Message-ID: <20190917084504.GD21254@piout.net>
References: <20190910104247.13142-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190910104247.13142-1-biwen.li@nxp.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 10/09/2019 18:42:46+0800, Biwen Li wrote:
> Add some properties for pcf85263/pcf85363 as follows:
>   - nxp,rtc-interrupt-type: integer type
>   - nxp,rtc-interrupt-output-pin: string type
>   - quartz-load-femtofarads: integer type
>   - nxp,quartz-drive-strength: integer type
>   - nxp,quartz-low-jitter: bool type
>   - wakeup-source: bool type
> 
> Signed-off-by: Martin Fuzzey <mfuzzey@parkeon.com>
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v4:
> 	- Drop robust defines in include/dt-bindings/rtc/pcf85363.h
> 	- Add nxp,rtc-interrupt-type property
> 	- Replace interrupt-output-pin with nxp,rtc-interrupt-output-pin
> 
> Change in v3:
> 	- None
> 
> Change in v2:
> 	- Replace properties name
> 	  quartz-load-capacitance -> quartz-load-femtofarads
> 	  quartz-drive-strength -> nxp,quartz-drive-strength
> 	  quartz-low-jitter -> nxp,quartz-low-jitter
> 	- Replace drive strength name
> 	  PCF85263_QUARTZDRIVE_NORMAL -> PCF85263_QUARTZDRIVE_100ko
> 	  PCF85263_QUARTZDRIVE_LOW -> PCF85263_QUARTZDRIVE_60ko
> 	  PCF85263_QUARTZDRIVE_HIGH -> PCF85263_QUARTZDRIVE_500ko
> 	- Set default interrupt-output-pin as "INTA"
> 
>  .../devicetree/bindings/rtc/pcf85363.txt      | 44 ++++++++++++++++++-
>  include/dt-bindings/rtc/pcf85363.h            | 14 ++++++
>  2 files changed, 57 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/rtc/pcf85363.h
> 
> diff --git a/Documentation/devicetree/bindings/rtc/pcf85363.txt b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> index 94adc1cf93d9..fc1579463657 100644
> --- a/Documentation/devicetree/bindings/rtc/pcf85363.txt
> +++ b/Documentation/devicetree/bindings/rtc/pcf85363.txt
> @@ -8,10 +8,52 @@ Required properties:
>  Optional properties:
>  - interrupts: IRQ line for the RTC (not implemented).
>  
> +- nxp,rtc-interrupt-type: integer property, represent the interrupt's
> +  type. Valid values are
> +  INT_PIE(periodic interrupt enable),
> +  INT_OIE(offset correction interrupt enable),
> +  INT_A1IE(alarm1 interrupt enable),
> +  INT_A2IE(alarm2 interrupt enable),
> +  INT_TSRIE(timestamp register interrupt enable)
> +  INT_BSIE(battery switch interrupt enable),
> +  INT_WDIE(WatchDog interrupt enable,and
> +  compose these values such as: INT_A1IE | INT_A2IE,
> +  but currently only support INT_A1IE, default value is INT_A1IE.
> +  The property and property nxp,rtc-interrupt-output-pin
> +  work together to generate some interrupts on some pins.
> +
> +- nxp,rtc-interrupt-output-pin: The interrupt output pin must be
> +  "INTA" or "INTB", default value is "INTA". The property and property
> +  nxp,rtc-interrupt-type work together to generate some interrupts on
> +  some pins.
> +

This binding still doesn't work because there may be any combination of
interrupts on any of the two pins that this binding doesn't allow.

> +- quartz-load-femtofarads: The internal capacitor to select for the quartz,
> +  expressed in femto Farad (fF). Valid values are 6000, 7000 and 12500.
> +  Default value is 12500fF.
> +
> +- nxp,quartz-drive-strength: Drive strength for the quartz,
> +  expressed in kilo ohms (kOhm) Valid values are 60, 100 and 500.
> +  Default value is 100kOhm.
> +

It makes more sense to have quartz-drive-strength-ohms as a generic
property.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
