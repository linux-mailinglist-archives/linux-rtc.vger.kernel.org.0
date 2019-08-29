Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBEDA120C
	for <lists+linux-rtc@lfdr.de>; Thu, 29 Aug 2019 08:45:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbfH2Gpz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 29 Aug 2019 02:45:55 -0400
Received: from hel-mailgw-01.vaisala.com ([193.143.230.17]:47641 "EHLO
        hel-mailgw-01.vaisala.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726889AbfH2Gpz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 29 Aug 2019 02:45:55 -0400
IronPort-SDR: FqoXct+zFHhJMNCd/gHRyGElCirhOi+C4lY5TP0Jdt5YObFMePTZWwBJIWo7z2WZ3Y5kftHqgB
 hDDmIYuJI7fMepslUtSpeC1aKdFYaL7eop6x/+xs3JzpuXqKYjDVnBOTBjxbmklSBBC8YWtXr1
 pNpC0RBskdgH+pdZpvV82wGx0oJZ+Vf1nKA+2k+ujn/XIHVAo/STu/3KBG5pySLgQbB6zJhdj7
 ICOAgt8ZeK5xBNCx3gmhmEeQza4zWhYfVvkXRmUdsBFcUvQOv8+38Ps+GBoCpS9j7qw7JFh4Tm
 0L0=
X-IronPort-AV: E=Sophos;i="5.64,442,1559509200"; 
   d="scan'208";a="230033197"
Subject: Re: [v5] rtc: pcf85363/pcf85263: fix error that failed to run hwclock
 -w
To:     Biwen Li <biwen.li@nxp.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, leoyang.li@nxp.com,
        broonie@kernel.org
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190829021418.4607-1-biwen.li@nxp.com>
From:   Nandor Han <nandor.han@vaisala.com>
Message-ID: <65a85fb2-0482-2007-4a84-b622e5308c3d@vaisala.com>
Date:   Thu, 29 Aug 2019 09:45:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190829021418.4607-1-biwen.li@nxp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 29 Aug 2019 06:45:49.0936 (UTC) FILETIME=[65139F00:01D55E35]
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 8/29/19 5:14 AM, Biwen Li wrote:
> Issue:
>      - # hwclock -w
>        hwclock: RTC_SET_TIME: Invalid argument
> 
> Why:
>      - Relative commit: 8b9f9d4dc511309918c4f6793bae7387c0c638af, this patch
>        will always check for unwritable registers, it will compare reg
>        with max_register in regmap_writeable.
> 
>      - The pcf85363/pcf85263 has the capability of address wrapping
>        which means if you access an address outside the allowed range
>        (0x00-0x2f) hardware actually wraps the access to a lower address.
>        The rtc-pcf85363 driver will use this feature to configure the time
>        and execute 2 actions in the same i2c write operation (stopping the
>        clock and configure the time). However the driver has also
>        configured the `regmap maxregister` protection mechanism that will
>        block accessing addresses outside valid range (0x00-0x2f).
> 
> How:
>      - Split of writing regs to two parts, first part writes control
>        registers about stop_enable and resets, second part writes
>        RTC time and date registers.
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v5:
> 	- drop robust explanation
> 

LGTM +1

Nandor

