Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9576818F0DD
	for <lists+linux-rtc@lfdr.de>; Mon, 23 Mar 2020 09:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727579AbgCWI24 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 23 Mar 2020 04:28:56 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:34865 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727544AbgCWI2z (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 23 Mar 2020 04:28:55 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id C95D3C000F;
        Mon, 23 Mar 2020 08:28:53 +0000 (UTC)
Date:   Mon, 23 Mar 2020 09:28:53 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Peng Ma <peng.ma@nxp.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
        ran.wang_1@nxp.com, biwen.li@nxp.com
Subject: Re: [PATCH] rtc: fsl-ftm-alarm: remove the useless variable
Message-ID: <20200323082853.GW5504@piout.net>
References: <20200323072956.38263-1-peng.ma@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200323072956.38263-1-peng.ma@nxp.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/03/2020 15:29:56+0800, Peng Ma wrote:
> Remove the useless variable to fixed the below build warning:
> drivers/rtc/rtc-fsl-ftm-alarm.c: In function 'ftm_rtc_probe':
> drivers/rtc/rtc-fsl-ftm-alarm.c:246:22: warning: unused variable 'np' [-Wunused-variable]
>   struct device_node *np = pdev->dev.of_node;
> 
> Signed-off-by: Peng Ma <peng.ma@nxp.com>
> ---
>  drivers/rtc/rtc-fsl-ftm-alarm.c | 1 -
>  1 file changed, 1 deletion(-)
> 

I squashed it in the offending commit.
-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
