Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 277C028F7B2
	for <lists+linux-rtc@lfdr.de>; Thu, 15 Oct 2020 19:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731290AbgJORil (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 15 Oct 2020 13:38:41 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:49005 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731233AbgJORil (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 15 Oct 2020 13:38:41 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 0DB4A1BF20A;
        Thu, 15 Oct 2020 17:38:38 +0000 (UTC)
Date:   Thu, 15 Oct 2020 19:38:38 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [bug report] [PATCH] RTC subsystem: class
Message-ID: <20201015173838.GF134622@piout.net>
References: <20201015095851.GA3042688@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201015095851.GA3042688@mwanda>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/10/2020 12:58:51+0300, Dan Carpenter wrote:
> Hello Alessandro Zummo,
> 
> The patch 0c86edc0d497: "[PATCH] RTC subsystem: class" from Mar 27,
> 2006, leads to the following static checker warning:
> 

Wow, 14 years ago :)

> 	drivers/rtc/rtc-r9701.c:109 r9701_set_datetime()
> 	error: undefined (user controlled) shift '1 << dt->tm_wday'
> 
> drivers/rtc/rtc-r9701.c
>     95  static int r9701_set_datetime(struct device *dev, struct rtc_time *dt)
>     96  {
>     97          int ret, year;
>     98  
>     99          year = dt->tm_year + 1900;
>    100          if (year >= 2100 || year < 2000)
>    101                  return -EINVAL;
>    102  
>    103          ret = write_reg(dev, RHRCNT, bin2bcd(dt->tm_hour));
>    104          ret = ret ? ret : write_reg(dev, RMINCNT, bin2bcd(dt->tm_min));
>    105          ret = ret ? ret : write_reg(dev, RSECCNT, bin2bcd(dt->tm_sec));
>    106          ret = ret ? ret : write_reg(dev, RDAYCNT, bin2bcd(dt->tm_mday));
>    107          ret = ret ? ret : write_reg(dev, RMONCNT, bin2bcd(dt->tm_mon + 1));
>    108          ret = ret ? ret : write_reg(dev, RYRCNT, bin2bcd(dt->tm_year - 100));
>    109          ret = ret ? ret : write_reg(dev, RWKCNT, 1 << dt->tm_wday);
> 
> I would have expected that rtc_valid_tm() would check that dt->tm_wday
> as valid but it doesn't.  As far as I can see dt->tm_wday can be set to
> any int value in the rtc_dev_ioctl(). 
> 

Nobody cares about tm_wday and userspace usually passes 0. For now, it
is left to individual rtc drivers to check and correct tm_wday when they
care in order to avoid having more calculations is the path for all the
other RTCs that don't care.

Honestly, for this RTC, this doesn't matter much because the value
isn't even read back.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
