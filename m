Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6397C9946E
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Aug 2019 15:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731563AbfHVNEh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Aug 2019 09:04:37 -0400
Received: from mga09.intel.com ([134.134.136.24]:48582 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731541AbfHVNEh (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 22 Aug 2019 09:04:37 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Aug 2019 06:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; 
   d="scan'208";a="378509664"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2019 06:04:32 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1i0mlR-0001dM-TB; Thu, 22 Aug 2019 16:04:29 +0300
Date:   Thu, 22 Aug 2019 16:04:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     "Tanwar, Rahul" <rahul.tanwar@linux.intel.com>
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
        tony.luck@intel.com, x86@kernel.org, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, alan@linux.intel.com,
        linux-kernel@vger.kernel.org, qi-ming.wu@intel.com,
        cheol.yong.kim@intel.com, rahul.tanwar@intel.com
Subject: Re: [PATCH v1 1/2] x86/rtc: Add option to skip using RTC
Message-ID: <20190822130429.GN30120@smile.fi.intel.com>
References: <cover.1566458029.git.rahul.tanwar@linux.intel.com>
 <becacc523508b295a52db9f1592e2868e3988e28.1566458029.git.rahul.tanwar@linux.intel.com>
 <20190822090208.GJ30120@smile.fi.intel.com>
 <25f6947d-7ba0-c23c-25aa-c4c4173da6b0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25f6947d-7ba0-c23c-25aa-c4c4173da6b0@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Aug 22, 2019 at 05:26:33PM +0800, Tanwar, Rahul wrote:
> On 22/8/2019 5:02 PM, Andy Shevchenko wrote:
> > On Thu, Aug 22, 2019 at 03:44:03PM +0800, Rahul Tanwar wrote:
> > > Use a newly introduced optional "status" property of "motorola,mc146818"
> > > compatible DT node to determine if RTC is supported. Skip read/write from
> > > RTC device only when this node is present and status is "disabled". In all
> > > other cases, proceed as before.
> > Can't we rather update ->get_wallclock() and ->set_wallclock() based on this?
> 
> 
> get_wallclock() and set_wallclock() are function pointers of platform_ops
> 
> which are initialized to mach_get_cmos_time() and mach_set_rtc_mmss()
> 
> at init time. Since adding a new platform to override these functions is
> 
> discouraged, so the only way is to modify RTC get/set functions.

Shouldn't it be platform agnostic code?
So, my point is, instead of hacking two functions, perhaps better to avoid them
at all.


-- 
With Best Regards,
Andy Shevchenko


