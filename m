Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB627302F75
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Jan 2021 23:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727046AbhAYWx2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Jan 2021 17:53:28 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:48819 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732697AbhAYWvv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Jan 2021 17:51:51 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id AED4D1BF20C;
        Mon, 25 Jan 2021 22:51:01 +0000 (UTC)
Date:   Mon, 25 Jan 2021 23:51:01 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v4 12/21] dt-bindings: rtc: sun6i: Add H616 compatible
 string
Message-ID: <20210125225101.GV1196852@piout.net>
References: <20210125151811.11871-1-andre.przywara@arm.com>
 <20210125151811.11871-13-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210125151811.11871-13-andre.przywara@arm.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello Andre,

On 25/01/2021 15:18:02+0000, Andre Przywara wrote:
> Add the obvious compatible name to the existing RTC binding, and pair
> it with the existing H6 fallback compatible string, as the devices are
> compatible.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 

How do you expect that patch to be merged? I was thinking it would go
through Rob's tree.

> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> index b1b0ee769b71..4193e5813344 100644
> --- a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
> @@ -26,6 +26,9 @@ properties:
>            - const: allwinner,sun50i-a64-rtc
>            - const: allwinner,sun8i-h3-rtc
>        - const: allwinner,sun50i-h6-rtc
> +      - items:
> +          - const: allwinner,sun50i-h616-rtc
> +          - const: allwinner,sun50i-h6-rtc
>  
>    reg:
>      maxItems: 1
> -- 
> 2.17.5
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
