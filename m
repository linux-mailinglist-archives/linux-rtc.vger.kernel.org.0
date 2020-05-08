Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749F41CA9FA
	for <lists+linux-rtc@lfdr.de>; Fri,  8 May 2020 13:50:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgEHLu5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 May 2020 07:50:57 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:42139 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726636AbgEHLu5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 May 2020 07:50:57 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 100E8FF808;
        Fri,  8 May 2020 11:50:52 +0000 (UTC)
Date:   Fri, 8 May 2020 13:50:52 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@oss.nxp.com>
Cc:     leoyang.li@nxp.com, robh+dt@kernel.org, mpe@ellerman.id.au,
        benh@kernel.crashing.org, a.zummo@towertech.it,
        devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Biwen Li <biwen.li@nxp.com>
Subject: Re: [PATCH 2/3] dts: ppc: t4240rdb: add uie_unsupported property to
 drop warning
Message-ID: <20200508115052.GL34497@piout.net>
References: <20200508054925.48237-1-biwen.li@oss.nxp.com>
 <20200508054925.48237-2-biwen.li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508054925.48237-2-biwen.li@oss.nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/05/2020 13:49:24+0800, Biwen Li wrote:
> From: Biwen Li <biwen.li@nxp.com>
> 
> This adds uie_unsupported property to drop warning as follows:
>     - $ hwclock.util-linux
>       hwclock.util-linux: select() to /dev/rtc0
>       to wait for clock tick timed out
> 
> My case:
>     - RTC ds1374's INT pin is connected to VCC on T4240RDB,
>       then the RTC cannot inform cpu about the alarm interrupt
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  arch/powerpc/boot/dts/fsl/t4240rdb.dts | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/boot/dts/fsl/t4240rdb.dts b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> index a56a705d41f7..ccdd10202e56 100644
> --- a/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> +++ b/arch/powerpc/boot/dts/fsl/t4240rdb.dts
> @@ -144,7 +144,11 @@
>  			rtc@68 {
>  				compatible = "dallas,ds1374";
>  				reg = <0x68>;
> -				interrupts = <0x1 0x1 0 0>;

removing the interrupt should be enough to solve your issue

> +				// The ds1374's INT pin isn't
> +				// connected to cpu's INT pin,
> +				// so the rtc cannot synchronize
> +				// clock tick per second.
> +				uie_unsupported;
>  			};
>  		};
>  
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
