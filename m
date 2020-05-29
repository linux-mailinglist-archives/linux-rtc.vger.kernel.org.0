Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7AE91E7810
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2020 10:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725913AbgE2ISh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 04:18:37 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:41803 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgE2ISh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 May 2020 04:18:37 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id B9462C0013;
        Fri, 29 May 2020 08:18:34 +0000 (UTC)
Date:   Fri, 29 May 2020 10:18:34 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Ran Wang <ran.wang_1@nxp.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, Li Biwen <biwen.li@nxp.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: rtc: add wakeup-source for FlexTimer
Message-ID: <20200529081834.GX3972@piout.net>
References: <20200529061035.18912-1-ran.wang_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200529061035.18912-1-ran.wang_1@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/05/2020 14:10:34+0800, Ran Wang wrote:
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> index fffac74..d7c482c 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-fsl-ftm-alarm.txt
> @@ -20,6 +20,7 @@ Required properties:
>  Optional properties:
>  - big-endian: If the host controller is big-endian mode, specify this property.
>    The default endian mode is little-endian.
> +- wakeup-source: Enable it as a wakeup source
>  

This is already covered by Documentation/devicetree/bindings/rtc/rtc.yaml

>  Example:
>  rcpm: rcpm@1e34040 {
> @@ -32,5 +33,6 @@ ftm_alarm0: timer@2800000 {
>  	compatible = "fsl,ls1088a-ftm-alarm";
>  	reg = <0x0 0x2800000 0x0 0x10000>;
>  	fsl,rcpm-wakeup = <&rcpm 0x0 0x0 0x0 0x0 0x4000 0x0>;
> +	wakeup-source;
>  	interrupts = <0 44 4>;
>  };
> -- 
> 2.7.4
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
