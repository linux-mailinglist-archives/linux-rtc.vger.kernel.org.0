Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB8DC9B1D9
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 16:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395205AbfHWOZI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 10:25:08 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49257 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730899AbfHWOZI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Aug 2019 10:25:08 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E8D7A6000B;
        Fri, 23 Aug 2019 14:25:05 +0000 (UTC)
Date:   Fri, 23 Aug 2019 16:25:04 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [1/3] rtc/fsl: support flextimer for lx2160a
Message-ID: <20190823142504.GA30479@piout.net>
References: <20190823095740.12280-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190823095740.12280-1-biwen.li@nxp.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/08/2019 17:57:38+0800, Biwen Li wrote:
> The patch supports flextimer for lx2160a
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
>  drivers/rtc/rtc-fsl-ftm-alarm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
> index 4f7259c2d6a3..2b81525f6db8 100644
> --- a/drivers/rtc/rtc-fsl-ftm-alarm.c
> +++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
> @@ -313,6 +313,7 @@ static const struct of_device_id ftm_rtc_match[] = {
>  	{ .compatible = "fsl,ls1088a-ftm-alarm", },
>  	{ .compatible = "fsl,ls208xa-ftm-alarm", },
>  	{ .compatible = "fsl,ls1028a-ftm-alarm", },
> +	{ .compatible = "fsl,lx2160a-ftm-alarm", },
>  	{ },
>  };

I've squashed it with 3/3 and in the patch adding the driver. I also
added proper documentation.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
