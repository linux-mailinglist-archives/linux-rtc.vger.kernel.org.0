Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EBA9F0387
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Nov 2019 17:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388897AbfKEQ50 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Nov 2019 11:57:26 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:33771 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388831AbfKEQ50 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Nov 2019 11:57:26 -0500
X-Originating-IP: 92.137.17.54
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id CE4AB60005;
        Tue,  5 Nov 2019 16:57:23 +0000 (UTC)
Date:   Tue, 5 Nov 2019 17:57:23 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] rtc: bd70528: Fix hour register mask
Message-ID: <20191105165723.GD8309@piout.net>
References: <20191023114751.GA14100@localhost.localdomain>
 <20191105165317.GC8309@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105165317.GC8309@piout.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/11/2019 17:53:18+0100, Alexandre Belloni wrote:
> On 23/10/2019 14:47:51+0300, Matti Vaittinen wrote:
> > When RTC is used in 24H mode (and it is by this driver) the maximum
> > hour value is 24 in BCD. This occupies bits [5:0] - which means
> > correct mask for HOUR register is 0x3f not 0x1f. Fix the mask
> > 
> > Fixes: 32a4a4ebf768 ("rtc: bd70528: Initial support for ROHM bd70528 RTC")
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> >  include/linux/mfd/rohm-bd70528.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> Applied, thanks.
> 

Actually, is there any point in doing that since "rtc: bd70528 add
BD71828 support" will conflict with it and correct the issue anyway?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
