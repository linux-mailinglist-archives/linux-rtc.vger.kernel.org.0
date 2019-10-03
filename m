Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDC3CC9DBA
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 13:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728017AbfJCLse (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 07:48:34 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:35605 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726523AbfJCLsd (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 07:48:33 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id F131824000C;
        Thu,  3 Oct 2019 11:48:31 +0000 (UTC)
Date:   Thu, 3 Oct 2019 13:48:31 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lukasz Majewski <lukma@denx.de>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Add support for century bits to m41t62 (rv4162) RTC
 devices
Message-ID: <20191003114831.GR4106@piout.net>
References: <20190911154803.15969-1-lukma@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190911154803.15969-1-lukma@denx.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 11/09/2019 17:48:03+0200, Lukasz Majewski wrote:
> This change adds support for 'century bits' on 4162 family of RTC devices
> (from ST or microcrystal), which allow storing time beyond year 2099.
> 
> For rv4162 century bits - CB1[7]:CB0[6] are stored in reg6 - 0x6 (MONTH):
> CB1  CB0
>  0    0      (year 2000 - 2099)
>  0    1      (year 2100 - 2199)
>  1    0      (year 2200 - 2299)
>  1    1      (year 2300 - 2399)
> 
> The driver has been also adjusted to allow setting time up to year 2399
> if the M41T80_FEATURE_CB is set in its DTS/I2C data.
> 
> There shall be no functional changes for devices not supporting this
> feature. However, other devices - like m41t80 - have different approaches
> to handle century information.
> 

This does not work because the RTC doesn't handle leap years on century
properly. This means that if you do that, then there is no guarantee the
date will be the correct after 2099. As far as the m41t62 and rv4162
are concerned, there is no way to make the century bits useful.

See the datasheet:

"During any year which is a multiple of 4, the RV-4162 RTC will
automatically insert leap day, February 29.  Therefore, the application
software must correct for this during the exception years (2100, 2200,
etc.) as noted above."

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
