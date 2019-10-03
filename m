Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA2BCAFB4
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Oct 2019 22:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732598AbfJCUBa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Oct 2019 16:01:30 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:48859 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731089AbfJCUBa (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Oct 2019 16:01:30 -0400
X-Originating-IP: 86.202.229.42
Received: from localhost (lfbn-lyo-1-146-42.w86-202.abo.wanadoo.fr [86.202.229.42])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BD3311C0006;
        Thu,  3 Oct 2019 20:01:27 +0000 (UTC)
Date:   Thu, 3 Oct 2019 22:01:27 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jinke Fan <fanjinke@hygon.cn>
Cc:     a.zummo@towertech.it, puwen@hygon.cn, thomas.lendacky@amd.com,
        kim.phillips@amd.com, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH RFC] rtc: Fix the AltCentury value on AMD/Hygon
 platform
Message-ID: <20191003200127.GM575@piout.net>
References: <20190924024108.51286-1-fanjinke@hygon.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190924024108.51286-1-fanjinke@hygon.cn>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 24/09/2019 10:41:08+0800, Jinke Fan wrote:
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
> Test results on AMD/Hygon machine show that it works as expected.
> 
> Reference:
> https://www.amd.com/system/files/TechDocs/51192_Bolton_FCH_RRG.pdf
> section: 3.13 Real Time Clock (RTC)
> 
> Signed-off-by: Jinke Fan <fanjinke@hygon.cn>
> ---
>  drivers/rtc/rtc-mc146818-lib.c | 9 +++++++--
>  include/linux/mc146818rtc.h    | 2 ++
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
