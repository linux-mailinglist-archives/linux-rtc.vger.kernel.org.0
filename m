Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0722523529C
	for <lists+linux-rtc@lfdr.de>; Sat,  1 Aug 2020 15:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgHAN2T (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 1 Aug 2020 09:28:19 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:40143 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgHAN2S (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 1 Aug 2020 09:28:18 -0400
X-Originating-IP: 90.66.108.79
Received: from localhost (lfbn-lyo-1-1932-79.w90-66.abo.wanadoo.fr [90.66.108.79])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BF87C60003;
        Sat,  1 Aug 2020 13:28:14 +0000 (UTC)
Date:   Sat, 1 Aug 2020 15:28:13 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Grant Feng <von81@163.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: interface:: 1969-12-31T23:59:59 is set as rtc_time
 if rtc_time is invalid in __rtc_read_time
Message-ID: <20200801132813.GE3679@piout.net>
References: <20200801112007.2148-1-von81@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200801112007.2148-1-von81@163.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 01/08/2020 19:20:07+0800, Grant Feng wrote:
> 1969-12-31T23:59:59 is an error more clear than Invalid argument

Definitively not, 1969-12-31T23:59:59 is a valid date and should not be
returned when it is known the current date is not set in the RTC.

> 
> For example, when the RTC clock is not set, it will print a kernel
> error log every time someone tries to read the clock:
>         ~ # hwclock -r
>         hwclock: RTC_RD_TIME: Invalid argument
> 
> It's clear and easy to understand what happened if print
> 1969-12-31T23:59:59 in this situation：
>         ~ # hwclock -r
>         Wed Dec 31 23:59:59 1969  0.000000 seconds
> 

How do you know this is an error an not what is actually set on the RTC?

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
