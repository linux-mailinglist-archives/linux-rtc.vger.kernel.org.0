Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB5FE9F79
	for <lists+linux-rtc@lfdr.de>; Wed, 30 Oct 2019 16:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfJ3Psr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 30 Oct 2019 11:48:47 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:54389 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbfJ3Psr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 30 Oct 2019 11:48:47 -0400
X-Originating-IP: 91.217.168.176
Received: from localhost (unknown [91.217.168.176])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id EEBF6240007;
        Wed, 30 Oct 2019 15:48:43 +0000 (UTC)
Date:   Wed, 30 Oct 2019 16:48:43 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] rtc: fsl-ftm-alarm: Fix build error without
 PM_SLEEP
Message-ID: <20191030154843.GB10007@piout.net>
References: <20191030133256.14612-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191030133256.14612-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/10/2019 21:32:56+0800, YueHaibing wrote:
> When do randbuild, Kconfig warning this:
> 
> WARNING: unmet direct dependencies detected for FSL_RCPM
>   Depends on [n]: PM_SLEEP [=y] && (ARM || ARM64)
>   Selected by [y]:
>   - RTC_DRV_FSL_FTM_ALARM [=y] && RTC_CLASS [=y] && (ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST [=y])
> 
> Add PM_SLEEP dependency to fix this.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: e1c2feb1efa2 ("rtc: fsl-ftm-alarm: allow COMPILE_TEST")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/rtc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
