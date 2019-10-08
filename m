Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A1484CFC75
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Oct 2019 16:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfJHObZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Oct 2019 10:31:25 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:45903 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725795AbfJHObY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Oct 2019 10:31:24 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 56FA7C0007;
        Tue,  8 Oct 2019 14:31:22 +0000 (UTC)
Date:   Tue, 8 Oct 2019 16:31:21 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com,
        Srinivas Goud <srinivas.goud@xilinx.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: xilinx: Fix calibval variable type
Message-ID: <20191008143121.GX4254@piout.net>
References: <20765c4c27aa92c75426b82fd2815ebef6471492.1570544738.git.michal.simek@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20765c4c27aa92c75426b82fd2815ebef6471492.1570544738.git.michal.simek@xilinx.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 08/10/2019 16:25:41+0200, Michal Simek wrote:
> From: Srinivas Goud <srinivas.goud@xilinx.com>
> 
> This patch fixes the warnings reported by static code analysis.
> Updated calibval variable type to unsigned type from signed.
> 
> Signed-off-by: Srinivas Goud <srinivas.goud@xilinx.com>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
> 
>  drivers/rtc/rtc-zynqmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
> index 2c762757fb54..da0dbea8def3 100644
> --- a/drivers/rtc/rtc-zynqmp.c
> +++ b/drivers/rtc/rtc-zynqmp.c
> @@ -44,7 +44,7 @@ struct xlnx_rtc_dev {
>  	void __iomem		*reg_base;
>  	int			alarm_irq;
>  	int			sec_irq;
> -	int			calibval;
> +	unsigned int		calibval;

Note that ideally, this varialbe should be removed and replaced by
.read_offset and .set_offset callbacks so userspace can properly
recalibrate the crystal instead of relying on a static value inside the
device tree.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
