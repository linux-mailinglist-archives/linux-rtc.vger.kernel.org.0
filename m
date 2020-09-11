Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26F54266A1F
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Sep 2020 23:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgIKVeY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 11 Sep 2020 17:34:24 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:41023 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbgIKVeM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 11 Sep 2020 17:34:12 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id BE2AF1BF203;
        Fri, 11 Sep 2020 21:34:10 +0000 (UTC)
Date:   Fri, 11 Sep 2020 23:34:10 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Qiang Zhao <qiang.zhao@nxp.com>
Cc:     a.zummo@towertech.it, robh+dt@kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: rtc-2127: Add bindings for
 nxp,rtc-2127.txt
Message-ID: <20200911213410.GB7446@piout.net>
References: <20200827091441.12972-1-qiang.zhao@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827091441.12972-1-qiang.zhao@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

The correct subject prefix is dt-bindings: rtc: pcf2127

On 27/08/2020 17:14:39+0800, Qiang Zhao wrote:
> From: Zhao Qiang <qiang.zhao@nxp.com>
> 
> Add bindings for nxp,rtc-2127
> 
> Signed-off-by: Zhao Qiang <qiang.zhao@nxp.com>
> ---
>  Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt b/Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt
> new file mode 100644
> index 0000000..c822e10
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/nxp,rtc-2127.txt

The proper filename is nxp,pcf2127.

> @@ -0,0 +1,18 @@
> +NXP PCF2127 SPI Real Time Clock
> +
> +Required properties:
> +- compatible: should be: "nxp,pcf2127"
> +                      or "nxp,pcf2129"
> +- reg: should be the SPI slave chipselect address
> +
> +Optional properties:
> +- no-watchdog: PCF2127 is not used as watchdog
> +

Please Cc the watchdog maintainers as this should probably end up being
a common watchdog binding.

> +Example:
> +
> +pcf2127: rtc@51 {
> +	compatible = "nxp,pcf2127";
> +	reg = <0x51>;
> +	interrupts = <0 150 0x4>;
> +	no-watchdog;
> +};
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
