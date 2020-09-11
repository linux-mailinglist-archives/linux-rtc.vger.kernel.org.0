Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0C46265676
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Sep 2020 03:16:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725294AbgIKBQH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 21:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgIKBQG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 21:16:06 -0400
Received: from smtp.gentoo.org (smtp.gentoo.org [IPv6:2001:470:ea4a:1:5054:ff:fec7:86e4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5048C061573;
        Thu, 10 Sep 2020 18:16:06 -0700 (PDT)
Subject: Re: [PATCH] rtc: ds1685: Fix bank switching to avoid endless loop
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200910084124.138560-1-tsbogend@alpha.franken.de>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <3643be60-492c-66bd-1e34-adffb85d3754@gentoo.org>
Date:   Thu, 10 Sep 2020 21:16:00 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200910084124.138560-1-tsbogend@alpha.franken.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 9/10/2020 04:41, Thomas Bogendoerfer wrote:
> ds1685_rtc_begin_data_access() tried to access an extended register before
> enabling access to it by switching to bank 1. Depending on content in NVRAM
> this could lead to an endless loop. While at it fix also switch back to
> bank 0 in ds1685_rtc_end_data_access().
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  drivers/rtc/rtc-ds1685.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
> index 56c670af2e50..dfbd7b88b2b9 100644
> --- a/drivers/rtc/rtc-ds1685.c
> +++ b/drivers/rtc/rtc-ds1685.c
> @@ -193,12 +193,12 @@ ds1685_rtc_begin_data_access(struct ds1685_priv *rtc)
>  	rtc->write(rtc, RTC_CTRL_B,
>  		   (rtc->read(rtc, RTC_CTRL_B) | RTC_CTRL_B_SET));
>  
> +	/* Switch to Bank 1 */
> +	ds1685_rtc_switch_to_bank1(rtc);
> +
>  	/* Read Ext Ctrl 4A and check the INCR bit to avoid a lockout. */
>  	while (rtc->read(rtc, RTC_EXT_CTRL_4A) & RTC_CTRL_4A_INCR)
>  		cpu_relax();
> -
> -	/* Switch to Bank 1 */
> -	ds1685_rtc_switch_to_bank1(rtc);
>  }
>  
>  /**
> @@ -213,7 +213,7 @@ static inline void
>  ds1685_rtc_end_data_access(struct ds1685_priv *rtc)
>  {
>  	/* Switch back to Bank 0 */
> -	ds1685_rtc_switch_to_bank1(rtc);
> +	ds1685_rtc_switch_to_bank0(rtc);
>  
>  	/* Clear the SET bit in Ctrl B */
>  	rtc->write(rtc, RTC_CTRL_B,
> 

This probably needs to be sent to stable as well.

Acked-by: Joshua Kinard <kumba@gentoo.org>
