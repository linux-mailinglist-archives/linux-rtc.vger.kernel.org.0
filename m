Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA00618EC80
	for <lists+linux-rtc@lfdr.de>; Sun, 22 Mar 2020 22:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgCVVQH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 22 Mar 2020 17:16:07 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:58057 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgCVVQH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 22 Mar 2020 17:16:07 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 89CB8FF803;
        Sun, 22 Mar 2020 21:16:05 +0000 (UTC)
Date:   Sun, 22 Mar 2020 22:16:05 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Keyur Patel <iamkeyur96@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: bd70528: Avoid double error messaging when IRQ
 absent
Message-ID: <20200322211605.GF221863@piout.net>
References: <20200321180838.12729-1-iamkeyur96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200321180838.12729-1-iamkeyur96@gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/03/2020 14:08:37-0400, Keyur Patel wrote:
> Since the commit 7723f4c ("driver core: platform: Add an error message
> to platform_get_irq*()") platform_get_irq() started issuing an error message.
> Thus, there is no need to have the same in the driver.
> 
> Signed-off-by: Keyur Patel <iamkeyur96@gmail.com>
> ---
>  drivers/rtc/rtc-bd70528.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
