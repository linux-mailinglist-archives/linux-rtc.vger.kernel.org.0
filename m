Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B45F6140ED
	for <lists+linux-rtc@lfdr.de>; Sun,  5 May 2019 18:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727295AbfEEQAd (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 5 May 2019 12:00:33 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:44737 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbfEEQAc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 5 May 2019 12:00:32 -0400
X-Originating-IP: 90.66.53.80
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id EACCAE0002;
        Sun,  5 May 2019 16:00:29 +0000 (UTC)
Date:   Sun, 5 May 2019 18:00:29 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH V2] rtc: snvs: Use __maybe_unused instead of #if
 CONFIG_PM_SLEEP
Message-ID: <20190505160029.GJ22550@piout.net>
References: <1556586144-7070-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556586144-7070-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/04/2019 01:07:08+0000, Anson Huang wrote:
> Use __maybe_unused for power management related functions
> instead of #if CONFIG_PM_SLEEP to simply the code.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> Changes since V1:
> 	- use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() to make sure snvs_rtc_pm_ops is empty when PM is off.
> ---
>  drivers/rtc/rtc-snvs.c | 19 ++++---------------
>  1 file changed, 4 insertions(+), 15 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
