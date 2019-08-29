Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADEF3A1F62
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2019 17:39:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727949AbfH2Pju (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Aug 2019 11:39:50 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:50469 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727947AbfH2Pjt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Aug 2019 11:39:49 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id E8D0E240007;
        Thu, 29 Aug 2019 15:39:47 +0000 (UTC)
Date:   Thu, 29 Aug 2019 17:39:42 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Anson.Huang@nxp.com
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linux-imx@nxp.com
Subject: Re: [PATCH] rtc: snvs: fix possible race condition
Message-ID: <20190829153942.GK21922@piout.net>
References: <20190716071858.36750-1-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716071858.36750-1-Anson.Huang@nxp.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/07/2019 15:18:58+0800, Anson.Huang@nxp.com wrote:
> From: Anson Huang <Anson.Huang@nxp.com>
> 
> The RTC IRQ is requested before the struct rtc_device is allocated,
> this may lead to a NULL pointer dereference in IRQ handler.
> 
> To fix this issue, allocating the rtc_device struct before requesting
> the RTC IRQ using devm_rtc_allocate_device, and use rtc_register_device
> to register the RTC device.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
>  drivers/rtc/rtc-snvs.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
