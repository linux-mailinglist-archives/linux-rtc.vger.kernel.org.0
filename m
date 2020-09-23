Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6C12754AC
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Sep 2020 11:44:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgIWJox (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Sep 2020 05:44:53 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:42259 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726102AbgIWJox (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Sep 2020 05:44:53 -0400
X-Greylist: delayed 145630 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Sep 2020 05:44:52 EDT
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 35EDA20011;
        Wed, 23 Sep 2020 09:44:50 +0000 (UTC)
Date:   Wed, 23 Sep 2020 11:44:49 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Qiang Zhao <qiang.zhao@nxp.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, a.zummo@towertech.it,
        robh+dt@kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: [Patch v2 1/3] dt-bindings: rtc: pcf2127: Add bindings for
 nxp,pcf2127
Message-ID: <20200923094449.GP9675@piout.net>
References: <20200921054821.26071-1-qiang.zhao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200921054821.26071-1-qiang.zhao@nxp.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

You forgot to copy the watchdog maintainers, I think such a property
should be discussed with them.

Note that I'm still convinced this is not a complete solution, see:
https://lore.kernel.org/linux-rtc/20200716181816.GF3428@piout.net/

On 21/09/2020 13:48:19+0800, Qiang Zhao wrote:
> From: Zhao Qiang <qiang.zhao@nxp.com>
> 
> Add bindings for nxp,pcf2127
> 
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---
> Changes for v2:
>  - modify the format to yaml
>  - add compitable "nxp,pca2129"
> 
>  .../devicetree/bindings/rtc/nxp,pcf2127.yaml       | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> new file mode 100644
> index 0000000..226a0b2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml
> @@ -0,0 +1,41 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/nxp,pcf2127.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCF RTCs
> +
> +maintainers:
> +  - Qiang Zhao <qiang.zhao@nxp.com>
> +
> +allOf:
> +  - $ref: "rtc.yaml#"
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,pcf2127
> +      - nxp,pcf2129
> +      - nxp,pca2129
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  no-watchdog:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      With this property, the device will not registered as a watchdog device.
> +
> +  start-year: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +...
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
