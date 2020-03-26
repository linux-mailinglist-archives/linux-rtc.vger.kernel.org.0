Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEBC6194983
	for <lists+linux-rtc@lfdr.de>; Thu, 26 Mar 2020 21:47:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbgCZUrt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 26 Mar 2020 16:47:49 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:53325 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbgCZUrt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 26 Mar 2020 16:47:49 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 87C2720007;
        Thu, 26 Mar 2020 20:47:46 +0000 (UTC)
Date:   Thu, 26 Mar 2020 21:47:46 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Eugene Syromiatnikov <esyr@redhat.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        "Dmitry V. Levin" <ldv@altlinux.org>
Subject: Re: [PATCH] rtc: make definitions in include/uapi/linux/rtc.h
 actually useful for user space
Message-ID: <20200326204746.GA593483@piout.net>
References: <20200324041209.GA30727@asgard.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200324041209.GA30727@asgard.redhat.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 24/03/2020 05:12:09+0100, Eugene Syromiatnikov wrote:
> BIT() macro is not defined in UAPI headers; there is, however, similarly
> defined _BITUL() macro present in include/uapi/linux/const.h; use it
> instead and include <linux/const.h> and <linux/ioctl.h> in order to make
> the definitions provided in the header useful.
> 
> Fixes: 3431ca4837bf ("rtc: define RTC_VL_READ values")
> Signed-off-by: Eugene Syromiatnikov <esyr@redhat.com>
> ---
>  include/uapi/linux/rtc.h | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
