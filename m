Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4693C8FCEE
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Aug 2019 10:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbfHPIEW (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Aug 2019 04:04:22 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:43725 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726596AbfHPIEV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Aug 2019 04:04:21 -0400
X-Originating-IP: 176.184.102.226
Received: from localhost (crj95-h02-176-184-102-226.dsl.sta.abo.bbox.fr [176.184.102.226])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4494E20013;
        Fri, 16 Aug 2019 08:04:19 +0000 (UTC)
Date:   Fri, 16 Aug 2019 10:04:17 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Biwen Li <biwen.li@nxp.com>
Cc:     a.zummo@towertech.it, leoyang.li@nxp.com,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to run
 hwclock -w
Message-ID: <20190816080417.GB3545@piout.net>
References: <20190816024636.34738-1-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816024636.34738-1-biwen.li@nxp.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/08/2019 10:46:36+0800, Biwen Li wrote:
> Issue:
>     - # hwclock -w
>       hwclock: RTC_SET_TIME: Invalid argument
> 
> Why:
>     - Relative patch: https://lkml.org/lkml/2019/4/3/55 , this patch
>       will always check for unwritable registers, it will compare reg
>       with max_register in regmap_writeable.
> 
>     - In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e, but DT_100THS
>       is 0, max_regiter is 0x2f, then reg will be equal to 0x30,
>       '0x30 < 0x2f' is false,so regmap_writeable will return false.
> 
>     - Root cause: the buf[] was written to a wrong place in the file
>       drivers/rtc/rtc-pcf85363.c
> 

This is not true, the RTC wraps the register accesses properly and this
is probably something that should be handled by regmap_writable.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
