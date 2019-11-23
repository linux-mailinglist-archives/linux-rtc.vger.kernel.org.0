Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E073C107CF3
	for <lists+linux-rtc@lfdr.de>; Sat, 23 Nov 2019 06:19:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726676AbfKWFTt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 23 Nov 2019 00:19:49 -0500
Received: from smtp.gentoo.org ([140.211.166.183]:36338 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725768AbfKWFTt (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 23 Nov 2019 00:19:49 -0500
Received: from [192.168.1.13] (c-76-114-240-162.hsd1.md.comcast.net [76.114.240.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id A8D1334D254;
        Sat, 23 Nov 2019 05:19:47 +0000 (UTC)
Subject: Re: [PATCH 4/8] rtc: ds1685: fix build error with make W=1
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
 <20191122102212.400158-5-alexandre.belloni@bootlin.com>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <bee6cf44-a3e5-f217-388c-47165f1d5f90@gentoo.org>
Date:   Sat, 23 Nov 2019 00:19:45 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191122102212.400158-5-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/22/2019 05:22, Alexandre Belloni wrote:
> Fix the following parsing errors when building with W=1:
> drivers/rtc/rtc-ds1685.c:1053: error: Cannot parse struct or union!
> drivers/rtc/rtc-ds1685.c:1062: error: Cannot parse struct or union!
> drivers/rtc/rtc-ds1685.c:1363: warning: cannot understand function prototype: 'struct platform_driver ds1685_rtc_driver = '
> 
> Cc: Joshua Kinard <kumba@gentoo.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-ds1685.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> index 8419595e7da7..56c670af2e50 100644
> --- a/drivers/rtc/rtc-ds1685.c
> +++ b/drivers/rtc/rtc-ds1685.c
> @@ -1039,7 +1039,7 @@ ds1685_rtc_sysfs_serial_show(struct device *dev,
>  }
>  static DEVICE_ATTR(serial, S_IRUGO, ds1685_rtc_sysfs_serial_show, NULL);
>  
> -/**
> +/*
>   * struct ds1685_rtc_sysfs_misc_attrs - list for misc RTC features.
>   */
>  static struct attribute*
> @@ -1050,7 +1050,7 @@ ds1685_rtc_sysfs_misc_attrs[] = {
>  	NULL,
>  };
>  
> -/**
> +/*
>   * struct ds1685_rtc_sysfs_misc_grp - attr group for misc RTC features.
>   */
>  static const struct attribute_group
> @@ -1355,7 +1355,7 @@ ds1685_rtc_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -/**
> +/*
>   * ds1685_rtc_driver - rtc driver properties.
>   */
>  static struct platform_driver ds1685_rtc_driver = {
> 

/** is for kerneldoc comments.  Is this a bug in kbuild's W=1 implementation
of not parsing kerneldoc on a struct correctly?  I'm sure I got that syntax
for structs out of the kerneldoc guide, unless it changed at some point.

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
