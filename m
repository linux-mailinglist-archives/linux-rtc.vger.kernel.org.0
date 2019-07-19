Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 634F46E1C4
	for <lists+linux-rtc@lfdr.de>; Fri, 19 Jul 2019 09:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbfGSHdV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 Jul 2019 03:33:21 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:55139 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726036AbfGSHdU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 Jul 2019 03:33:20 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E4CA8240008;
        Fri, 19 Jul 2019 07:33:17 +0000 (UTC)
Date:   Fri, 19 Jul 2019 09:33:16 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Anson.Huang@nxp.com
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH V2] rtc: snvs: fix possible race condition
Message-ID: <20190719073316.GA4012@piout.net>
References: <20190719030102.6141-1-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190719030102.6141-1-Anson.Huang@nxp.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/07/2019 11:01:02+0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> The RTC IRQ is requested before the struct rtc_device is allocated,
> this may lead to a NULL pointer dereference in IRQ handler.
> 
> To fix this issue, allocating the rtc_device struct and register rtc
> device before requesting the RTC IRQ.
> 
> Using devm_rtc_allocate_device/rtc_register_device instead of
> devm_rtc_device_register.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V1:
> 	- move devm_request_irq() to after rtc device register done, make sure everything
> 	  is ready before enabling IRQ.

This opens another race condition, the first version of the patch was
correct.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
