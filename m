Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6EC309D8D
	for <lists+linux-rtc@lfdr.de>; Sun, 31 Jan 2021 16:32:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbhAaP1V (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 31 Jan 2021 10:27:21 -0500
Received: from mailoutvs3.siol.net ([185.57.226.194]:41849 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232766AbhAaNzb (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 31 Jan 2021 08:55:31 -0500
X-Greylist: delayed 566 seconds by postgrey-1.27 at vger.kernel.org; Sun, 31 Jan 2021 08:55:31 EST
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 0427552187D;
        Sun, 31 Jan 2021 14:44:43 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta10.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta10.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 2UVdYFwNwfuR; Sun, 31 Jan 2021 14:44:42 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id A8106521892;
        Sun, 31 Jan 2021 14:44:42 +0100 (CET)
Received: from kista.localnet (cpe-86-58-58-53.static.triera.net [86.58.58.53])
        (Authenticated sender: jernej.skrabec@siol.net)
        by mail.siol.net (Postfix) with ESMTPA id D547952187D;
        Sun, 31 Jan 2021 14:44:40 +0100 (CET)
From:   Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To:     Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Andre Przywara <andre.przywara@arm.com>
Cc:     Samuel Holland <samuel@sholland.org>,
        Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh@kernel.org>,
        =?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Shuosheng Huang <huangshuosheng@allwinnertech.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v5 12/20] dt-bindings: rtc: sun6i: Add H616 compatible string
Date:   Sun, 31 Jan 2021 14:44:40 +0100
Message-ID: <1675074.8rG671tKPg@kista>
In-Reply-To: <20210127172500.13356-13-andre.przywara@arm.com>
References: <20210127172500.13356-1-andre.przywara@arm.com> <20210127172500.13356-13-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi!

Dne sreda, 27. januar 2021 ob 18:24:52 CET je Andre Przywara napisal(a):
> Add the obvious compatible name to the existing RTC binding, and pair
> it with the existing H6 fallback compatible string, as the devices are
> compatible.

After close lookup I would disagree with this observation. Major difference is 
that H616 doesn't support usage of external 32768 Hz oscillator. It uses 24 
MHz oscillator with divider for that case. Due to that change, whole logic for 
external oscillator should go out. Additionally, this logic overwrites default 
value in LOSC_CTRL register, which is not nice (there is no documentation for 
those bits). 

Best regards,
Jernej

> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-
rtc.yaml b/Documentation/devicetree/bindings/rtc/allwinner,sun6i-a31-rtc.yaml
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
> 


