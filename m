Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454FD394EF8
	for <lists+linux-rtc@lfdr.de>; Sun, 30 May 2021 04:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229569AbhE3CdO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 29 May 2021 22:33:14 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:33737 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhE3CdO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 29 May 2021 22:33:14 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 66C2720006;
        Sun, 30 May 2021 02:31:35 +0000 (UTC)
Date:   Sun, 30 May 2021 04:31:35 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Cassio Neri <cassio.neri@gmail.com>
Cc:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] rtc: Improve performance of rtc_time64_to_tm. Add
 tests.
Message-ID: <YLL5B+nkQ9wED1Wk@piout.net>
References: <20210530013159.383230-1-cassio.neri@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530013159.383230-1-cassio.neri@gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

Your v2 as to be self contained, not a simple patch on top of v1.

On 30/05/2021 02:31:59+0100, Cassio Neri wrote:
> Signed-off-by: Cassio Neri <cassio.neri@gmail.com>
> Reported-by: kernel test robot <lkp@intel.com>
> 
> ---
> 
> Fix link issue on 32 bit platforms raised from the v1.
> 
> ---
>  drivers/rtc/lib_test.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/lib_test.c b/drivers/rtc/lib_test.c
> index 0060e3a72b50..e50513c8e086 100644
> --- a/drivers/rtc/lib_test.c
> +++ b/drivers/rtc/lib_test.c
> @@ -45,13 +45,16 @@ static void rtc_time64_to_tm_test_date_range(struct kunit *test)
>  
>  	struct rtc_time result;
>  	time64_t secs;
> +	s64      days;
>  
>  	for (secs = 0; secs <= total_secs; secs += 86400) {
>  
>  		rtc_time64_to_tm(secs, &result);
>  
> +		days = div_s64(secs, 86400);
> +
>  		#define FAIL_MSG "%d/%02d/%02d (%2d) : %ld", \
> -			year, month, mday, yday, secs/86400
> +			year, month, mday, yday, days
>  
>  		KUNIT_ASSERT_EQ_MSG(test, year - 1900, result.tm_year, FAIL_MSG);
>  		KUNIT_ASSERT_EQ_MSG(test, month - 1, result.tm_mon, FAIL_MSG);
> 
> base-commit: bcae59d0d45b866d5b9525ea8ece6d671e6767c8
> prerequisite-patch-id: ea804a9b3d52cd4f6bfbbf1c53260cb8f2d2c60b
> -- 
> 2.31.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
