Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA4BA19D5EC
	for <lists+linux-rtc@lfdr.de>; Fri,  3 Apr 2020 13:40:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgDCLkZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 Apr 2020 07:40:25 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:21365 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728066AbgDCLkY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 Apr 2020 07:40:24 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 88080240015;
        Fri,  3 Apr 2020 11:40:21 +0000 (UTC)
Date:   Fri, 3 Apr 2020 13:40:21 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Colin King <colin.king@canonical.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next][V3] rtc: ds1307: check for failed memory
 allocation on wdt
Message-ID: <20200403114021.GS3683@piout.net>
References: <20200403110437.57420-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200403110437.57420-1-colin.king@canonical.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/04/2020 12:04:37+0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a failed memory allocation will lead to a null pointer
> dereference on point wdt.  Fix this by checking for a failed
> allocation and just returning.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: fd90d48db037 ("rtc: ds1307: add support for watchdog timer on ds1388")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: move error exit label and remove a return statement, thanks to 
>     Walter Harms for spotting this clean up.
> V3: simplify, just bail out and return on detecting the out of memory
>     condition
> 
> ---
> 
>  drivers/rtc/rtc-ds1307.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
