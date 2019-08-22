Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65A5E98E9C
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 11:02:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730648AbfHVJCR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 05:02:17 -0400
Received: from mga09.intel.com ([134.134.136.24]:18156 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729272AbfHVJCQ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 22 Aug 2019 05:02:16 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 02:02:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; 
   d="scan'208";a="208072412"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2019 02:02:11 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1i0iyu-0006TO-GR; Thu, 22 Aug 2019 12:02:08 +0300
Date:   Thu, 22 Aug 2019 12:02:08 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Rahul Tanwar <rahul.tanwar@linux.intel.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        tony.luck@intel.com, x86@kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, alan@linux.intel.com,
        linux-kernel@vger.kernel.org, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com, rahul.tanwar@intel.com
Subject: Re: [PATCH v1 1/2] x86/rtc: Add option to skip using RTC
Message-ID: <20190822090208.GJ30120@smile.fi.intel.com>
References: <cover.1566458029.git.rahul.tanwar@linux.intel.com>
 <becacc523508b295a52db9f1592e2868e3988e28.1566458029.git.rahul.tanwar@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <becacc523508b295a52db9f1592e2868e3988e28.1566458029.git.rahul.tanwar@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Aug 22, 2019 at 03:44:03PM +0800, Rahul Tanwar wrote:
> Use a newly introduced optional "status" property of "motorola,mc146818"
> compatible DT node to determine if RTC is supported. Skip read/write from
> RTC device only when this node is present and status is "disabled". In all
> other cases, proceed as before.

Can't we rather update ->get_wallclock() and ->set_wallclock() based on this?

> Suggested-by: Alan Cox <alan@linux.intel.com>
> Signed-off-by: Rahul Tanwar <rahul.tanwar@linux.intel.com>
> ---
>  arch/x86/kernel/rtc.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/x86/kernel/rtc.c b/arch/x86/kernel/rtc.c
> index 586f718b8e95..f9f760a8e76a 100644
> --- a/arch/x86/kernel/rtc.c
> +++ b/arch/x86/kernel/rtc.c
> @@ -32,6 +32,11 @@ EXPORT_SYMBOL(cmos_lock);
>  DEFINE_SPINLOCK(rtc_lock);
>  EXPORT_SYMBOL(rtc_lock);
>  
> +static const struct of_device_id of_cmos_match[] = {
> +        { .compatible = "motorola,mc146818" },
> +        {}
> +};
> +
>  /*
>   * In order to set the CMOS clock precisely, set_rtc_mmss has to be
>   * called 500 ms after the second nowtime has started, because when
> @@ -42,9 +47,14 @@ EXPORT_SYMBOL(rtc_lock);
>  int mach_set_rtc_mmss(const struct timespec64 *now)
>  {
>  	unsigned long long nowtime = now->tv_sec;
> +	struct device_node *node;
>  	struct rtc_time tm;
>  	int retval = 0;
>  
> +	node = of_find_matching_node(NULL, of_cmos_match);
> +	if (node && !of_device_is_available(node))
> +		return -EINVAL;
> +
>  	rtc_time64_to_tm(nowtime, &tm);
>  	if (!rtc_valid_tm(&tm)) {
>  		retval = mc146818_set_time(&tm);
> @@ -63,8 +73,15 @@ int mach_set_rtc_mmss(const struct timespec64 *now)
>  void mach_get_cmos_time(struct timespec64 *now)
>  {
>  	unsigned int status, year, mon, day, hour, min, sec, century = 0;
> +	struct device_node *node;
>  	unsigned long flags;
>  
> +	node = of_find_matching_node(NULL, of_cmos_match);
> +	if (node && !of_device_is_available(node)) {
> +		now->tv_sec = now->tv_nsec = 0;
> +		return;
> +	}
> +
>  	/*
>  	 * If pm_trace abused the RTC as storage, set the timespec to 0,
>  	 * which tells the caller that this RTC value is unusable.
> -- 
> 2.11.0
> 

-- 
With Best Regards,
Andy Shevchenko


