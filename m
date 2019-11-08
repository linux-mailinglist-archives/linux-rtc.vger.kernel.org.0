Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 67744F4F70
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2019 16:25:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfKHPZB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Nov 2019 10:25:01 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:41597 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfKHPZA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 Nov 2019 10:25:00 -0500
X-Originating-IP: 92.137.17.54
Received: from localhost (alyon-657-1-975-54.w92-137.abo.wanadoo.fr [92.137.17.54])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3A98C240003;
        Fri,  8 Nov 2019 15:24:57 +0000 (UTC)
Date:   Fri, 8 Nov 2019 16:24:57 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jinke Fan <fanjinke@hygon.cn>
Cc:     a.zummo@towertech.it, puwen@hygon.cn, thomas.lendacky@amd.com,
        kim.phillips@amd.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v4] rtc: Fix the AltCentury value on AMD/Hygon
 platform
Message-ID: <20191108152457.GD216543@piout.net>
References: <20191105083943.115320-1-fanjinke@hygon.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105083943.115320-1-fanjinke@hygon.cn>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/11/2019 16:39:43+0800, Jinke Fan wrote:
> When using following operations:
> date -s "21190910 19:20:00"
> hwclock -w
> to change date from 2019 to 2119 for test, it will fail on Hygon
> Dhyana and AMD Zen CPUs, while the same operations run ok on Intel i7
> platform.
> 
> MC146818 driver use function mc146818_set_time() to set register
> RTC_FREQ_SELECT(RTC_REG_A)'s bit4-bit6 field which means divider stage
> reset value on Intel platform to 0x7.
> 
> While AMD/Hygon RTC_REG_A(0Ah)'s bit4 is defined as DV0 [Reference]:
> DV0 = 0 selects Bank 0, DV0 = 1 selects Bank 1. Bit5-bit6 is defined
> as reserved.
> 
> DV0 is set to 1, it will select Bank 1, which will disable AltCentury
> register(0x32) access. As UEFI pass acpi_gbl_FADT.century 0x32
> (AltCentury), the CMOS write will be failed on code:
> CMOS_WRITE(century, acpi_gbl_FADT.century).
> 
> Correct RTC_REG_A bank select bit(DV0) to 0 on AMD/Hygon CPUs, it will
> enable AltCentury(0x32) register writing and finally setup century as
> expected.
> 
> Test results on Intel i7, AMD EPYC(17h) and Hygon machine show that it
> works as expected.
> Compiling for sparc64 and alpha architectures are passed.
> 
> Reference:
> https://www.amd.com/system/files/TechDocs/51192_Bolton_FCH_RRG.pdf
> section: 3.13 Real Time Clock (RTC)
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Jinke Fan <fanjinke@hygon.cn>
> ---
> 
> v3->v4:
>   - Limited modification to AMD EPYC(17h).
>   - Change the macro RTC_DV0 to RTC_DIV_RESET2.
>   - Make sure save_freq_select's bit4 is cleared.
> 
> v2->v3:
>   - Make the changes only relevant to AMD/Hygon.
> 
> v1->v2:
>   - Fix the compile errors on sparc64/alpha platform.
> 
>  drivers/rtc/rtc-mc146818-lib.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
